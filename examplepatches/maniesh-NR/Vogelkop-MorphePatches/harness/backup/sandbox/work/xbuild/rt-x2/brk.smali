.class public final synthetic Lbrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrk;


# direct methods
.method public synthetic constructor <init>(Lmrk;B)V
    .registers 3

    iput-byte p2, p0, Lbrk;->a:B

    iput-object p1, p0, Lbrk;->b:Lmrk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lbrk;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lbrk;->b:Lmrk;

    packed-switch v0, :pswitch_data_128

    iget-object v0, p0, Lmrk;->x:Lpde;

    invoke-virtual {p0}, Lmrk;->e()Lfyj;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_14
    iget-object p0, p0, Lmrk;->G:Lrv7;

    iget-object p0, p0, Lrv7;->v:Lqde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_27
    :goto_27
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_64

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljx1;

    if-eqz v2, :cond_60

    instance-of v3, v2, Lvx1;

    if-eqz v3, :cond_52

    check-cast v2, Lvx1;

    iget-object v2, v2, Lvx1;->b:Lwxe;

    if-eqz v2, :cond_4e

    instance-of v3, v2, Lqx1;

    if-eqz v3, :cond_45

    move-object v2, v1

    goto :goto_5a

    :cond_45
    instance-of v3, v2, Ltx1;

    if-eqz v3, :cond_4e

    check-cast v2, Ltx1;

    iget-object v2, v2, Ltx1;->m:Landroid/net/Uri;

    goto :goto_5a

    :cond_4e
    invoke-static {}, Lh9o;->p()V

    goto :goto_65

    :cond_52
    instance-of v3, v2, Lfz1;

    if-eqz v3, :cond_60

    check-cast v2, Lfz1;

    iget-object v2, v2, Lfz1;->c:Landroid/net/Uri;

    :goto_5a
    if-eqz v2, :cond_27

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_27

    :cond_60
    invoke-static {}, Lh9o;->p()V

    goto :goto_65

    :cond_64
    move-object v1, v0

    :goto_65
    return-object v1

    :pswitch_66
    iget-object p0, p0, Lmrk;->G:Lrv7;

    iget-object p0, p0, Lrv7;->v:Lqde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {p0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_7f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_cc

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljx1;

    if-eqz v2, :cond_c8

    instance-of v3, v2, Lvx1;

    sget-object v4, Lwx0;->a:Lwx0;

    if-eqz v3, :cond_af

    check-cast v2, Lvx1;

    iget-object v2, v2, Lvx1;->b:Lwxe;

    if-eqz v2, :cond_ab

    instance-of v3, v2, Lqx1;

    if-eqz v3, :cond_a7

    new-instance v4, Lux0;

    check-cast v2, Lqx1;

    iget-object v2, v2, Lqx1;->o:Lo29;

    invoke-direct {v4, v2}, Lux0;-><init>(Lo29;)V

    goto :goto_c4

    :cond_a7
    instance-of v2, v2, Ltx1;

    if-nez v2, :cond_c4

    :cond_ab
    invoke-static {}, Lh9o;->p()V

    goto :goto_cd

    :cond_af
    instance-of v3, v2, Lfz1;

    if-eqz v3, :cond_c8

    check-cast v2, Lfz1;

    iget-object v3, v2, Lfz1;->c:Landroid/net/Uri;

    if-nez v3, :cond_c4

    new-instance v4, Lvx0;

    iget-object v2, v2, Lfz1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v4, v2}, Lvx0;-><init>(I)V

    :cond_c4
    :goto_c4
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7f

    :cond_c8
    invoke-static {}, Lh9o;->p()V

    goto :goto_cd

    :cond_cc
    move-object v1, v0

    :goto_cd
    return-object v1

    :pswitch_ce
    iget-object p0, p0, Lmrk;->i:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_dd

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    goto :goto_de

    :cond_dd
    const/4 p0, 0x0

    :goto_de
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_e3
    iget-object p0, p0, Lmrk;->C:Lhqk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_f3
    :goto_f3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lgqk;

    instance-of v3, v2, Lfqk;

    if-eqz v3, :cond_f3

    check-cast v2, Lfqk;

    iget-object v2, v2, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f3

    :cond_10b
    iget-boolean p0, p0, Lhqk;->j:Z

    const/4 v1, 0x1

    if-ne p0, v1, :cond_113

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    :cond_113
    return-object v0

    :pswitch_114
    iget-object p0, p0, Lmrk;->I:Lirk;

    iget-boolean p0, p0, Lirk;->a:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_11d
    iget-object p0, p0, Lmrk;->h:Liv7;

    invoke-virtual {p0}, Liv7;->b()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_128
    .packed-switch 0x0
        :pswitch_11d
        :pswitch_114
        :pswitch_e3
        :pswitch_ce
        :pswitch_66
        :pswitch_14
    .end packed-switch
.end method
