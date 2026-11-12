.class public final Llhb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Li16;

.field public final b:Lx5f;

.field public final c:Lyl;

.field public final d:Li16;

.field public final e:Lcsh;

.field public final f:Lnhb;

.field public final g:Lpo7;

.field public h:Lyz;

.field public i:Ls50;

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:I


# direct methods
.method public constructor <init>(Lndc;Lx5f;Lyl;Lpza;Lpza;Lni6;Li16;Lcsh;Lnhb;Lpo7;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p4, Li16;

    const/16 v0, 0x16

    invoke-direct {p4, p5, p6, v0}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p4, p0, Llhb;->a:Li16;

    iput-object p2, p0, Llhb;->b:Lx5f;

    iput-object p3, p0, Llhb;->c:Lyl;

    iput-object p7, p0, Llhb;->d:Li16;

    iput-object p8, p0, Llhb;->e:Lcsh;

    iput-object p9, p0, Llhb;->f:Lnhb;

    iput-object p10, p0, Llhb;->g:Lpo7;

    new-instance p2, Lihb;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lihb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p10, p1, p2}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 38

    move-object/from16 v0, p0

    iget-object v1, v0, Llhb;->h:Lyz;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Lyz;->q()Z

    move-result v1

    if-eqz v1, :cond_16

    iget-object v1, v0, Llhb;->h:Lyz;

    invoke-virtual {v1}, Lyz;->c()V

    iput-object v2, v0, Llhb;->h:Lyz;

    goto :goto_1c

    :cond_16
    iget-boolean v1, v0, Llhb;->l:Z

    xor-int/2addr v1, v3

    iput-boolean v1, v0, Llhb;->k:Z

    return-void

    :cond_1c
    :goto_1c
    iget-boolean v1, v0, Llhb;->j:Z

    if-eqz v1, :cond_26

    iget-boolean v1, v0, Llhb;->l:Z

    xor-int/2addr v1, v3

    iput-boolean v1, v0, Llhb;->k:Z

    return-void

    :cond_26
    iput-boolean v3, v0, Llhb;->j:Z

    iget-object v1, v0, Llhb;->f:Lnhb;

    iget-object v1, v1, Lnhb;->b:Lhl;

    new-instance v4, Lhhb;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5}, Lhhb;-><init>(Llhb;B)V

    new-instance v6, Lhhb;

    invoke-direct {v6, v0, v3}, Lhhb;-><init>(Llhb;B)V

    iget-object v0, v0, Llhb;->d:Li16;

    iget-object v7, v0, Li16;->b:Ljava/lang/Object;

    check-cast v7, Lw7h;

    if-eqz v1, :cond_45

    invoke-virtual {v7, v1}, Lw7h;->a(Ldl;)Lbz;

    move-result-object v3

    goto/16 :goto_11d

    :cond_45
    iget-object v1, v0, Li16;->c:Ljava/lang/Object;

    check-cast v1, Lp7h;

    if-nez v1, :cond_10d

    iget-object v1, v7, Lw7h;->s:Lr9g;

    iget-object v8, v7, Lw7h;->e:Lxnh;

    sget-object v9, Lep7;->a:Lii;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lqyf;

    invoke-virtual {v9}, Lk8;->a0()Z

    move-result v10

    if-eqz v10, :cond_a4

    new-instance v3, Lp7h;

    new-instance v10, Lxo7;

    iget-object v11, v7, Lw7h;->a:Landroid/app/Activity;

    sget-object v12, Lrm;->b:Lrm;

    iget-object v14, v7, Lw7h;->f:Lpyl;

    iget-object v15, v7, Lw7h;->j:Luwh;

    iget-object v13, v7, Lw7h;->w:Lqfb;

    new-instance v2, Lr68;

    invoke-direct {v2, v8}, Lr68;-><init>(Lxnh;)V

    iget-object v8, v7, Lw7h;->n:Li3j;

    invoke-static {v5, v5}, Lap;->b(II)Lap;

    move-result-object v19

    iget-object v5, v7, Lw7h;->s:Lr9g;

    move-object/from16 v16, v13

    const-string v13, "980088188"

    move-object/from16 v17, v2

    move-object/from16 v20, v5

    move-object/from16 v18, v8

    invoke-direct/range {v10 .. v20}, Lxo7;-><init>(Landroid/app/Activity;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;)V

    invoke-virtual {v9, v10}, Lqyf;->s0(Lxo7;)Ldz;

    move-result-object v2

    new-instance v13, Lvo;

    sget-object v5, Lyo;->e:Lyo;

    invoke-static {v5, v12}, Lyo;->g(Lyo;Lrm;)I

    move-result v19

    const/16 v20, 0x0

    const-string v14, ""

    const-string v15, ""

    const-string v16, ""

    const/16 v18, 0x0

    move-object/from16 v17, v5

    invoke-direct/range {v13 .. v20}, Lvo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lyo;III)V

    invoke-direct {v3, v2, v13, v1}, Lp7h;-><init>(Ldz;Lvo;Lr9g;)V

    goto :goto_10a

    :cond_a4
    new-instance v2, Lp7h;

    new-instance v21, Lao;

    iget-object v9, v7, Lw7h;->a:Landroid/app/Activity;

    iget-object v10, v7, Lw7h;->b:Lumi;

    sget-object v24, Lrm;->b:Lrm;

    iget-object v11, v7, Lw7h;->f:Lpyl;

    iget-object v12, v7, Lw7h;->j:Luwh;

    iget-object v13, v7, Lw7h;->w:Lqfb;

    new-instance v14, Lr68;

    invoke-direct {v14, v8}, Lr68;-><init>(Lxnh;)V

    iget-object v8, v7, Lw7h;->n:Li3j;

    invoke-static {v5, v5}, Lap;->b(II)Lap;

    move-result-object v31

    iget-object v15, v7, Lw7h;->s:Lr9g;

    new-instance v3, Lt7h;

    invoke-direct {v3, v7, v5}, Lt7h;-><init>(Lw7h;B)V

    new-instance v5, Lt7h;

    move-object/from16 v34, v3

    const/4 v3, 0x1

    invoke-direct {v5, v7, v3}, Lt7h;-><init>(Lw7h;B)V

    new-instance v3, Lt7h;

    move-object/from16 v35, v5

    const/4 v5, 0x2

    invoke-direct {v3, v7, v5}, Lt7h;-><init>(Lw7h;B)V

    const-string v25, "ca-app-pub-3940256099942544/1033173712"

    const/16 v33, 0x0

    move-object/from16 v36, v3

    move-object/from16 v30, v8

    move-object/from16 v22, v9

    move-object/from16 v23, v10

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v28, v13

    move-object/from16 v29, v14

    move-object/from16 v32, v15

    invoke-direct/range {v21 .. v36}, Lao;-><init>(Landroid/app/Activity;Lumi;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;ZLesk;Lesk;Lesk;)V

    move-object/from16 v3, v21

    move-object/from16 v5, v24

    new-instance v7, Lvo;

    sget-object v11, Lyo;->b:Lyo;

    invoke-static {v11, v5}, Lyo;->g(Lyo;Lrm;)I

    move-result v13

    const/4 v14, 0x0

    const-string v8, ""

    const-string v9, ""

    const-string v10, ""

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v14}, Lvo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lyo;III)V

    invoke-direct {v2, v3, v7, v1}, Lp7h;-><init>(Ldz;Lvo;Lr9g;)V

    move-object v3, v2

    :goto_10a
    iput-object v3, v0, Li16;->c:Ljava/lang/Object;

    goto :goto_10e

    :cond_10d
    move-object v3, v1

    :goto_10e
    new-instance v7, Lhl;

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/4 v8, 0x1

    const-string v9, ""

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v7 .. v15}, Lhl;-><init>(ILjava/lang/String;IIIZLjava/util/TreeSet;Ljava/util/TreeSet;)V

    move-object v1, v7

    :goto_11d
    invoke-interface {v3}, Lbz;->a()Z

    move-result v2

    if-nez v2, :cond_129

    sget-object v0, Ls50;->c:Ls50;

    invoke-virtual {v6, v0}, Lhhb;->run(Ljava/lang/Object;)V

    return-void

    :cond_129
    new-instance v2, Lmhb;

    invoke-direct {v2, v0, v4, v6, v3}, Lmhb;-><init>(Li16;Lhhb;Lhhb;Lbz;)V

    new-instance v0, Lm43;

    const/4 v4, 0x3

    sget-object v5, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v6, 0x0

    invoke-direct {v0, v1, v6, v4, v5}, Lm43;-><init>(Ldl;Ljava/lang/String;ILjava/util/List;)V

    invoke-interface {v3, v2, v0}, Lbz;->e(Lzy;Laz;)V

    return-void
.end method

.method public final b(I)Z
    .registers 4

    iget-object v0, p0, Llhb;->f:Lnhb;

    iget-object v0, v0, Lnhb;->b:Lhl;

    if-eqz v0, :cond_14

    iget-boolean v1, v0, Lhl;->j:Z

    if-eqz v1, :cond_e

    const/4 v1, 0x1

    if-eq p1, v1, :cond_16

    goto :goto_14

    :cond_e
    iget p1, p0, Llhb;->m:I

    iget v1, v0, Lhl;->i:I

    if-ge p1, v1, :cond_16

    :cond_14
    :goto_14
    const/4 p0, 0x0

    return p0

    :cond_16
    iget p1, v0, Lhl;->h:I

    iget v0, v0, Lhl;->g:I

    iget-object p0, p0, Llhb;->a:Li16;

    invoke-virtual {p0, p1, v0}, Li16;->A(II)Z

    move-result p0

    return p0
.end method
