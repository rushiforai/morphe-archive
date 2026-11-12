.class public final Lrr8;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final j:Lk32;

.field public final k:Lvuh;

.field public final l:Ljava/util/HashMap;

.field public m:I


# direct methods
.method public constructor <init>(Lumi;Lk32;Lvuh;)V
    .registers 5

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0, p1}, Lldk;-><init>(Ltcl;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lrr8;->l:Ljava/util/HashMap;

    iput-object p2, p0, Lrr8;->j:Lk32;

    iput-object p3, p0, Lrr8;->k:Lvuh;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Lrr8;->j:Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljqh;

    iget-object p0, p0, Ljqh;->a:Lcom/opera/android/redirect_store/RedirectStoreDatabase_Impl;

    new-instance v0, Lu4h;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lu4h;-><init>(B)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 7

    check-cast p1, Lgqh;

    iget-object v0, p0, Lrr8;->j:Lk32;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljqh;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v1, Ljqh;->a:Lcom/opera/android/redirect_store/RedirectStoreDatabase_Impl;

    new-instance v3, Lvvf;

    const/16 v4, 0xd

    invoke-direct {v3, v1, p1, v4}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p1, 0x0

    const/4 v1, 0x1

    invoke-static {v2, p1, v1, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljqh;

    iget-object v0, v0, Ljqh;->a:Lcom/opera/android/redirect_store/RedirectStoreDatabase_Impl;

    new-instance v2, Lu4h;

    invoke-direct {v2, v4}, Lu4h;-><init>(B)V

    invoke-static {v0, v1, p1, v2}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    new-instance v0, Lbr;

    const/16 v1, 0xb

    invoke-direct {v0, p0, p1, v1}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v0}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lrr8;->l:Ljava/util/HashMap;

    if-eqz p1, :cond_26

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_a
    :goto_a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgqh;

    iget-object v2, v1, Lgqh;->b:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    iget-object v2, v1, Lgqh;->b:Ljava/lang/String;

    iget-object v1, v1, Lgqh;->a:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a

    :cond_26
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result p1

    new-instance v0, Lbr;

    const/16 v1, 0xb

    invoke-direct {v0, p0, p1, v1}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v0}, Lvml;->e(Ljava/lang/Runnable;)V

    return-void
.end method
