.class public final synthetic Lj04;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lj04;->a:B

    iput-object p1, p0, Lj04;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 8
    iput-byte p3, p0, Lj04;->a:B

    iput-object p1, p0, Lj04;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 41

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    iget-byte v2, v0, Lj04;->a:B

    sget-object v3, Lm3c;->S:Lfza;

    const/16 v4, 0x13

    const/high16 v5, 0x41800000    # 16.0f

    sget-object v6, Lz7e;->b:Lz7e;

    const/4 v7, 0x6

    const/16 v8, 0xf

    sget-object v9, Lhh5;->a:Lzpa;

    const/4 v10, 0x2

    const/4 v11, 0x0

    const/16 v12, 0x10

    const/4 v13, 0x1

    const/4 v14, 0x0

    iget-object v0, v0, Lj04;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_7b0

    check-cast v0, Ldil;

    move-object/from16 v2, p1

    check-cast v2, Lc8e;

    move-object/from16 v3, p2

    check-cast v3, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v3, Lvt9;

    const v1, 0x760d4197

    invoke-virtual {v3, v1}, Lvt9;->W(I)V

    sget-object v1, Lmi5;->h:Lhp7;

    invoke-virtual {v3, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln27;

    invoke-virtual {v3}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v9, :cond_51

    new-instance v4, Lgcb;

    const-wide/16 v5, 0x0

    invoke-direct {v4, v5, v6}, Lgcb;-><init>(J)V

    invoke-static {v4}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v4

    invoke-virtual {v3, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_51
    check-cast v4, Lafe;

    invoke-virtual {v3, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v3}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v6

    if-nez v5, :cond_5f

    if-ne v6, v9, :cond_67

    :cond_5f
    new-instance v6, Leek;

    invoke-direct {v6, v0, v4, v8}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v6}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_67
    check-cast v6, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v3, v1}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v3}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v0, :cond_75

    if-ne v5, v9, :cond_7d

    :cond_75
    new-instance v5, Lhil;

    invoke-direct {v5, v1, v4, v14}, Lhil;-><init>(Ln27;Lafe;B)V

    invoke-virtual {v3, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_7d
    check-cast v5, Lkotlin/jvm/functions/Function1;

    new-instance v0, Lb57;

    invoke-direct {v0, v12, v6, v5}, Lb57;-><init>(BLjava/lang/Object;Lkotlin/jvm/functions/Function1;)V

    invoke-static {v2, v0}, Lqyn;->q(Lc8e;Lcr9;)Lc8e;

    move-result-object v0

    invoke-virtual {v3, v14}, Lvt9;->p(Z)V

    return-object v0

    :pswitch_8c
    check-cast v0, Lshk;

    move-object/from16 v2, p1

    check-cast v2, Lp9i;

    move-object/from16 v2, p2

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x11

    if-eq v3, v12, :cond_a1

    move v14, v13

    :cond_a1
    and-int/2addr v1, v13

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_d5

    invoke-static {v0, v2}, Luyg;->q(Lshk;Lih5;)Ljava/lang/String;

    move-result-object v15

    const/16 v35, 0x0

    const v36, 0x3fffe

    const/16 v16, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v34, 0x0

    move-object/from16 v33, v2

    invoke-static/range {v15 .. v36}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_da

    :cond_d5
    move-object/from16 v33, v2

    invoke-virtual/range {v33 .. v33}, Lvt9;->Q()V

    :goto_da
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_dd
    check-cast v0, Lcd1;

    move-object/from16 v2, p1

    check-cast v2, Lvfd;

    move-object/from16 v3, p2

    check-cast v3, Lpfd;

    check-cast v1, Lyo5;

    iget-wide v4, v1, Lyo5;->a:J

    invoke-interface {v3, v4, v5}, Lpfd;->N(J)Lifg;

    move-result-object v1

    iget v3, v1, Lifg;->a:I

    iget v4, v1, Lifg;->b:I

    new-instance v5, Ld7k;

    invoke-direct {v5, v1, v0, v10}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v0, Ln08;->a:Ln08;

    invoke-interface {v2, v3, v4, v0, v5}, Lvfd;->b0(IILjava/util/Map;Lkotlin/jvm/functions/Function1;)Lufd;

    move-result-object v0

    return-object v0

    :pswitch_ff
    check-cast v0, Ls1k;

    move-object/from16 v2, p1

    check-cast v2, Leb5;

    move-object/from16 v2, p2

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v8, v1, 0x11

    if-eq v8, v12, :cond_115

    move v8, v13

    goto :goto_116

    :cond_115
    move v8, v14

    :goto_116
    and-int/2addr v1, v13

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v8}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_1ed

    invoke-static {v6, v5}, La26;->X(Lc8e;F)Lc8e;

    move-result-object v1

    new-instance v5, Lx62;

    new-instance v6, Lt40;

    invoke-direct {v6, v4}, Lt40;-><init>(B)V

    const/high16 v4, 0x41000000    # 8.0f

    invoke-direct {v5, v4, v13, v6}, Lx62;-><init>(FZLy62;)V

    sget-object v4, Lrbe;->n:Lrd3;

    invoke-static {v5, v4, v2, v7}, Lcb5;->a(Lz62;Lrd3;Lih5;I)Ldb5;

    move-result-object v4

    iget-wide v5, v2, Lvt9;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v2}, Lvt9;->l()Loag;

    move-result-object v6

    invoke-static {v2, v1}, Lqyn;->P(Lih5;Lc8e;)Lc8e;

    move-result-object v1

    sget-object v7, Lbh5;->To:Lujp;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Lvt9;->a0()V

    iget-boolean v7, v2, Lvt9;->S:Z

    if-eqz v7, :cond_153

    invoke-virtual {v2, v3}, Lvt9;->k(Lkotlin/jvm/functions/Function0;)V

    goto :goto_156

    :cond_153
    invoke-virtual {v2}, Lvt9;->j0()V

    :goto_156
    sget-object v3, Lujp;->f:Lah5;

    invoke-static {v2, v4, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    sget-object v3, Lujp;->e:Lah5;

    invoke-static {v2, v6, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, Lujp;->g:Lah5;

    invoke-static {v2, v3, v4}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v2}, Ly4h;->m(Lih5;)V

    sget-object v3, Lujp;->d:Lah5;

    invoke-static {v2, v1, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    sget-object v1, Lua5;->a:Lhp7;

    invoke-virtual {v2, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsa5;

    iget-wide v3, v1, Lsa5;->h:J

    sget-object v1, Lccj;->a:Lhp7;

    invoke-virtual {v2, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lacj;

    iget-object v1, v1, Lacj;->b:Lu8i;

    new-instance v5, Li1k;

    invoke-direct {v5, v0}, Li1k;-><init>(Ls1k;)V

    const v6, 0x193d3e05

    invoke-static {v6, v5, v2}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v23

    const/high16 v25, 0xc00000

    const/16 v26, 0x79

    const/4 v15, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v16, v1

    move-object/from16 v24, v2

    move-wide/from16 v17, v3

    invoke-static/range {v15 .. v26}, Lutk;->a(Lc8e;Lpaj;JJFFLkotlin/jvm/functions/Function2;Lih5;II)V

    iget-object v15, v0, Ls1k;->b:Ljava/lang/String;

    sget-object v1, Labm;->a:Lhp7;

    invoke-virtual {v2, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwam;

    iget-object v3, v3, Lwam;->h:Likl;

    const/16 v35, 0x0

    const v36, 0x1fffe

    const/16 v16, 0x0

    const-wide/16 v17, 0x0

    const/16 v21, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v34, 0x0

    move-object/from16 v33, v2

    move-object/from16 v32, v3

    invoke-static/range {v15 .. v36}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    iget-object v15, v0, Ls1k;->c:Ljava/lang/String;

    invoke-virtual {v2, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwam;

    iget-object v1, v1, Lwam;->k:Likl;

    move-object/from16 v32, v1

    invoke-static/range {v15 .. v36}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    iget-object v0, v0, Ls1k;->d:Ljava/lang/String;

    invoke-static {v0, v2, v14}, Lr9h;->h(Ljava/lang/String;Lih5;I)V

    invoke-virtual {v2, v13}, Lvt9;->p(Z)V

    goto :goto_1f0

    :cond_1ed
    invoke-virtual {v2}, Lvt9;->Q()V

    :goto_1f0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1f3
    check-cast v0, Lu0j;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Throwable;

    move-object/from16 v2, p2

    check-cast v2, Lkotlin/Unit;

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    invoke-virtual {v0}, Lu0j;->e()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_205
    check-cast v0, Lami;

    move-object/from16 v2, p1

    check-cast v2, Lgfh;

    move-object/from16 v3, p2

    check-cast v3, Ljfh;

    check-cast v1, Lt0a;

    invoke-virtual {v0, v2, v3}, Lami;->e(Lgfh;Ljfh;)Lyli;

    move-result-object v0

    return-object v0

    :pswitch_216
    check-cast v0, Ljbc;

    move-object/from16 v2, p1

    check-cast v2, Ly4c;

    move-object/from16 v2, p2

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v4, v1, 0x11

    if-eq v4, v12, :cond_22c

    move v4, v13

    goto :goto_22d

    :cond_22c
    move v4, v14

    :goto_22d
    and-int/2addr v1, v13

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v4}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_284

    const/4 v1, 0x0

    invoke-static {v6, v5, v1, v10}, La26;->Z(Lc8e;FFI)Lc8e;

    move-result-object v1

    sget-object v4, Lrbe;->b:Ltd3;

    invoke-static {v4, v14}, Lnr3;->c(Ltd3;Z)Ltfd;

    move-result-object v4

    iget-wide v5, v2, Lvt9;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    invoke-virtual {v2}, Lvt9;->l()Loag;

    move-result-object v6

    invoke-static {v2, v1}, Lqyn;->P(Lih5;Lc8e;)Lc8e;

    move-result-object v1

    sget-object v7, Lbh5;->To:Lujp;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Lvt9;->a0()V

    iget-boolean v7, v2, Lvt9;->S:Z

    if-eqz v7, :cond_25f

    invoke-virtual {v2, v3}, Lvt9;->k(Lkotlin/jvm/functions/Function0;)V

    goto :goto_262

    :cond_25f
    invoke-virtual {v2}, Lvt9;->j0()V

    :goto_262
    sget-object v3, Lujp;->f:Lah5;

    invoke-static {v2, v4, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    sget-object v3, Lujp;->e:Lah5;

    invoke-static {v2, v6, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, Lujp;->g:Lah5;

    invoke-static {v2, v3, v4}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v2}, Ly4h;->m(Lih5;)V

    sget-object v3, Lujp;->d:Lah5;

    invoke-static {v2, v1, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v0, v11, v2, v14}, Lalo;->c(Ljbc;Lc8e;Lih5;I)V

    invoke-virtual {v2, v13}, Lvt9;->p(Z)V

    goto :goto_287

    :cond_284
    invoke-virtual {v2}, Lvt9;->Q()V

    :goto_287
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_28a
    check-cast v0, Ln01;

    move-object/from16 v2, p1

    check-cast v2, Lp9i;

    move-object/from16 v2, p2

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x11

    if-eq v3, v12, :cond_2a0

    move v3, v13

    goto :goto_2a1

    :cond_2a0
    move v3, v14

    :goto_2a1
    and-int/2addr v1, v13

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v3}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_308

    invoke-virtual {v0}, Ln01;->a()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_2cb

    const v1, 0x6132d082

    invoke-virtual {v2, v1}, Lvt9;->W(I)V

    sget-object v1, Ldhk;->e:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lshk;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v0, v2}, Luyg;->r(Lshk;[Ljava/lang/Object;Lih5;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v14}, Lvt9;->p(Z)V

    :goto_2c9
    move-object v15, v0

    goto :goto_2e1

    :cond_2cb
    const v0, 0x61344cdd

    invoke-virtual {v2, v0}, Lvt9;->W(I)V

    sget-object v0, Lahk;->I:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lshk;

    invoke-static {v0, v2}, Luyg;->q(Lshk;Lih5;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v14}, Lvt9;->p(Z)V

    goto :goto_2c9

    :goto_2e1
    const/16 v35, 0x0

    const v36, 0x3fffe

    const/16 v16, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v34, 0x0

    move-object/from16 v33, v2

    invoke-static/range {v15 .. v36}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_30d

    :cond_308
    move-object/from16 v33, v2

    invoke-virtual/range {v33 .. v33}, Lvt9;->Q()V

    :goto_30d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_310
    check-cast v0, Lbsj;

    move-object/from16 v2, p1

    check-cast v2, Lp9i;

    move-object/from16 v2, p2

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x11

    if-eq v3, v12, :cond_325

    move v14, v13

    :cond_325
    and-int/2addr v1, v13

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_367

    iget-object v0, v0, Lbsj;->a:Lrxh;

    sget-object v1, Lj41;->c:Lyi5;

    invoke-virtual {v2, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/res/Resources;

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v35, 0x0

    const v36, 0x3fffe

    const/16 v16, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v34, 0x0

    move-object/from16 v33, v2

    invoke-static/range {v15 .. v36}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_36c

    :cond_367
    move-object/from16 v33, v2

    invoke-virtual/range {v33 .. v33}, Lvt9;->Q()V

    :goto_36c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_36f
    check-cast v0, Lpfe;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Throwable;

    move-object/from16 v2, p2

    check-cast v2, Lkotlin/Unit;

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    sget-object v1, Lpfe;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1, v0, v11}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v11}, Lpfe;->l(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_386
    check-cast v0, Lcv8;

    move-object/from16 v2, p1

    check-cast v2, Lkl5;

    move-object/from16 v2, p2

    check-cast v2, Landroid/util/Size;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v0, v0, Lcv8;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    shl-int/lit8 v3, v1, 0x1

    sub-int/2addr v2, v3

    const v3, 0x7f070968

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    if-gt v2, v3, :cond_3ad

    move v10, v13

    :cond_3ad
    const v3, 0x7f070969

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    new-instance v3, Ll5k;

    add-int/lit8 v4, v10, -0x1

    mul-int/2addr v4, v0

    sub-int/2addr v2, v4

    div-int/2addr v2, v10

    invoke-direct {v3, v1, v2}, Ll5k;-><init>(II)V

    return-object v3

    :pswitch_3bf
    check-cast v0, Lcom/opera/android/esim/ui/EsimActivity;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/String;

    move-object/from16 v3, p2

    check-cast v3, Le78;

    move-object v4, v1

    check-cast v4, Lg78;

    sget v1, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    invoke-virtual {v0}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object v0

    new-instance v5, Lqxh;

    invoke-direct {v5, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Lu78;->i:Lnak;

    :cond_3d9
    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lh78;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lh78;

    invoke-direct {v1, v5, v3, v4}, Lh78;-><init>(Lpxh;Le78;Lg78;)V

    invoke-virtual {v2, v0, v1}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3d9

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3f1
    check-cast v0, Ligi;

    iget-object v2, v0, Ligi;->f:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    move-object/from16 v3, p1

    check-cast v3, Leri;

    move-object/from16 v4, p2

    check-cast v4, Luv7;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    sget-object v5, Ligi;->i:Lixh;

    if-eqz v1, :cond_53e

    iget-object v1, v4, Luv7;->c:Lvv7;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_433

    if-eq v1, v13, :cond_420

    if-eq v1, v10, :cond_420

    const/4 v0, 0x3

    if-eq v1, v0, :cond_420

    const/4 v0, 0x4

    if-eq v1, v0, :cond_53e

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_540

    :cond_420
    new-instance v11, Lvu7;

    invoke-virtual {v5, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v0

    invoke-static {v3, v2, v0}, Leti;->c(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v0

    invoke-interface {v3}, Leri;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v11, v0, v1}, Lxu7;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    goto/16 :goto_540

    :cond_433
    iget-object v1, v0, Ligi;->d:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luv7;

    iget-object v3, v1, Luv7;->d:Lyl2;

    const v4, 0x7f06063b

    const v6, 0x7f0402c8

    const v9, 0x7f141471

    if-eqz v3, :cond_4ab

    sget-object v10, Lhk6;->i:Lh58;

    invoke-virtual {v10}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_450
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_46a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v13, v12

    check-cast v13, Lhk6;

    iget-object v13, v13, Lhk6;->d:Ljava/lang/String;

    invoke-interface {v3}, Lyl2;->h()Ljava/lang/String;

    move-result-object v15

    invoke-static {v13, v15}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_450

    goto :goto_46b

    :cond_46a
    move-object v12, v11

    :goto_46b
    check-cast v12, Lhk6;

    if-eqz v12, :cond_47f

    iget v10, v12, Lhk6;->b:I

    invoke-static {v10, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v10, :cond_47f

    invoke-static {v6, v2, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v12

    invoke-static {v10, v12}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    goto :goto_480

    :cond_47f
    move-object v10, v11

    :goto_480
    if-eqz v10, :cond_490

    new-instance v11, Lwu7;

    const v0, 0x7f14087c

    invoke-virtual {v2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v10, v0}, Lxu7;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    goto/16 :goto_540

    :cond_490
    new-instance v10, Letc;

    invoke-direct {v10}, Letc;-><init>()V

    new-instance v12, Li16;

    invoke-direct {v12, v10, v0, v8}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v3, v12}, Lyl2;->e(Lxl2;)Z

    move-result v3

    if-eqz v3, :cond_4ab

    new-instance v11, Lwu7;

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v10, v0}, Lxu7;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    goto/16 :goto_540

    :cond_4ab
    iget-object v3, v1, Luv7;->e:Lpvb;

    if-eqz v3, :cond_505

    invoke-interface {v3}, Lpvb;->m()Li1;

    move-result-object v3

    if-eqz v3, :cond_505

    iget-object v8, v3, Li1;->e:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_4e8

    iget-object v10, v3, Li1;->d:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    if-eqz v10, :cond_4e8

    new-instance v11, Lwu7;

    new-instance v1, Landroid/graphics/drawable/LayerDrawable;

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v14}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    filled-new-array {v3}, [Landroid/graphics/drawable/ColorDrawable;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v5, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v1, v14, v3, v3}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    new-instance v4, Lhu5;

    invoke-direct {v4, v1, v0, v7}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v3, v8, v10, v4}, Lqbe;->v(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lcom/opera/api/Callback;)V

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v1, v0}, Lxu7;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    goto :goto_540

    :cond_4e8
    iget v0, v3, Li1;->c:I

    if-eqz v0, :cond_505

    new-instance v1, Lwu7;

    invoke-static {v0, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_4fc

    invoke-static {v6, v2, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    invoke-static {v0, v3}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    move-object v11, v0

    :cond_4fc
    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v11, v0}, Lxu7;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    move-object v11, v1

    goto :goto_540

    :cond_505
    iget-object v0, v1, Luv7;->b:Llbf;

    sget-object v3, Llbf;->d:Llbf;

    if-ne v0, v3, :cond_522

    iget-object v0, v1, Luv7;->c:Lvv7;

    sget-object v1, Lvv7;->a:Lvv7;

    if-ne v0, v1, :cond_522

    new-instance v11, Lwu7;

    const v0, 0x7f080754

    invoke-static {v0, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v11, v0, v1}, Lxu7;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    goto :goto_540

    :cond_522
    new-instance v0, Lwu7;

    const v1, 0x7f0805c5

    invoke-static {v1, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_535

    invoke-static {v6, v2, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    invoke-static {v1, v3}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    move-object v11, v1

    :cond_535
    invoke-virtual {v2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v11, v1}, Lxu7;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    move-object v11, v0

    goto :goto_540

    :cond_53e
    sget-object v11, Luu7;->c:Luu7;

    :goto_540
    return-object v11

    :pswitch_541
    check-cast v0, Lz0d;

    move-object/from16 v2, p1

    check-cast v2, Llmg;

    move-object/from16 v2, p2

    check-cast v2, Llmg;

    check-cast v1, Ly8f;

    iget-wide v1, v2, Llmg;->c:J

    iget-object v0, v0, Lz0d;->b:Lmgl;

    sget-object v3, Lujp;->o:Lhai;

    invoke-interface {v0, v1, v2, v3}, Lmgl;->b(JLhai;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_559
    check-cast v0, Lkotlin/jvm/functions/Function1;

    move-object/from16 v2, p1

    check-cast v2, Lwd9;

    move-object/from16 v2, p2

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x11

    if-eq v3, v12, :cond_56e

    move v14, v13

    :cond_56e
    and-int/2addr v1, v13

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_63c

    invoke-virtual {v2, v0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    if-nez v1, :cond_583

    if-ne v3, v9, :cond_58b

    :cond_583
    new-instance v3, Ly47;

    invoke-direct {v3, v0, v12}, Ly47;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_58b
    move-object v15, v3

    check-cast v15, Lkotlin/jvm/functions/Function0;

    sget-object v23, Lyi4;->p:Lue5;

    const/high16 v25, 0x30000000

    const/16 v26, 0x1fe

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v24, v2

    invoke-static/range {v15 .. v26}, Lyi4;->a(Lkotlin/jvm/functions/Function0;Lc8e;ZLpaj;Lz14;Le24;Lgo3;Lzvf;Lcr9;Lih5;II)V

    invoke-virtual {v2, v0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    if-nez v1, :cond_5b3

    if-ne v3, v9, :cond_5bd

    :cond_5b3
    new-instance v3, Ly47;

    const/16 v1, 0x11

    invoke-direct {v3, v0, v1}, Ly47;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_5bd
    move-object v15, v3

    check-cast v15, Lkotlin/jvm/functions/Function0;

    sget-object v23, Lyi4;->q:Lue5;

    const/high16 v25, 0x30000000

    const/16 v26, 0x1fe

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v24, v2

    invoke-static/range {v15 .. v26}, Lyi4;->a(Lkotlin/jvm/functions/Function0;Lc8e;ZLpaj;Lz14;Le24;Lgo3;Lzvf;Lcr9;Lih5;II)V

    invoke-virtual {v2, v0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    if-nez v1, :cond_5e5

    if-ne v3, v9, :cond_5ef

    :cond_5e5
    new-instance v3, Ly47;

    const/16 v1, 0x12

    invoke-direct {v3, v0, v1}, Ly47;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_5ef
    move-object v15, v3

    check-cast v15, Lkotlin/jvm/functions/Function0;

    sget-object v23, Lyi4;->r:Lue5;

    const/high16 v25, 0x30000000

    const/16 v26, 0x1fe

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v24, v2

    invoke-static/range {v15 .. v26}, Lyi4;->a(Lkotlin/jvm/functions/Function0;Lc8e;ZLpaj;Lz14;Le24;Lgo3;Lzvf;Lcr9;Lih5;II)V

    invoke-virtual {v2, v0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    if-nez v1, :cond_617

    if-ne v3, v9, :cond_61f

    :cond_617
    new-instance v3, Ly47;

    invoke-direct {v3, v0, v4}, Ly47;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_61f
    move-object v15, v3

    check-cast v15, Lkotlin/jvm/functions/Function0;

    sget-object v23, Lyi4;->s:Lue5;

    const/high16 v25, 0x30000000

    const/16 v26, 0x1fe

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v24, v2

    invoke-static/range {v15 .. v26}, Lyi4;->a(Lkotlin/jvm/functions/Function0;Lc8e;ZLpaj;Lz14;Le24;Lgo3;Lzvf;Lcr9;Lih5;II)V

    goto :goto_641

    :cond_63c
    move-object/from16 v24, v2

    invoke-virtual/range {v24 .. v24}, Lvt9;->Q()V

    :goto_641
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_644
    check-cast v0, Ljz5;

    move-object/from16 v2, p1

    check-cast v2, Lp9i;

    move-object/from16 v2, p2

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x11

    if-eq v3, v12, :cond_659

    move v14, v13

    :cond_659
    and-int/2addr v1, v13

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_68d

    iget-object v0, v0, Ljz5;->b:Lgz5;

    iget-object v15, v0, Lgz5;->d:Ljava/lang/String;

    const/16 v35, 0x0

    const v36, 0x3fffe

    const/16 v16, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v34, 0x0

    move-object/from16 v33, v2

    invoke-static/range {v15 .. v36}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_692

    :cond_68d
    move-object/from16 v33, v2

    invoke-virtual/range {v33 .. v33}, Lvt9;->Q()V

    :goto_692
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_695
    check-cast v0, Lxw5;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move-object/from16 v3, p2

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_6bb

    iget-object v4, v0, Lxw5;->v:Li9f;

    invoke-interface {v4, v2}, Li9f;->g(I)I

    move-result v2

    iget-object v4, v0, Lxw5;->v:Li9f;

    invoke-interface {v4, v3}, Li9f;->g(I)I

    move-result v3

    :cond_6bb
    iget-boolean v4, v0, Lxw5;->u:Z

    if-eqz v4, :cond_6d5

    iget-object v4, v0, Lxw5;->r:Lmil;

    iget-wide v4, v4, Lmil;->b:J

    sget v6, Lxjl;->c:I

    const/16 v6, 0x20

    shr-long v6, v4, v6

    long-to-int v6, v6

    if-ne v2, v6, :cond_6d7

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    long-to-int v4, v4

    if-ne v3, v4, :cond_6d7

    :cond_6d5
    :goto_6d5
    move v13, v14

    goto :goto_721

    :cond_6d7
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-ltz v4, :cond_716

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v4

    iget-object v5, v0, Lxw5;->r:Lmil;

    iget-object v5, v5, Lmil;->a:Lsf1;

    iget-object v5, v5, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-gt v4, v5, :cond_716

    if-nez v1, :cond_6f7

    if-eq v2, v3, :cond_6f7

    iget-object v1, v0, Lxw5;->w:Ldil;

    invoke-virtual {v1, v13}, Ldil;->e(Z)V

    goto :goto_701

    :cond_6f7
    iget-object v1, v0, Lxw5;->w:Ldil;

    invoke-virtual {v1, v14}, Ldil;->u(Z)V

    sget-object v4, Lb7a;->a:Lb7a;

    invoke-virtual {v1, v4}, Ldil;->r(Lb7a;)V

    :goto_701
    iget-object v1, v0, Lxw5;->s:Lgbc;

    iget-object v1, v1, Lgbc;->v:Llw5;

    new-instance v4, Lmil;

    iget-object v0, v0, Lxw5;->r:Lmil;

    iget-object v0, v0, Lmil;->a:Lsf1;

    invoke-static {v2, v3}, Lupj;->c(II)J

    move-result-wide v2

    invoke-direct {v4, v0, v2, v3, v11}, Lmil;-><init>(Lsf1;JLxjl;)V

    invoke-virtual {v1, v4}, Llw5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_721

    :cond_716
    iget-object v0, v0, Lxw5;->w:Ldil;

    invoke-virtual {v0, v14}, Ldil;->u(Z)V

    sget-object v1, Lb7a;->a:Lb7a;

    invoke-virtual {v0, v1}, Ldil;->r(Lb7a;)V

    goto :goto_6d5

    :goto_721
    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_726
    check-cast v0, Lpf5;

    move-object/from16 v2, p1

    check-cast v2, Lp9i;

    move-object/from16 v2, p2

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x11

    if-eq v3, v12, :cond_73b

    move v14, v13

    :cond_73b
    and-int/2addr v1, v13

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_771

    iget v0, v0, Lpf5;->f:I

    invoke-static {v2, v0}, Lmzg;->q(Lih5;I)Ljava/lang/String;

    move-result-object v15

    const/16 v35, 0x0

    const v36, 0x3fffe

    const/16 v16, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v34, 0x0

    move-object/from16 v33, v2

    invoke-static/range {v15 .. v36}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_776

    :cond_771
    move-object/from16 v33, v2

    invoke-virtual/range {v33 .. v33}, Lvt9;->Q()V

    :goto_776
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_779
    check-cast v0, Lgz2;

    move-object/from16 v2, p1

    check-cast v2, Lr2k;

    move-object/from16 v2, p2

    check-cast v2, Lr2k;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    iget-object v0, v0, Lgz2;->c:Lfz2;

    sget-object v2, Lgz2;->h:[Lxtb;

    aget-object v2, v2, v14

    invoke-virtual {v0, v2, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_794
    check-cast v0, Lrkc;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Throwable;

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    invoke-virtual {v0, v2}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7a2
    check-cast v0, Lp04;

    move-object/from16 v2, p1

    check-cast v2, Lbyi;

    new-instance v3, Lf23;

    const/4 v4, 0x7

    invoke-direct {v3, v1, v0, v2, v4}, Lf23;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v3

    nop

    :pswitch_data_7b0
    .packed-switch 0x0
        :pswitch_7a2
        :pswitch_794
        :pswitch_779
        :pswitch_726
        :pswitch_695
        :pswitch_644
        :pswitch_559
        :pswitch_541
        :pswitch_3f1
        :pswitch_3bf
        :pswitch_386
        :pswitch_36f
        :pswitch_310
        :pswitch_28a
        :pswitch_216
        :pswitch_205
        :pswitch_1f3
        :pswitch_ff
        :pswitch_dd
        :pswitch_8c
    .end packed-switch
.end method
