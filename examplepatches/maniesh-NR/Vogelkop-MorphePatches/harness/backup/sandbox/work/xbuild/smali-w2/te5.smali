.class public final synthetic Lte5;
.super Lkr;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic h:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lte5;->h:B

    invoke-direct/range {p0 .. p6}, Lkr;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p0

    iget-byte v1, v0, Lte5;->h:B

    const/16 v2, 0x14

    const/4 v3, 0x1

    const/16 v4, 0x18

    const-string v5, "id"

    const-string v6, "params"

    const-string v7, "method"

    const-string v8, "2.0"

    const-string v9, "jsonrpc"

    const-string v10, "views.v1.notifyHostStateChanged"

    const-string v11, "state"

    const/4 v12, 0x3

    const/4 v13, 0x0

    const/4 v14, 0x0

    iget-object v0, v0, Lkr;->a:Ljava/lang/Object;

    const/4 v15, 0x5

    packed-switch v1, :pswitch_data_504

    move-object/from16 v1, p1

    check-cast v1, Lhsn;

    move-object/from16 v2, p2

    check-cast v2, Lmt5;

    check-cast v0, Llqn;

    iget-object v2, v0, Llqn;->w:Lvsn;

    sget-object v3, Lfsn;->a:Lfsn;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4d

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_9c

    iget-object v2, v2, Lvsn;->c:Ls62;

    invoke-virtual {v2}, Ls62;->f()Lqyj;

    move-result-object v2

    invoke-virtual {v2}, Lqyj;->d()Ljava/util/Locale;

    move-result-object v2

    iget-object v0, v0, Llqn;->F:Lmlj;

    if-eqz v0, :cond_49

    move-object v14, v0

    :cond_49
    invoke-static {v1, v2, v14}, Lz5i;->t0(Landroid/content/Context;Ljava/util/Locale;Lmlj;)V

    goto :goto_9c

    :cond_4d
    instance-of v3, v1, Lesn;

    const/16 v4, 0x1388

    if-eqz v3, :cond_60

    iget-object v0, v0, Llqn;->F:Lmlj;

    if-eqz v0, :cond_58

    move-object v14, v0

    :cond_58
    check-cast v1, Lesn;

    iget-object v0, v1, Lesn;->a:Lrxh;

    invoke-virtual {v14, v0, v4}, Lmlj;->a(Lrxh;I)V

    goto :goto_9c

    :cond_60
    sget-object v3, Lfsn;->b:Lfsn;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7c

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_9c

    iget-object v1, v2, Lvsn;->c:Ls62;

    invoke-virtual {v1}, Ls62;->f()Lqyj;

    move-result-object v1

    invoke-virtual {v1}, Lqyj;->d()Ljava/util/Locale;

    move-result-object v1

    invoke-static {v0, v1}, Lz5i;->u0(Landroid/content/Context;Ljava/util/Locale;)V

    goto :goto_9c

    :cond_7c
    instance-of v2, v1, Lgsn;

    if-eqz v2, :cond_9a

    iget-object v2, v0, Llqn;->F:Lmlj;

    if-eqz v2, :cond_85

    move-object v14, v2

    :cond_85
    check-cast v1, Lgsn;

    iget-object v1, v1, Lgsn;->a:Lrxh;

    new-instance v2, Lrxh;

    const v3, 0x7f140ebc

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Ldqn;

    invoke-direct {v3, v0, v13}, Ldqn;-><init>(Llqn;B)V

    invoke-virtual {v14, v1, v4, v2, v3}, Lmlj;->b(Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V

    goto :goto_9c

    :cond_9a
    if-nez v1, :cond_9f

    :cond_9c
    :goto_9c
    sget-object v14, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_a2

    :cond_9f
    invoke-static {}, Lh9o;->p()V

    :goto_a2
    return-object v14

    :pswitch_a3
    move-object/from16 v1, p1

    check-cast v1, Ldla;

    move-object/from16 v2, p2

    check-cast v2, Lmt5;

    check-cast v0, Lupn;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lr2n;

    const/16 v3, 0x10

    invoke-direct {v2, v0, v3}, Lr2n;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lvpb;

    invoke-direct {v3}, Lvpb;-><init>()V

    new-instance v12, Lorb;

    invoke-direct {v12}, Lorb;-><init>()V

    invoke-virtual {v3, v12}, Lvpb;->a(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ldla;->a()Lorb;

    move-result-object v1

    invoke-virtual {v12, v1, v11}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, v0, Lupn;->a:Lqq8;

    invoke-virtual {v0}, Lqq8;->h()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v8, v7, v10}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v7

    invoke-virtual {v7, v3, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v7, v1, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lqfl;

    invoke-direct {v1, v2, v4}, Lqfl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v7, v1}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_e6
    move-object/from16 v1, p1

    check-cast v1, Li1n;

    iget-wide v4, v1, Li1n;->a:J

    move-object/from16 v1, p2

    check-cast v1, Lmt5;

    move-object v3, v0

    check-cast v3, Ljpi;

    iget-object v0, v3, Ljpi;->J:Ls9i;

    invoke-virtual {v0}, Ls9i;->Q()Lnx5;

    move-result-object v0

    new-instance v2, Lz6;

    const/4 v7, 0x3

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v7}, Lz6;-><init>(Ljpi;JLmt5;B)V

    invoke-static {v0, v6, v6, v2, v12}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_106
    move-object/from16 v1, p1

    check-cast v1, Li1n;

    iget-wide v4, v1, Li1n;->a:J

    move-object/from16 v1, p2

    check-cast v1, Lmt5;

    move-object v3, v0

    check-cast v3, Ljpi;

    iget-object v0, v3, Ljpi;->J:Ls9i;

    invoke-virtual {v0}, Ls9i;->Q()Lnx5;

    move-result-object v0

    new-instance v2, Lz6;

    const/4 v7, 0x2

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v7}, Lz6;-><init>(Ljpi;JLmt5;B)V

    invoke-static {v0, v6, v6, v2, v12}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_126
    move-object/from16 v1, p1

    check-cast v1, Lsug;

    move-object/from16 v4, p2

    check-cast v4, Lmt5;

    check-cast v0, Lxtg;

    iget-object v4, v0, Lxtg;->r:Lua7;

    sget-object v5, Lqug;->a:Lqug;

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x2

    const/16 v20, 0x0

    if-eqz v5, :cond_156

    invoke-virtual {v0}, Lxtg;->H0()Lvug;

    move-result-object v2

    iget-object v2, v2, Lvug;->d:Lyvg;

    invoke-virtual {v2}, Lyvg;->a()V

    invoke-virtual {v2, v6}, Lyvg;->b(I)V

    invoke-virtual {v2}, Lyvg;->c()V

    invoke-virtual {v0, v13}, Lxtg;->I0(I)V

    invoke-virtual {v4}, Lua7;->D()V

    :goto_152
    move-object/from16 v4, v20

    goto/16 :goto_2c5

    :cond_156
    sget-object v5, Lhug;->a:Lhug;

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_175

    iget-object v2, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Lgjm;

    new-instance v3, Lmtg;

    invoke-direct {v3}, Lmtg;-><init>()V

    new-instance v4, Lstg;

    invoke-direct {v4, v0, v13}, Lstg;-><init>(Lxtg;B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v4, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3, v0, v5}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto :goto_152

    :cond_175
    sget-object v5, Liug;->a:Liug;

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_194

    iget-object v2, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Lgjm;

    new-instance v4, Lntg;

    invoke-direct {v4}, Lntg;-><init>()V

    new-instance v5, Lstg;

    invoke-direct {v5, v0, v3}, Lstg;-><init>(Lxtg;B)V

    new-instance v3, Lt7d;

    invoke-direct {v3, v5, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v4, v0, v3}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto :goto_152

    :cond_194
    sget-object v3, Ljug;->a:Ljug;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1db

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "com.android.vending"

    const-wide/16 v7, 0x0

    invoke-static {v2, v3, v7, v8}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v2

    if-eqz v2, :cond_1c1

    iget-object v2, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Lgjm;

    new-instance v3, Lotg;

    invoke-direct {v3}, Lotg;-><init>()V

    new-instance v4, Lstg;

    invoke-direct {v4, v0, v6}, Lstg;-><init>(Lxtg;B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v4, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3, v0, v5}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto :goto_152

    :cond_1c1
    iget-object v2, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Lgjm;

    new-instance v3, Lytg;

    invoke-direct {v3}, Lytg;-><init>()V

    new-instance v4, Lm3g;

    const/16 v5, 0x13

    invoke-direct {v4, v5}, Lm3g;-><init>(B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v4, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3, v0, v5}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto/16 :goto_152

    :cond_1db
    sget-object v3, Lkug;->a:Lkug;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1fb

    iget-object v2, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Lgjm;

    new-instance v3, Laug;

    invoke-direct {v3}, Laug;-><init>()V

    new-instance v4, Lstg;

    invoke-direct {v4, v0, v12}, Lstg;-><init>(Lxtg;B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v4, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3, v0, v5}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto/16 :goto_152

    :cond_1fb
    sget-object v3, Lnug;->a:Lnug;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21c

    iget-object v2, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Lgjm;

    new-instance v3, Lbug;

    invoke-direct {v3}, Lbug;-><init>()V

    new-instance v4, Lstg;

    const/4 v5, 0x4

    invoke-direct {v4, v0, v5}, Lstg;-><init>(Lxtg;B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v4, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3, v0, v5}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto/16 :goto_152

    :cond_21c
    sget-object v3, Llug;->a:Llug;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23c

    iget-object v3, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v3, Lgjm;

    new-instance v4, Lytg;

    invoke-direct {v4}, Lytg;-><init>()V

    new-instance v5, Lm3g;

    invoke-direct {v5, v2}, Lm3g;-><init>(B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v5, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v3, v4, v0, v2}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto/16 :goto_152

    :cond_23c
    sget-object v2, Lrug;->a:Lrug;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25c

    iget-object v2, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Lgjm;

    new-instance v3, Lgug;

    invoke-direct {v3}, Lgug;-><init>()V

    new-instance v4, Lstg;

    invoke-direct {v4, v0, v15}, Lstg;-><init>(Lxtg;B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v4, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3, v0, v5}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto/16 :goto_152

    :cond_25c
    sget-object v2, Lmug;->a:Lmug;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27e

    iget-object v2, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Lgjm;

    new-instance v3, Lztg;

    invoke-direct {v3}, Lztg;-><init>()V

    new-instance v4, Lm3g;

    const/16 v5, 0x15

    invoke-direct {v4, v5}, Lm3g;-><init>(B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v4, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3, v0, v5}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto/16 :goto_152

    :cond_27e
    sget-object v2, Loug;->a:Loug;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a0

    iget-object v2, v4, Lua7;->c:Ljava/lang/Object;

    check-cast v2, Lgjm;

    new-instance v3, Leug;

    invoke-direct {v3}, Leug;-><init>()V

    new-instance v4, Lm3g;

    const/16 v5, 0x16

    invoke-direct {v4, v5}, Lm3g;-><init>(B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v4, v15}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3, v0, v5}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto/16 :goto_152

    :cond_2a0
    instance-of v2, v1, Lpug;

    if-eqz v2, :cond_2d1

    invoke-virtual {v0}, Lxtg;->H0()Lvug;

    move-result-object v19

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v17

    move-object/from16 v18, v1

    check-cast v18, Lpug;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static/range {v19 .. v19}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v2

    new-instance v16, Lmz9;

    const/16 v21, 0xf

    invoke-direct/range {v16 .. v21}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    move-object/from16 v3, v16

    move-object/from16 v4, v20

    invoke-static {v2, v4, v4, v3, v12}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :goto_2c5
    invoke-virtual {v0}, Lxtg;->H0()Lvug;

    move-result-object v0

    iget-object v0, v0, Lvug;->h:Lnak;

    invoke-virtual {v0, v1, v4}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v14, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_2d4

    :cond_2d1
    invoke-static {}, Lh9o;->p()V

    :goto_2d4
    return-object v14

    :pswitch_2d5
    move-object/from16 v1, p1

    check-cast v1, Ltug;

    move-object/from16 v2, p2

    check-cast v2, Lmt5;

    check-cast v0, Lxtg;

    iget-object v0, v0, Lxtg;->t:Lttg;

    if-eqz v0, :cond_2ea

    iget-object v0, v0, Lttg;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-boolean v1, v1, Ltug;->a:Z

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    :cond_2ea
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2ed
    move-object/from16 v1, p1

    check-cast v1, Lutg;

    move-object/from16 v4, p2

    check-cast v4, Lmt5;

    check-cast v0, Lxtg;

    iget-object v4, v0, Lxtg;->v:Lkf;

    if-nez v4, :cond_2fc

    move-object v4, v14

    :cond_2fc
    iget-object v4, v4, Lkf;->c:Ljava/lang/Object;

    check-cast v4, Landroid/widget/FrameLayout;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v4, v0, Lxtg;->v:Lkf;

    if-nez v4, :cond_308

    move-object v4, v14

    :cond_308
    iget-object v4, v4, Lkf;->c:Ljava/lang/Object;

    check-cast v4, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string v5, "Missing required view with ID: "

    const v6, 0x7f0a06c5

    const v7, 0x7f0a0870

    const v8, 0x7f0a0513

    const v9, 0x7f0a04c3

    const v10, 0x7f0a041f

    const v11, 0x7f0a0252

    const v12, 0x7f0a006a

    if-eqz v1, :cond_3cb

    if-ne v1, v3, :cond_3c6

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v3, 0x7f0d01ec

    invoke-virtual {v1, v3, v4, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v12, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v3, :cond_3b4

    invoke-static {v11, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/premium/giveaway/view/PremiumGiveawayCardView;

    if-eqz v4, :cond_3b2

    const v4, 0x7f0a02f4

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_3b0

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/premium/giveaway/view/PremiumGiveawayCardView;

    if-eqz v4, :cond_3ae

    const v4, 0x7f0a04a4

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/LinearLayout;

    if-eqz v10, :cond_3b0

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_3ac

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/opera/android/premium/giveaway/view/PremiumGiveawayCardView;

    if-eqz v9, :cond_3aa

    const v8, 0x7f0a06b5

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v9, :cond_3aa

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/premium/giveaway/view/PremiumGiveawayCardView;

    if-eqz v8, :cond_3a8

    const v7, 0x7f0a094c

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_3a8

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v7, :cond_3b5

    check-cast v1, Landroid/widget/ScrollView;

    new-instance v1, Lttg;

    invoke-direct {v1, v7, v4, v3}, Lttg;-><init>(Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V

    goto/16 :goto_432

    :cond_3a8
    move v6, v7

    goto :goto_3b5

    :cond_3aa
    move v6, v8

    goto :goto_3b5

    :cond_3ac
    move v6, v9

    goto :goto_3b5

    :cond_3ae
    move v6, v10

    goto :goto_3b5

    :cond_3b0
    move v6, v4

    goto :goto_3b5

    :cond_3b2
    move v6, v11

    goto :goto_3b5

    :cond_3b4
    move v6, v12

    :cond_3b5
    :goto_3b5
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_4ae

    :cond_3c6
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_4ae

    :cond_3cb
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v3, 0x7f0d01ed

    invoke-virtual {v1, v3, v4, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v12, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v3, :cond_49e

    const v4, 0x7f0a01a8

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/LinearLayout;

    if-eqz v12, :cond_49c

    invoke-static {v11, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/premium/giveaway/view/PremiumGiveawayCardView;

    if-eqz v4, :cond_49a

    const v4, 0x7f0a02a9

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/opera/android/custom_views/FadingScrollView;

    if-eqz v11, :cond_49c

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/premium/giveaway/view/PremiumGiveawayCardView;

    if-eqz v4, :cond_498

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_496

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/opera/android/premium/giveaway/view/PremiumGiveawayCardView;

    if-eqz v9, :cond_494

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/premium/giveaway/view/PremiumGiveawayCardView;

    if-eqz v8, :cond_492

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v7, :cond_49f

    check-cast v1, Landroid/widget/LinearLayout;

    new-instance v1, Lttg;

    invoke-direct {v1, v7, v4, v3}, Lttg;-><init>(Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V

    :goto_432
    iget-object v3, v0, Lxtg;->r:Lua7;

    invoke-virtual {v3}, Lua7;->p()Ln37;

    move-result-object v3

    check-cast v3, Lptg;

    iget v3, v3, Lptg;->d:I

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const v6, 0x7f12003b

    invoke-virtual {v4, v6, v3, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v1, Lttg;->a:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const v6, 0x7f12003a

    invoke-virtual {v4, v6, v3, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, v1, Lttg;->b:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v3, Lzvd;

    invoke-direct {v3, v0, v2}, Lzvd;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v1, Lttg;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, v0, Lxtg;->t:Lttg;

    invoke-virtual {v0}, Lxtg;->H0()Lvug;

    move-result-object v1

    iget-object v1, v1, Lvug;->i:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltug;

    iget-object v0, v0, Lxtg;->t:Lttg;

    if-eqz v0, :cond_48f

    iget-object v0, v0, Lttg;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-boolean v1, v1, Ltug;->a:Z

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    :cond_48f
    sget-object v14, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_4ae

    :cond_492
    move v6, v7

    goto :goto_49f

    :cond_494
    move v6, v8

    goto :goto_49f

    :cond_496
    move v6, v9

    goto :goto_49f

    :cond_498
    move v6, v10

    goto :goto_49f

    :cond_49a
    move v6, v11

    goto :goto_49f

    :cond_49c
    move v6, v4

    goto :goto_49f

    :cond_49e
    move v6, v12

    :cond_49f
    :goto_49f
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_4ae
    return-object v14

    :pswitch_4af
    move-object/from16 v1, p1

    check-cast v1, Lbla;

    move-object/from16 v2, p2

    check-cast v2, Lmt5;

    check-cast v0, Ls98;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Luk6;

    invoke-direct {v2, v0, v4}, Luk6;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lvpb;

    invoke-direct {v3}, Lvpb;-><init>()V

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    invoke-virtual {v3, v4}, Lvpb;->a(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lbla;->a()Lorb;

    move-result-object v1

    invoke-virtual {v4, v1, v11}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, v0, Ls98;->a:Lqq8;

    invoke-virtual {v0}, Lqq8;->h()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v8, v7, v10}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v4

    invoke-virtual {v4, v3, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, v1, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Ltu7;

    invoke-direct {v1, v2, v15}, Ltu7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v4, v1}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4f0
    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    check-cast v0, Lue5;

    invoke-virtual {v0, v1, v2}, Lue5;->a(Lih5;I)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_504
    .packed-switch 0x0
        :pswitch_4f0
        :pswitch_4af
        :pswitch_2ed
        :pswitch_2d5
        :pswitch_126
        :pswitch_106
        :pswitch_e6
        :pswitch_a3
    .end packed-switch
.end method
