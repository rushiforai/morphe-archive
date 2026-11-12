.class public abstract Ld53;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Lh7f;

.field public final c:Lb53;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld53;->a:Ljava/util/ArrayList;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ld53;->b:Lh7f;

    new-instance v0, Lb53;

    invoke-direct {v0, p0}, Lb53;-><init>(Ld53;)V

    iput-object v0, p0, Ld53;->c:Lb53;

    return-void
.end method


# virtual methods
.method public c(Ljava/lang/Object;Loqe;Lv82;)Lc53;
    .registers 4

    new-instance p0, Lc92;

    invoke-direct {p0, p1, p2, p3}, Lc53;-><init>(Ljava/lang/Object;Loqe;Lv82;)V

    return-object p0
.end method

.method public final e(Ljava/lang/Object;Loqe;Lw82;)V
    .registers 7

    new-instance v0, Lv82;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lv82;-><init>(B)V

    iget-object v1, v0, Lv82;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, p0, Ld53;->c:Lb53;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1, p2, v0}, Ld53;->c(Ljava/lang/Object;Loqe;Lv82;)Lc53;

    move-result-object p1

    iget-object p2, p0, Ld53;->a:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_34

    iget-object p0, p0, Ld53;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_24
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_34

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lx82;

    invoke-interface {p2}, Lx82;->l()V

    goto :goto_24

    :cond_34
    invoke-virtual {p1}, Lc53;->c()V

    return-void
.end method

.method public final k(Ljava/lang/Object;)Z
    .registers 6

    iget-object p0, p0, Ld53;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_8
    if-ge v2, v0, :cond_1c

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lc53;

    iget-object v3, v3, Lc53;->a:Ljava/lang/Object;

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_1c
    return v1
.end method

.method public final l(Lc53;)V
    .registers 3

    iget-object v0, p0, Ld53;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e

    iget-object p0, p0, Ld53;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_e
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lx82;

    invoke-interface {p1}, Lx82;->l()V

    goto :goto_e

    :cond_1e
    return-void
.end method

.method public final m(Ljava/lang/Object;)V
    .registers 5

    iget-object p0, p0, Ld53;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_1e

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc53;

    iget-object v2, v1, Lc53;->a:Ljava/lang/Object;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-virtual {v1}, Lc53;->a()V

    :cond_1b
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_1e
    return-void
.end method
