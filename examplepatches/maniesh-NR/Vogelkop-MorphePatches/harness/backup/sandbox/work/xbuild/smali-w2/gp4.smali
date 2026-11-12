.class public final Lgp4;
.super Llze;
.source "SourceFile"


# instance fields
.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Ljava/util/HashSet;

.field public final synthetic e:Lip4;


# direct methods
.method public constructor <init>(Lip4;Lip4;Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .registers 5

    iput-object p3, p0, Lgp4;->c:Ljava/util/ArrayList;

    iput-object p4, p0, Lgp4;->d:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lgp4;->e:Lip4;

    invoke-direct {p0, p2}, Llze;-><init>(Lt7j;)V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)V
    .registers 15

    check-cast p1, Lfp4;

    iget-object v0, p0, Lgp4;->e:Lip4;

    invoke-static {v0}, Lip4;->e(Lip4;)Lq8j;

    move-result-object v1

    if-ne v1, p0, :cond_2b

    invoke-static {v0}, Lip4;->f(Lip4;)V

    iget-object v1, p1, Lfp4;->e:Ljava/util/List;

    iget-object p1, p1, Lfp4;->f:Ljava/util/List;

    iget-object v2, p0, Lgp4;->c:Ljava/util/ArrayList;

    invoke-interface {v1, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    iget-object p0, p0, Lgp4;->d:Ljava/util/HashSet;

    if-eqz v1, :cond_2c

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    move-result v3

    if-ne v1, v3, :cond_2c

    invoke-interface {p1, p0}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_2c

    :cond_2b
    return-void

    :cond_2c
    iget-object p1, v0, Lip4;->j:Lta7;

    iget-object v1, p1, Lta7;->b:Ljava/lang/Object;

    check-cast v1, Li16;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_46

    new-instance p0, Ljava/util/HashSet;

    sget-object v3, Lyqe;->d:Lyqe;

    invoke-static {v3}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    invoke-direct {p0, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    :cond_46
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v5, Ljava/util/HashSet;

    const/4 v6, 0x1

    invoke-virtual {v1, v6, v3}, Li16;->t(ZZ)Ljava/util/ArrayList;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    :goto_62
    if-ge v3, v7, :cond_81

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v3, v3, 0x1

    check-cast v8, Lyqe;

    new-instance v9, Lop4;

    invoke-virtual {v5, v8}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    invoke-interface {p0, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v12

    invoke-direct {v9, v8, v10, v11, v12}, Lop4;-><init>(Lyqe;ZZI)V

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_62

    :cond_81
    new-instance p0, Lyg9;

    const/16 v2, 0x10

    invoke-direct {p0, v2}, Lyg9;-><init>(B)V

    invoke-static {v6, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iput-object v6, v1, Li16;->c:Ljava/lang/Object;

    iget-object p0, v1, Li16;->b:Ljava/lang/Object;

    check-cast p0, Li32;

    invoke-virtual {p0, v6}, Lldk;->g(Ljava/lang/Object;)V

    const/4 p0, 0x0

    iput-object p0, p1, Lta7;->m:Ljava/lang/Object;

    iput-object p0, p1, Lta7;->h:Ljava/lang/Object;

    invoke-virtual {v0}, Lt7j;->c()V

    return-void
.end method
