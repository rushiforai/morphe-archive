.class public final synthetic Ljkc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Ljkc;->a:B

    iput-object p1, p0, Ljkc;->b:Ljava/lang/Object;

    iput-object p2, p0, Ljkc;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 56

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Ljkc;->a:B

    const/4 v3, 0x3

    const/16 v4, 0x98b

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    iget-object v10, v0, Ljkc;->c:Ljava/lang/Object;

    iget-object v0, v0, Ljkc;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_752

    check-cast v0, Ljava/lang/String;

    check-cast v10, Ljo0;

    check-cast v1, Lcq0;

    iget-object v2, v1, Lcq0;->a:Ln9a;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lio0;

    const/16 v3, 0x97f

    invoke-direct {v2, v3, v7, v5}, Ljf0;-><init>(III)V

    iget-object v1, v1, Lcq0;->b:Lbq0;

    invoke-virtual {v1, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_3d

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3d

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v9, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4a

    :cond_3d
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v9, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v9, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4a
    invoke-virtual {v4, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v8, v9, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v9, v9, v10}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_56
    check-cast v0, Ljava/lang/String;

    check-cast v10, Lj70;

    check-cast v1, Lyj0;

    iget-object v2, v1, Lyj0;->a:Lpsp;

    new-instance v2, Ll70;

    const/16 v3, 0x879

    invoke-direct {v2, v3, v7, v9}, Ljf0;-><init>(III)V

    iget-object v1, v1, Lyj0;->b:Lt56;

    const/16 v3, 0x13

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    if-eqz v4, :cond_7d

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7d

    new-instance v5, Lif0;

    invoke-direct {v5, v1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_8a

    :cond_7d
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v3, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lif0;

    invoke-direct {v5, v1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_8a
    invoke-virtual {v5, v0, v2}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v8, v9, v10}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_93
    check-cast v0, Ljava/lang/Integer;

    check-cast v10, Lkotlin/jvm/functions/Function1;

    check-cast v1, Ljava/lang/String;

    if-eqz v0, :cond_a5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gt v2, v0, :cond_a8

    :cond_a5
    invoke-interface {v10, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a8
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ab
    check-cast v0, Lkotlin/jvm/functions/Function1;

    check-cast v10, Lwg5;

    check-cast v1, Ls9f;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v10, v1}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ba
    check-cast v0, Lj9f;

    check-cast v10, Lifg;

    check-cast v1, Lp1d;

    iget-boolean v2, v0, Lj9f;->q:Z

    iget v3, v0, Lj9f;->o:F

    if-eqz v2, :cond_d4

    invoke-interface {v1, v3}, Ln27;->M(F)I

    move-result v2

    iget v0, v0, Lj9f;->p:F

    invoke-interface {v1, v0}, Ln27;->M(F)I

    move-result v0

    invoke-static {v1, v10, v2, v0}, Lp1d;->h(Lp1d;Lifg;II)V

    goto :goto_e1

    :cond_d4
    invoke-interface {v1, v3}, Ln27;->M(F)I

    move-result v2

    iget v0, v0, Lj9f;->p:F

    invoke-interface {v1, v0}, Ln27;->M(F)I

    move-result v0

    invoke-static {v1, v10, v2, v0}, Lp1d;->f(Lp1d;Lifg;II)V

    :goto_e1
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_e4
    check-cast v0, Lyo0;

    check-cast v10, Lvb0;

    check-cast v1, Lyb0;

    iget-object v2, v1, Lyb0;->a:Lzpa;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lxo0;

    invoke-direct {v2, v4, v7, v5}, Ljf0;-><init>(III)V

    iget-object v1, v1, Lyb0;->b:Lxb0;

    const/16 v3, 0x37

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_10c

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_10c

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_115

    :cond_10c
    invoke-static {v1, v3, v9}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_115
    invoke-virtual {v5, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v9, v9, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v8, v9, v10}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_121
    check-cast v0, Llo0;

    check-cast v10, Lno0;

    check-cast v1, Ltd0;

    iget-object v2, v1, Ltd0;->a:Lzpa;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lmo0;

    invoke-direct {v2, v4, v7, v5}, Ljf0;-><init>(III)V

    iget-object v1, v1, Ltd0;->b:Lqd0;

    const/16 v3, 0x3e

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_149

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_149

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_152

    :cond_149
    invoke-static {v1, v3, v9}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_152
    invoke-virtual {v5, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v9, v9, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v8, v9, v10}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_15e
    check-cast v0, Ljava/lang/String;

    check-cast v10, Lop0;

    check-cast v1, Lqp0;

    iget-object v1, v1, Lqp0;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt90;

    iget-object v2, v1, Lt90;->a:Ls90;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v0, :cond_175

    move v3, v8

    goto :goto_176

    :cond_175
    move v3, v9

    :goto_176
    invoke-virtual {v2, v9, v3, v0}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v0, v1, Lt90;->a:Ls90;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v8, v9, v10}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_184
    check-cast v0, Landroid/net/Uri;

    check-cast v10, Llqm;

    check-cast v1, Lve0;

    const-string v2, "client"

    invoke-virtual {v0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1b4

    const-string v3, "ms-opera-mobile"

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b2

    const-string v3, "android-ofa-"

    invoke-static {v2, v3, v8}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_1b2

    const-string v3, "opera"

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b2

    const-string v3, "ms-opera-mi-android"

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b6

    :cond_1b2
    move v3, v9

    goto :goto_1b7

    :cond_1b4
    const-string v2, "<none>"

    :cond_1b6
    move v3, v8

    :goto_1b7
    if-eqz v3, :cond_1bf

    iget-object v3, v1, Lve0;->b:Lue0;

    invoke-virtual {v3, v8, v9, v9}, Ljf0;->o(III)V

    goto :goto_1c4

    :cond_1bf
    iget-object v3, v1, Lve0;->b:Lue0;

    invoke-virtual {v3, v9, v9, v9}, Ljf0;->o(III)V

    :goto_1c4
    const-string v3, "udm"

    invoke-virtual {v0, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "50"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d7

    iget-object v0, v1, Lve0;->b:Lue0;

    invoke-virtual {v0, v5, v9, v9}, Ljf0;->o(III)V

    :cond_1d7
    new-instance v0, Lo5f;

    const/4 v3, 0x4

    invoke-direct {v0, v10, v3}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2, v0}, Lve0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1e3
    check-cast v0, Lop0;

    check-cast v10, Lc90;

    check-cast v1, Lqp0;

    iget-object v1, v1, Lqp0;->e:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb90;

    iget-object v2, v1, Lb90;->a:La90;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v9, v9, v0}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v0, v1, Lb90;->a:La90;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v8, v9, v10}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_204
    check-cast v0, Ljava/util/List;

    check-cast v10, Ljava/util/LinkedHashMap;

    check-cast v1, Lwc0;

    iget-object v2, v1, Lwc0;->a:Ls56;

    invoke-virtual {v2, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_220

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_220

    new-instance v4, Lhf0;

    invoke-direct {v4, v2, v8, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_22d

    :cond_220
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2, v8, v9, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, v2, v8, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_22d
    check-cast v0, Ljava/util/Collection;

    invoke-virtual {v4, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v10}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_23a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_279

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v4, v1, Lwc0;->a:Ls56;

    invoke-virtual {v4, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    if-eqz v5, :cond_268

    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_268

    new-instance v6, Lif0;

    invoke-direct {v6, v4, v9, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_275

    :cond_268
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v4, v9, v9, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v6, Lif0;

    invoke-direct {v6, v4, v9, v5}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_275
    invoke-virtual {v6, v3, v2}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_23a

    :cond_279
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_27c
    check-cast v0, Ljava/lang/String;

    check-cast v10, Lu9d;

    check-cast v1, Lj60;

    new-instance v2, Le51;

    invoke-direct {v2, v10, v9}, Le51;-><init>(Lu9d;B)V

    iget-object v6, v1, Lj60;->a:Lzpa;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Ls60;

    invoke-direct {v8, v4, v7, v5}, Ljf0;-><init>(III)V

    iget-object v1, v1, Lj60;->b:Li60;

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    if-eqz v4, :cond_2a7

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2a7

    new-instance v5, Lif0;

    invoke-direct {v5, v1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_2b4

    :cond_2a7
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v3, v9, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lif0;

    invoke-direct {v5, v1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_2b4
    invoke-virtual {v5, v0, v8}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lt60;

    invoke-direct {v0, v6, v8}, Lt60;-><init>(Lzpa;Ls60;)V

    invoke-virtual {v2, v0}, Le51;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2c2
    check-cast v0, Lice;

    check-cast v10, Lor4;

    iget-object v0, v0, Lice;->d:Ljava/util/ArrayList;

    new-instance v2, Lfce;

    invoke-direct {v2, v1, v10}, Lfce;-><init>(Ljava/lang/Object;Lor4;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2d3
    check-cast v0, Lece;

    check-cast v10, Ljava/lang/String;

    check-cast v1, Ldwn;

    iget-object v2, v0, Lece;->b:Lnx5;

    new-instance v4, Lww3;

    invoke-direct {v4, v0, v10, v1, v6}, Lww3;-><init>(Lece;Ljava/lang/String;Ldwn;Lmt5;)V

    invoke-static {v2, v6, v6, v4, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2e6
    check-cast v0, Lpej;

    check-cast v10, Lcd1;

    check-cast v1, Lm1i;

    iget-object v0, v0, Lpej;->d:La21;

    iget-object v0, v0, La21;->k:Ljava/lang/Object;

    check-cast v0, Lp0g;

    invoke-virtual {v0}, Lp0g;->h()F

    move-result v0

    iget-wide v2, v1, Lm1i;->r:J

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_337

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-nez v3, :cond_337

    const/4 v3, 0x0

    cmpg-float v3, v2, v3

    if-eqz v3, :cond_337

    invoke-virtual {v10}, Lcd1;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    invoke-static {v1, v3}, Li7e;->d(Lm1i;F)F

    move-result v4

    invoke-virtual {v1, v4}, Lm1i;->g(F)V

    invoke-static {v1, v3}, Li7e;->e(Lm1i;F)F

    move-result v3

    invoke-virtual {v1, v3}, Lm1i;->h(F)V

    add-float/2addr v0, v2

    div-float/2addr v0, v2

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2, v0}, Lz7h;->a(FF)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lm1i;->r(J)V

    :cond_337
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_33a
    check-cast v0, Ljava/lang/String;

    check-cast v10, Lkotlin/jvm/functions/Function0;

    check-cast v1, Lq0j;

    sget-object v2, Lo0j;->a:[Lxtb;

    sget-object v2, Ln0j;->u:Lp0j;

    sget-object v3, Lo0j;->a:[Lxtb;

    const/16 v4, 0xb

    aget-object v3, v3, v4

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1, v2, v3}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    invoke-static {v1, v0}, Lo0j;->d(Lq0j;Ljava/lang/String;)V

    new-instance v0, Lnx0;

    const/4 v2, 0x5

    invoke-direct {v0, v10, v2}, Lnx0;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sget-object v2, Le0j;->b:Lp0j;

    new-instance v3, Lc8;

    invoke-direct {v3, v6, v0}, Lc8;-><init>(Ljava/lang/String;Lbr9;)V

    invoke-interface {v1, v2, v3}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_36c
    check-cast v0, Lq6e;

    check-cast v10, Ll6e;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v1, :cond_379

    const-string v1, ""

    :cond_379
    iget-object v2, v0, Lq6e;->k:Lumi;

    new-instance v3, Ln6e;

    invoke-direct {v3, v0, v10, v1, v8}, Ln6e;-><init>(Lq6e;Ll6e;Ljava/lang/String;B)V

    invoke-virtual {v2, v3}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v3

    new-instance v4, Ln6e;

    invoke-direct {v4, v0, v10, v1, v9}, Ln6e;-><init>(Lq6e;Ll6e;Ljava/lang/String;B)V

    invoke-virtual {v2, v4}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v3, v0}, Lnml;->b(Lnml;)V

    invoke-virtual {v3, v6}, Lnml;->a(Ljava/lang/Object;)Loml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_396
    check-cast v0, Lkotlin/jvm/functions/Function1;

    check-cast v10, Ljava/lang/String;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_3a5

    invoke-interface {v0, v10}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3a5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3a8
    move-object v3, v0

    check-cast v3, Li2e;

    check-cast v10, Lafe;

    move-object v11, v1

    check-cast v11, Lh6c;

    invoke-interface {v10}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Lad2;

    new-instance v1, Ls2e;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v2, 0x1

    const-class v4, Li2e;

    const-string v5, "onClick"

    const-string v6, "onClick(Lcom/opera/momi/clientsdk/ui/missions/MissionUi;)V"

    invoke-direct/range {v1 .. v8}, Ls2e;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v13, v1

    new-instance v14, Ls2e;

    const/4 v8, 0x1

    const-string v5, "onInfoClick"

    const-string v6, "onInfoClick(Lcom/opera/momi/clientsdk/ui/missions/MissionUi;)V"

    move-object v1, v14

    invoke-direct/range {v1 .. v8}, Ls2e;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v15, Ls2e;

    const/4 v8, 0x2

    const-string v5, "onMissionImpression"

    const-string v6, "onMissionImpression(Ljava/lang/String;)V"

    move-object v1, v15

    invoke-direct/range {v1 .. v8}, Ls2e;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v16, Ls2;

    const/16 v8, 0x10

    const/4 v2, 0x2

    const-string v5, "onBannerClick"

    const-string v6, "onBannerClick(Lcom/opera/momi/clientsdk/ui/banner/BannerCardUiState;Lcom/opera/momi/clientsdk/ui/banner/BannerClickTarget;)V"

    move-object/from16 v1, v16

    invoke-direct/range {v1 .. v8}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Ls2e;

    const/4 v8, 0x3

    const/4 v2, 0x1

    const-string v5, "onBannerImpression"

    const-string v6, "onBannerImpression(Ljava/lang/String;)V"

    invoke-direct/range {v1 .. v8}, Ls2e;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v17, v1

    invoke-static/range {v11 .. v17}, Li41;->T(Lh6c;Lad2;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3fd
    check-cast v0, Lua7;

    check-cast v10, Landroid/icu/text/BreakIterator;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_43e

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_43e

    invoke-virtual {v10, v1}, Landroid/icu/text/BreakIterator;->setText(Ljava/lang/String;)V

    invoke-virtual {v10}, Landroid/icu/text/BreakIterator;->first()I

    move-result v2

    :goto_412
    invoke-virtual {v10}, Landroid/icu/text/BreakIterator;->next()I

    move-result v3

    if-eq v3, v7, :cond_43e

    invoke-virtual {v10}, Landroid/icu/text/BreakIterator;->getRuleStatus()I

    move-result v4

    const/16 v5, 0xc8

    if-gt v5, v4, :cond_43c

    const/16 v5, 0x12d

    if-ge v4, v5, :cond_43c

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    iget-object v4, v0, Lua7;->d:Ljava/lang/Object;

    check-cast v4, Lp4j;

    iget-object v4, v4, Lp4j;->a:Lu9d;

    invoke-virtual {v4, v2}, Lu9d;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_43c

    move-object v6, v2

    goto :goto_43e

    :cond_43c
    move v2, v3

    goto :goto_412

    :cond_43e
    :goto_43e
    return-object v6

    :pswitch_43f
    check-cast v0, Ljvd;

    check-cast v10, Lfvd;

    check-cast v1, Losk;

    iget-object v0, v0, Ljvd;->b:Lnb2;

    invoke-virtual {v0, v1, v10}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    return-object v6

    :pswitch_44b
    check-cast v0, Lkotlinx/serialization/KSerializer;

    check-cast v10, Lkotlinx/serialization/KSerializer;

    check-cast v1, Lt15;

    const-string v2, "key"

    invoke-interface {v0}, Lkotlinx/serialization/KSerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lt15;->b(Lt15;Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {v10}, Lkotlinx/serialization/KSerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v0

    sget-object v2, Ll08;->a:Ll08;

    const-string v3, "value"

    invoke-virtual {v1, v3, v0, v2}, Lt15;->a(Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;Ljava/util/List;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_468
    check-cast v0, Ldpc;

    check-cast v10, Lzmc;

    check-cast v1, Landroid/view/View;

    iget-object v0, v0, Ldpc;->b:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v10}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_476
    check-cast v0, Lkotlin/jvm/functions/Function1;

    check-cast v10, Ltmc;

    check-cast v1, Landroid/view/View;

    invoke-interface {v0, v10}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_482
    check-cast v0, Ljava/lang/String;

    check-cast v10, Ljava/util/List;

    check-cast v1, Losk;

    invoke-virtual {v1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_48c
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_490
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4a5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Loi9;

    iget-short v2, v2, Loi9;->a:S

    int-to-long v2, v2

    invoke-virtual {v1, v9, v2, v3}, Lwsk;->T0(IJ)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_490

    :cond_4a5
    invoke-virtual {v1}, Lwsk;->n()Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_4aa
    .catchall {:try_start_48c .. :try_end_4aa} :catchall_4ae

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v0

    :catchall_4ae
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_4b3
    check-cast v0, Lwlc;

    check-cast v10, Lo7f;

    check-cast v1, Losk;

    iget-object v0, v0, Lwlc;->h:Lnb2;

    invoke-virtual {v0, v1, v10}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4c1
    check-cast v0, Ljava/lang/String;

    check-cast v10, Ljava/util/ArrayList;

    check-cast v1, Losk;

    invoke-virtual {v1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_4cb
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_4cf
    if-ge v8, v0, :cond_4e3

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v8, v8, 0x1

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v9, v2, v3}, Lwsk;->T0(IJ)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_4cf

    :cond_4e3
    const-string v0, "oscoreId"

    invoke-static {v1, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "source"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "homeTeamName"

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v4, "homeTeamLogoUrl"

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    const-string v5, "homeTeamScore"

    invoke-static {v1, v5}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v5

    const-string v7, "homeTeamScorePenalties"

    invoke-static {v1, v7}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v7

    const-string v8, "awayTeamName"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    const-string v9, "awayTeamLogoUrl"

    invoke-static {v1, v9}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v9

    const-string v10, "awayTeamScore"

    invoke-static {v1, v10}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v10

    const-string v11, "awayTeamScorePenalties"

    invoke-static {v1, v11}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v11

    const-string v12, "eventStatus"

    invoke-static {v1, v12}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v12

    const-string v13, "statusDescription"

    invoke-static {v1, v13}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v13

    const-string v14, "finishType"

    invoke-static {v1, v14}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v14

    const-string v15, "startTimestamp"

    invoke-static {v1, v15}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v15

    const-string v6, "timeCurrent"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    move/from16 p0, v6

    const-string v6, "timeFirstHalf"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    move/from16 p1, v6

    const-string v6, "timeFirstHalfExtended"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    move/from16 v17, v6

    const-string v6, "timeSecondHalf"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    move/from16 v18, v6

    const-string v6, "timeSecondHalfExtended"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    move/from16 v19, v6

    const-string v6, "timeFirstHalfExtra"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    move/from16 v20, v6

    const-string v6, "timeFirstHalfExtraExtended"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    move/from16 v21, v6

    const-string v6, "timeSecondHalfExtra"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    move/from16 v22, v6

    const-string v6, "timeSecondHalfExtraExtended"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    move/from16 v23, v6

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    :goto_584
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v24

    if-eqz v24, :cond_71f

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v26

    move/from16 v24, v14

    move/from16 v51, v15

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v14

    long-to-int v14, v14

    sget-object v15, Loi9;->b:Li06;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, Loi9;->h:Lh58;

    invoke-virtual {v15}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_5a2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_5b9

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    move/from16 v52, v0

    move-object/from16 v0, v25

    check-cast v0, Loi9;

    iget-short v0, v0, Loi9;->a:S

    if-eq v0, v14, :cond_5bd

    move/from16 v0, v52

    goto :goto_5a2

    :cond_5b9
    move/from16 v52, v0

    const/16 v25, 0x0

    :cond_5bd
    move-object/from16 v28, v25

    check-cast v28, Loi9;

    if-eqz v28, :cond_70b

    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v29

    invoke-virtual {v1, v4}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v30

    invoke-virtual {v1, v5}, Lwsk;->getLong(I)J

    move-result-wide v14

    long-to-int v0, v14

    invoke-virtual {v1, v7}, Lwsk;->getLong(I)J

    move-result-wide v14

    long-to-int v14, v14

    invoke-virtual {v1, v8}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v33

    invoke-virtual {v1, v9}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v34

    move v15, v2

    move/from16 v53, v3

    invoke-virtual {v1, v10}, Lwsk;->getLong(I)J

    move-result-wide v2

    long-to-int v2, v2

    move/from16 v35, v2

    invoke-virtual {v1, v11}, Lwsk;->getLong(I)J

    move-result-wide v2

    long-to-int v2, v2

    invoke-virtual {v1, v12}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v37

    invoke-virtual {v1, v13}, Lwsk;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_5fb

    const/16 v38, 0x0

    :goto_5f8
    move/from16 v3, v24

    goto :goto_602

    :cond_5fb
    invoke-virtual {v1, v13}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v38, v3

    goto :goto_5f8

    :goto_602
    invoke-virtual {v1, v3}, Lwsk;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_60f

    const/16 v39, 0x0

    :goto_60a
    move/from16 v31, v0

    move/from16 v0, v51

    goto :goto_616

    :cond_60f
    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v39, v24

    goto :goto_60a

    :goto_616
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v40

    move/from16 v51, v0

    move/from16 v0, p0

    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_62b

    const/16 v42, 0x0

    :goto_626
    move/from16 p0, v0

    move/from16 v0, p1

    goto :goto_636

    :cond_62b
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    move-object/from16 v42, v24

    goto :goto_626

    :goto_636
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_643

    const/16 v43, 0x0

    :goto_63e
    move/from16 p1, v0

    move/from16 v0, v17

    goto :goto_64e

    :cond_643
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    move-object/from16 v43, v24

    goto :goto_63e

    :goto_64e
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v17

    if-eqz v17, :cond_65b

    const/16 v44, 0x0

    :goto_656
    move/from16 v17, v0

    move/from16 v0, v18

    goto :goto_666

    :cond_65b
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    move-object/from16 v44, v17

    goto :goto_656

    :goto_666
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_673

    const/16 v45, 0x0

    :goto_66e
    move/from16 v18, v0

    move/from16 v0, v19

    goto :goto_67e

    :cond_673
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v45, v18

    goto :goto_66e

    :goto_67e
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v19

    if-eqz v19, :cond_68b

    const/16 v46, 0x0

    :goto_686
    move/from16 v19, v0

    move/from16 v0, v20

    goto :goto_696

    :cond_68b
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v46, v19

    goto :goto_686

    :goto_696
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_6a3

    const/16 v47, 0x0

    :goto_69e
    move/from16 v20, v0

    move/from16 v0, v21

    goto :goto_6ae

    :cond_6a3
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v47, v20

    goto :goto_69e

    :goto_6ae
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_6bb

    const/16 v48, 0x0

    :goto_6b6
    move/from16 v21, v0

    move/from16 v0, v22

    goto :goto_6c6

    :cond_6bb
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    move-object/from16 v48, v21

    goto :goto_6b6

    :goto_6c6
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_6d3

    const/16 v49, 0x0

    :goto_6ce
    move/from16 v22, v0

    move/from16 v0, v23

    goto :goto_6de

    :cond_6d3
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    move-object/from16 v49, v22

    goto :goto_6ce

    :goto_6de
    invoke-virtual {v1, v0}, Lwsk;->isNull(I)Z

    move-result v23

    if-eqz v23, :cond_6e7

    const/16 v50, 0x0

    goto :goto_6f1

    :cond_6e7
    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v50, v23

    :goto_6f1
    new-instance v25, Lruc;

    move/from16 v36, v2

    move/from16 v32, v14

    invoke-direct/range {v25 .. v50}, Lruc;-><init>(JLoi9;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V

    move-object/from16 v2, v25

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v23, v0

    move v14, v3

    move v2, v15

    move/from16 v15, v51

    move/from16 v0, v52

    move/from16 v3, v53

    goto/16 :goto_584

    :cond_70b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown event source: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_71f
    .catchall {:try_start_4cb .. :try_end_71f} :catchall_723

    :cond_71f
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v6

    :catchall_723
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_728
    check-cast v0, Lwlc;

    check-cast v10, Lr0f;

    check-cast v1, Losk;

    iget-object v0, v0, Lwlc;->c:Lnb2;

    invoke-virtual {v0, v1, v10}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_736
    check-cast v0, Ltsd;

    check-cast v10, Lkotlin/jvm/functions/Function1;

    invoke-interface {v10, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ltsd;->r(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_744
    check-cast v0, Ljze;

    check-cast v10, Ld58;

    invoke-virtual {v10, v1}, Ld58;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljze;->r(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_752
    .packed-switch 0x0
        :pswitch_744
        :pswitch_736
        :pswitch_728
        :pswitch_4c1
        :pswitch_4b3
        :pswitch_482
        :pswitch_476
        :pswitch_468
        :pswitch_44b
        :pswitch_43f
        :pswitch_3fd
        :pswitch_3a8
        :pswitch_396
        :pswitch_36c
        :pswitch_33a
        :pswitch_2e6
        :pswitch_2d3
        :pswitch_2c2
        :pswitch_27c
        :pswitch_204
        :pswitch_1e3
        :pswitch_184
        :pswitch_15e
        :pswitch_121
        :pswitch_e4
        :pswitch_ba
        :pswitch_ab
        :pswitch_93
        :pswitch_56
    .end packed-switch
.end method
