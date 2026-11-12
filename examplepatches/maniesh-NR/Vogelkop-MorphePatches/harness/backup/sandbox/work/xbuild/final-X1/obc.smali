.class public final synthetic Lobc;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lobc;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Lobc;->a:B

    const/16 v2, 0xc

    sget-object v3, Lvt0;->b:Lvt0;

    const/16 v4, 0x9c4

    const-string v5, "vpn_pro.kill_switch.on"

    const/4 v6, 0x3

    sget-object v7, Lijm;->b:Lijm;

    const/4 v8, 0x0

    const/4 v9, 0x6

    const/4 v10, 0x1

    const/4 v11, 0x0

    packed-switch v1, :pswitch_data_406

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Li2e;

    check-cast v0, Lq2e;

    iget-object v0, v0, Lq2e;->i:Lw6j;

    invoke-virtual {v0}, Lw6j;->q()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_24
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Li2e;

    check-cast v0, Lq2e;

    iget-object v1, v0, Lq2e;->i:Lw6j;

    iget-object v2, v1, Lw6j;->c:Ljava/lang/Object;

    check-cast v2, Lnak;

    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnek;

    if-eqz v2, :cond_47

    instance-of v2, v2, Llek;

    if-nez v2, :cond_47

    iget-object v0, v0, Lq2e;->l:Lnak;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v11, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_5c

    :cond_47
    iget-object v0, v1, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Ld3k;

    if-eqz v0, :cond_53

    invoke-virtual {v0}, Lxob;->isActive()Z

    move-result v0

    if-eq v0, v10, :cond_5c

    :cond_53
    iget-object v0, v1, Lw6j;->c:Ljava/lang/Object;

    check-cast v0, Lnak;

    invoke-virtual {v0, v11}, Lnak;->j(Ljava/lang/Object;)V

    iput-object v11, v1, Lw6j;->e:Ljava/lang/Object;

    :cond_5c
    :goto_5c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5f
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Li2e;

    check-cast v0, Lq2e;

    iget-object v1, v0, Lq2e;->k:Lnak;

    :cond_67
    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lc2e;

    invoke-virtual {v1, v0, v11}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_67

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_77
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lm0e;

    iget-object v1, v0, Lm0e;->a:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lng;->a:Lng;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8c

    invoke-virtual {v0}, Lm0e;->b()V

    :cond_8c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8f
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lcrd;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "package:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v2, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_c2
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lfrd;

    iget-object v0, v0, Lfrd;->d:Lqoj;

    const v1, 0x7f140d67

    sget-object v2, Llag;->d:Llag;

    invoke-virtual {v0, v1, v2}, Lqoj;->a(ILlag;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_d3
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lfrd;

    iget-object v0, v0, Lfrd;->c:Ld8j;

    check-cast v0, Lg8j;

    invoke-virtual {v0}, Lg8j;->h()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_e1
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lcrd;

    invoke-virtual {v0}, Lryl;->g0()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_eb
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, La9d;

    iget-object v0, v0, La9d;->h:Lorm;

    sget-object v1, Lwb0;->d:Lwb0;

    invoke-static {v0, v9, v1}, Lorm;->a(Lorm;ILwb0;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_f9
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, La9d;

    iget-object v1, v0, La9d;->h:Lorm;

    sget-object v2, Lwb0;->b:Lwb0;

    invoke-static {v1, v9, v2}, Lorm;->a(Lorm;ILwb0;)V

    iget-object v1, v0, La9d;->g:Lru9;

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object v1

    iget-object v2, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, v5, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    iget-object v1, v0, La9d;->p:Lnak;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v11, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object v0, v0, La9d;->j:Lysj;

    new-instance v1, Lglj;

    new-instance v2, Lrxh;

    const v3, 0x7f1407d4

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    invoke-direct {v1, v2, v4}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v7}, Lr22;->b(Ljjm;Lijm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_136
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, La9d;

    iget-object v0, v0, La9d;->h:Lorm;

    sget-object v1, Lwb0;->c:Lwb0;

    invoke-static {v0, v9, v1}, Lorm;->a(Lorm;ILwb0;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_144
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, La9d;

    iget-object v1, v0, La9d;->h:Lorm;

    check-cast v1, Lx5f;

    invoke-virtual {v1, v3}, Lx5f;->Q0(Lvt0;)V

    iget-object v0, v0, La9d;->k:Lyug;

    invoke-static {v0, v2, v11, v9}, Lyug;->c(Lyug;ILltg;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_157
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, La9d;

    iget-object v1, v0, La9d;->n:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu8d;

    if-eqz v1, :cond_176

    iget-byte v1, v1, Lu8d;->a:B

    if-ne v1, v6, :cond_176

    iget-object v1, v0, La9d;->h:Lorm;

    check-cast v1, Lx5f;

    invoke-virtual {v1, v3}, Lx5f;->Q0(Lvt0;)V

    iget-object v0, v0, La9d;->k:Lyug;

    invoke-static {v0, v2, v11, v9}, Lyug;->c(Lyug;ILltg;I)V

    goto :goto_185

    :cond_176
    iget-object v1, v0, La9d;->f:Lfmk;

    new-instance v2, Lw8d;

    invoke-direct {v2, v0, v8}, Lw8d;-><init>(La9d;I)V

    iget-object v0, v1, Lfmk;->d:Ljava/util/HashSet;

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lfmk;->b()V

    :goto_185
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_188
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, La9d;

    iget-object v1, v0, La9d;->h:Lorm;

    sget-object v2, Lvt0;->d:Lvt0;

    check-cast v1, Lx5f;

    invoke-virtual {v1, v2}, Lx5f;->Q0(Lvt0;)V

    iget-object v1, v0, La9d;->g:Lru9;

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object v1

    iget-object v2, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, v5, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    iget-object v1, v0, La9d;->p:Lnak;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v11, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object v0, v0, La9d;->j:Lysj;

    new-instance v1, Lglj;

    new-instance v2, Lrxh;

    const v3, 0x7f1413ea

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    invoke-direct {v1, v2, v4}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v7}, Lr22;->b(Ljjm;Lijm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1c7
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, La9d;

    iget-object v0, v10, La9d;->h:Lorm;

    sget-object v1, Lvt0;->c:Lvt0;

    check-cast v0, Lx5f;

    invoke-virtual {v0, v1}, Lx5f;->Q0(Lvt0;)V

    iget-object v0, v10, La9d;->i:Lz77;

    new-instance v8, Lobc;

    const/4 v14, 0x0

    const/16 v15, 0x13

    const/4 v9, 0x0

    const-class v11, La9d;

    const-string v12, "onSwitchToFreeDialogClosed"

    const-string v13, "onSwitchToFreeDialogClosed()V"

    invoke-direct/range {v8 .. v15}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v1, v8

    new-instance v8, Lobc;

    const/16 v15, 0x14

    const-string v12, "onSwitchToFreeDialogConfirmed"

    const-string v13, "onSwitchToFreeDialogConfirmed()V"

    invoke-direct/range {v8 .. v15}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v2, v8

    new-instance v8, Lobc;

    const/16 v15, 0x15

    const-string v12, "onSwitchToFreeDialogDismissed"

    const-string v13, "onSwitchToFreeDialogDismissed()V"

    invoke-direct/range {v8 .. v15}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v11, Lpf5;

    new-instance v3, Lmf5;

    const/4 v4, 0x7

    invoke-direct {v3, v4}, Lmf5;-><init>(B)V

    const v15, 0x7f1411d5

    const v16, 0x7f140584

    const v17, 0x7f1403bf

    move-object v13, v1

    move-object v12, v2

    move-object/from16 v18, v3

    move-object v14, v8

    invoke-direct/range {v11 .. v18}, Lpf5;-><init>(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;IIILkotlin/jvm/functions/Function0;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v11, v7}, Lr22;->b(Ljjm;Lijm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_220
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, La9d;

    iget-object v1, v0, La9d;->h:Lorm;

    sget-object v2, Lvt0;->e:Lvt0;

    check-cast v1, Lx5f;

    invoke-virtual {v1, v2}, Lx5f;->Q0(Lvt0;)V

    iget-object v1, v0, La9d;->f:Lfmk;

    new-instance v2, Lw8d;

    invoke-direct {v2, v0, v10}, Lw8d;-><init>(La9d;I)V

    iget-object v0, v1, Lfmk;->d:Ljava/util/HashSet;

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lfmk;->b()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23f
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, La9d;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "https://support-vpn-pro.opera.com/"

    sget-object v1, Llqm;->d:Llqm;

    invoke-static {v0, v1, v8}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput v6, v0, Lvx3;->b:I

    invoke-static {v0, v10, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_256
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Li8d;

    invoke-virtual {v0}, Lryl;->g0()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_260
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v1, v0, Lr6d;->v:Lnak;

    :cond_268
    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_268

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_27d
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v0, v0, Lr6d;->d:Lv5d;

    iget-object v0, v0, Lv5d;->h:Le6g;

    invoke-virtual {v0}, Le6g;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_28d
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v1, v0, Lr6d;->l:Lrlh;

    iget-object v1, v1, Lrlh;->a:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrn4;

    instance-of v2, v1, Lqn4;

    if-eqz v2, :cond_32b

    check-cast v1, Lqn4;

    iget-object v1, v1, Lqn4;->a:Ljava/util/List;

    iget-object v2, v0, Lr6d;->j:Lrlh;

    iget-object v2, v2, Lrlh;->a:Lnak;

    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lutm;

    iget-object v2, v2, Lutm;->b:Lg1b;

    invoke-static {v1, v2}, Lfr3;->g(Ljava/util/List;Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2c3

    iget-object v0, v0, Lr6d;->d:Lv5d;

    iget-object v0, v0, Lv5d;->f:Ln7i;

    invoke-virtual {v0}, Ln7i;->invoke()Ljava/lang/Object;

    goto :goto_32b

    :cond_2c3
    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2ce
    :goto_2ce
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2fb

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lom4;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2ce

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2e5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2ce

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ln01;

    iget-object v7, v7, Ln01;->a:Ll01;

    iget-object v9, v5, Lom4;->a:Ll01;

    if-ne v7, v9, :cond_2e5

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2ce

    :cond_2fb
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v3, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_30a
    if-ge v8, v2, :cond_31a

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v8, v8, 0x1

    check-cast v4, Lom4;

    iget-object v4, v4, Lom4;->b:Ln01;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_30a

    :cond_31a
    invoke-static {v1}, Lrm5;->U(Ljava/lang/Iterable;)Lg1b;

    move-result-object v1

    iget-object v0, v0, Lr6d;->t:Lnak;

    new-instance v2, Lzjm;

    invoke-direct {v2, v1}, Lzjm;-><init>(Lg1b;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v11, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_32b
    :goto_32b
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_32e
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v0, v0, Lr6d;->d:Lv5d;

    iget-object v0, v0, Lv5d;->g:Ln7i;

    invoke-virtual {v0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_33e
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v0, v0, Lr6d;->d:Lv5d;

    iget-object v0, v0, Lv5d;->c:Ln7i;

    invoke-virtual {v0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_34e
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v0, v0, Lr6d;->d:Lv5d;

    iget-object v0, v0, Lv5d;->b:Ln7i;

    invoke-virtual {v0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_35e
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v0, v0, Lr6d;->t:Lnak;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lyjm;->a:Lyjm;

    invoke-virtual {v0, v11, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_371
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v1, v0, Lr6d;->v:Lnak;

    :cond_379
    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_379

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_38e
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    move-object v1, v0

    check-cast v1, Lr6d;

    iget-object v2, v1, Lr6d;->f:Lnak;

    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_3cb

    :cond_3a3
    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0, v3}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a3

    invoke-static {v1}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v0

    new-instance v2, La6d;

    const/4 v3, 0x4

    invoke-direct {v2, v1, v11, v3}, La6d;-><init>(Lr6d;Lmt5;B)V

    invoke-static {v0, v11, v11, v2, v6}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    new-instance v2, Lx5d;

    invoke-direct {v2, v1, v8}, Lx5d;-><init>(Lr6d;B)V

    invoke-virtual {v0, v2}, Lxob;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    :cond_3cb
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3ce
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v0, v0, Lr6d;->d:Lv5d;

    iget-object v0, v0, Lv5d;->a:Ln7i;

    invoke-virtual {v0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3de
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ljbc;

    check-cast v0, Lnbc;

    iget-object v0, v0, Lnbc;->c:Lkbc;

    iget-object v0, v0, Lkbc;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3ee
    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ljbc;

    check-cast v0, Lnbc;

    iget-object v0, v0, Lnbc;->c:Lkbc;

    iget-object v0, v0, Lkbc;->a:Lkotlin/jvm/functions/Function2;

    const-string v1, "https://www.opera.com/legal/privacy"

    invoke-static {v1}, Lbwg;->G(Ljava/lang/String;)Lgpm;

    move-result-object v1

    sget-object v2, Lcc;->b:Lcc;

    invoke-interface {v0, v1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_406
    .packed-switch 0x0
        :pswitch_3ee
        :pswitch_3de
        :pswitch_3ce
        :pswitch_38e
        :pswitch_371
        :pswitch_35e
        :pswitch_34e
        :pswitch_33e
        :pswitch_32e
        :pswitch_28d
        :pswitch_27d
        :pswitch_260
        :pswitch_256
        :pswitch_23f
        :pswitch_220
        :pswitch_1c7
        :pswitch_188
        :pswitch_157
        :pswitch_144
        :pswitch_136
        :pswitch_f9
        :pswitch_eb
        :pswitch_e1
        :pswitch_d3
        :pswitch_c2
        :pswitch_8f
        :pswitch_77
        :pswitch_5f
        :pswitch_24
    .end packed-switch
.end method
