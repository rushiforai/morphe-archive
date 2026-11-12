.class public final synthetic Lgj3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lij3;


# direct methods
.method public synthetic constructor <init>(Lij3;B)V
    .registers 3

    iput-byte p2, p0, Lgj3;->a:B

    iput-object p1, p0, Lgj3;->b:Lij3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lgj3;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lgj3;->b:Lij3;

    packed-switch v0, :pswitch_data_f8

    check-cast p1, Lzie;

    iget-object v0, p1, Lzie;->a:Ljava/util/List;

    check-cast v0, Ljava/util/Collection;

    iget-object v3, p1, Lzie;->b:Ljava/util/List;

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3, v0}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v3, p1, Lzie;->c:Ljava/util/List;

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3, v0}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object p1, p1, Lzie;->d:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_2b
    :goto_2b
    if-ge v1, v0, :cond_5e

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Lyie;

    iget-object v4, v3, Lyie;->b:Lqyn;

    sget-object v5, Lwie;->j:Lwie;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2b

    instance-of v5, v4, Lxie;

    if-nez v5, :cond_2b

    instance-of v4, v4, Lvie;

    if-eqz v4, :cond_5a

    iget-object v4, p0, Lij3;->d:Lf9d;

    new-instance v5, Ld9d;

    iget-object v6, v3, Lyie;->a:Ljava/lang/String;

    iget-object v3, v3, Lyie;->b:Lqyn;

    check-cast v3, Lvie;

    iget-wide v7, v3, Lvie;->j:J

    invoke-direct {v5, v6, v7, v8}, Ld9d;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v4, v5}, Lf9d;->a(Loup;)V

    goto :goto_2b

    :cond_5a
    invoke-static {}, Lh9o;->p()V

    goto :goto_60

    :cond_5e
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_60
    return-object v2

    :pswitch_61
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_70

    iget-object p0, p0, Lij3;->c:Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;

    iget-wide p0, p0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->a:J

    invoke-static {p0, p1}, LJ/N;->M2NvereD(J)V

    :cond_70
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_73
    check-cast p1, Ljava/util/Set;

    iget-object v0, p0, Lij3;->c:Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;

    iget-object p0, p0, Lij3;->g:Ljava/util/LinkedHashSet;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p0, p1}, Lb5j;->d(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_85
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x2

    const/4 v7, 0x3

    if-eqz v4, :cond_ba

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lvj3;

    invoke-interface {p0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v8, v4, Lvj3;->a:Lsj3;

    iget-object v4, v4, Lvj3;->b:Ltj3;

    invoke-static {v4}, Lkfo;->X(Ltj3;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    if-eqz v8, :cond_b3

    if-eq v8, v5, :cond_b4

    if-eq v8, v6, :cond_b1

    if-ne v8, v7, :cond_ad

    move v5, v7

    goto :goto_b4

    :cond_ad
    invoke-static {}, Lh9o;->p()V

    goto :goto_f7

    :cond_b1
    move v5, v6

    goto :goto_b4

    :cond_b3
    move v5, v1

    :cond_b4
    :goto_b4
    iget-wide v6, v0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->a:J

    invoke-static {v6, v7, v5, v4}, LJ/N;->MXETNLFE(JILjava/lang/Object;)V

    goto :goto_85

    :cond_ba
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_be
    :goto_be
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_f5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvj3;

    invoke-interface {p0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_be

    iget-object v4, v3, Lvj3;->a:Lsj3;

    iget-object v3, v3, Lvj3;->b:Ltj3;

    invoke-static {v3}, Lkfo;->X(Ltj3;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_ee

    if-eq v4, v5, :cond_ec

    if-eq v4, v6, :cond_ea

    if-ne v4, v7, :cond_e6

    move v4, v7

    goto :goto_ef

    :cond_e6
    invoke-static {}, Lh9o;->p()V

    goto :goto_f7

    :cond_ea
    move v4, v6

    goto :goto_ef

    :cond_ec
    move v4, v5

    goto :goto_ef

    :cond_ee
    move v4, v1

    :goto_ef
    iget-wide v8, v0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->a:J

    invoke-static {v8, v9, v4, v3}, LJ/N;->Mw9$UdZ2(JILjava/lang/Object;)V

    goto :goto_be

    :cond_f5
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_f7
    return-object v2

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_73
        :pswitch_61
    .end packed-switch
.end method
