.class public final Lguo;
.super Lgcp;
.source "SourceFile"


# instance fields
.field public final k:Leq;

.field public l:Llzo;

.field public m:Lne5;

.field public n:Ld3k;

.field public o:Z

.field public p:Z

.field public q:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Leq;)V
    .registers 9

    sget-object v0, Lwjo;->b:Lwjo;

    new-instance v1, Lpro;

    sget-object v2, Lsm;->d:Lsm;

    invoke-direct {v1, p2, v2, p3, v0}, Lpro;-><init>(Ljava/lang/String;Lsm;Leq;Lwjo;)V

    new-instance p2, Lvdp;

    invoke-direct {p2, v1}, Lvdp;-><init>(Lpro;)V

    new-instance v0, Lq5p;

    sget-object v2, Lwjh;->i:Lcpj;

    invoke-virtual {v2, p1}, Lcpj;->b(Landroid/content/Context;)Lwjh;

    move-result-object v2

    new-instance v3, Lwtm;

    sget-object v4, Lujp;->u:Lujp;

    invoke-direct {v3, p1, v4, p2}, Lwtm;-><init>(Landroid/content/Context;Lqro;Lvdp;)V

    invoke-direct {v0, v1, p2, v2, v3}, Lr22;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, p1, v0}, Lpxo;-><init>(Landroid/content/Context;Lr22;)V

    iput-object p3, p0, Lguo;->k:Leq;

    return-void
.end method

.method public static final synthetic g(Lguo;)V
    .registers 1

    invoke-super {p0}, Lpxo;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lpxo;->e:Lbap;

    new-instance v1, Lcno;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Lcno;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lbap;->c(Lkotlin/jvm/functions/Function1;)Lbap;

    move-result-object v0

    iput-object v0, p0, Lpxo;->e:Lbap;

    return-void
.end method

.method public final f(Lz13;Lguo;Ly13;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V
    .registers 31

    move-object/from16 v2, p0

    move-object/from16 v7, p1

    iput-object v7, v2, Lpxo;->f:Landroid/view/ViewGroup;

    iget-object v0, v2, Lpxo;->d:Lvoo;

    move-object v8, v0

    check-cast v8, Lylp;

    if-eqz v8, :cond_13b

    iget-object v0, v2, Lguo;->l:Llzo;

    if-nez v0, :cond_13b

    sget-object v0, Lfap;->a:Lzyk;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lfap;->d(Landroid/content/Context;)Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v11

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v12

    sget-object v0, Ld1p;->a:Lt5p;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Ld1p;->d(Landroid/content/Context;)Lt5p;

    move-result-object v0

    invoke-virtual {v8}, Lylp;->e()Lyjo;

    move-result-object v1

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    iget-object v3, v8, Lvoo;->b:Lpro;

    iget-object v10, v3, Lpro;->c:Leq;

    invoke-virtual {v0}, Lt5p;->a()Ljava/lang/String;

    move-result-object v14

    iget-boolean v15, v0, Lt5p;->c:Z

    const/4 v13, 0x0

    invoke-virtual/range {v8 .. v15}, Lylp;->f(Landroid/content/Context;Leq;IILjava/lang/Integer;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v1, :cond_4e

    if-eqz v0, :cond_4e

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4f

    :cond_4e
    const/4 v3, 0x0

    :goto_4f
    if-eqz v3, :cond_13b

    iget-object v0, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Lyjo;

    iget-object v0, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Ljava/lang/String;

    iget-object v0, v8, Lvoo;->m:Ljava/lang/Integer;

    iget-object v1, v2, Lguo;->k:Leq;

    iget-short v3, v1, Leq;->a:S

    if-eqz v0, :cond_75

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v3, :cond_75

    iget-object v0, v8, Lvoo;->n:Ljava/lang/Integer;

    iget-short v3, v1, Leq;->b:S

    if-eqz v0, :cond_75

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v3, :cond_78

    :cond_75
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_78
    new-instance v1, Llqh;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v3, Llqh;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lvvm;

    const/4 v6, 0x1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-direct/range {v0 .. v6}, Lvvm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lz23;

    const/4 v4, 0x5

    invoke-direct {v3, v2, v1, v0, v4}, Lz23;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lqqo;

    const/16 v4, 0xa

    invoke-direct {v1, v2, v4}, Lqqo;-><init>(Ljava/lang/Object;B)V

    iget-object v5, v2, Lguo;->k:Leq;

    iget-object v6, v2, Lpxo;->a:Landroid/content/Context;

    iget-short v12, v5, Leq;->a:S

    int-to-float v12, v12

    invoke-static {v6, v12}, Lnxg;->d(Landroid/content/Context;F)I

    move-result v18

    iget-object v6, v2, Lpxo;->a:Landroid/content/Context;

    iget-short v5, v5, Leq;->b:S

    int-to-float v5, v5

    invoke-static {v6, v5}, Lnxg;->d(Landroid/content/Context;F)I

    move-result v19

    :try_start_ad
    new-instance v5, Lof3;

    const/16 v6, 0x13

    move-object/from16 v12, p5

    invoke-direct {v5, v12, v2, v6}, Lof3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v6, Lagm;

    invoke-direct {v6, v2, v8, v5, v4}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lh5k;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v3, v4, Lh5k;->b:Ljava/lang/Object;

    iput-object v8, v4, Lh5k;->c:Ljava/lang/Object;

    iput-object v2, v4, Lh5k;->d:Ljava/lang/Object;

    new-instance v12, La3p;

    iget-object v13, v2, Lpxo;->a:Landroid/content/Context;

    iget-object v5, v8, Lvoo;->x:Ljava/io/File;

    if-eqz v5, :cond_d0

    move-object v14, v5

    goto :goto_d1

    :cond_d0
    const/4 v14, 0x0

    :goto_d1
    sget-object v15, Lsm;->d:Lsm;

    iget-object v5, v2, Lpxo;->i:Lp7p;

    iget-boolean v9, v8, Lylp;->A:Z

    const/16 v23, 0x0

    const/16 v24, 0x400

    move-object/from16 v22, v1

    move-object/from16 v17, v4

    move-object/from16 v20, v5

    move-object/from16 v16, v6

    move/from16 v21, v9

    invoke-direct/range {v12 .. v24}, La3p;-><init>(Landroid/content/Context;Ljava/io/File;Lsm;Lbpo;Lm1p;IILp7p;ZLkotlin/jvm/functions/Function0;Lbxk;I)V
    :try_end_e8
    .catch Ljava/lang/RuntimeException; {:try_start_ad .. :try_end_e8} :catch_129

    move/from16 v1, v18

    move/from16 v4, v19

    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v5, v1, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    const/4 v1, 0x0

    invoke-virtual {v7, v12, v1, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    sget-object v1, Lw2p;->a:La64;

    new-instance v4, Lsqo;

    const/16 v5, 0xb

    const/4 v6, 0x0

    invoke-direct {v4, v5, v6, v3}, Lsqo;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v3, 0x3

    invoke-static {v1, v6, v6, v4, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v1

    iput-object v1, v2, Lguo;->n:Ld3k;

    new-instance v1, Llzo;

    iget-object v3, v8, Lvoo;->j:Ljava/lang/String;

    invoke-direct {v1, v12, v10, v3, v11}, Llzo;-><init>(La3p;Lyjo;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, v2, Lguo;->l:Llzo;

    invoke-virtual {v1}, Llzo;->c()V

    new-instance v3, Lne5;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lne5;-><init>(Landroid/content/Context;)V

    new-instance v4, Ldto;

    invoke-direct {v4, v1, v2, v0}, Ldto;-><init>(Llzo;Lguo;Lvvm;)V

    invoke-virtual {v3, v12, v4}, Lne5;->m(Landroid/view/View;Lhko;)V

    iput-object v3, v2, Lguo;->m:Lne5;

    invoke-virtual {v2}, Lpxo;->e()V

    return-void

    :catch_129
    iget-object v0, v2, Lpxo;->i:Lp7p;

    const/16 v1, 0x3ef

    if-eqz v0, :cond_132

    invoke-virtual {v0, v1}, Lp7p;->a(I)V

    :cond_132
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object/from16 v1, p4

    invoke-interface {v1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_13b
    return-void
.end method

.method public final h()V
    .registers 3

    iget-boolean v0, p0, Lguo;->o:Z

    if-nez v0, :cond_2c

    iget-boolean v0, p0, Lguo;->p:Z

    if-eqz v0, :cond_2c

    iget-boolean v0, p0, Lguo;->q:Z

    if-eqz v0, :cond_2c

    const/4 v0, 0x1

    iput-boolean v0, p0, Lguo;->o:Z

    iget-object v0, p0, Lpxo;->e:Lbap;

    invoke-virtual {v0}, Lbap;->f()V

    iget-object v0, p0, Lpxo;->i:Lp7p;

    if-eqz v0, :cond_1e

    sget-object v1, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, v1}, Lp7p;->b(Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;)V

    :cond_1e
    iget-object v0, p0, Lpxo;->g:Lsxo;

    if-eqz v0, :cond_25

    invoke-virtual {v0}, Lsxo;->c()V

    :cond_25
    iget-object p0, p0, Lpxo;->c:Luuj;

    if-eqz p0, :cond_2c

    invoke-virtual {p0}, Luuj;->c()V

    :cond_2c
    return-void
.end method
