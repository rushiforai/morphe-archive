.class public final synthetic Lf5k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkq;


# instance fields
.field public final synthetic a:Lk5k;


# direct methods
.method public synthetic constructor <init>(Lk5k;)V
    .registers 2

    iput-object p1, p0, Lf5k;->a:Lk5k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final r(Lmq;)V
    .registers 9

    iget-object v0, p1, Lmq;->d:Lyz;

    if-eqz v0, :cond_67

    iget-object p0, p0, Lf5k;->a:Lk5k;

    iget-object p0, p0, Lk5k;->c:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_67

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj5k;

    iget-object v1, v0, Lj5k;->e:Lk5k;

    iget-object v2, v0, Lj5k;->a:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    iget-object p0, v0, Lj5k;->b:Ljava/util/ArrayDeque;

    invoke-virtual {p0, p1}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    new-instance p0, Lno;

    new-instance v3, Luo;

    iget-object v4, v0, Lj5k;->d:Lbz;

    iget-object v0, v0, Lj5k;->c:Ldl;

    invoke-direct {v3, v4, v0}, Luo;-><init>(Lbz;Ldl;)V

    iget-object v0, v1, Lk5k;->d:Lwy;

    iget-object v4, v1, Lk5k;->a:Ljava/util/ArrayList;

    iget-object v0, v0, Lwy;->l:Lyl;

    iget-object v5, v1, Lk5k;->e:Lg5k;

    iget-object v6, p1, Lmq;->f:Ljava/util/List;

    invoke-direct {p0, v3, v0, v5, v6}, Lno;-><init>(Luo;Lkm;Lk8;Ljava/util/List;)V

    iget-boolean v0, p0, Lmq;->n:Z

    if-eqz v0, :cond_4a

    const/4 v0, 0x1

    iput-boolean v0, p0, Lno;->q:Z

    :cond_4a
    invoke-interface {v2, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_5d

    invoke-virtual {v4, v0, p0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lk5k;->g:Leu8;

    if-eqz v0, :cond_5d

    invoke-virtual {v0, p1, p0}, Leu8;->e(Lmq;Lmq;)V

    :cond_5d
    iget-object p0, p1, Lmq;->d:Lyz;

    if-eqz p0, :cond_67

    const/4 p1, 0x0

    iput-object p1, p0, Lyz;->q:Ltz;

    invoke-virtual {p0}, Lyz;->c()V

    :cond_67
    return-void
.end method
