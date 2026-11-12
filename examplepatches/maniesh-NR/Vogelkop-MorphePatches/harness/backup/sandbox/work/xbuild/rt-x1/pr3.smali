.class public final synthetic Lpr3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/io/Serializable;

.field public final synthetic f:Ljava/io/Serializable;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/io/Serializable;Ljava/lang/Object;B)V
    .registers 8

    iput-byte p7, p0, Lpr3;->a:B

    iput-object p1, p0, Lpr3;->b:Ljava/lang/Object;

    iput-object p2, p0, Lpr3;->c:Ljava/lang/Object;

    iput-object p3, p0, Lpr3;->d:Ljava/lang/Object;

    iput-object p4, p0, Lpr3;->e:Ljava/io/Serializable;

    iput-object p5, p0, Lpr3;->f:Ljava/io/Serializable;

    iput-object p6, p0, Lpr3;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p0

    iget-byte v1, v0, Lpr3;->a:B

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    iget-object v7, v0, Lpr3;->g:Ljava/lang/Object;

    iget-object v8, v0, Lpr3;->f:Ljava/io/Serializable;

    iget-object v9, v0, Lpr3;->e:Ljava/io/Serializable;

    iget-object v10, v0, Lpr3;->d:Ljava/lang/Object;

    iget-object v11, v0, Lpr3;->c:Ljava/lang/Object;

    iget-object v0, v0, Lpr3;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_1b4

    check-cast v0, Lsfo;

    check-cast v11, Ljava/lang/String;

    check-cast v10, Ljava/lang/String;

    check-cast v9, Ljava/lang/String;

    check-cast v8, Ljava/lang/String;

    check-cast v7, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lspa;

    sget-object v2, Lapa;->b:Lapa;

    const-string v2, "GET"

    invoke-static {v2}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v2

    iput-object v2, v1, Lspa;->b:Lapa;

    iget-object v2, v1, Lspa;->a:Ltgm;

    iget-object v0, v0, Lsfo;->a:Ljava/lang/String;

    const-string v3, "odds/batch"

    invoke-static {v0, v3, v2}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    if-eqz v11, :cond_42

    const-string v0, "product"

    invoke-static {v1, v0, v11}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_42
    if-eqz v10, :cond_49

    const-string v0, "geoip-country-code"

    invoke-static {v1, v0, v10}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_49
    if-eqz v9, :cond_50

    const-string v0, "event_ids"

    invoke-static {v1, v0, v9}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_50
    if-eqz v8, :cond_57

    const-string v0, "user_id"

    invoke-static {v1, v0, v8}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_57
    if-eqz v7, :cond_5e

    const-string v0, "ad_position"

    invoke-static {v1, v0, v7}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_5e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_61
    check-cast v0, Ljava/lang/String;

    check-cast v11, Lifd;

    check-cast v10, Lvnj;

    check-cast v9, Ljava/util/LinkedHashSet;

    check-cast v8, Ljava/util/LinkedHashSet;

    check-cast v7, Ljava/util/ArrayList;

    move-object/from16 v1, p1

    check-cast v1, Lonj;

    check-cast v1, Lpnj;

    iget-object v2, v1, Lpnj;->a:Ljava/lang/String;

    iget-object v3, v1, Lpnj;->b:Llnj;

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ab

    instance-of v2, v11, Lnnj;

    iget-object v4, v10, Lvnj;->g:Lfnj;

    if-eqz v2, :cond_92

    if-eqz v4, :cond_86

    move-object v5, v4

    :cond_86
    iget-object v2, v5, Lfnj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a0

    invoke-interface {v9, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_a0

    :cond_92
    if-eqz v4, :cond_95

    move-object v5, v4

    :cond_95
    iget-object v2, v5, Lfnj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v2, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a0

    invoke-interface {v8, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_a0
    :goto_a0
    invoke-virtual {v10, v3, v0, v11}, Lvnj;->h(Llnj;Ljava/lang/String;Lifd;)V

    iget-object v0, v1, Lpnj;->c:Lkotlin/jvm/functions/Function1;

    if-eqz v0, :cond_aa

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_aa
    move v4, v6

    :cond_ab
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_b0
    check-cast v0, Lsj0;

    check-cast v11, Lxn0;

    check-cast v10, Ljava/lang/String;

    check-cast v9, Ljava/lang/String;

    check-cast v8, Ljava/lang/String;

    check-cast v7, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lck0;

    invoke-virtual {v1}, Lck0;->d()Ltd0;

    move-result-object v1

    iget-object v5, v1, Ltd0;->a:Lzpa;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lqn0;

    const/4 v12, -0x1

    const/4 v13, 0x6

    const/16 v14, 0x98b

    invoke-direct {v5, v14, v12, v13}, Ljf0;-><init>(III)V

    iget-object v1, v1, Ltd0;->b:Lqd0;

    const/16 v12, 0x39

    invoke-virtual {v1, v12}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    if-eqz v13, :cond_ea

    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_ea

    new-instance v14, Lhf0;

    invoke-direct {v14, v1, v12, v13}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_f3

    :cond_ea
    invoke-static {v1, v12, v6}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v13

    new-instance v14, Lhf0;

    invoke-direct {v14, v1, v12, v13}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_f3
    invoke-virtual {v14, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5, v4, v6, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v6, v6, v11}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz v10, :cond_101

    invoke-virtual {v5, v3, v6, v10}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_101
    if-eqz v9, :cond_106

    invoke-virtual {v5, v2, v6, v9}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_106
    if-eqz v8, :cond_10c

    const/4 v0, 0x4

    invoke-virtual {v5, v0, v8}, Lqn0;->x(ILjava/lang/String;)V

    :cond_10c
    if-eqz v7, :cond_112

    const/4 v0, 0x5

    invoke-virtual {v5, v0, v7}, Lqn0;->x(ILjava/lang/String;)V

    :cond_112
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_115
    check-cast v0, Ltah;

    check-cast v11, Lzz9;

    check-cast v10, Ljava/lang/String;

    check-cast v9, Ljava/io/File;

    check-cast v8, Lo29;

    check-cast v7, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Loy1;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_16f

    if-eq v4, v6, :cond_135

    if-eq v4, v3, :cond_135

    if-eq v4, v2, :cond_135

    invoke-static {}, Lh9o;->p()V

    goto :goto_179

    :cond_135
    iget-object v0, v0, Ltah;->g:Ljava/lang/Object;

    check-cast v0, Lf0a;

    iget-object v0, v0, Lf0a;->a:Lzyk;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_177

    if-eq v1, v6, :cond_15d

    if-eq v1, v3, :cond_14b

    if-eq v1, v2, :cond_14b

    invoke-static {}, Lh9o;->p()V

    goto :goto_179

    :cond_14b
    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lysj;

    new-instance v1, Lrxh;

    const v2, 0x7f140800

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    invoke-static {v0, v1}, Ljoh;->h(Lysj;Lpxh;)V

    goto :goto_177

    :cond_15d
    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lysj;

    new-instance v1, Lrxh;

    const v2, 0x7f1406c2

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    invoke-static {v0, v1}, Ljoh;->h(Lysj;Lpxh;)V

    goto :goto_177

    :cond_16f
    new-instance v1, La0a;

    invoke-direct {v1, v10, v9, v8, v7}, La0a;-><init>(Ljava/lang/String;Ljava/io/File;Lo29;Ljava/lang/String;)V

    invoke-virtual {v0, v11, v1}, Ltah;->I(Lb0a;La0a;)V

    :cond_177
    :goto_177
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_179
    return-object v5

    :pswitch_17a
    check-cast v0, [Lifg;

    check-cast v11, Ljava/util/List;

    check-cast v10, Lvfd;

    check-cast v9, Lnqh;

    check-cast v8, Lnqh;

    check-cast v7, Lqr3;

    move-object/from16 v12, p1

    check-cast v12, Lp1d;

    array-length v1, v0

    move v2, v4

    :goto_18c
    if-ge v4, v1, :cond_1b0

    aget-object v13, v0, v4

    add-int/lit8 v3, v2, 0x1

    invoke-interface {v11, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lpfd;

    invoke-interface {v10}, Lshb;->getLayoutDirection()Ld2c;

    move-result-object v15

    iget v2, v9, Lnqh;->a:I

    iget v5, v8, Lnqh;->a:I

    iget-object v6, v7, Lqr3;->a:Ltd3;

    move/from16 v16, v2

    move/from16 v17, v5

    move-object/from16 v18, v6

    invoke-static/range {v12 .. v18}, Lnr3;->d(Lp1d;Lifg;Lpfd;Ld2c;IILtd3;)V

    add-int/lit8 v4, v4, 0x1

    move v2, v3

    goto :goto_18c

    :cond_1b0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_1b4
    .packed-switch 0x0
        :pswitch_17a
        :pswitch_115
        :pswitch_b0
        :pswitch_61
    .end packed-switch
.end method
