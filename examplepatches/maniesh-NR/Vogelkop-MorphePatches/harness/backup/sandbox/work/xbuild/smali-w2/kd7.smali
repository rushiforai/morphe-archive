.class public final Lkd7;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final j:Lk32;

.field public final k:Lld7;

.field public final l:Ljava/util/HashMap;

.field public m:Z

.field public final n:J


# direct methods
.method public constructor <init>(Lumi;Lk32;Ldu3;Lkw3;)V
    .registers 6

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0, p1}, Lldk;-><init>(Ltcl;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lkd7;->l:Ljava/util/HashMap;

    iput-object p2, p0, Lkd7;->j:Lk32;

    invoke-virtual {p4}, Lkw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    iput-wide p1, p0, Lkd7;->n:J

    invoke-virtual {p3}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lld7;

    iput-object p1, p0, Lkd7;->k:Lld7;

    if-nez p1, :cond_25

    return-void

    :cond_25
    iget-object p1, p1, Lld7;->c:Ljava/lang/Object;

    check-cast p1, Li7f;

    invoke-virtual {p1, p0}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Lkd7;->j:Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapk;

    iget-object p0, p0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v0, Lr4k;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lr4k;-><init>(B)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_18

    iget-object p0, p0, Lkd7;->j:Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapk;

    iget-object v0, p0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v1, Lyok;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lyok;-><init>(Lapk;Ljava/util/List;B)V

    const/4 p0, 0x0

    invoke-static {v0, p0, v2, v1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    :cond_18
    return-void
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 10

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lkd7;->l:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    const/4 v1, 0x1

    if-nez p1, :cond_d

    iput-boolean v1, p0, Lkd7;->m:Z

    return-void

    :cond_d
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v2, 0x0

    :goto_12
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lhd7;

    iget-wide v4, v3, Lhd7;->c:J

    iget-wide v6, p0, Lkd7;->n:J

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2c

    iget-object v4, v3, Lhd7;->a:Ljava/lang/String;

    invoke-virtual {v0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    :cond_2c
    move v2, v1

    goto :goto_12

    :cond_2e
    if-eqz v2, :cond_3b

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-static {p1}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lldk;->g(Ljava/lang/Object;)V

    :cond_3b
    iput-boolean v1, p0, Lkd7;->m:Z

    return-void
.end method
