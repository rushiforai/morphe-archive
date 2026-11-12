.class public final Lgdn;
.super Lha2;
.source "SourceFile"


# instance fields
.field public final k:Ljava/util/ArrayList;

.field public final l:Ljava/util/ArrayList;

.field public m:Ljava/util/List;

.field public n:Lfdn;

.field public o:Z

.field public p:Ljava/util/List;

.field public q:Z

.field public r:Z


# direct methods
.method public constructor <init>(Ltni;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lfdn;ZZ)V
    .registers 10

    invoke-direct {p0, p1}, Lha2;-><init>(Ltni;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_10
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfdn;

    new-instance v1, Lqmf;

    invoke-direct {v1, v0}, Lqmf;-><init>(Lfdn;)V

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_25
    iput-object p1, p0, Lgdn;->l:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_34
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_5d

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lfdn;

    sget-object v0, Lpdn;->a:Lx1b;

    iget-object v1, p3, Lfdn;->a:Ljava/lang/String;

    iget-object v0, v0, Lx1b;->e:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    new-instance v0, Lmxc;

    invoke-direct {v0, p3}, Lnxc;-><init>(Lfdn;)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_34

    :cond_55
    invoke-static {p3}, Lnxc;->e(Lfdn;)Lnxc;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_34

    :cond_5d
    iput-object p1, p0, Lgdn;->k:Ljava/util/ArrayList;

    invoke-static {p5, p4}, Lgdn;->Y(Lfdn;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lgdn;->m:Ljava/util/List;

    iput-object p5, p0, Lgdn;->n:Lfdn;

    iput-boolean p6, p0, Lgdn;->o:Z

    iput-boolean p7, p0, Lgdn;->r:Z

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lgdn;->p:Ljava/util/List;

    return-void
.end method

.method public static Y(Lfdn;Ljava/util/List;)Ljava/util/List;
    .registers 6

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_17

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfdn;

    invoke-virtual {v0, p0}, Lfdn;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_20
    :goto_20
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_62

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfdn;

    iget-boolean v2, v1, Lfdn;->e:Z

    if-eqz v2, :cond_36

    invoke-virtual {v1, p0}, Lfdn;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    :cond_36
    sget-object v2, Lpdn;->a:Lx1b;

    iget-object v3, v1, Lfdn;->a:Ljava/lang/String;

    iget-object v2, v2, Lx1b;->e:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4b

    new-instance v2, Lmxc;

    invoke-direct {v2, v1}, Lnxc;-><init>(Lfdn;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_20

    :cond_4b
    invoke-virtual {v1, p0}, Lfdn;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    new-instance v2, Llxc;

    invoke-direct {v2, v1}, Lnxc;-><init>(Lfdn;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_20

    :cond_5a
    invoke-static {v1}, Lnxc;->e(Lfdn;)Lnxc;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_20

    :cond_62
    return-object v0
.end method


# virtual methods
.method public final Z(Z)V
    .registers 6

    iput-boolean p1, p0, Lgdn;->q:Z

    iget-object v0, p0, Lha2;->a:Ljava/util/ArrayList;

    if-eqz p1, :cond_10

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object p1, p0, Lgdn;->p:Ljava/util/List;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_85

    :cond_10
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-boolean p1, p0, Lgdn;->r:Z

    iget-object v1, p0, Lgdn;->l:Ljava/util/ArrayList;

    iget-object v2, p0, Lgdn;->k:Ljava/util/ArrayList;

    if-eqz p1, :cond_44

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2f

    new-instance p1, Lkzb;

    const v3, 0x7f141382

    invoke-direct {p1, v3}, Lkzb;-><init>(I)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_2f
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_85

    new-instance p1, Lkzb;

    const v1, 0x7f1413c2

    invoke-direct {p1, v1}, Lkzb;-><init>(I)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_85

    :cond_44
    iget-boolean p1, p0, Lgdn;->o:Z

    if-nez p1, :cond_4b

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_4b
    iget-object p1, p0, Lgdn;->m:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_67

    iget-boolean p1, p0, Lgdn;->o:Z

    if-eqz p1, :cond_67

    new-instance p1, Lkzb;

    const v1, 0x7f1413f5

    invoke-direct {p1, v1}, Lkzb;-><init>(I)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lgdn;->m:Ljava/util/List;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_67
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_85

    new-instance p1, Lkzb;

    const v1, 0x7f141369

    invoke-direct {p1, v1}, Lkzb;-><init>(I)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Llxc;

    iget-object v1, p0, Lgdn;->n:Lfdn;

    invoke-direct {p1, v1}, Lnxc;-><init>(Lfdn;)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_85
    :goto_85
    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method
