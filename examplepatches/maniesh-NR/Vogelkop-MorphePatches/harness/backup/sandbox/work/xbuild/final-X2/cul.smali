.class public final Lcul;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/util/ArraySet;

.field public final b:Ljava/util/ArrayList;

.field public final c:Ljava/util/HashMap;

.field public d:Z

.field public e:Ljava/util/HashSet;

.field public final f:Ljava/util/ArrayList;

.field public final g:Lh7f;

.field public final h:Li32;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcul;->a:Landroid/util/ArraySet;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcul;->b:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcul;->c:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcul;->f:Ljava/util/ArrayList;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcul;->g:Lh7f;

    new-instance v0, Li32;

    invoke-direct {v0, p0, p1, p2}, Li32;-><init>(Lcul;Landroid/content/Context;Lumi;)V

    iput-object v0, p0, Lcul;->h:Li32;

    invoke-virtual {v0}, Lldk;->h()V

    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/String;)Z
    .registers 8

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Lcul;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_25

    iget-object v3, p0, Lcul;->c:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbul;

    if-eqz v3, :cond_1f

    iget-object v3, v3, Lbul;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    goto :goto_20

    :cond_1f
    move v3, v0

    :goto_20
    if-gt p1, v3, :cond_25

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_25
    const/4 p0, 0x5

    if-ge v1, p0, :cond_3c

    invoke-virtual {v2, v1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :goto_2b
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 p2, 0x1

    if-le p1, p0, :cond_3b

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, p2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_2b

    :cond_3b
    return p2

    :cond_3c
    return v0
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Lcul;->g:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-nez v0, :cond_d

    return-void

    :cond_d
    invoke-static {p0}, Lam2;->j(Lg7f;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0
.end method

.method public final c(Lhq8;)V
    .registers 6

    invoke-virtual {p1}, Lhq8;->c()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcul;->c:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbul;

    if-nez v1, :cond_16

    new-instance v1, Lbul;

    invoke-direct {v1, p1}, Lbul;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16
    iget-object v0, v1, Lbul;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, v1, Lbul;->c:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    invoke-virtual {p0}, Lcul;->d()V

    iget-object v1, p0, Lcul;->b:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lcul;->a(ILjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_39

    invoke-virtual {p0}, Lcul;->b()V

    :cond_39
    return-void
.end method

.method public final d()V
    .registers 3

    iget-boolean v0, p0, Lcul;->d:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcul;->c:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object p0, p0, Lcul;->h:Li32;

    invoke-virtual {p0, v0}, Lldk;->g(Ljava/lang/Object;)V

    return-void
.end method

.method public final e()V
    .registers 6

    iget-object v0, p0, Lcul;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lcul;->c:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbul;

    iget-object v3, v2, Lbul;->a:Ljava/lang/String;

    iget-object v2, v2, Lbul;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-virtual {p0, v2, v3}, Lcul;->a(ILjava/lang/String;)Z

    goto :goto_f

    :cond_27
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x5

    if-ge v0, v1, :cond_6c

    iget-object v0, p0, Lcul;->a:Landroid/util/ArraySet;

    invoke-virtual {v0}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_34
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lg6e;

    new-instance v2, Laul;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Laul;-><init>(Lcul;B)V

    iget-byte v3, v1, Lg6e;->a:B

    iget-object v1, v1, Lg6e;->b:Ljava/lang/Object;

    packed-switch v3, :pswitch_data_70

    check-cast v1, Lmdh;

    iget-object v1, v1, Lmdh;->h:Lh42;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_5b

    sget-object v1, Ll08;->a:Ll08;

    :cond_5b
    invoke-virtual {v2, v1}, Laul;->run(Ljava/lang/Object;)V

    goto :goto_34

    :pswitch_5f
    check-cast v1, Lcom/opera/android/favorites/e;

    new-instance v3, Lhpd;

    const/16 v4, 0xb

    invoke-direct {v3, v1, v2, v4}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Lnr8;->f(Ljava/lang/Runnable;)V

    goto :goto_34

    :cond_6c
    invoke-virtual {p0}, Lcul;->b()V

    return-void

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_5f
    .end packed-switch
.end method
