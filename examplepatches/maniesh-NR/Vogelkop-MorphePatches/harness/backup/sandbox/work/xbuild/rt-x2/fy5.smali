.class public final synthetic Lfy5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;B)V
    .registers 3

    iput-byte p2, p0, Lfy5;->a:B

    iput-object p1, p0, Lfy5;->b:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lfy5;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lfy5;->b:Ljava/util/List;

    packed-switch v0, :pswitch_data_be

    check-cast p1, Ljava/lang/Throwable;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lg07;

    invoke-virtual {p1}, Lg07;->b()V

    goto :goto_e

    :cond_1e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_21
    check-cast p1, Lrg0;

    iget-object p1, p1, Lrg0;->a:Lqg0;

    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_3b

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3b

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_48

    :cond_3b
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v0, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_48
    check-cast p0, Ljava/util/Collection;

    invoke-virtual {v1, p0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_50
    check-cast p1, Lrg0;

    iget-object p1, p1, Lrg0;->a:Lqg0;

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_6a

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6a

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_77

    :cond_6a
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v0, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_77
    check-cast p0, Ljava/util/Collection;

    invoke-virtual {v1, p0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7f
    check-cast p1, Lrg0;

    iget-object p1, p1, Lrg0;->a:Lqg0;

    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_99

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_99

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_a6

    :cond_99
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v0, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_a6
    check-cast p0, Ljava/util/Collection;

    invoke-virtual {v1, p0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ae
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ley5;

    iget-object p0, p0, Ley5;->c:Ljava/lang/String;

    return-object p0

    nop

    :pswitch_data_be
    .packed-switch 0x0
        :pswitch_ae
        :pswitch_7f
        :pswitch_50
        :pswitch_21
    .end packed-switch
.end method
