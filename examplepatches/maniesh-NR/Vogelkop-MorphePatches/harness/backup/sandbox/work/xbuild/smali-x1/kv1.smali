.class public final synthetic Lkv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkri;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lkv1;->a:B

    iput-object p1, p0, Lkv1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lq6e;)V
    .registers 6

    iget-byte v0, p0, Lkv1;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lkv1;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_80

    check-cast p0, Lydn;

    iget-object p1, p1, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lydn;->G(Ljava/util/List;)V

    return-void

    :pswitch_14
    check-cast p0, Lm6m;

    invoke-virtual {p0, v1}, Lm6m;->a(Z)V

    return-void

    :pswitch_1a
    check-cast p0, Lghf;

    iget-object p1, p1, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2a
    :goto_2a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_46

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leri;

    invoke-interface {v2}, Leri;->d()Z

    move-result v3

    if-nez v3, :cond_2a

    invoke-interface {v2}, Leri;->j()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2a

    invoke-virtual {v0, v2}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    :cond_46
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p1

    iget-object v0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast v0, Lqie;

    iget-object v2, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v2, Lumi;

    new-instance v3, Ljri;

    invoke-direct {v3, p1, p0, v1}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v2, v3}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance p1, Loml;

    invoke-direct {p1, p0}, Loml;-><init>(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p1, p0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void

    :pswitch_65
    check-cast p0, Lu0a;

    iget-object p0, p0, Lu0a;->a:Lpde;

    sget-object p1, Ls0a;->a:Ls0a;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_6f
    check-cast p0, Liv7;

    invoke-virtual {p0}, Liv7;->d()V

    return-void

    :pswitch_75
    check-cast p0, Lkze;

    invoke-virtual {p1}, Lq6e;->b()Leri;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_75
        :pswitch_6f
        :pswitch_65
        :pswitch_1a
        :pswitch_14
    .end packed-switch
.end method
