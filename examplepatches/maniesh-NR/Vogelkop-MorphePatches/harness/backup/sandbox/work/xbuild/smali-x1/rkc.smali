.class public final synthetic Lrkc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lrkc;->a:B

    iput-object p1, p0, Lrkc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lpfe;Lofe;)V
    .registers 3

    const/16 p2, 0x17

    iput-byte p2, p0, Lrkc;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrkc;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lrkc;->a:B

    const-string v3, "message"

    const-string v4, "code"

    const-string v5, "error"

    const/16 v6, 0xc

    const/16 v7, 0x8

    const/4 v8, -0x1

    const/16 v9, 0x98b

    const/4 v10, 0x2

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    iget-object v0, v0, Lrkc;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_720

    check-cast v0, Landroid/net/Uri;

    check-cast v1, Lck0;

    invoke-virtual {v1}, Lck0;->f()Lhp0;

    move-result-object v1

    iget-object v1, v1, Lhp0;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lve0;

    const-string v2, "client"

    invoke-virtual {v0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_53

    const-string v2, "ms-opera-mobile"

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_55

    const-string v2, "android-ofa-"

    invoke-static {v0, v2, v13}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_55

    const-string v2, "opera"

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_55

    const-string v2, "ms-opera-mi-android"

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_55

    :cond_53
    const-string v0, "<none>"

    :cond_55
    :goto_55
    new-instance v2, Lzbe;

    const/16 v3, 0x1a

    invoke-direct {v2, v3}, Lzbe;-><init>(B)V

    invoke-virtual {v1, v0, v2}, Lve0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_62
    check-cast v0, Lehc;

    check-cast v1, Lck0;

    invoke-virtual {v1}, Lck0;->c()Ltb0;

    move-result-object v1

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Ltb0;->a:Lzpa;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lzc0;

    invoke-direct {v3, v9, v8, v10}, Ljf0;-><init>(III)V

    iget-object v4, v1, Ltb0;->b:Lq56;

    invoke-virtual {v4}, Lq56;->B()Lhf0;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    const-wide/16 v4, 0x16

    invoke-virtual {v3, v13, v12, v4, v5}, Ljf0;->p(IIJ)V

    if-nez v2, :cond_96

    move v4, v13

    goto :goto_97

    :cond_96
    move v4, v12

    :goto_97
    invoke-virtual {v3, v12, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_6e

    :cond_9b
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_9e
    check-cast v0, Lxl0;

    check-cast v1, Lck0;

    invoke-virtual {v1}, Lck0;->d()Ltd0;

    move-result-object v1

    iget-object v2, v1, Ltd0;->a:Lzpa;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lwl0;

    invoke-direct {v2, v9, v8, v12}, Ljf0;-><init>(III)V

    iget-object v1, v1, Ltd0;->b:Lqd0;

    invoke-virtual {v1, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_c6

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c6

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v7, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_cf

    :cond_c6
    invoke-static {v1, v7, v12}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v7, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_cf
    invoke-virtual {v4, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    if-nez v0, :cond_d5

    move v12, v13

    :cond_d5
    invoke-virtual {v2, v13, v12, v0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_db
    check-cast v0, Lgd0;

    check-cast v1, Lfd0;

    filled-new-array {v0}, [Lgd0;

    move-result-object v0

    iget-object v1, v1, Lfd0;->a:Led0;

    invoke-virtual {v1, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_f9

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_f9

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v13, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_106

    :cond_f9
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v13, v12, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, v1, v13, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_106
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-virtual {v3, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_112
    check-cast v0, Lxg0;

    check-cast v1, Ltd0;

    iget-object v2, v1, Ltd0;->a:Lzpa;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lwg0;

    invoke-direct {v2, v9, v8, v12}, Ljf0;-><init>(III)V

    iget-object v1, v1, Ltd0;->b:Lqd0;

    const/16 v3, 0x45

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_138

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_138

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_141

    :cond_138
    invoke-static {v1, v3, v12}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_141
    invoke-virtual {v5, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v13, v12, v0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_14a
    check-cast v0, Ldee;

    check-cast v1, La8e;

    invoke-virtual {v0, v1}, Ldee;->a(Ljava/lang/Object;)V

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    :pswitch_154
    check-cast v0, Lpfe;

    check-cast v1, Ljava/lang/Throwable;

    invoke-virtual {v0, v11}, Lpfe;->l(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_15e
    check-cast v0, Lw6e;

    check-cast v1, Lvb7;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    new-instance v1, Lci;

    invoke-direct {v1, v0, v6}, Lci;-><init>(Ljava/lang/Object;B)V

    return-object v1

    :pswitch_16b
    check-cast v0, Llld;

    check-cast v1, Li8e;

    new-instance v2, Lq5e;

    const/16 v3, 0xa

    invoke-direct {v2, v0, v3}, Lq5e;-><init>(Llld;B)V

    sget-object v3, Lc37;->d:Lrhk;

    sget-object v18, Lxwb;->b:Lxwb;

    sget-object v19, Ll08;->a:Ll08;

    new-instance v14, Lqc3;

    const-class v4, Lil5;

    invoke-static {v4}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    const/16 v16, 0x0

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    invoke-direct {v2, v0, v12}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v4, Lu3e;

    invoke-static {v4}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    invoke-direct {v2, v0, v10}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v4, Lp5e;

    invoke-static {v4}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/4 v4, 0x3

    invoke-direct {v2, v0, v4}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v4, Ltr1;

    invoke-static {v4}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    invoke-static {v14, v1}, Lu35;->b(Lqc3;Li8e;)Lvn8;

    move-result-object v2

    const-class v4, Llrh;

    invoke-static {v4}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v4

    invoke-virtual {v14, v4}, Lqc3;->a(Litb;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljtb;->a(Litb;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v4, 0x3a

    const-string v8, ""

    invoke-static {v5, v4, v8, v4, v3}, Lj7c;->p(Ljava/lang/StringBuilder;CLjava/lang/String;CLrhk;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v2}, Li8e;->b(Ljava/lang/String;Lvab;)V

    new-instance v2, Lq5e;

    const/4 v5, 0x4

    invoke-direct {v2, v0, v5}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v5, La4e;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/4 v5, 0x5

    invoke-direct {v2, v0, v5}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v5, Lx3e;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/4 v5, 0x6

    invoke-direct {v2, v0, v5}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v5, Lv3e;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/4 v9, 0x7

    invoke-direct {v2, v0, v9}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v9, Lb6e;

    invoke-static {v9}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    invoke-direct {v2, v0, v7}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v7, Li5e;

    invoke-static {v7}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/16 v7, 0x9

    invoke-direct {v2, v0, v7}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v7, Lmzd;

    invoke-static {v7}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/16 v7, 0xb

    invoke-direct {v2, v0, v7}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v7, Ls5e;

    invoke-static {v7}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    invoke-direct {v2, v0, v6}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/16 v5, 0xd

    invoke-direct {v2, v0, v5}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v5, La2e;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/16 v5, 0xe

    invoke-direct {v2, v0, v5}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v5, Li2h;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/16 v5, 0xf

    invoke-direct {v2, v0, v5}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v6, Lm3i;

    invoke-static {v6}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/16 v6, 0x10

    invoke-direct {v2, v0, v6}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v6, Lu4i;

    invoke-static {v6}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/16 v6, 0x11

    invoke-direct {v2, v0, v6}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v6, Ly5e;

    invoke-static {v6}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    const/16 v6, 0x12

    invoke-direct {v2, v0, v6}, Lq5e;-><init>(Llld;B)V

    new-instance v14, Lqc3;

    const-class v7, Lr5e;

    invoke-static {v7}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    move-object/from16 v17, v2

    invoke-direct/range {v14 .. v19}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    new-instance v2, Lvn8;

    invoke-direct {v2, v14}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    new-instance v2, Lq5e;

    invoke-direct {v2, v0, v13}, Lq5e;-><init>(Llld;B)V

    sget-object v23, Lxwb;->a:Lxwb;

    move-object/from16 v24, v19

    new-instance v19, Lqc3;

    const-class v7, Lab7;

    invoke-static {v7}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v22, v2

    invoke-direct/range {v19 .. v24}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    move-object/from16 v2, v19

    invoke-static {v2, v1}, Lj7c;->m(Lqc3;Li8e;)Ltlj;

    move-result-object v9

    invoke-static {v7}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v7

    invoke-virtual {v2, v7}, Lqc3;->a(Litb;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljtb;->a(Litb;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v4, v8, v4, v3}, Lj7c;->p(Ljava/lang/StringBuilder;CLjava/lang/String;CLrhk;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v9}, Li8e;->b(Ljava/lang/String;Lvab;)V

    new-instance v2, Lq5e;

    const/16 v7, 0x13

    invoke-direct {v2, v0, v7}, Lq5e;-><init>(Llld;B)V

    new-instance v19, Lqc3;

    const-class v7, Landroid/content/Context;

    invoke-static {v7}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v20

    move-object/from16 v22, v2

    invoke-direct/range {v19 .. v24}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    move-object/from16 v2, v19

    move-object/from16 v19, v24

    invoke-static {v2, v1}, Lj7c;->m(Lqc3;Li8e;)Ltlj;

    move-result-object v9

    invoke-static {v7}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v7

    invoke-virtual {v2, v7}, Lqc3;->a(Litb;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljtb;->a(Litb;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v4, v8, v4, v3}, Lj7c;->p(Ljava/lang/StringBuilder;CLjava/lang/String;CLrhk;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v9}, Li8e;->b(Ljava/lang/String;Lvab;)V

    iget-object v0, v0, Llld;->b:Ljava/lang/Object;

    check-cast v0, Lr3b;

    invoke-interface {v0}, Lr3b;->O()Lt9f;

    move-result-object v0

    const-class v2, Lt9f;

    if-eqz v0, :cond_40c

    new-instance v3, La7b;

    invoke-direct {v3, v0, v5}, La7b;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v24, v19

    new-instance v19, Lqc3;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v22, v3

    invoke-direct/range {v19 .. v24}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    move-object/from16 v0, v19

    new-instance v2, Ltlj;

    invoke-direct {v2, v0}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    goto :goto_42a

    :cond_40c
    new-instance v0, Lnf8;

    invoke-direct {v0, v6}, Lnf8;-><init>(B)V

    move-object/from16 v24, v19

    new-instance v19, Lqc3;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v22, v0

    invoke-direct/range {v19 .. v24}, Lqc3;-><init>(Ls15;Lrhk;Lkotlin/jvm/functions/Function2;Lxwb;Ll08;)V

    move-object/from16 v0, v19

    new-instance v2, Ltlj;

    invoke-direct {v2, v0}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {v1, v2}, Li8e;->a(Lvab;)V

    :goto_42a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_42d
    check-cast v0, Lw2e;

    check-cast v1, Lwa1;

    iget-object v0, v0, Lw2e;->d:Ljava/lang/String;

    invoke-interface {v1, v13, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_439
    check-cast v0, Lw2e;

    check-cast v1, Lwa1;

    iget-object v0, v0, Lw2e;->d:Ljava/lang/String;

    invoke-interface {v1, v13, v0}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_445
    check-cast v0, Le0e;

    check-cast v1, Lpg;

    invoke-virtual {v0}, Le0e;->Z()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_44f
    check-cast v0, Lsf2;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    iget-object v0, v0, Lsf2;->b:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_45b
    check-cast v0, Le5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Le5;->g(I)Lkotlin/text/MatchGroup;

    move-result-object v0

    return-object v0

    :pswitch_468
    check-cast v0, Lo3c;

    check-cast v1, Lmk7;

    invoke-virtual {v0}, Lo3c;->a()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_472
    check-cast v0, Lkbd;

    iget-object v2, v0, Lkbd;->p:Ljava/lang/Object;

    check-cast v2, Lt14;

    invoke-virtual {v2, v1}, Lt14;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_482
    check-cast v0, Lq0n;

    check-cast v1, Ljava/util/List;

    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    rem-int/2addr v3, v10

    if-nez v3, :cond_4af

    :goto_492
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v13, v3, :cond_4aa

    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    add-int/lit8 v4, v13, 0x1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v13, v13, 0x2

    goto :goto_492

    :cond_4aa
    invoke-virtual {v0, v2}, Lq0n;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    goto :goto_4b4

    :cond_4af
    const-string v0, "non-zero remainder"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_4b4
    return-object v11

    :pswitch_4b5
    check-cast v0, Ln9d;

    check-cast v1, Ljava/util/Set;

    if-eqz v1, :cond_4dd

    iput-object v1, v0, Ln9d;->g:Ljava/util/Set;

    iget-object v2, v0, Ln9d;->a:Ltcl;

    new-instance v3, Lrml;

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v3, v4, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v2, Lk9d;

    invoke-direct {v2, v1, v0, v13}, Lk9d;-><init>(Ljava/util/Set;Ln9d;B)V

    invoke-virtual {v3, v2}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v2

    new-instance v3, Lk9d;

    invoke-direct {v3, v1, v0, v12}, Lk9d;-><init>(Ljava/util/Set;Ln9d;B)V

    invoke-virtual {v2, v3}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v1

    iget-object v0, v0, Ln9d;->f:Lqie;

    invoke-virtual {v1, v0}, Lplk;->m(Lqie;)Lp1j;

    :cond_4dd
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4e0
    check-cast v0, Lwub;

    check-cast v1, Ljava/lang/Float;

    iget-object v0, v0, Lwub;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/opera/android/StatusBarDrawingFrameLayout;->setAlpha(F)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4f2
    check-cast v0, Lvzc;

    check-cast v1, Lkotlin/Unit;

    iput-object v11, v0, Lvzc;->b:Ljavax/crypto/spec/SecretKeySpec;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4fb
    check-cast v0, Lvrc;

    move-object v2, v1

    check-cast v2, Lndc;

    new-instance v1, Lu02;

    iget-object v3, v0, Lvrc;->c:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lvs6;

    iget-object v4, v4, Lvs6;->e:Lqs6;

    iget-object v4, v4, Lqs6;->d:Ligi;

    iget-object v4, v4, Ligi;->b:Ljava/lang/Object;

    check-cast v4, Lkze;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lvs6;

    iget-object v5, v5, Lvs6;->b:Lgmc;

    iget-object v5, v5, Lgmc;->q:Lrlh;

    invoke-static {v5}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v5

    iget-object v6, v0, Lvrc;->d:Ldw3;

    iget-object v6, v6, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->v()Lfs6;

    move-result-object v7

    iget-object v7, v7, Lfs6;->e:Ljze;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lvs6;

    iget-object v8, v8, Lvs6;->b:Lgmc;

    iget-object v8, v8, Lgmc;->s:Lrlh;

    invoke-static {v8}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v8

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lvs6;

    iget-object v9, v9, Lvs6;->b:Lgmc;

    iget-object v9, v9, Lgmc;->t:Lrlh;

    invoke-static {v9}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v9

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvs6;

    iget-object v3, v3, Lvs6;->b:Lgmc;

    iget-object v3, v3, Lgmc;->u:Lrlh;

    invoke-static {v3}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v3

    iget-object v10, v0, Lvrc;->a:Ldx3;

    invoke-static {v10}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v11

    move-object v12, v6

    move-object v6, v8

    move-object v8, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v7

    move-object v7, v9

    new-instance v9, Lpo7;

    invoke-direct {v9, v11}, Lpo7;-><init>(Lno7;)V

    iget-object v11, v0, Lvrc;->b:Lcom/opera/android/settings/SettingsManager;

    new-instance v13, Lg8c;

    const/16 v14, 0x18

    invoke-direct {v13, v14}, Lg8c;-><init>(B)V

    const-string v14, "ga_usage_statistics"

    invoke-static {v11, v14, v13}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v13

    new-instance v14, Lg8c;

    const/16 v15, 0x19

    invoke-direct {v14, v15}, Lg8c;-><init>(B)V

    const-string v15, "live_scores_accessed_onboarding"

    invoke-static {v11, v15, v14}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v11

    iget-object v0, v0, Lvrc;->h:Ldw3;

    invoke-virtual {v0}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcs6;

    iget-object v0, v0, Lcs6;->b:Lrlh;

    invoke-static {v0}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v0

    invoke-virtual {v12}, Lcom/opera/android/OperaApplication;->v()Lfs6;

    move-result-object v14

    iget-object v14, v14, Lfs6;->g:Lode;

    const v15, 0x7f1401b7

    invoke-virtual {v10, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12}, Lcom/opera/android/OperaApplication;->v()Lfs6;

    move-result-object v12

    iget-object v12, v12, Lfs6;->h:Lhx5;

    move-object/from16 p0, v0

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v16, v1

    move-object/from16 p1, v2

    const-wide/16 v1, 0x0

    invoke-static {v10, v0, v1, v2}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v2, p1

    move-object v10, v13

    move-object v13, v14

    move-object v14, v15

    move-object/from16 v1, v16

    move-object/from16 v16, v0

    move-object v15, v12

    move-object/from16 v12, p0

    invoke-direct/range {v1 .. v16}, Lu02;-><init>(Lndc;Lkze;Lhx5;Ljze;Lhx5;Lhx5;Lhx5;Lpo7;Ltsd;Ltsd;Lhx5;Lode;Ljava/lang/String;Lhx5;Ljava/lang/String;)V

    move-object/from16 v16, v1

    return-object v16

    :pswitch_5c7
    check-cast v0, Lu02;

    iget-object v1, v0, Lu02;->o:Ljava/lang/Object;

    check-cast v1, Lkze;

    invoke-virtual {v0}, Lu02;->F()Lcla;

    move-result-object v0

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5d7
    check-cast v0, Ldka;

    check-cast v1, Ljava/lang/Throwable;

    new-instance v2, Ldqb;

    invoke-direct {v2, v1}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v2}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ldka;->n(Ltw7;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5eb
    check-cast v0, Ldka;

    check-cast v1, Ljava/lang/Throwable;

    new-instance v2, Ldqb;

    invoke-direct {v2, v1}, Ldqb;-><init>(Ljava/lang/Throwable;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v2}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ldka;->n(Ltw7;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5ff
    check-cast v0, Lcom/opera/android/OperaApplication;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_61b

    sget-object v1, Ldp7;->a:Ld06;

    iget-object v1, v1, Ld06;->a:Ljava/lang/Object;

    check-cast v1, Lz8b;

    iget-object v2, v1, Lz8b;->a:Ljava/lang/Object;

    check-cast v2, Lua7;

    if-eqz v2, :cond_618

    invoke-virtual {v2, v11}, Lua7;->C(Lxd5;)V

    :cond_618
    invoke-virtual {v1, v0}, Lz8b;->E(Landroid/content/ContextWrapper;)Lcp7;

    :cond_61b
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_61e
    check-cast v0, Llrc;

    check-cast v1, Lprc;

    iget-object v1, v1, Lprc;->a:Lorc;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_638

    if-eq v1, v12, :cond_635

    if-ne v1, v10, :cond_631

    sget-object v1, Lnrc;->c:Lnrc;

    goto :goto_63a

    :cond_631
    invoke-static {}, Lh9o;->p()V

    goto :goto_67a

    :cond_635
    sget-object v1, Lnrc;->b:Lnrc;

    goto :goto_63a

    :cond_638
    sget-object v1, Lnrc;->a:Lnrc;

    :goto_63a
    iget-object v0, v0, Llrc;->v:Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;

    if-nez v0, :cond_63f

    move-object v0, v11

    :cond_63f
    iget-object v2, v0, Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;->a:Lnrc;

    if-eq v2, v1, :cond_678

    iput-object v1, v0, Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;->a:Lnrc;

    invoke-virtual {v0}, Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;->b()Lb98;

    move-result-object v2

    iget-object v2, v2, Lb98;->b:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;->a()Ljrc;

    move-result-object v2

    iget-object v2, v2, Ljrc;->b:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_66f

    if-eq v1, v12, :cond_678

    if-ne v1, v10, :cond_66b

    invoke-virtual {v0}, Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;->a()Ljrc;

    move-result-object v0

    iget-object v0, v0, Ljrc;->b:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v13}, Landroid/view/View;->setVisibility(I)V

    goto :goto_678

    :cond_66b
    invoke-static {}, Lh9o;->p()V

    goto :goto_67a

    :cond_66f
    invoke-virtual {v0}, Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;->b()Lb98;

    move-result-object v0

    iget-object v0, v0, Lb98;->b:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v13}, Landroid/view/View;->setVisibility(I)V

    :cond_678
    :goto_678
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_67a
    return-object v11

    :pswitch_67b
    check-cast v0, Lpqc;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lpqc;->e:Z

    iget-object v0, v0, Lpqc;->d:Lfd;

    invoke-virtual {v0}, Lfd;->c()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_68d
    check-cast v0, Lyqc;

    check-cast v1, Lorb;

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6b5

    invoke-virtual {v1, v5}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcqb;

    invoke-direct {v3, v2, v1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v3}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lyqc;->n(Ltw7;)V

    goto :goto_6d2

    :cond_6b5
    const-string v2, "result"

    invoke-virtual {v1, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    const-string v2, "state"

    invoke-virtual {v1, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lepc;

    invoke-direct {v2, v1}, Lepc;-><init>(Ljava/lang/String;)V

    new-instance v1, Lsw7;

    invoke-direct {v1, v2}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lyqc;->n(Ltw7;)V

    :goto_6d2
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6d5
    check-cast v0, Lyzb;

    check-cast v1, Lorb;

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6fd

    invoke-virtual {v1, v5}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lcqb;

    invoke-direct {v3, v2, v1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v3}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lyzb;->n(Ltw7;)V

    goto :goto_707

    :cond_6fd
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lyzb;->n(Ltw7;)V

    :goto_707
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_70a
    check-cast v0, Ltkc;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v0, v0, Ltkc;->q:Lagm;

    invoke-virtual {v0}, Lagm;->q()Lab2;

    move-result-object v0

    check-cast v0, Lcu5;

    invoke-virtual {v0, v1}, Lcu5;->b0(I)Landroid/view/View;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_720
    .packed-switch 0x0
        :pswitch_70a
        :pswitch_6d5
        :pswitch_68d
        :pswitch_67b
        :pswitch_61e
        :pswitch_5ff
        :pswitch_5eb
        :pswitch_5d7
        :pswitch_5c7
        :pswitch_4fb
        :pswitch_4f2
        :pswitch_4e0
        :pswitch_4b5
        :pswitch_482
        :pswitch_472
        :pswitch_468
        :pswitch_45b
        :pswitch_44f
        :pswitch_445
        :pswitch_439
        :pswitch_42d
        :pswitch_16b
        :pswitch_15e
        :pswitch_154
        :pswitch_14a
        :pswitch_112
        :pswitch_db
        :pswitch_9e
        :pswitch_62
    .end packed-switch
.end method
