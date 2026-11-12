.class public final Lav6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly3i;


# instance fields
.field public final a:Ljv1;

.field public final b:Lzyk;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Lz3i;Ljv1;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lav6;->a:Ljv1;

    new-instance p2, Lr94;

    const/16 v0, 0x17

    invoke-direct {p2, p1, v0}, Lr94;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lav6;->b:Lzyk;

    new-instance p1, Lr94;

    const/16 p2, 0x18

    invoke-direct {p1, p0, p2}, Lr94;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lav6;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/HashMap;Lebb;Lp71;)Ljava/lang/Object;
    .registers 6

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->o()Lobh;

    move-result-object p0

    if-eqz p2, :cond_16

    invoke-virtual {p2}, Lebb;->i()J

    move-result-wide v0

    new-instance p2, Ljava/lang/Long;

    invoke-direct {p2, v0, v1}, Ljava/lang/Long;-><init>(J)V

    goto :goto_17

    :cond_16
    const/4 p2, 0x0

    :goto_17
    check-cast p0, Lubh;

    invoke-virtual {p0, p1, p2, p3}, Lubh;->d(Ljava/util/Map;Ljava/lang/Long;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_22

    return-object p0

    :cond_22
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b()Lekc;
    .registers 1

    iget-object p0, p0, Lav6;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lekc;

    return-object p0
.end method

.method public final c(Ls3i;Lp4i;Le6g;)Lj7i;
    .registers 24

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual/range {p0 .. p0}, Lav6;->p()Le6e;

    move-result-object v2

    iget-object v3, v1, Lp4i;->b:Ljava/lang/String;

    const/4 v7, 0x0

    if-eqz v3, :cond_18

    invoke-static {v3}, Lbwg;->H(Ljava/lang/String;)Lgpm;

    move-result-object v3

    if-eqz v3, :cond_18

    invoke-static {v3}, Lqs7;->A(Lgpm;)Lek6;

    move-result-object v3

    goto :goto_19

    :cond_18
    move-object v3, v7

    :goto_19
    iget-object v4, v1, Lp4i;->a:Lo3i;

    iget-object v5, v4, Lo3i;->a:Ljava/lang/String;

    iget-boolean v4, v1, Lp4i;->c:Z

    new-instance v1, Lwtd;

    move-object/from16 v6, p3

    invoke-direct/range {v1 .. v6}, Lwtd;-><init>(Le6e;Lek6;ZLjava/lang/String;Le6g;)V

    new-instance v2, Lnd3;

    const/16 v3, 0xb

    invoke-direct {v2, v3}, Lnd3;-><init>(B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v3

    invoke-virtual {v3}, Lxd5;->getOnBackPressedDispatcher()Lkcf;

    move-result-object v3

    new-instance v4, Ld8e;

    const/16 v5, 0x1d

    invoke-direct {v4, v0, v5}, Ld8e;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0}, Lrki;->getSavedStateRegistry()Lpki;

    move-result-object v5

    const-string v6, "RootRetainedComponent"

    invoke-virtual {v5, v6}, Lpki;->b(Ljava/lang/String;)Loki;

    move-result-object v5

    if-nez v5, :cond_186

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v5

    new-instance v8, Li16;

    invoke-direct {v8, v5}, Li16;-><init>(Ltcc;)V

    invoke-interface {v0}, Lrki;->getSavedStateRegistry()Lpki;

    move-result-object v5

    invoke-virtual {v5, v6}, Lpki;->a(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v9

    if-eqz v9, :cond_9b

    const-string v10, "STATE_KEEPER_STATE"

    sget-object v11, Lk2j;->Companion:Li2j;

    invoke-virtual {v11}, Li2j;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v11

    check-cast v11, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v9}, Landroid/os/Bundle;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v12

    :try_start_69
    const-class v13, Lg0n;

    invoke-virtual {v13}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v13

    invoke-virtual {v9, v13}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v10

    check-cast v10, Lg0n;
    :try_end_78
    .catchall {:try_start_69 .. :try_end_78} :catchall_96

    invoke-virtual {v9, v12}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    if-eqz v10, :cond_90

    iget-object v9, v10, Lg0n;->a:Lk2j;

    if-nez v9, :cond_91

    iget-object v9, v10, Lg0n;->b:Ll4c;

    invoke-interface {v9}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    if-eqz v9, :cond_90

    invoke-static {v9, v11}, Lnxg;->i([BLkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v9

    goto :goto_91

    :cond_90
    move-object v9, v7

    :cond_91
    :goto_91
    check-cast v9, Lk2j;

    if-eqz v9, :cond_9b

    goto :goto_9c

    :catchall_96
    move-exception v0

    invoke-virtual {v9, v12}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    throw v0

    :cond_9b
    move-object v9, v7

    :goto_9c
    new-instance v10, Lkw6;

    invoke-direct {v10, v9}, Lkw6;-><init>(Lk2j;)V

    new-instance v9, Ly51;

    invoke-direct {v9, v2, v10}, Ly51;-><init>(Lnd3;Lkw6;)V

    invoke-virtual {v5, v6, v9}, Lpki;->c(Ljava/lang/String;Loki;)V

    invoke-interface {v0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v2

    new-instance v5, Lz51;

    const/4 v9, 0x0

    invoke-direct {v5, v9}, Lz51;-><init>(B)V

    sget-object v11, Le06;->b:Le06;

    new-instance v12, Lplk;

    invoke-direct {v12, v2, v5, v11}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class v2, Ldbb;

    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v2

    invoke-virtual {v2}, Ls15;->b()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_180

    const-string v7, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    invoke-virtual {v7, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12, v2, v5}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v2

    check-cast v2, Ldbb;

    iget-object v2, v2, Ldbb;->b:Lnrl;

    sget-object v5, Lrn3;->a:Lrn3;

    const-string v7, "RetainedComponent_state_marker"

    invoke-virtual {v10, v7, v5}, Lkw6;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v11

    const/4 v12, 0x1

    if-nez v11, :cond_e1

    move v11, v12

    goto :goto_e2

    :cond_e1
    move v11, v9

    :goto_e2
    new-instance v13, Lgzh;

    invoke-direct {v13, v12}, Lgzh;-><init>(B)V

    invoke-virtual {v10, v7, v5, v13}, Lkw6;->b(Ljava/lang/String;Lkotlinx/serialization/KSerializer;Lkotlin/jvm/functions/Function0;)V

    if-eqz v11, :cond_102

    iget-object v5, v2, Lnrl;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lbbb;

    check-cast v5, Ld1i;

    if-eqz v5, :cond_102

    iget-object v7, v5, Ld1i;->a:Lrdc;

    invoke-static {v7}, Lvtp;->B(Lrdc;)V

    invoke-virtual {v5}, Ld1i;->onDestroy()V

    :cond_102
    iget-object v5, v2, Lnrl;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lbbb;

    if-nez v5, :cond_124

    new-instance v5, Ld1i;

    sget-object v7, Lk2j;->Companion:Li2j;

    invoke-virtual {v7}, Li2j;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v10, v6, v7}, Lkw6;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lk2j;

    invoke-direct {v5, v7, v1}, Ld1i;-><init>(Lk2j;Lwtd;)V

    invoke-virtual {v2, v6, v5}, Lnrl;->J(Ljava/lang/Object;Lbbb;)V

    :cond_124
    check-cast v5, Ld1i;

    new-instance v14, Le1i;

    invoke-direct {v14, v5, v9}, Le1i;-><init>(Ld1i;B)V

    new-instance v15, Le1i;

    invoke-direct {v15, v5, v12}, Le1i;-><init>(Ld1i;B)V

    new-instance v1, Le1i;

    const/4 v2, 0x2

    invoke-direct {v1, v5, v2}, Le1i;-><init>(Ld1i;B)V

    new-instance v7, Lf1i;

    invoke-direct {v7, v4, v5, v9}, Lf1i;-><init>(Ld8e;Ld1i;B)V

    new-instance v9, Lf1i;

    invoke-direct {v9, v4, v5, v12}, Lf1i;-><init>(Ld8e;Ld1i;B)V

    new-instance v11, Lf1i;

    invoke-direct {v11, v4, v5, v2}, Lf1i;-><init>(Ld8e;Ld1i;B)V

    new-instance v13, Ljdc;

    move-object/from16 v16, v1

    move-object/from16 v17, v7

    move-object/from16 v18, v9

    move-object/from16 v19, v11

    invoke-direct/range {v13 .. v19}, Ljdc;-><init>(Le1i;Lkotlin/jvm/functions/Function0;Le1i;Lf1i;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v8, v13}, Li16;->h(Llcc;)V

    sget-object v1, Lk2j;->Companion:Li2j;

    invoke-virtual {v1}, Li2j;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/KSerializer;

    new-instance v2, Le1i;

    const/4 v4, 0x3

    invoke-direct {v2, v5, v4}, Le1i;-><init>(Ld1i;B)V

    invoke-virtual {v10, v6, v1, v2}, Lkw6;->b(Ljava/lang/String;Lkotlinx/serialization/KSerializer;Lkotlin/jvm/functions/Function0;)V

    if-eqz v3, :cond_17b

    new-instance v1, Lxt2;

    iget-object v2, v5, Ld1i;->e:Lkcf;

    invoke-direct {v1, v2}, Lxt2;-><init>(Lkcf;)V

    new-instance v2, Lrmg;

    const/16 v4, 0x12

    invoke-direct {v2, v1, v4}, Lrmg;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v5, Ld1i;->d:Lrmg;

    invoke-virtual {v3, v0, v1}, Lkcf;->a(Lndc;Lgcf;)V

    :cond_17b
    iget-object v0, v5, Ld1i;->f:Ljava/lang/Object;

    check-cast v0, Lj7i;

    return-object v0

    :cond_180
    const-string v0, "Local and anonymous classes can not be ViewModels"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v7

    :cond_186
    const-string v0, "Another retained component is already registered with the key: RootRetainedComponent"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7
.end method

.method public final d()Lf99;
    .registers 3

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p0, Lh5e;

    iget-object p0, p0, Lh5e;->e:Ll2h;

    sget-object v0, Lc2h;->c:Lc2h;

    check-cast p0, Lb3h;

    invoke-virtual {p0, v0}, Lb3h;->b(Lc2h;)Lxd6;

    move-result-object p0

    new-instance v0, Lvu6;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lvu6;-><init>(Lxd6;B)V

    return-object v0
.end method

.method public final e(Ljava/lang/String;)V
    .registers 6

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p0, Lh5e;

    iget-object p0, p0, Lh5e;->h:Lzs8;

    iget-object v0, p0, Lzs8;->a:Lnx5;

    new-instance v1, Lfg6;

    const/16 v2, 0xe

    const/4 v3, 0x0

    invoke-direct {v1, p0, p1, v3, v2}, Lfg6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final f(Ljava/lang/String;Lmt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lpu6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lpu6;

    iget v1, v0, Lpu6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lpu6;->v:I

    goto :goto_1a

    :cond_13
    new-instance v0, Lpu6;

    check-cast p2, Lnt5;

    invoke-direct {v0, p0, p2}, Lpu6;-><init>(Lav6;Lnt5;)V

    :goto_1a
    iget-object p2, v0, Lpu6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lpu6;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    iput v3, v0, Lpu6;->v:I

    check-cast p0, Lh5e;

    invoke-virtual {p0, p1, v0}, Lh5e;->p(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_4c

    return-object v1

    :cond_4c
    return-object p0
.end method

.method public final g()Lf99;
    .registers 3

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p0, Lh5e;

    iget-object p0, p0, Lh5e;->e:Ll2h;

    sget-object v0, Lc2h;->d:Lc2h;

    check-cast p0, Lb3h;

    invoke-virtual {p0, v0}, Lb3h;->b(Lc2h;)Lxd6;

    move-result-object p0

    new-instance v0, Lvu6;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lvu6;-><init>(Lxd6;B)V

    return-object v0
.end method

.method public final h(Lmt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lyu6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lyu6;

    iget v1, v0, Lyu6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lyu6;->v:I

    goto :goto_1a

    :cond_13
    new-instance v0, Lyu6;

    check-cast p1, Lnt5;

    invoke-direct {v0, p0, p1}, Lyu6;-><init>(Lav6;Lnt5;)V

    :goto_1a
    iget-object p1, v0, Lyu6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lyu6;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_4c

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    iput v3, v0, Lyu6;->v:I

    check-cast p0, Lh5e;

    invoke-virtual {p0, v0}, Lh5e;->A(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_4c

    return-object v1

    :cond_4c
    :goto_4c
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_56

    check-cast p0, Ljava/util/List;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_56
    return-object p0
.end method

.method public final i(Lmt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lsu6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lsu6;

    iget v1, v0, Lsu6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lsu6;->v:I

    goto :goto_1a

    :cond_13
    new-instance v0, Lsu6;

    check-cast p1, Lnt5;

    invoke-direct {v0, p0, p1}, Lsu6;-><init>(Lav6;Lnt5;)V

    :goto_1a
    iget-object p1, v0, Lsu6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lsu6;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_4c

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    iput v3, v0, Lsu6;->v:I

    check-cast p0, Lh5e;

    invoke-virtual {p0, v0}, Lh5e;->s(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_4c

    return-object v1

    :cond_4c
    :goto_4c
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_56

    check-cast p0, Lhtm;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_56
    return-object p0
.end method

.method public final j(Lp71;)Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->o()Lobh;

    move-result-object p0

    check-cast p0, Lubh;

    invoke-virtual {p0, p1}, Lubh;->c(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_15

    return-object p0

    :cond_15
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final k(Ljava/lang/String;Lmt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lou6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lou6;

    iget v1, v0, Lou6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lou6;->v:I

    goto :goto_1a

    :cond_13
    new-instance v0, Lou6;

    check-cast p2, Lnt5;

    invoke-direct {v0, p0, p2}, Lou6;-><init>(Lav6;Lnt5;)V

    :goto_1a
    iget-object p2, v0, Lou6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lou6;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    iput v3, v0, Lou6;->v:I

    check-cast p0, Lh5e;

    invoke-virtual {p0, p1, v0}, Lh5e;->k(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_4c

    return-object v1

    :cond_4c
    return-object p0
.end method

.method public final l()Lhfk;
    .registers 7

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lh5e;

    iget-object p0, v2, Lh5e;->p:Lifk;

    new-instance v0, Lkfk;

    iget-object v1, p0, Lifk;->a:Lnx5;

    iget-object v3, p0, Lifk;->b:Lzfb;

    iget-object v4, p0, Lifk;->c:Lfi6;

    iget-object v5, p0, Lifk;->d:Llrh;

    invoke-direct/range {v0 .. v5}, Lkfk;-><init>(Lnx5;Lh5e;Lzfb;Lfi6;Llrh;)V

    return-object v0
.end method

.method public final m()Lf99;
    .registers 6

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p0, Lh5e;

    iget-object p0, p0, Lh5e;->q:Lhzl;

    check-cast p0, Lkzl;

    iget-object v0, p0, Lkzl;->a:Llum;

    check-cast v0, Lmvm;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lp71;

    const/16 v2, 0x1d

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, v0}, Lp71;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v0, Lxd6;

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lxd6;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lvu6;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lvu6;-><init>(Lxd6;B)V

    invoke-static {v1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    iget-object v1, p0, Lkzl;->b:Lnak;

    new-instance v4, Lim4;

    invoke-direct {v4, v2, v3, p0}, Lim4;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance p0, Lya9;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v4, v2}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p0
.end method

.method public final n(Lz1e;)V
    .registers 6

    iget-object v0, p0, Lav6;->a:Ljv1;

    invoke-virtual {v0}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_f

    return-void

    :cond_f
    sget-object v0, Lt4j;->a:Lt4j;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p0, Lh5e;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lt1e;->d:Lt1e;

    invoke-static {p0, p1}, Lt3e;->a(Lh5e;Lt1e;)V

    return-void

    :cond_2c
    sget-object v0, Lj1a;->a:Lj1a;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p0, Lh5e;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lt1e;->e:Lt1e;

    invoke-static {p0, p1}, Lt3e;->a(Lh5e;Lt1e;)V

    return-void

    :cond_49
    sget-object v0, Lbm6;->a:Lbm6;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_66

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p0, Lh5e;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lt1e;->f:Lt1e;

    invoke-static {p0, p1}, Lt3e;->a(Lh5e;Lt1e;)V

    return-void

    :cond_66
    sget-object v0, Lzff;->a:Lzff;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_83

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p0, Lh5e;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lt1e;->g:Lt1e;

    invoke-static {p0, p1}, Lt3e;->a(Lh5e;Lt1e;)V

    return-void

    :cond_83
    sget-object v0, Lnkh;->a:Lnkh;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a0

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p0, Lh5e;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lt1e;->h:Lt1e;

    invoke-static {p0, p1}, Lt3e;->a(Lh5e;Lt1e;)V

    return-void

    :cond_a0
    instance-of v0, p1, Lgzl;

    if-eqz v0, :cond_c3

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    check-cast p1, Lgzl;

    iget-object p1, p1, Lgzl;->a:Ljava/lang/String;

    check-cast p0, Lh5e;

    iget-object v0, p0, Lh5e;->a:Lnx5;

    new-instance v1, Lqmb;

    const/16 v2, 0x8

    const/4 v3, 0x0

    invoke-direct {v1, p0, p1, v3, v2}, Lqmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :cond_c3
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final o(Lmt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lzu6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lzu6;

    iget v1, v0, Lzu6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lzu6;->v:I

    goto :goto_1a

    :cond_13
    new-instance v0, Lzu6;

    check-cast p1, Lnt5;

    invoke-direct {v0, p0, p1}, Lzu6;-><init>(Lav6;Lnt5;)V

    :goto_1a
    iget-object p1, v0, Lzu6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lzu6;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_4c

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lav6;->p()Le6e;

    move-result-object p0

    iget-object p0, p0, Le6e;->b:La36;

    invoke-virtual {p0}, La36;->n()Lt3e;

    move-result-object p0

    iput v3, v0, Lzu6;->v:I

    check-cast p0, Lh5e;

    invoke-virtual {p0, v0}, Lh5e;->G(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_4c

    return-object v1

    :cond_4c
    :goto_4c
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_56

    check-cast p0, Ljava/util/List;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_56
    return-object p0
.end method

.method public final p()Le6e;
    .registers 1

    iget-object p0, p0, Lav6;->b:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le6e;

    return-object p0
.end method
