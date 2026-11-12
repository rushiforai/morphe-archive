.class public final synthetic Lhv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    .line 14
    iput-byte p1, p0, Lhv;->a:B

    iput-object p2, p0, Lhv;->c:Ljava/lang/Object;

    iput-object p3, p0, Lhv;->d:Ljava/lang/Object;

    iput-object p4, p0, Lhv;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 15
    iput-byte p4, p0, Lhv;->a:B

    iput-object p1, p0, Lhv;->c:Ljava/lang/Object;

    iput-object p2, p0, Lhv;->b:Ljava/lang/Object;

    iput-object p3, p0, Lhv;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lvt9;Llr4;Lhqj;Luae;)V
    .registers 5

    const/16 p4, 0xf

    iput-byte p4, p0, Lhv;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhv;->c:Ljava/lang/Object;

    iput-object p2, p0, Lhv;->b:Ljava/lang/Object;

    iput-object p3, p0, Lhv;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p0

    iget-byte v1, v0, Lhv;->a:B

    const/16 v2, 0xa

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    iget-object v7, v0, Lhv;->d:Ljava/lang/Object;

    iget-object v8, v0, Lhv;->b:Ljava/lang/Object;

    iget-object v0, v0, Lhv;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_43c

    check-cast v0, Lkotlin/jvm/functions/Function1;

    check-cast v8, Lwye;

    check-cast v7, Llqh;

    sget-object v1, Lwye;->W:Lm1i;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v8, Lwye;->J:Lpaj;

    iget-object v2, v1, Lm1i;->o:Lpaj;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    iget-boolean v2, v8, Lwye;->M:Z

    iget-boolean v3, v1, Lm1i;->p:Z

    if-eq v2, v3, :cond_2d

    move v4, v5

    :cond_2d
    iget-object v2, v1, Lm1i;->o:Lpaj;

    iget-wide v9, v1, Lm1i;->r:J

    iget-object v3, v1, Lm1i;->u:Ld2c;

    iget-object v11, v1, Lm1i;->t:Ln27;

    invoke-interface {v2, v9, v10, v3, v11}, Lpaj;->a(JLd2c;Ln27;)Lw7d;

    move-result-object v2

    iput-object v2, v1, Lm1i;->x:Lw7d;

    iget-object v3, v8, Lwye;->L:Lvoh;

    if-eqz v2, :cond_43

    invoke-virtual {v2}, Lw7d;->w()Lvoh;

    move-result-object v6

    :cond_43
    invoke-static {v3, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v3, v2, 0x1

    iput-boolean v3, v7, Llqh;->a:Z

    if-eqz v0, :cond_51

    if-nez v4, :cond_51

    if-nez v2, :cond_9a

    :cond_51
    iget-object v2, v1, Lm1i;->o:Lpaj;

    iput-object v2, v8, Lwye;->J:Lpaj;

    iget-boolean v2, v1, Lm1i;->p:Z

    iput-boolean v2, v8, Lwye;->M:Z

    iget-object v2, v1, Lm1i;->x:Lw7d;

    sget-object v3, Lvoh;->e:Lvoh;

    if-eqz v2, :cond_65

    invoke-virtual {v2}, Lw7d;->w()Lvoh;

    move-result-object v2

    if-nez v2, :cond_66

    :cond_65
    move-object v2, v3

    :cond_66
    iput-object v2, v8, Lwye;->L:Lvoh;

    iget-object v1, v1, Lm1i;->x:Lw7d;

    if-eqz v1, :cond_87

    invoke-virtual {v1}, Lw7d;->w()Lvoh;

    move-result-object v1

    if-eqz v1, :cond_87

    invoke-static {v1}, Lf03;->f0(Lvoh;)Lccb;

    move-result-object v1

    new-instance v3, Lvoh;

    iget v2, v1, Lccb;->a:I

    int-to-float v2, v2

    iget v6, v1, Lccb;->b:I

    int-to-float v6, v6

    iget v7, v1, Lccb;->c:I

    int-to-float v7, v7

    iget v1, v1, Lccb;->d:I

    int-to-float v1, v1

    invoke-direct {v3, v2, v6, v7, v1}, Lvoh;-><init>(FFFF)V

    :cond_87
    iput-object v3, v8, Lwye;->K:Lvoh;

    iget-boolean v1, v8, Lwye;->N:Z

    if-eqz v1, :cond_9a

    if-nez v4, :cond_95

    iget-boolean v1, v8, Lwye;->M:Z

    if-eqz v1, :cond_9a

    if-nez v0, :cond_9a

    :cond_95
    iget-object v0, v8, Lwye;->u:Lm3c;

    invoke-virtual {v0}, Lm3c;->F()V

    :cond_9a
    iput-boolean v5, v8, Lwye;->N:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_9f
    check-cast v0, Lpej;

    check-cast v8, Lnx5;

    check-cast v7, Lpej;

    iget-object v0, v0, Lpej;->d:La21;

    iget-object v0, v0, La21;->d:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function1;

    sget-object v1, Lqej;->b:Lqej;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_c2

    new-instance v0, Lc7e;

    const/4 v1, 0x6

    invoke-direct {v0, v7, v6, v1}, Lc7e;-><init>(Lpej;Lmt5;B)V

    invoke-static {v8, v6, v6, v0, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_c2
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    :pswitch_c5
    check-cast v0, Lkotlin/jvm/functions/Function2;

    check-cast v8, Lpqh;

    check-cast v7, Lpga;

    iget-object v1, v8, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Lo1d;

    iget-object v2, v1, Lo1d;->m:Lsee;

    if-nez v2, :cond_dc

    sget-object v2, Limi;->a:[J

    new-instance v2, Lsee;

    invoke-direct {v2}, Lsee;-><init>()V

    iput-object v2, v1, Lo1d;->m:Lsee;

    :cond_dc
    invoke-virtual {v2, v7}, Lsee;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_ea

    new-instance v3, Lm1d;

    invoke-direct {v3, v1}, Lm1d;-><init>(Lo1d;)V

    invoke-virtual {v2, v7, v3}, Lsee;->m(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_ea
    check-cast v3, Lm1d;

    iput-boolean v4, v3, Lm1d;->a:Z

    invoke-interface {v0, v3, v7}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_f4
    check-cast v0, Landroid/content/Context;

    check-cast v8, Lj4c;

    check-cast v7, Lj4c;

    new-instance v1, Lvpc;

    invoke-static {v0}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v0

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    new-instance v3, Lonc;

    invoke-direct {v3, v7, v5}, Lonc;-><init>(Lj4c;B)V

    invoke-direct {v1, v0, v2, v3}, Lvpc;-><init>(Ldj9;Lcom/opera/android/settings/SettingsManager;Lonc;)V

    return-object v1

    :pswitch_10f
    check-cast v0, Lekc;

    check-cast v8, Lekc;

    check-cast v7, Lekc;

    invoke-virtual {v0}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_128

    invoke-virtual {v8}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_128

    invoke-virtual {v7}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_128

    move v4, v5

    :cond_128
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_12d
    check-cast v0, Lkotlin/jvm/functions/Function2;

    check-cast v8, Likc;

    check-cast v7, Lpde;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_140
    check-cast v0, Lkotlin/jvm/functions/Function2;

    check-cast v8, Lekc;

    check-cast v7, Lekc;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_153
    check-cast v0, Ltjc;

    check-cast v8, Lr3g;

    check-cast v7, Lhu5;

    invoke-interface {v8}, Lr3g;->R0()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v8}, Lr3g;->o()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v5, v7}, Ltjc;->e(Ljava/lang/String;Ljava/lang/String;ZLcom/opera/api/Callback;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_167
    check-cast v0, Ltjc;

    check-cast v8, Ls3g;

    check-cast v7, Lsu;

    iget-object v1, v8, Ls3g;->a:Ljava/lang/String;

    if-nez v1, :cond_173

    iget-object v1, v8, Ls3g;->d:Ljava/lang/String;

    :cond_173
    iget-object v3, v8, Ls3g;->b:Ljava/lang/String;

    new-instance v5, Ly0a;

    invoke-direct {v5, v7, v2}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v3, v4, v5}, Ltjc;->e(Ljava/lang/String;Ljava/lang/String;ZLcom/opera/api/Callback;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_180
    check-cast v0, Ltjc;

    check-cast v8, Lq3g;

    check-cast v7, Ltu;

    invoke-virtual {v0, v8, v7}, Ltjc;->f(Lq3g;Ltu;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_18c
    check-cast v0, Ltjc;

    check-cast v8, Ls3g;

    check-cast v7, Lve9;

    invoke-virtual {v0, v8, v7}, Ltjc;->h(Ls3g;Lve9;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_198
    check-cast v0, Li37;

    check-cast v8, Lu6c;

    check-cast v7, Ly4c;

    invoke-virtual {v0}, Li37;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh6c;

    new-instance v1, Lro9;

    iget-object v2, v8, Lu6c;->e:Ls14;

    iget-object v2, v2, Ls14;->f:Ljava/lang/Object;

    check-cast v2, Lo5c;

    invoke-virtual {v2}, Lo5c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlin/ranges/IntRange;

    invoke-direct {v1, v2, v0}, Lro9;-><init>(Lkotlin/ranges/IntRange;Lw7d;)V

    new-instance v2, Li6c;

    invoke-direct {v2, v8, v0, v7, v1}, Li6c;-><init>(Lu6c;Lh6c;Ly4c;Lro9;)V

    return-object v2

    :pswitch_1bb
    check-cast v0, Lafe;

    check-cast v8, Lafe;

    check-cast v7, Lkotlin/jvm/functions/Function0;

    new-instance v1, Lgxf;

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldr9;

    invoke-interface {v8}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-interface {v7}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-direct {v1, v0, v2, v3}, Lgxf;-><init>(Ldr9;Lkotlin/jvm/functions/Function1;I)V

    return-object v1

    :pswitch_1dd
    check-cast v0, Lowa;

    check-cast v8, Ldll;

    check-cast v7, Lkze;

    new-instance v1, Lnxa;

    iget-object v0, v0, Lowa;->a:Landroid/content/Context;

    invoke-direct {v1, v0, v8, v7}, Lnxa;-><init>(Landroid/content/Context;Ldll;Lkze;)V

    return-object v1

    :pswitch_1eb
    move-object v1, v0

    check-cast v1, Lvt9;

    check-cast v8, Llr4;

    check-cast v7, Lhqj;

    iget-object v2, v1, Lvt9;->M:Ljh5;

    iget-object v3, v2, Ljh5;->b:Llr4;

    :try_start_1f6
    iput-object v8, v2, Ljh5;->b:Llr4;

    iget-object v5, v1, Lvt9;->G:Lhqj;

    iget-object v8, v1, Lvt9;->o:[I

    iget-object v9, v1, Lvt9;->v:Ljde;

    iput-object v6, v1, Lvt9;->o:[I

    iput-object v6, v1, Lvt9;->v:Ljde;
    :try_end_202
    .catchall {:try_start_1f6 .. :try_end_202} :catchall_224

    :try_start_202
    iput-object v7, v1, Lvt9;->G:Lhqj;

    iget-boolean v7, v2, Ljh5;->e:Z
    :try_end_206
    .catchall {:try_start_202 .. :try_end_206} :catchall_21c

    :try_start_206
    iput-boolean v4, v2, Ljh5;->e:Z

    invoke-virtual {v1, v6, v6}, Lvt9;->B(Loag;Ljava/lang/Object;)V
    :try_end_20b
    .catchall {:try_start_206 .. :try_end_20b} :catchall_218

    :try_start_20b
    iput-boolean v7, v2, Ljh5;->e:Z
    :try_end_20d
    .catchall {:try_start_20b .. :try_end_20d} :catchall_21c

    :try_start_20d
    iput-object v5, v1, Lvt9;->G:Lhqj;

    iput-object v8, v1, Lvt9;->o:[I

    iput-object v9, v1, Lvt9;->v:Ljde;
    :try_end_213
    .catchall {:try_start_20d .. :try_end_213} :catchall_224

    iput-object v3, v2, Ljh5;->b:Llr4;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_218
    move-exception v0

    :try_start_219
    iput-boolean v7, v2, Ljh5;->e:Z

    throw v0
    :try_end_21c
    .catchall {:try_start_219 .. :try_end_21c} :catchall_21c

    :catchall_21c
    move-exception v0

    :try_start_21d
    iput-object v5, v1, Lvt9;->G:Lhqj;

    iput-object v8, v1, Lvt9;->o:[I

    iput-object v9, v1, Lvt9;->v:Ljde;

    throw v0
    :try_end_224
    .catchall {:try_start_21d .. :try_end_224} :catchall_224

    :catchall_224
    move-exception v0

    iput-object v3, v2, Ljh5;->b:Llr4;

    throw v0

    :pswitch_228
    check-cast v0, Lts8;

    move-object/from16 v21, v8

    check-cast v21, Lpde;

    move-object/from16 v22, v7

    check-cast v22, Lp6l;

    new-instance v9, Lrs8;

    iget-object v1, v0, Lts8;->d:Landroidx/recyclerview/widget/RecyclerView;

    iget v2, v0, Lv5k;->c:I

    invoke-static {v1, v2, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v10

    iget-object v11, v0, Lts8;->e:Lcom/opera/android/feed/FeedScrollView;

    iget-object v12, v0, Lts8;->f:Lx5f;

    iget-object v13, v0, Lts8;->g:Lcom/opera/android/settings/SettingsManager;

    iget-object v14, v0, Lts8;->k:Lnr8;

    iget-object v15, v0, Lts8;->l:Lkze;

    iget-object v1, v0, Lts8;->m:Landroid/view/View$OnLongClickListener;

    iget-object v2, v0, Lts8;->n:Ldg7;

    iget-object v3, v0, Lts8;->o:Lnv2;

    iget-object v4, v0, Lts8;->p:Ltlg;

    iget-object v6, v0, Lts8;->j:Lbvl;

    new-instance v7, Lps8;

    invoke-direct {v7, v0, v5}, Lps8;-><init>(Lts8;B)V

    move-object/from16 v16, v1

    move-object/from16 v17, v2

    move-object/from16 v18, v3

    move-object/from16 v19, v4

    move-object/from16 v20, v6

    move-object/from16 v23, v7

    invoke-direct/range {v9 .. v23}, Lrs8;-><init>(Landroid/view/View;Lcom/opera/android/feed/FeedScrollView;Lx5f;Lcom/opera/android/settings/SettingsManager;Lnr8;Lkze;Landroid/view/View$OnLongClickListener;Ldg7;Lnv2;Ltlg;Lbvl;Lpde;Lp6l;Lps8;)V

    return-object v9

    :pswitch_265
    check-cast v0, Lnx5;

    check-cast v7, Lg31;

    check-cast v8, Ljava/lang/String;

    new-instance v1, Lvr;

    const/16 v2, 0x1a

    invoke-direct {v1, v7, v8, v6, v2}, Lvr;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, v6, v6, v1, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_278
    check-cast v0, Lauj;

    check-cast v8, Loji;

    check-cast v7, Lw6j;

    new-instance v1, Lpn6;

    invoke-direct {v1, v0, v8, v7}, Lpn6;-><init>(Lauj;Loji;Lw6j;)V

    return-object v1

    :pswitch_284
    check-cast v0, Ltt5;

    move-object v13, v8

    check-cast v13, Ltsd;

    move-object/from16 v16, v7

    check-cast v16, Lx5f;

    new-instance v9, Lcu5;

    iget-object v10, v0, Ltt5;->f:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v11, v0, Ltt5;->k:Ltsd;

    iget-object v12, v0, Ltt5;->l:Lkze;

    iget-object v0, v0, Ltt5;->m:Lqt5;

    new-instance v15, Lq2;

    const/16 v20, 0x0

    const/16 v21, 0x16

    move-object v14, v15

    const/4 v15, 0x0

    const-class v17, Lorm;

    const-string v18, "logContinueOnBookingImpression"

    const-string v19, "logContinueOnBookingImpression()V"

    invoke-direct/range {v14 .. v21}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v15, v14

    move-object v14, v0

    invoke-direct/range {v9 .. v15}, Lcu5;-><init>(Landroidx/recyclerview/widget/RecyclerView;Ltsd;Lkze;Ltsd;Lqt5;Lq2;)V

    return-object v9

    :pswitch_2ae
    move-object v10, v0

    check-cast v10, Lmq5;

    check-cast v8, Lvnm;

    check-cast v7, Lxs3;

    iget-object v0, v10, Lmq5;->t:Lwth;

    :goto_2b7
    iget-object v1, v0, Lwth;->b:Ljava/lang/Object;

    check-cast v1, Ldfe;

    iget v2, v1, Ldfe;->c:I

    if-eqz v2, :cond_2ff

    if-eqz v2, :cond_2f9

    add-int/lit8 v2, v2, -0x1

    iget-object v1, v1, Ldfe;->a:[Ljava/lang/Object;

    aget-object v1, v1, v2

    check-cast v1, Ljq5;

    iget-object v1, v1, Ljq5;->a:Lss3;

    invoke-virtual {v1}, Lss3;->invoke()Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lvoh;

    if-nez v11, :cond_2d6

    move v1, v5

    goto :goto_2e0

    :cond_2d6
    const-wide/16 v14, 0x0

    const/16 v16, 0x3

    const-wide/16 v12, 0x0

    invoke-static/range {v10 .. v16}, Lmq5;->V0(Lmq5;Lvoh;JJI)Z

    move-result v1

    :goto_2e0
    if-eqz v1, :cond_2ff

    iget-object v1, v0, Lwth;->b:Ljava/lang/Object;

    check-cast v1, Ldfe;

    iget v2, v1, Ldfe;->c:I

    sub-int/2addr v2, v5

    invoke-virtual {v1, v2}, Ldfe;->l(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljq5;

    iget-object v1, v1, Ljq5;->b:Lnh4;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    sget-object v3, Lt0i;->b:Lp0i;

    invoke-virtual {v1, v2}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    goto :goto_2b7

    :cond_2f9
    const-string v0, "MutableVector is empty."

    invoke-static {v0}, Lh9o;->h(Ljava/lang/String;)V

    goto :goto_326

    :cond_2ff
    iget-boolean v0, v10, Lmq5;->u:Z

    if-eqz v0, :cond_31c

    iget-object v0, v10, Lmq5;->s:Lhpi;

    invoke-virtual {v0}, Lhpi;->invoke()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lvoh;

    if-eqz v11, :cond_31c

    const-wide/16 v14, 0x0

    const/16 v16, 0x3

    const-wide/16 v12, 0x0

    invoke-static/range {v10 .. v16}, Lmq5;->V0(Lmq5;Lvoh;JJI)Z

    move-result v0

    if-ne v0, v5, :cond_31c

    iput-boolean v4, v10, Lmq5;->u:Z

    :cond_31c
    const-wide/16 v0, 0x0

    invoke-virtual {v10, v7, v0, v1}, Lmq5;->T0(Lxs3;J)F

    move-result v0

    iput v0, v8, Lvnm;->e:F

    sget-object v6, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_326
    return-object v6

    :pswitch_327
    check-cast v0, Lnq4;

    check-cast v8, Li7a;

    check-cast v7, Lxv;

    invoke-static {v0, v8, v7}, Lokhttp3/internal/connection/ConnectPlan;->a(Lnq4;Li7a;Lxv;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :pswitch_332
    check-cast v0, Lr65;

    check-cast v8, Lcom/usercentrics/sdk/UsercentricsReadyStatus;

    check-cast v7, Lcom/usercentrics/sdk/UsercentricsOptions;

    invoke-virtual {v0, v8, v7, v6}, Lr65;->i(Lcom/usercentrics/sdk/UsercentricsReadyStatus;Lcom/usercentrics/sdk/UsercentricsOptions;Lfwm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_33e
    check-cast v0, Lnq4;

    check-cast v7, Ljava/util/List;

    check-cast v8, Ljava/lang/String;

    iget-object v0, v0, Lnq4;->b:Lokhttp3/internal/tls/CertificateChainCleaner;

    if-eqz v0, :cond_34f

    invoke-virtual {v0, v7, v8}, Lokhttp3/internal/tls/CertificateChainCleaner;->clean(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_34f

    move-object v7, v0

    :cond_34f
    check-cast v7, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-static {v7, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_35e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_370

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/Certificate;

    check-cast v2, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_35e

    :cond_370
    return-object v0

    :pswitch_371
    check-cast v0, Lus3;

    check-cast v8, Lwye;

    check-cast v7, Lgb3;

    invoke-static {v0, v8, v7}, Lus3;->T0(Lus3;Lwye;Lgb3;)Lvoh;

    move-result-object v10

    if-eqz v10, :cond_3a2

    iget-object v9, v0, Lus3;->o:Lmq5;

    iget-wide v0, v9, Lmq5;->v:J

    const-wide/16 v2, -0x1

    invoke-static {v0, v1, v2, v3}, Lgcb;->a(JJ)Z

    move-result v0

    if-eqz v0, :cond_38e

    const-string v0, "Expected BringIntoViewRequester to not be used before parents are placed."

    invoke-static {v0}, Ld8b;->c(Ljava/lang/String;)V

    :cond_38e
    invoke-virtual {v9}, Lmq5;->U0()J

    move-result-wide v11

    const-wide/16 v13, 0x0

    invoke-virtual/range {v9 .. v14}, Lmq5;->X0(Lvoh;JJ)J

    move-result-wide v0

    const-wide v2, -0x7fffffff80000000L    # -1.0609978955E-314

    xor-long/2addr v0, v2

    invoke-virtual {v10, v0, v1}, Lvoh;->i(J)Lvoh;

    move-result-object v6

    :cond_3a2
    return-object v6

    :pswitch_3a3
    check-cast v0, Lztl;

    check-cast v8, Lnx5;

    check-cast v7, Lafe;

    invoke-virtual {v0}, Lztl;->b()Z

    move-result v1

    if-eqz v1, :cond_3bc

    new-instance v1, Lbz1;

    invoke-direct {v1, v5, v6, v0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v8, v6, v6, v1, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v7, v0}, Lafe;->setValue(Ljava/lang/Object;)V

    :cond_3bc
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3bf
    check-cast v0, Lfw2;

    check-cast v8, Lwjh;

    check-cast v7, Lnqh;

    invoke-virtual {v0}, Lfw2;->a()V

    iget-object v0, v8, Lwjh;->d:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcf2;

    iget v2, v7, Lnqh;->a:I

    :cond_3cf
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    ushr-int/lit8 v3, v0, 0x1b

    and-int/lit8 v3, v3, 0xf

    if-ne v3, v2, :cond_3dc

    add-int/lit8 v3, v0, -0x1

    goto :goto_3dd

    :cond_3dc
    move v3, v0

    :goto_3dd
    invoke-virtual {v1, v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-eqz v0, :cond_3cf

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3e6
    check-cast v0, Ls62;

    move-object v14, v8

    check-cast v14, La52;

    move-object v15, v7

    check-cast v15, Lkotlin/jvm/functions/Function1;

    new-instance v9, Lp62;

    iget-object v1, v0, Ls62;->w:Lr9i;

    iget-object v1, v1, Lr9i;->e:Ljava/lang/Object;

    move-object v10, v1

    check-cast v10, Lole;

    invoke-virtual {v0}, Ls62;->f()Lqyj;

    move-result-object v11

    iget-object v12, v0, Ls62;->x:Lg22;

    iget-object v13, v0, Ls62;->c:Lg7m;

    invoke-direct/range {v9 .. v15}, Lp62;-><init>(Lole;Lqyj;Lg22;Lg7m;La52;Lkotlin/jvm/functions/Function1;)V

    return-object v9

    :pswitch_403
    check-cast v0, Ldx3;

    check-cast v8, Lumi;

    check-cast v7, Lwth;

    new-instance v1, Lqb7;

    new-instance v2, Lvk6;

    invoke-direct {v2, v0, v8}, Lvk6;-><init>(Landroid/content/Context;Lumi;)V

    invoke-direct {v1, v2, v7}, Lqb7;-><init>(Lvk6;Lwth;)V

    return-object v1

    :pswitch_414
    check-cast v0, La12;

    check-cast v8, Ljava/lang/String;

    check-cast v7, Ljava/lang/String;

    iget-object v0, v0, La12;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v8, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_42f
    check-cast v0, Lhd;

    check-cast v8, Ljava/lang/String;

    check-cast v7, Ljv;

    invoke-virtual {v0, v8, v7}, Lhd;->a(Ljava/lang/String;Ljv;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_43c
    .packed-switch 0x0
        :pswitch_42f
        :pswitch_414
        :pswitch_403
        :pswitch_3e6
        :pswitch_3bf
        :pswitch_3a3
        :pswitch_371
        :pswitch_33e
        :pswitch_332
        :pswitch_327
        :pswitch_2ae
        :pswitch_284
        :pswitch_278
        :pswitch_265
        :pswitch_228
        :pswitch_1eb
        :pswitch_1dd
        :pswitch_1bb
        :pswitch_198
        :pswitch_18c
        :pswitch_180
        :pswitch_167
        :pswitch_153
        :pswitch_140
        :pswitch_12d
        :pswitch_10f
        :pswitch_f4
        :pswitch_c5
        :pswitch_9f
    .end packed-switch
.end method
