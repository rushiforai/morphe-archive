.class public final synthetic Lxt7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwjh;


# direct methods
.method public synthetic constructor <init>(Lwjh;B)V
    .registers 3

    iput-byte p2, p0, Lxt7;->a:B

    iput-object p1, p0, Lxt7;->b:Lwjh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lxt7;->a:B

    iget-object p0, p0, Lxt7;->b:Lwjh;

    packed-switch v0, :pswitch_data_e6

    check-cast p1, Leri;

    invoke-virtual {p0}, Lwjh;->C()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Lwf;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1f

    sget-object p1, Ll08;->a:Ll08;

    goto/16 :goto_bf

    :cond_1f
    check-cast p1, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_be

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljx1;

    const/4 v3, 0x0

    if-eqz v2, :cond_ba

    instance-of v4, v2, Lsx1;

    if-eqz v4, :cond_48

    new-instance v3, Leu7;

    check-cast v2, Lsx1;

    iget-object v2, v2, Lvx1;->a:Ljava/lang/String;

    invoke-direct {v3, v2}, Leu7;-><init>(Ljava/lang/String;)V

    goto/16 :goto_b5

    :cond_48
    instance-of v4, v2, Lrx1;

    if-eqz v4, :cond_84

    check-cast v2, Lrx1;

    iget-object v4, v2, Lvx1;->a:Ljava/lang/String;

    iget-object v2, v2, Lvx1;->b:Lwxe;

    if-eqz v2, :cond_80

    instance-of v5, v2, Lqx1;

    if-eqz v5, :cond_69

    new-instance v3, Ldu7;

    new-instance v5, Lnw0;

    check-cast v2, Lqx1;

    iget-object v6, v2, Lqx1;->m:Ljava/io/File;

    iget-object v2, v2, Lqx1;->o:Lo29;

    invoke-direct {v5, v6, v2}, Lnw0;-><init>(Ljava/io/File;Lo29;)V

    invoke-direct {v3, v4, v5}, Ldu7;-><init>(Ljava/lang/String;Lqw0;)V

    goto :goto_b5

    :cond_69
    instance-of v5, v2, Ltx1;

    if-eqz v5, :cond_80

    new-instance v3, Ldu7;

    new-instance v5, Low0;

    check-cast v2, Ltx1;

    iget-object v2, v2, Ltx1;->m:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v5, v2}, Low0;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4, v5}, Ldu7;-><init>(Ljava/lang/String;Lqw0;)V

    goto :goto_b5

    :cond_80
    invoke-static {}, Lh9o;->p()V

    goto :goto_e5

    :cond_84
    instance-of v4, v2, Lpx1;

    if-eqz v4, :cond_92

    new-instance v3, Lcu7;

    check-cast v2, Lpx1;

    iget-object v2, v2, Lvx1;->a:Ljava/lang/String;

    invoke-direct {v3, v2}, Lcu7;-><init>(Ljava/lang/String;)V

    goto :goto_b5

    :cond_92
    instance-of v4, v2, Lfz1;

    if-eqz v4, :cond_ba

    check-cast v2, Lfz1;

    iget-object v3, v2, Lfz1;->c:Landroid/net/Uri;

    iget-object v4, v2, Lfz1;->a:Ljava/lang/String;

    if-eqz v3, :cond_ae

    new-instance v2, Ldu7;

    new-instance v5, Low0;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Low0;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v4, v5}, Ldu7;-><init>(Ljava/lang/String;Lqw0;)V

    move-object v3, v2

    goto :goto_b5

    :cond_ae
    new-instance v3, Lfu7;

    iget-object v2, v2, Lfz1;->b:Ljava/lang/String;

    invoke-direct {v3, v4, v2}, Lfu7;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_b5
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2a

    :cond_ba
    invoke-static {}, Lh9o;->p()V

    goto :goto_e5

    :cond_be
    move-object p1, v1

    :goto_bf
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Leme;

    invoke-direct {v1, v0}, Leme;-><init>(Ljava/lang/Object;)V

    iget-object v0, v0, Ldt1;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v2, Lik;

    const/4 v3, 0x1

    invoke-direct {v2, v0, p1, v3}, Lik;-><init>(Ljava/util/ArrayList;Ljava/util/List;B)V

    invoke-static {v2, v3}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v2

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v2, v1}, Lj87;->a(Lsic;)V

    invoke-virtual {p0}, Lwjh;->C()V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_e5
    return-object v3

    :pswitch_data_e6
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
