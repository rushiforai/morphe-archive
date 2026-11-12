.class public final synthetic Ld5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvb0;


# direct methods
.method public synthetic constructor <init>(Lvb0;B)V
    .registers 3

    iput-byte p2, p0, Ld5f;->a:B

    iput-object p1, p0, Ld5f;->b:Lvb0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Ld5f;->a:B

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/16 v3, 0x98b

    const/4 v4, 0x1

    iget-object p0, p0, Ld5f;->b:Lvb0;

    packed-switch v0, :pswitch_data_c8

    check-cast p1, Lyb0;

    iget-object v0, p1, Lyb0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ldv0;

    invoke-direct {v0, v3, v2, v4}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lyb0;->b:Lxb0;

    const/16 v2, 0x34

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_30

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_30

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_39

    :cond_30
    invoke-static {p1, v2, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_39
    invoke-virtual {v5, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_42
    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->d()Ltd0;

    move-result-object p1

    iget-object p1, p1, Ltd0;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyb0;

    iget-object v0, p1, Lyb0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lof0;

    invoke-direct {v0, v3, v2, v4}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lyb0;->b:Lxb0;

    const/16 v2, 0x31

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_72

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_72

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_7b

    :cond_72
    invoke-static {p1, v2, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_7b
    invoke-virtual {v5, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_84
    check-cast p1, Lyb0;

    iget-object v0, p1, Lyb0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lyr0;

    invoke-direct {v0, v3, v2, v4}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lyb0;->b:Lxb0;

    const/16 v2, 0x33

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_a8

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_a8

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_b1

    :cond_a8
    invoke-static {p1, v2, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_b1
    invoke-virtual {v5, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ba
    check-cast p1, Ltd0;

    new-instance v0, Ld5f;

    invoke-direct {v0, p0, v4}, Ld5f;-><init>(Lvb0;B)V

    invoke-virtual {p1, v0}, Ltd0;->b(Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_c8
    .packed-switch 0x0
        :pswitch_ba
        :pswitch_84
        :pswitch_42
    .end packed-switch
.end method
