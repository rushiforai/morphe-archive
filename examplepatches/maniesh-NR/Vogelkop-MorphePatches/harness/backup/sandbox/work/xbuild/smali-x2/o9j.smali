.class public final Lo9j;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lumi;

.field public final c:La21;

.field public final d:Loji;

.field public final e:Lorm;

.field public final f:Ln9j;

.field public final g:Ljava/util/concurrent/atomic/AtomicReference;

.field public h:Z


# direct methods
.method public constructor <init>(Lumi;La21;Loji;Lorm;)V
    .registers 42

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0}, Ll7n;-><init>()V

    move-object/from16 v2, p1

    iput-object v2, v0, Lo9j;->b:Lumi;

    iput-object v1, v0, Lo9j;->c:La21;

    move-object/from16 v2, p3

    iput-object v2, v0, Lo9j;->d:Loji;

    move-object/from16 v2, p4

    iput-object v2, v0, Lo9j;->e:Lorm;

    new-instance v2, Ln9j;

    invoke-direct {v2, v0}, Ln9j;-><init>(Lo9j;)V

    iput-object v2, v0, Lo9j;->f:Ln9j;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v2, v0, Lo9j;->g:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, La21;->j()V

    iget-object v2, v1, La21;->d:Ljava/lang/Object;

    check-cast v2, [Lw6j;

    new-instance v3, Ljava/util/ArrayList;

    array-length v4, v2

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    array-length v4, v2

    const/4 v5, 0x0

    move v6, v5

    :goto_33
    if-ge v6, v4, :cond_297

    aget-object v7, v2, v6

    iget-object v8, v7, Lw6j;->b:Ljava/lang/Object;

    check-cast v8, Lz7j;

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v9

    iget-object v10, v7, Lw6j;->a:Ljava/lang/Object;

    check-cast v10, Landroid/content/Context;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v9

    if-nez v9, :cond_4c

    const/16 v17, 0x1

    goto :goto_4e

    :cond_4c
    move/from16 v17, v5

    :goto_4e
    new-instance v9, Lxc6;

    invoke-direct {v9, v5}, Lxc6;-><init>(B)V

    new-instance v12, Liy3;

    invoke-virtual {v8}, Lz7j;->c()Lny3;

    move-result-object v13

    iget-object v14, v8, Lz7j;->u:Llw3;

    iget-object v15, v8, Lz7j;->q:Llw3;

    new-instance v11, Lg1c;

    iget-object v5, v14, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->O()Lv3m;

    move-result-object v5

    move-object/from16 p4, v2

    new-instance v2, Lj1c;

    move/from16 v18, v4

    iget-object v4, v15, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    move/from16 v19, v6

    iget-object v6, v8, Lz7j;->j:Lew3;

    invoke-virtual {v6}, Lew3;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/SharedPreferences;

    move-object/from16 v20, v9

    iget-object v9, v8, Lz7j;->y:Lcom/opera/android/Lazy;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljbn;

    invoke-direct {v2, v4, v6, v5, v9}, Lj1c;-><init>(Lcom/opera/android/settings/SettingsManager;Landroid/content/SharedPreferences;Lv3m;Ljbn;)V

    new-instance v4, Luj;

    sget-object v5, Ld9j;->a:[Ld9j;

    const/16 v5, 0x7530

    const/4 v6, 0x3

    invoke-direct {v4, v6, v5}, Luj;-><init>(BI)V

    new-instance v5, Luj;

    const/16 v9, 0x7918

    const/4 v6, 0x7

    invoke-direct {v5, v6, v9}, Luj;-><init>(BI)V

    new-instance v9, Luj;

    move/from16 v22, v6

    const v6, 0xbb80

    const/16 v0, 0x9

    invoke-direct {v9, v0, v6}, Luj;-><init>(BI)V

    invoke-direct {v11, v2, v4, v5, v9}, Lg1c;-><init>(Lj1c;Luj;Luj;Luj;)V

    invoke-direct {v12, v13, v11}, Liy3;-><init>(Lny3;Lg1c;)V

    new-instance v2, Lru1;

    invoke-virtual {v8}, Lz7j;->a()Lyu1;

    move-result-object v4

    new-instance v5, Loxe;

    invoke-direct {v5, v10}, Loxe;-><init>(Landroid/content/Context;)V

    new-instance v6, Lq9;

    const/4 v9, 0x0

    invoke-direct {v6, v9}, Lq9;-><init>(B)V

    new-instance v9, Luj;

    const/16 v11, 0x1388

    const/4 v13, 0x6

    invoke-direct {v9, v13, v11}, Luj;-><init>(BI)V

    invoke-direct {v2, v4, v5, v6, v9}, Lru1;-><init>(Lyu1;Loxe;Lq9;Luj;)V

    new-instance v4, Lx7k;

    invoke-virtual {v8}, Lz7j;->f()Lb8k;

    move-result-object v5

    new-instance v6, Lqte;

    new-instance v9, Lw6j;

    iget-object v11, v15, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v11}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v11

    move/from16 v23, v0

    iget-object v0, v8, Lz7j;->s:Lnw3;

    iget-object v0, v0, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v0

    invoke-direct {v9, v11, v0}, Lw6j;-><init>(Lcom/opera/android/settings/SettingsManager;Lzwk;)V

    iget-object v0, v9, Lw6j;->c:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lekc;

    const/16 v9, 0x1b58

    const/4 v11, 0x2

    invoke-direct {v6, v0, v9, v11}, Lqte;-><init>(Lekc;IB)V

    new-instance v0, Lqte;

    new-instance v9, Lyqa;

    const/16 v13, 0x15

    invoke-direct {v9, v13}, Lyqa;-><init>(B)V

    invoke-virtual {v8, v9}, Lz7j;->d(Lyqa;)Lwte;

    move-result-object v9

    iget-object v9, v9, Lwte;->e:Lv9j;

    const/16 v13, 0x6d60

    const/4 v11, 0x0

    invoke-direct {v0, v9, v13, v11}, Lqte;-><init>(Lekc;IB)V

    invoke-direct {v4, v5, v6, v0}, Lx7k;-><init>(Lb8k;Lqte;Lqte;)V

    move-object v0, v12

    new-instance v12, Licg;

    new-instance v13, Ly5g;

    iget-object v5, v7, Lw6j;->c:Ljava/lang/Object;

    check-cast v5, Lwub;

    new-instance v6, Lqte;

    iget-object v5, v5, Lwub;->a:Ljava/lang/Object;

    check-cast v5, Lks3;

    invoke-virtual {v5}, Lks3;->w()Lk6g;

    move-result-object v5

    iget-object v5, v5, Lk6g;->i:Lv9j;

    const/16 v9, 0x1f40

    const/4 v11, 0x1

    invoke-direct {v6, v5, v9, v11}, Lqte;-><init>(Lekc;IB)V

    invoke-direct {v13, v6}, Ly5g;-><init>(Lqte;)V

    move-object v5, v14

    new-instance v14, Luj;

    const/16 v6, 0x2328

    const/4 v9, 0x4

    invoke-direct {v14, v9, v6}, Luj;-><init>(BI)V

    move-object v6, v15

    new-instance v15, Luj;

    const/16 v11, 0x2710

    const/4 v9, 0x2

    invoke-direct {v15, v9, v11}, Luj;-><init>(BI)V

    new-instance v9, Lqte;

    invoke-virtual {v8}, Lz7j;->g()Lzxk;

    move-result-object v11

    iget-object v11, v11, Lzxk;->f:Lv9j;

    move-object/from16 v26, v0

    const/16 v0, 0x55f0

    move-object/from16 v27, v2

    const/4 v2, 0x3

    invoke-direct {v9, v11, v0, v2}, Lqte;-><init>(Lekc;IB)V

    move-object/from16 v16, v9

    const/4 v2, 0x6

    invoke-direct/range {v12 .. v17}, Licg;-><init>(Ly5g;Luj;Luj;Lqte;Z)V

    new-instance v28, Lbzg;

    new-instance v9, Luj;

    const v11, 0xc738

    const/4 v13, 0x1

    invoke-direct {v9, v13, v11}, Luj;-><init>(BI)V

    new-instance v11, Luj;

    const/16 v13, 0x6590

    const/4 v14, 0x0

    invoke-direct {v11, v14, v13}, Luj;-><init>(BI)V

    new-instance v13, Lxk;

    invoke-direct {v13, v11, v9}, Lxk;-><init>(Luj;Luj;)V

    new-instance v9, Ly5g;

    new-instance v11, Luj;

    const/16 v14, 0x5dc0

    const/16 v15, 0x8

    invoke-direct {v11, v15, v14}, Luj;-><init>(BI)V

    invoke-direct {v9, v11}, Ly5g;-><init>(Luj;)V

    new-instance v11, Lxoj;

    new-instance v14, Ljvg;

    iget-object v5, v5, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->O()Lv3m;

    move-result-object v5

    invoke-direct {v14, v5}, Ljvg;-><init>(Lv3m;)V

    invoke-direct {v11, v14}, Lxoj;-><init>(Ljvg;)V

    new-instance v5, Lq9;

    iget-object v14, v7, Lw6j;->e:Ljava/lang/Object;

    check-cast v14, Llw3;

    invoke-direct {v5, v14}, Lq9;-><init>(Llw3;)V

    new-instance v14, Lq9;

    move/from16 v16, v2

    const/4 v2, 0x1

    invoke-direct {v14, v2}, Lq9;-><init>(B)V

    new-instance v2, Luj;

    move/from16 v17, v15

    const/16 v15, 0x3a98

    const/4 v0, 0x5

    invoke-direct {v2, v0, v15}, Luj;-><init>(BI)V

    iget-object v7, v7, Lw6j;->d:Ljava/lang/Object;

    check-cast v7, Lrii;

    new-instance v15, Lxoj;

    iget-object v7, v7, Lrii;->b:Ljava/lang/Object;

    check-cast v7, Ltah;

    invoke-virtual {v7}, Ltah;->R()Lggn;

    move-result-object v7

    invoke-direct {v15, v7}, Lxoj;-><init>(Lggn;)V

    sget-object v7, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v10}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    check-cast v7, Lcom/opera/android/OperaApplication;

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v7

    invoke-virtual {v7}, Lydn;->p()Lwdn;

    move-result-object v7

    iget-boolean v7, v7, Lwdn;->a:Z

    move-object/from16 v34, v2

    move-object/from16 v32, v5

    move/from16 v36, v7

    move-object/from16 v30, v9

    move-object/from16 v31, v11

    move-object/from16 v29, v13

    move-object/from16 v33, v14

    move-object/from16 v35, v15

    invoke-direct/range {v28 .. v36}, Lbzg;-><init>(Lxk;Ly5g;Lxoj;Lq9;Lq9;Luj;Lxoj;Z)V

    new-instance v2, Lmc2;

    invoke-virtual {v8}, Lz7j;->e()Lpsi;

    move-result-object v5

    invoke-direct {v2, v5}, Lmc2;-><init>(Lpsi;)V

    new-instance v5, Lmc2;

    new-instance v7, Ligi;

    iget-object v6, v6, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v6

    iget-object v9, v8, Lz7j;->d:Lj4c;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lyk6;

    invoke-direct {v7, v6, v9}, Ligi;-><init>(Lcom/opera/android/settings/SettingsManager;Lyk6;)V

    invoke-direct {v5, v7}, Lmc2;-><init>(Ligi;)V

    new-instance v6, Lmc2;

    invoke-virtual {v8}, Lz7j;->b()Lami;

    move-result-object v7

    invoke-direct {v6, v7}, Lmc2;-><init>(Lami;)V

    new-instance v7, Lxc6;

    const/4 v8, 0x3

    invoke-direct {v7, v8}, Lxc6;-><init>(B)V

    new-instance v8, Ldrd;

    invoke-static {}, Lipe;->G()Z

    move-result v9

    invoke-direct {v8, v9}, Ldrd;-><init>(Z)V

    new-instance v9, Lxc6;

    const/4 v11, 0x4

    invoke-direct {v9, v11}, Lxc6;-><init>(B)V

    new-instance v11, Lxc6;

    const/4 v13, 0x1

    invoke-direct {v11, v13}, Lxc6;-><init>(B)V

    new-instance v14, Lxc6;

    const/4 v15, 0x2

    invoke-direct {v14, v15}, Lxc6;-><init>(B)V

    move/from16 p1, v0

    new-instance v0, La3;

    invoke-direct {v0, v10}, La3;-><init>(Landroid/content/Context;)V

    const/16 v10, 0xf

    new-array v10, v10, [Lf1g;

    const/16 v24, 0x0

    aput-object v20, v10, v24

    aput-object v26, v10, v13

    aput-object v27, v10, v15

    const/16 v21, 0x3

    aput-object v4, v10, v21

    const/16 v25, 0x4

    aput-object v12, v10, v25

    aput-object v28, v10, p1

    aput-object v2, v10, v16

    aput-object v5, v10, v22

    aput-object v6, v10, v17

    aput-object v7, v10, v23

    const/16 v2, 0xa

    aput-object v8, v10, v2

    const/16 v4, 0xb

    aput-object v9, v10, v4

    const/16 v4, 0xc

    aput-object v11, v10, v4

    const/16 v4, 0xd

    aput-object v14, v10, v4

    const/16 v4, 0xe

    aput-object v0, v10, v4

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v4, Ljava/util/ArrayList;

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_273
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_287

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lf1g;

    invoke-static {v2}, La21;->g(Lv6j;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_273

    :cond_287
    invoke-static {v4}, Lk95;->p(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v19, 0x1

    const/4 v5, 0x0

    move-object/from16 v2, p4

    move/from16 v4, v18

    goto/16 :goto_33

    :cond_297
    invoke-static {v3}, Lk95;->p(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v9, 0x0

    :goto_2a0
    if-ge v9, v2, :cond_2bf

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v9, v9, 0x1

    check-cast v3, Lv6j;

    iget-object v4, v3, Lv6j;->b:Lhx5;

    iget-object v5, v1, La21;->j:Ljava/lang/Object;

    check-cast v5, Lg9j;

    invoke-virtual {v4, v5}, Lekc;->k(Lf7f;)V

    invoke-virtual {v3}, Lv6j;->c()Lhx5;

    move-result-object v3

    iget-object v4, v1, La21;->k:Ljava/lang/Object;

    check-cast v4, Lg9j;

    invoke-virtual {v3, v4}, Lekc;->k(Lf7f;)V

    goto :goto_2a0

    :cond_2bf
    iput-object v0, v1, La21;->l:Ljava/lang/Object;

    new-instance v0, Lk9j;

    const/4 v11, 0x0

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11}, Lk9j;-><init>(Lo9j;B)V

    invoke-virtual {v1, v0}, Lo9j;->f(Ln5o;)V

    return-void
.end method

.method public static synthetic h(Lo9j;Ljava/lang/String;I)V
    .registers 4

    const/4 v0, 0x1

    and-int/2addr p2, v0

    if-eqz p2, :cond_5

    const/4 p1, 0x0

    :cond_5
    invoke-virtual {p0, p1, v0}, Lo9j;->g(Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 1

    iget-object p0, p0, Lo9j;->c:La21;

    invoke-virtual {p0}, La21;->j()V

    return-void
.end method

.method public final f(Ln5o;)V
    .registers 2

    iget-object p0, p0, Lo9j;->b:Lumi;

    invoke-virtual {p0, p1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance p1, Loml;

    invoke-direct {p1, p0}, Loml;-><init>(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0, p0}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-void
.end method

.method public final g(Ljava/lang/String;Z)V
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_17

    iget-object p2, p0, Lo9j;->g:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p2, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Loml;

    if-eqz p2, :cond_17

    invoke-virtual {p2}, Loml;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_17

    invoke-virtual {p2, v0}, Loml;->cancel(Z)Z

    :cond_17
    iget-object p2, p0, Lo9j;->c:La21;

    if-eqz p1, :cond_28

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_28

    invoke-static {p2, v1, p1, v0}, La21;->s(La21;Ljava/util/List;Ljava/lang/String;I)V

    goto :goto_3a

    :cond_28
    iput-object v1, p2, La21;->m:Ljava/lang/Object;

    iget-object v0, p2, La21;->e:Ljava/lang/Object;

    check-cast v0, Lshf;

    invoke-virtual {v0, v1}, Lshf;->S(Ljava/lang/Object;)V

    iget-object p2, p2, La21;->h:Ljava/lang/Object;

    check-cast p2, Lh42;

    sget-object v0, Ll08;->a:Ll08;

    invoke-virtual {p2, v0}, Lekc;->n(Ljava/lang/Object;)V

    :goto_3a
    new-instance p2, Ll9j;

    invoke-direct {p2, p1, p0}, Ll9j;-><init>(Ljava/lang/String;Lo9j;)V

    iget-object p0, p0, Lo9j;->b:Lumi;

    invoke-virtual {p0, p2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    new-instance p1, Loml;

    invoke-direct {p1, p0}, Loml;-><init>(Lnml;)V

    invoke-virtual {p1, v1, v1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-void
.end method
