.class public final Lwf;
.super Ldt1;
.source "SourceFile"


# instance fields
.field public final synthetic e:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lwf;->e:B

    invoke-direct {p0}, Ldt1;-><init>()V

    return-void
.end method


# virtual methods
.method public final P(Ljava/util/List;)V
    .registers 5

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_11
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpc;

    new-instance v2, Lvf;

    invoke-direct {v2, v1}, Lvf;-><init>(Lpc;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_26
    new-instance p1, Leme;

    invoke-direct {p1, p0}, Leme;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    new-instance v1, Lik;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v0, v2}, Lik;-><init>(Ljava/util/ArrayList;Ljava/util/List;B)V

    invoke-static {v1, v2}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v1

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v1, p1}, Lj87;->a(Lsic;)V

    return-void
.end method

.method public final getItemId(I)J
    .registers 3

    iget-byte v0, p0, Lwf;->e:B

    sparse-switch v0, :sswitch_data_3e

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemId(I)J

    move-result-wide p0

    return-wide p0

    :sswitch_a
    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsmh;

    invoke-interface {p0}, Lsmh;->getId()J

    move-result-wide p0

    return-wide p0

    :sswitch_19
    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkv2;

    iget-object p0, p0, Lkv2;->a:Lpc;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    int-to-long p0, p0

    return-wide p0

    :sswitch_2b
    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvf;

    iget-object p0, p0, Lvf;->a:Lpc;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    int-to-long p0, p0

    return-wide p0

    nop

    :sswitch_data_3e
    .sparse-switch
        0x0 -> :sswitch_2b
        0x2 -> :sswitch_19
        0x5 -> :sswitch_a
    .end sparse-switch
.end method
