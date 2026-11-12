.class public final synthetic Ln5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/util/LinkedHashMap;

.field public final synthetic e:Z

.field public final synthetic f:Lnm0;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/util/LinkedHashMap;ZLnm0;B)V
    .registers 7

    iput-byte p6, p0, Ln5f;->a:B

    iput-object p1, p0, Ln5f;->b:Ljava/util/List;

    iput-object p2, p0, Ln5f;->c:Ljava/lang/String;

    iput-object p3, p0, Ln5f;->d:Ljava/util/LinkedHashMap;

    iput-boolean p4, p0, Ln5f;->e:Z

    iput-object p5, p0, Ln5f;->f:Lnm0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Ln5f;->a:B

    const/4 v1, -0x1

    const/16 v2, 0x98b

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_10c

    check-cast p1, Lmm0;

    iget-object v0, p1, Lmm0;->b:Llm0;

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    if-eqz v5, :cond_22

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_22

    new-instance v6, Lhf0;

    invoke-direct {v6, v0, v4, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_2f

    :cond_22
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v4, v3, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Lhf0;

    invoke-direct {v6, v0, v4, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_2f
    iget-object v5, p0, Ln5f;->b:Ljava/util/List;

    check-cast v5, Ljava/util/Collection;

    invoke-virtual {v6, v5}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    iget-object v5, p0, Ln5f;->c:Ljava/lang/String;

    if-eqz v5, :cond_3d

    invoke-virtual {v0, v3, v3, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_3d
    iget-object v5, p0, Ln5f;->d:Ljava/util/LinkedHashMap;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_47
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_99

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lpcg;

    iget-object v8, p1, Lmm0;->a:Lzpa;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Ljt0;

    const/4 v9, 0x2

    invoke-direct {v8, v2, v1, v9}, Ljf0;-><init>(III)V

    invoke-virtual {v0, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map;

    if-eqz v10, :cond_7e

    invoke-interface {v10}, Ljava/util/Map;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_7e

    new-instance v11, Lif0;

    invoke-direct {v11, v0, v9, v10}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_8b

    :cond_7e
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v9, v3, v10}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v11, Lif0;

    invoke-direct {v11, v0, v9, v10}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_8b
    invoke-virtual {v11, v7, v8}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v7, v6, Lpcg;->a:Lvd0;

    invoke-virtual {v8, v4, v3, v7}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v6, v6, Lpcg;->b:Lop0;

    invoke-virtual {v8, v3, v3, v6}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_47

    :cond_99
    const/4 p1, 0x3

    iget-boolean v1, p0, Ln5f;->e:Z

    invoke-virtual {v0, p1, v3, v1}, Ljf0;->r(IIZ)V

    const/4 p1, 0x4

    iget-object p0, p0, Ln5f;->f:Lnm0;

    invoke-virtual {v0, p1, v3, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a8
    check-cast p1, Lyb0;

    new-instance v4, Ln5f;

    const/4 v10, 0x2

    iget-object v5, p0, Ln5f;->b:Ljava/util/List;

    iget-object v6, p0, Ln5f;->c:Ljava/lang/String;

    iget-object v7, p0, Ln5f;->d:Ljava/util/LinkedHashMap;

    iget-boolean v8, p0, Ln5f;->e:Z

    iget-object v9, p0, Ln5f;->f:Lnm0;

    invoke-direct/range {v4 .. v10}, Ln5f;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/LinkedHashMap;ZLnm0;B)V

    iget-object p0, p1, Lyb0;->a:Lzpa;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Llm0;

    const/4 v5, 0x5

    invoke-direct {v0, v2, v1, v5}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lyb0;->b:Lxb0;

    const/16 v1, 0x38

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_dd

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_dd

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_e6

    :cond_dd
    invoke-static {p1, v1, v3}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_e6
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lmm0;

    invoke-direct {p1, p0, v0}, Lmm0;-><init>(Lzpa;Llm0;)V

    invoke-virtual {v4, p1}, Ln5f;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f4
    check-cast p1, Ltd0;

    new-instance v0, Ln5f;

    const/4 v6, 0x1

    iget-object v1, p0, Ln5f;->b:Ljava/util/List;

    iget-object v2, p0, Ln5f;->c:Ljava/lang/String;

    iget-object v3, p0, Ln5f;->d:Ljava/util/LinkedHashMap;

    iget-boolean v4, p0, Ln5f;->e:Z

    iget-object v5, p0, Ln5f;->f:Lnm0;

    invoke-direct/range {v0 .. v6}, Ln5f;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/LinkedHashMap;ZLnm0;B)V

    invoke-virtual {p1, v0}, Ltd0;->b(Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_10c
    .packed-switch 0x0
        :pswitch_f4
        :pswitch_a8
    .end packed-switch
.end method
