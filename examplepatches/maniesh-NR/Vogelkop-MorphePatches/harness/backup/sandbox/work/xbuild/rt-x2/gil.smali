.class public final synthetic Lgil;
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

    .line 11
    iput-byte p3, p0, Lgil;->a:B

    iput-object p1, p0, Lgil;->b:Ljava/lang/Object;

    iput-object p2, p0, Lgil;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lsjl;Lrf1;Lcgc;)V
    .registers 4

    const/4 p1, 0x1

    iput-byte p1, p0, Lgil;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lgil;->b:Ljava/lang/Object;

    iput-object p3, p0, Lgil;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lgil;->a:B

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/16 v6, 0x9

    const/4 v7, 0x6

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    packed-switch v2, :pswitch_data_6da

    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Ldh1;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lbeo;

    check-cast v1, Lspa;

    const-class v3, Ldh1;

    sget-object v4, Lapa;->b:Lapa;

    const-string v4, "POST"

    invoke-static {v4}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v4

    iput-object v4, v1, Lspa;->b:Lapa;

    iget-object v4, v1, Lspa;->a:Ltgm;

    iget-object v0, v0, Lbeo;->a:Ljava/lang/String;

    const-string v5, "api/v1/auth/wallet-challenge"

    invoke-static {v0, v5, v4}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    if-nez v2, :cond_39

    sget-object v0, Lb4f;->a:Lb4f;

    iput-object v0, v1, Lspa;->d:Ljava/lang/Object;

    goto :goto_3b

    :cond_39
    iput-object v2, v1, Lspa;->d:Ljava/lang/Object;

    :goto_3b
    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    :try_start_3f
    invoke-static {v3}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v10
    :try_end_43
    .catchall {:try_start_3f .. :try_end_43} :catchall_43

    :catchall_43
    invoke-static {v0, v10, v1}, Lz1m;->p(Ls15;Lcam;Lspa;)V

    sget-object v0, Lvpa;->a:Ljf2;

    iget-object v0, v1, Lspa;->c:Lg9a;

    const-string v1, "Authorization"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Content-Type"

    const-string v2, "application/json"

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5b
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Log1;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lbeo;

    check-cast v1, Lspa;

    const-class v3, Log1;

    sget-object v4, Lapa;->b:Lapa;

    const-string v4, "POST"

    invoke-static {v4}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v4

    iput-object v4, v1, Lspa;->b:Lapa;

    iget-object v4, v1, Lspa;->a:Ltgm;

    iget-object v0, v0, Lbeo;->a:Ljava/lang/String;

    const-string v5, "api/v1/auth/bind-wallet"

    invoke-static {v0, v5, v4}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    if-nez v2, :cond_81

    sget-object v0, Lb4f;->a:Lb4f;

    iput-object v0, v1, Lspa;->d:Ljava/lang/Object;

    goto :goto_83

    :cond_81
    iput-object v2, v1, Lspa;->d:Ljava/lang/Object;

    :goto_83
    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    :try_start_87
    invoke-static {v3}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v10
    :try_end_8b
    .catchall {:try_start_87 .. :try_end_8b} :catchall_8b

    :catchall_8b
    invoke-static {v0, v10, v1}, Lz1m;->p(Ls15;Lcam;Lspa;)V

    sget-object v0, Lvpa;->a:Ljf2;

    iget-object v0, v1, Lspa;->c:Lg9a;

    const-string v1, "Authorization"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Content-Type"

    const-string v2, "application/json"

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a3
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lrg1;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lbeo;

    check-cast v1, Lspa;

    const-class v3, Lrg1;

    sget-object v4, Lapa;->b:Lapa;

    const-string v4, "POST"

    invoke-static {v4}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v4

    iput-object v4, v1, Lspa;->b:Lapa;

    iget-object v4, v1, Lspa;->a:Ltgm;

    iget-object v0, v0, Lbeo;->a:Ljava/lang/String;

    const-string v5, "api/v1/auth/tokens/refresh"

    invoke-static {v0, v5, v4}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    if-nez v2, :cond_c9

    sget-object v0, Lb4f;->a:Lb4f;

    iput-object v0, v1, Lspa;->d:Ljava/lang/Object;

    goto :goto_cb

    :cond_c9
    iput-object v2, v1, Lspa;->d:Ljava/lang/Object;

    :goto_cb
    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    :try_start_cf
    invoke-static {v3}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v10
    :try_end_d3
    .catchall {:try_start_cf .. :try_end_d3} :catchall_d3

    :catchall_d3
    invoke-static {v0, v10, v1}, Lz1m;->p(Ls15;Lcam;Lspa;)V

    sget-object v0, Lvpa;->a:Ljf2;

    iget-object v0, v1, Lspa;->c:Lg9a;

    const-string v1, "Content-Type"

    const-string v2, "application/json"

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_e4
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lw7o;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lue5;

    check-cast v1, Lfh5;

    iget-boolean v3, v2, Lw7o;->c:Z

    if-nez v3, :cond_142

    invoke-virtual {v1}, Lfh5;->e()V

    iget-object v3, v1, Lfh5;->a:Landroid/view/View;

    iget-object v4, v1, Lfh5;->d:Lndc;

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    iput-object v0, v2, Lw7o;->e:Lue5;

    iget-object v5, v2, Lw7o;->d:Ltcc;

    if-nez v5, :cond_124

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v3}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11e

    new-instance v0, Lfmn;

    invoke-direct {v0, v2, v4, v7}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_142

    :cond_11e
    iput-object v4, v2, Lw7o;->d:Ltcc;

    invoke-virtual {v4, v2}, Ltcc;->a(Lmdc;)V

    goto :goto_142

    :cond_124
    check-cast v4, Lqdc;

    iget-object v3, v4, Lqdc;->i:Lqcc;

    sget-object v4, Lqcc;->c:Lqcc;

    invoke-virtual {v3, v4}, Lqcc;->d(Lqcc;)Z

    move-result v3

    if-eqz v3, :cond_142

    iget-object v3, v2, Lw7o;->b:Lfi5;

    new-instance v4, Lfrl;

    invoke-direct {v4, v2, v1, v0, v8}, Lfrl;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lue5;

    const v1, -0x66c1ecc8

    invoke-direct {v0, v1, v4, v11}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {v3, v0}, Lfi5;->A(Lkotlin/jvm/functions/Function2;)V

    :cond_142
    :goto_142
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_145
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lh6o;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lqk4;

    check-cast v1, Landroid/content/Context;

    iget-object v2, v2, Lh6o;->j:Lw6o;

    iget-object v3, v0, Lqk4;->a:Lr7o;

    iget v3, v3, Lr7o;->b:I

    int-to-long v3, v3

    invoke-virtual {v2, v1, v3, v4, v0}, Lw6o;->e(Landroid/content/Context;JLsk4;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_15c
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lk3o;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    check-cast v1, Lvb7;

    invoke-virtual {v2, v0}, Lk3o;->a(Landroid/view/View;)V

    new-instance v1, Lrz2;

    const/16 v3, 0xa

    invoke-direct {v1, v2, v0, v3}, Lrz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    :pswitch_171
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lkxn;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lppb;

    check-cast v1, Ljava/lang/String;

    iget v0, v0, Lppb;->a:I

    iget-object v2, v2, Lkxn;->b:Lwc1;

    if-eqz v2, :cond_19f

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "window.momiBridge.onCallback("

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", \'"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\')"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v10}, Lwc1;->a(Ljava/lang/String;Lq0n;)V

    :cond_19f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1a2
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lbpb;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lkxn;

    check-cast v1, Lvb7;

    iget-object v1, v2, Lbpb;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_1b2
    if-ge v9, v3, :cond_1c6

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v9, v9, 0x1

    check-cast v4, Lv63;

    iget-object v5, v0, Lkxn;->a:Lzu2;

    iget-object v5, v5, Lzu2;->a:Ljava/util/LinkedHashMap;

    iget-object v7, v4, Lv63;->a:Ljava/lang/String;

    invoke-interface {v5, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1b2

    :cond_1c6
    new-instance v1, Lrz2;

    invoke-direct {v1, v2, v0, v6}, Lrz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    :pswitch_1cc
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lvsn;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lb80;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v3, v2, Lvsn;->k:Lg7m;

    iget-object v3, v3, Lg7m;->d:Ljava/lang/Object;

    check-cast v3, Lji;

    invoke-virtual {v3}, Lji;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorm;

    check-cast v3, Lx5f;

    iget-boolean v4, v3, Lx5f;->h:Z

    if-eqz v4, :cond_202

    iget-object v4, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v6, Lck0;

    invoke-direct {v6, v4, v5}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v4, Lv2e;

    invoke-direct {v4, v8, v0, v10, v1}, Lv2e;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v6, v4}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v3, v5}, Lx5f;->U0(Lx56;)V

    :cond_202
    if-eqz v1, :cond_20f

    iget-object v0, v2, Lvsn;->c:Ls62;

    invoke-virtual {v0}, Ls62;->c()Lp62;

    move-result-object v0

    sget-object v1, Lt52;->k:Lt52;

    invoke-virtual {v0, v1, v10}, Lp62;->a(Lwyh;Lm62;)V

    :cond_20f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_212
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lpqh;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Llqn;

    check-cast v1, Lju4;

    iget-object v3, v2, Lpqh;->a:Ljava/lang/Object;

    if-eqz v3, :cond_235

    iget-object v3, v0, Llqn;->G:Lmrn;

    if-eqz v3, :cond_225

    move-object v10, v3

    :cond_225
    const-string v3, ""

    invoke-virtual {v10, v3}, Lmrn;->i(Ljava/lang/String;)V

    iget-object v0, v0, Llqn;->w:Lvsn;

    iget-object v0, v0, Lvsn;->c:Ls62;

    invoke-virtual {v0}, Ls62;->e()Liy1;

    move-result-object v0

    invoke-virtual {v0}, Liy1;->b()V

    :cond_235
    iput-object v1, v2, Lpqh;->a:Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23a
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lgil;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    check-cast v1, Ltw7;

    invoke-virtual {v1}, Ltw7;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_289

    check-cast v1, Ljava/lang/Iterable;

    instance-of v3, v1, Ljava/util/Collection;

    if-eqz v3, :cond_25b

    move-object v3, v1

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_289

    :cond_25b
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_25f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_289

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lsfb;

    if-eqz v3, :cond_274

    iget-wide v4, v3, Lsfb;->a:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    goto :goto_275

    :cond_274
    move-object v4, v10

    :goto_275
    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_25f

    if-eqz v3, :cond_25f

    iget-boolean v3, v3, Lsfb;->d:Z

    if-ne v3, v11, :cond_25f

    add-int/lit8 v9, v9, 0x1

    if-gez v9, :cond_25f

    invoke-static {}, Lj95;->m()V

    throw v10

    :cond_289
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Lgil;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_293
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Llqn;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    move-object v14, v0

    check-cast v14, Landroid/view/View;

    move-object v0, v1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v11, :cond_2a8

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_2fe

    :cond_2a8
    new-instance v0, Lsba;

    iget-object v13, v2, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v14}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f140110

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    new-instance v3, Lsxh;

    const v4, 0x7f1401d1

    invoke-direct {v3, v4, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-virtual {v14}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v1, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v15

    new-instance v1, Loc;

    new-instance v4, Lrxh;

    const v5, 0x7f1401cc

    invoke-direct {v4, v5}, Lrxh;-><init>(I)V

    new-instance v5, Leqn;

    invoke-direct {v5, v2, v9}, Leqn;-><init>(Llqn;B)V

    invoke-direct {v1, v4, v5}, Loc;-><init>(Lrxh;Landroid/view/View$OnClickListener;)V

    new-instance v12, Lqba;

    const/16 v18, 0x0

    const v19, 0x7f0d0203

    const/16 v16, 0x1

    const/16 v21, 0x1

    move-object/from16 v20, v1

    move-object/from16 v17, v3

    invoke-direct/range {v12 .. v21}, Lqba;-><init>(Landroid/view/ViewGroup;Landroid/view/View;IILsxh;Lrba;ILoc;Z)V

    invoke-direct {v0, v12}, Lsba;-><init>(Lqba;)V

    new-instance v1, Lhqn;

    invoke-direct {v1, v2, v9}, Lhqn;-><init>(Llqn;B)V

    invoke-virtual {v2, v0, v1}, Llqn;->L0(Lsba;Lkz3;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_2fe
    return-object v0

    :pswitch_2ff
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lysm;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lxob;

    check-cast v1, Ljava/lang/Throwable;

    iget-object v1, v2, Lysm;->k:Ljava/lang/Object;

    monitor-enter v1

    :try_start_30c
    iget-object v2, v2, Lysm;->w:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_311
    .catchall {:try_start_30c .. :try_end_311} :catchall_315

    monitor-exit v1

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_315
    move-exception v0

    monitor-exit v1

    throw v0

    :pswitch_318
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lvnm;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v2, Lvnm;->e:F

    iput v5, v2, Lvnm;->e:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_333
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lw6j;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lelm;

    check-cast v1, Lkotlin/Unit;

    new-instance v1, Ls9f;

    invoke-direct {v1}, Ls9f;-><init>()V

    new-instance v5, Lt9f;

    invoke-direct {v5, v1}, Lt9f;-><init>(Ls9f;)V

    iget-object v1, v2, Lw6j;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-static {v1}, Lr9n;->t(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    const-string v2, "__other_option__"

    new-instance v6, Lfvh;

    invoke-direct {v6}, Lfvh;-><init>()V

    const-string v7, "https://docs.google.com/forms/d/1ejASrRL0GTVY4t43w8MM-o1l8f1z2fLmPermETKsHJg/formResponse"

    invoke-virtual {v6, v7}, Lfvh;->h(Ljava/lang/String;)V

    new-instance v7, Lf1p;

    const/16 v12, 0x11

    invoke-direct {v7, v12}, Lf1p;-><init>(B)V

    iget-object v12, v0, Lelm;->a:Ljava/lang/String;

    if-eqz v12, :cond_36d

    const-string v13, "entry.889143526"

    invoke-virtual {v7, v13, v12}, Lf1p;->o(Ljava/lang/String;Ljava/lang/String;)V

    :cond_36d
    const-string v12, "entry.1386744330"

    invoke-virtual {v7, v12, v1}, Lf1p;->o(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lelm;->b:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v12

    :cond_378
    :goto_378
    if-ge v9, v12, :cond_3da

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    add-int/lit8 v9, v9, 0x1

    check-cast v13, Lkotlin/Pair;

    iget-object v14, v13, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v14, Lklm;

    iget-object v13, v13, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v13, Lclm;

    invoke-virtual {v14}, Ljava/lang/Enum;->ordinal()I

    move-result v14

    if-eqz v14, :cond_3a9

    if-eq v14, v11, :cond_3a6

    if-eq v14, v8, :cond_3a3

    if-eq v14, v4, :cond_3a0

    if-ne v14, v3, :cond_39b

    const-string v14, "551482145"

    goto :goto_3ab

    :cond_39b
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_40f

    :cond_3a0
    const-string v14, "448093660"

    goto :goto_3ab

    :cond_3a3
    const-string v14, "1780143696"

    goto :goto_3ab

    :cond_3a6
    const-string v14, "2011307376"

    goto :goto_3ab

    :cond_3a9
    const-string v14, "494990926"

    :goto_3ab
    const-string v15, "entry."

    invoke-virtual {v15, v14}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iget-boolean v15, v13, Lclm;->a:Z

    if-eqz v15, :cond_3b7

    move-object v15, v2

    goto :goto_3bb

    :cond_3b7
    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    :goto_3bb
    invoke-virtual {v7, v14, v15}, Lf1p;->o(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v15, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_378

    const-string v15, ".other_option_response"

    invoke-virtual {v14, v15}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iget-object v15, v0, Lelm;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v15, v13}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    if-nez v13, :cond_3d6

    const-string v13, ""

    :cond_3d6
    invoke-virtual {v7, v14, v13}, Lf1p;->o(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_378

    :cond_3da
    new-instance v0, Llj9;

    iget-object v1, v7, Lf1p;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, v7, Lf1p;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2}, Llj9;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    const-string v1, "POST"

    invoke-virtual {v6, v1, v0}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance v0, Lkvh;

    invoke-direct {v0, v6}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v5, v0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v7

    new-instance v8, Lqjl;

    const/16 v0, 0xf

    invoke-direct {v8, v0}, Lqjl;-><init>(B)V

    new-instance v9, Lqjl;

    const/16 v0, 0x10

    invoke-direct {v9, v0}, Lqjl;-><init>(B)V

    const-wide/16 v11, 0x0

    const/16 v13, 0x78

    const/4 v10, 0x0

    invoke-static/range {v7 .. v13}, Lvtp;->R(Lokhttp3/internal/connection/RealCall;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;IJI)Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lt0i;

    :goto_40f
    return-object v10

    :pswitch_410
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Livg;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lpam;

    check-cast v1, Lsam;

    iget-object v3, v2, Livg;->b:Ljava/lang/Object;

    check-cast v3, Lauj;

    monitor-enter v3

    :try_start_41f
    invoke-interface {v1}, Lsam;->a()Z

    move-result v4

    iget-object v2, v2, Livg;->c:Ljava/lang/Object;

    check-cast v2, Ly3d;

    if-eqz v4, :cond_430

    invoke-virtual {v2, v0, v1}, Ly3d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsam;

    goto :goto_436

    :cond_430
    invoke-virtual {v2, v0}, Ly3d;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsam;
    :try_end_436
    .catchall {:try_start_41f .. :try_end_436} :catchall_43a

    :goto_436
    monitor-exit v3

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_43a
    move-exception v0

    monitor-exit v3

    throw v0

    :pswitch_43d
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lo3m;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    check-cast v1, Losk;

    iget-object v2, v2, Lo3m;->c:Lnb2;

    invoke-virtual {v2, v1, v0}, Lkfo;->P(Losk;Ljava/lang/Iterable;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_44f
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lb3m;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lq2m;

    check-cast v1, Lvb7;

    new-instance v1, Lrz2;

    const/4 v3, 0x7

    invoke-direct {v1, v2, v0, v3}, Lrz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    :pswitch_460
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lb3m;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lb3m;

    check-cast v1, Lvb7;

    iget-object v1, v2, Lb3m;->k:Lpuj;

    invoke-virtual {v1, v0}, Lpuj;->add(Ljava/lang/Object;)Z

    new-instance v1, Lrz2;

    invoke-direct {v1, v2, v0, v7}, Lrz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    :pswitch_475
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lb3m;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lw2m;

    check-cast v1, Lvb7;

    iget-object v1, v2, Lb3m;->j:Lpuj;

    invoke-virtual {v1, v0}, Lpuj;->add(Ljava/lang/Object;)Z

    new-instance v1, Lrz2;

    const/16 v3, 0x8

    invoke-direct {v1, v2, v0, v3}, Lrz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    :pswitch_48c
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lnx5;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lb3m;

    check-cast v1, Lvb7;

    sget-object v1, Lrx5;->d:Lrx5;

    new-instance v3, Lpak;

    invoke-direct {v3, v0, v10}, Lpak;-><init>(Lb3m;Lmt5;)V

    invoke-static {v2, v10, v1, v3, v11}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    new-instance v0, Lt91;

    invoke-direct {v0, v4}, Lt91;-><init>(B)V

    return-object v0

    :pswitch_4a6
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lh42;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4b8
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lh42;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Llqh;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    iget-boolean v4, v0, Llqh;->a:Z

    if-nez v4, :cond_4d3

    if-nez v3, :cond_4cd

    if-nez v1, :cond_4d3

    goto :goto_4d8

    :cond_4cd
    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4d8

    :cond_4d3
    iput-boolean v9, v0, Llqh;->a:Z

    invoke-virtual {v2, v1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_4d8
    :goto_4d8
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4db
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lg7m;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    check-cast v1, Lndc;

    iget-object v1, v2, Lg7m;->c:Ljava/lang/Object;

    check-cast v1, Lgbf;

    iget-object v3, v1, Lgbf;->n:Lshf;

    iget-object v3, v3, Lshf;->a:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/ToolbarProgressBar;

    iget-object v4, v2, Lg7m;->k:Ljava/lang/Object;

    check-cast v4, Lyvl;

    new-instance v5, Lwvl;

    invoke-direct {v5, v2, v9}, Lwvl;-><init>(Lg7m;B)V

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v7

    invoke-static {v3, v7, v4, v5}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance v3, Lxvl;

    invoke-direct {v3, v2}, Lxvl;-><init>(Lg7m;)V

    new-instance v4, Lwvl;

    invoke-direct {v4, v2, v11}, Lwvl;-><init>(Lg7m;B)V

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v5

    invoke-static {v1, v5, v3, v4}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object v1, v2, Lg7m;->i:Ljava/lang/Object;

    check-cast v1, Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwul;

    iget-object v1, v1, Lwul;->c:Lpde;

    new-instance v3, Lqfl;

    invoke-direct {v3, v2, v6}, Lqfl;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lw4i;

    const/16 v4, 0x1d

    invoke-direct {v2, v3, v4}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0, v2}, Lekc;->j(Lndc;Lf7f;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_52e
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lpr;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    check-cast v1, Lndc;

    invoke-virtual {v2}, Lpr;->y()V

    iget-object v1, v2, Lpr;->c:Ljava/lang/Object;

    check-cast v1, Lbvl;

    invoke-interface {v1}, Lbvl;->getState()Lpde;

    move-result-object v1

    new-instance v3, Lcvl;

    invoke-direct {v3, v2, v11}, Lcvl;-><init>(Lpr;B)V

    new-instance v2, Lw4i;

    const/16 v4, 0x1c

    invoke-direct {v2, v3, v4}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0, v2}, Lekc;->j(Lndc;Lf7f;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_555
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lmul;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lih;

    check-cast v1, Losk;

    iget-object v2, v2, Lmul;->b:Lnb2;

    invoke-virtual {v2, v1, v0}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_567
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    check-cast v1, Lp1d;

    if-eqz v2, :cond_590

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v3

    move v4, v9

    :goto_578
    if-ge v4, v3, :cond_590

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkotlin/Pair;

    iget-object v6, v5, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v6, Lifg;

    iget-object v5, v5, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v5, Lybb;

    iget-wide v7, v5, Lybb;->a:J

    invoke-static {v1, v6, v7, v8}, Lp1d;->g(Lp1d;Lifg;J)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_578

    :cond_590
    if-eqz v0, :cond_5b9

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    :goto_596
    if-ge v9, v2, :cond_5b9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkotlin/Pair;

    iget-object v4, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v4, Lifg;

    iget-object v3, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v3, Lkotlin/jvm/functions/Function0;

    if-eqz v3, :cond_5b1

    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lybb;

    iget-wide v5, v3, Lybb;->a:J

    goto :goto_5b3

    :cond_5b1
    const-wide/16 v5, 0x0

    :goto_5b3
    invoke-static {v1, v4, v5, v6}, Lp1d;->g(Lp1d;Lifg;J)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_596

    :cond_5b9
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5bc
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lsjl;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lrf1;

    check-cast v1, Lm1i;

    iget-object v3, v2, Lsjl;->b:Lsf1;

    iget-object v2, v2, Lsjl;->a:Lt0g;

    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnjl;

    if-eqz v4, :cond_5d7

    iget-object v4, v4, Lnjl;->a:Lmjl;

    iget-object v4, v4, Lmjl;->a:Lsf1;

    goto :goto_5d8

    :cond_5d7
    move-object v4, v10

    :goto_5d8
    invoke-virtual {v3, v4}, Lsf1;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_631

    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnjl;

    if-eqz v2, :cond_631

    iget-object v3, v2, Lnjl;->b:Lxbe;

    invoke-static {v0, v2}, Lsjl;->c(Lrf1;Lnjl;)Lrf1;

    move-result-object v0

    if-eqz v0, :cond_631

    iget v4, v0, Lrf1;->c:I

    iget v0, v0, Lrf1;->b:I

    invoke-virtual {v2, v0, v4}, Lnjl;->i(II)Ld91;

    move-result-object v6

    invoke-virtual {v2, v0}, Lnjl;->b(I)Lvoh;

    move-result-object v7

    sub-int/2addr v4, v11

    invoke-virtual {v2, v4}, Lnjl;->b(I)Lvoh;

    move-result-object v2

    invoke-virtual {v3, v0}, Lxbe;->d(I)I

    move-result v0

    invoke-virtual {v3, v4}, Lxbe;->d(I)I

    move-result v3

    if-ne v0, v3, :cond_611

    iget v0, v2, Lvoh;->a:F

    iget v2, v7, Lvoh;->a:F

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v5

    :cond_611
    iget v0, v7, Lvoh;->b:F

    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v4, v0

    const/16 v0, 0x20

    shl-long/2addr v2, v0

    const-wide v7, 0xffffffffL

    and-long/2addr v4, v7

    or-long/2addr v2, v4

    const-wide v4, -0x7fffffff80000000L    # -1.0609978955E-314

    xor-long/2addr v2, v4

    invoke-virtual {v6, v2, v3}, Ld91;->i(J)V

    goto :goto_632

    :cond_631
    move-object v6, v10

    :goto_632
    if-eqz v6, :cond_639

    new-instance v10, Lrjl;

    invoke-direct {v10, v6}, Lrjl;-><init>(Ld91;)V

    :cond_639
    if-eqz v10, :cond_641

    invoke-virtual {v1, v10}, Lm1i;->n(Lpaj;)V

    invoke-virtual {v1, v11}, Lm1i;->f(Z)V

    :cond_641
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_644
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lrf1;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Lcgc;

    iget-object v0, v0, Lcgc;->b:Lq0g;

    check-cast v1, Lwel;

    iget-object v4, v2, Lrf1;->a:Ljava/lang/Object;

    check-cast v4, Lpfc;

    invoke-virtual {v4}, Lpfc;->b()Ltjl;

    move-result-object v5

    if-eqz v5, :cond_65d

    iget-object v5, v5, Ltjl;->a:Lrwj;

    goto :goto_65e

    :cond_65d
    move-object v5, v10

    :goto_65e
    invoke-virtual {v0}, Lq0g;->h()I

    move-result v6

    and-int/2addr v6, v11

    if-eqz v6, :cond_66e

    invoke-virtual {v4}, Lpfc;->b()Ltjl;

    move-result-object v6

    if-eqz v6, :cond_66e

    iget-object v6, v6, Ltjl;->b:Lrwj;

    goto :goto_66f

    :cond_66e
    move-object v6, v10

    :goto_66f
    if-eqz v5, :cond_675

    invoke-virtual {v5, v6}, Lrwj;->d(Lrwj;)Lrwj;

    move-result-object v6

    :cond_675
    invoke-virtual {v0}, Lq0g;->h()I

    move-result v5

    and-int/2addr v5, v8

    if-eqz v5, :cond_685

    invoke-virtual {v4}, Lpfc;->b()Ltjl;

    move-result-object v5

    if-eqz v5, :cond_685

    iget-object v5, v5, Ltjl;->c:Lrwj;

    goto :goto_686

    :cond_685
    move-object v5, v10

    :goto_686
    if-eqz v6, :cond_68c

    invoke-virtual {v6, v5}, Lrwj;->d(Lrwj;)Lrwj;

    move-result-object v5

    :cond_68c
    invoke-virtual {v0}, Lq0g;->h()I

    move-result v0

    and-int/2addr v0, v3

    if-eqz v0, :cond_69b

    invoke-virtual {v4}, Lpfc;->b()Ltjl;

    move-result-object v0

    if-eqz v0, :cond_69b

    iget-object v10, v0, Ltjl;->d:Lrwj;

    :cond_69b
    if-eqz v5, :cond_6a1

    invoke-virtual {v5, v10}, Lrwj;->d(Lrwj;)Lrwj;

    move-result-object v10

    :cond_6a1
    new-instance v0, Llqh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v3, v1, Lwel;->a:Lsf1;

    new-instance v4, Ltmi;

    const/16 v5, 0xc

    invoke-direct {v4, v0, v2, v10, v5}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lsf1;->c(Lkotlin/jvm/functions/Function1;)Lsf1;

    move-result-object v0

    iput-object v0, v1, Lwel;->b:Lsf1;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6b8
    iget-object v2, v0, Lgil;->b:Ljava/lang/Object;

    check-cast v2, Lkotlin/jvm/functions/Function0;

    iget-object v0, v0, Lgil;->c:Ljava/lang/Object;

    check-cast v0, Liil;

    check-cast v1, Lxfl;

    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    if-eqz v0, :cond_6d1

    invoke-virtual {v0}, Liil;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    :cond_6d1
    if-eqz v11, :cond_6d6

    invoke-interface {v1}, Lxfl;->close()V

    :cond_6d6
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_6da
    .packed-switch 0x0
        :pswitch_6b8
        :pswitch_644
        :pswitch_5bc
        :pswitch_567
        :pswitch_555
        :pswitch_52e
        :pswitch_4db
        :pswitch_4b8
        :pswitch_4a6
        :pswitch_48c
        :pswitch_475
        :pswitch_460
        :pswitch_44f
        :pswitch_43d
        :pswitch_410
        :pswitch_333
        :pswitch_318
        :pswitch_2ff
        :pswitch_293
        :pswitch_23a
        :pswitch_212
        :pswitch_1cc
        :pswitch_1a2
        :pswitch_171
        :pswitch_15c
        :pswitch_145
        :pswitch_e4
        :pswitch_a3
        :pswitch_5b
    .end packed-switch
.end method
