.class public final synthetic Lfoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqsh;


# direct methods
.method public synthetic constructor <init>(Lqsh;B)V
    .registers 3

    iput-byte p2, p0, Lfoj;->a:B

    iput-object p1, p0, Lfoj;->b:Lqsh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lfoj;->a:B

    iget-object p0, p0, Lfoj;->b:Lqsh;

    packed-switch v0, :pswitch_data_a6

    iget-object v0, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v1, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_99

    iget-object p0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast p0, Leoj;

    iget-object v0, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2c
    :goto_2c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_45

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lb2l;

    invoke-interface {v3}, Lb9l;->T()Lp6l;

    move-result-object v3

    sget-object v4, Lp6l;->a:Lp6l;

    if-ne v3, v4, :cond_2c

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2c

    :cond_45
    new-instance v0, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v1, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_56
    if-ge v4, v2, :cond_6a

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lb2l;

    check-cast v5, Ld7l;

    invoke-virtual {v5}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_56

    :cond_6a
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Leoj;->c:Livg;

    new-instance v2, Lvvf;

    const/16 v4, 0x19

    invoke-direct {v2, v0, p0, v4}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v1, Livg;->b:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v0, Lrml;

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v4, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Ljoj;

    invoke-direct {p0, v1, v3}, Ljoj;-><init>(Livg;B)V

    invoke-virtual {v0, p0}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    new-instance v0, Ltji;

    const/16 v1, 0x15

    invoke-direct {v0, v2, v1}, Ltji;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    :cond_99
    return-void

    :pswitch_9a
    sget-object v0, Lava;->a:Lcva;

    new-instance v1, Lfoj;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lfoj;-><init>(Lqsh;B)V

    invoke-virtual {v0, v1}, Lcva;->a(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_a6
    .packed-switch 0x0
        :pswitch_9a
    .end packed-switch
.end method
