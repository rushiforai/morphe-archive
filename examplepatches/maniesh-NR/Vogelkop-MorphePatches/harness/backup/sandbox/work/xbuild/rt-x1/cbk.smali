.class public final Lcbk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:I

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# virtual methods
.method public final a(Lhq8;Lqpm;Ljava/lang/Runnable;Z)V
    .registers 16

    invoke-virtual {p1}, Lhq8;->g()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {p1, v1}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcbk;->e:Ljava/lang/Object;

    check-cast v2, Llgf;

    iget-object v3, v2, Llgf;->i:Ljava/lang/Object;

    check-cast v3, Lcul;

    iget-object v3, v3, Lcul;->c:Ljava/util/HashMap;

    invoke-virtual {p1}, Lhq8;->c()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbul;

    if-nez v3, :cond_23

    const/4 v3, 0x0

    :goto_21
    move v7, v3

    goto :goto_2a

    :cond_23
    iget-object v3, v3, Lbul;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    goto :goto_21

    :goto_2a
    iget-object v3, v2, Llgf;->c:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    iget v2, v2, Llgf;->a:I

    new-instance v4, Lyt3;

    move-object v5, p0

    move-object v6, p1

    move-object v9, p2

    move-object v10, p3

    move v8, p4

    invoke-direct/range {v4 .. v10}, Lyt3;-><init>(Lcbk;Lhq8;IZLqpm;Ljava/lang/Runnable;)V

    invoke-static {v3, v2, v1, v0, v4}, Lqbe;->v(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lcbk;->e:Ljava/lang/Object;

    check-cast v0, Llgf;

    iget-object v0, v0, Llgf;->d:Ljava/lang/Object;

    check-cast v0, Lppm;

    iget-object v1, p0, Lcbk;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget v2, p0, Lcbk;->b:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcbk;->b:I

    if-lez v2, :cond_15

    return-void

    :cond_15
    new-instance p0, Lnn;

    const/16 v2, 0xe

    invoke-direct {p0, v2}, Lnn;-><init>(B)V

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_2a

    const/4 p0, 0x0

    invoke-interface {v0, p0}, Lppm;->a(Lyl2;)V

    return-void

    :cond_2a
    new-instance p0, Lomj;

    const/16 v2, 0x10

    invoke-direct {p0, v2}, Lomj;-><init>(B)V

    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyl2;

    invoke-interface {v0, p0}, Lppm;->a(Lyl2;)V

    return-void
.end method
