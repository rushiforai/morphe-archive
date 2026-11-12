.class public final Lin3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkkm;
.implements Llkm;


# instance fields
.field public final a:Li53;

.field public final b:Ljava/util/ArrayList;

.field public final c:Li7f;


# direct methods
.method public constructor <init>(Li53;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lin3;->a:Li53;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lin3;->b:Ljava/util/ArrayList;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lin3;->c:Li7f;

    new-instance v0, Lhn3;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lhn3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Li53;->a(Lql3;)V

    return-void
.end method


# virtual methods
.method public final N(Ljava/util/List;)Le5d;
    .registers 6

    if-nez p1, :cond_4

    sget-object p1, Ll08;->a:Ll08;

    :cond_4
    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_15
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_30

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lal3;

    iget-object v2, p0, Lin3;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Lguh;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_30
    invoke-virtual {p0}, Lin3;->a()V

    new-instance p0, Le5d;

    sget-object p1, Ll08;->a:Ll08;

    const/4 v1, 0x2

    invoke-direct {p0, v0, p1, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p0
.end method

.method public final O(Ll46;)V
    .registers 2

    return-void
.end method

.method public final R(Ljava/util/ArrayList;)V
    .registers 6

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_5
    :goto_5
    if-ge v1, v0, :cond_24

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lal3;

    iget-object v3, p0, Lin3;->b:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p0, Lin3;->a:Li53;

    check-cast v3, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lcom/opera/android/bookmarks/b;

    invoke-virtual {v3, v2}, Lcom/opera/android/bookmarks/h;->q(Lcom/opera/android/bookmarks/b;)V

    goto :goto_5

    :cond_24
    return-void
.end method

.method public final a()V
    .registers 2

    iget-object p0, p0, Lin3;->c:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqbf;

    iget-object v0, v0, Lqbf;->a:Lvbf;

    invoke-virtual {v0}, Lvbf;->q()V

    goto :goto_6

    :cond_18
    return-void
.end method

.method public final t(Le5d;)V
    .registers 4

    invoke-virtual {p1}, Le5d;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lguh;

    iget-object v1, p0, Lin3;->b:Ljava/util/ArrayList;

    iget-object v0, v0, Lguh;->a:Ljava/lang/Object;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_18
    invoke-virtual {p0}, Lin3;->a()V

    return-void
.end method
