.class public final Lzte;
.super Lxte;
.source "SourceFile"


# instance fields
.field public final b:Lfqe;

.field public final synthetic c:Lbue;


# direct methods
.method public constructor <init>(Lbue;Lfqe;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzte;->c:Lbue;

    iput-object p2, p0, Lzte;->b:Lfqe;

    invoke-virtual {p0}, Lzte;->d()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)V
    .registers 8

    check-cast p1, Ll1c;

    iget-object p0, p0, Lzte;->c:Lbue;

    iget-object v0, p0, Lbue;->f:Lvzk;

    iget-object v1, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lbue;->b:Ls5j;

    iget-object v2, v1, Ls5j;->b:Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1c
    :goto_1c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_32

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ll0c;->a(Ljava/lang/String;)Ll0c;

    move-result-object v4

    if-eqz v4, :cond_1c

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_32
    iget-object p1, p1, Ll1c;->c:Ll0c;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3e

    invoke-virtual {p0}, Lbue;->a()V

    return-void

    :cond_3e
    iget-object p1, v0, Lvzk;->c:Ljava/lang/Object;

    check-cast p1, Lesk;

    invoke-interface {p1}, Lesk;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Locale;

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :cond_57
    if-ge v2, v0, :cond_6b

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    move-object v5, v4

    check-cast v5, Ll0c;

    iget-object v5, v5, Ll0c;->b:Ljava/lang/String;

    invoke-static {v5, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_57

    goto :goto_6c

    :cond_6b
    const/4 v4, 0x0

    :goto_6c
    check-cast v4, Ll0c;

    if-nez v4, :cond_77

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Ll0c;

    :cond_77
    iget-object p1, v1, Ls5j;->c:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_96

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_92

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "<existing>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_96

    :cond_92
    invoke-virtual {p0, v4, v1}, Lbue;->b(Ll0c;Z)V

    return-void

    :cond_96
    sget-object p1, Ll08;->a:Ll08;

    invoke-virtual {p0, v4, p1}, Lbue;->c(Ll0c;Ljava/util/List;)V

    return-void
.end method

.method public final d()V
    .registers 2

    iget-object v0, p0, Lzte;->b:Lfqe;

    invoke-virtual {v0, p0}, Lfqe;->a(Lq8j;)V

    return-void
.end method
