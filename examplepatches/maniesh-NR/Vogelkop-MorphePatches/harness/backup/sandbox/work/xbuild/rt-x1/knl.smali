.class public final Lknl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lumi;

.field public final b:J

.field public c:Loml;

.field public final d:Lp7l;

.field public final e:Li7f;


# direct methods
.method public constructor <init>(Lumi;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lknl;->a:Lumi;

    iput-wide p2, p0, Lknl;->b:J

    new-instance p1, Lp7l;

    const/16 p2, 0xc

    invoke-direct {p1, p0, p2}, Lp7l;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lknl;->d:Lp7l;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lknl;->e:Li7f;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lzu7;

    iget-object p0, p0, Lknl;->e:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lzu7;

    iget-object p0, p0, Lknl;->e:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lzu7;)V
    .registers 2

    iget-object p0, p0, Lknl;->e:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Lknl;->c:Loml;

    if-eqz v0, :cond_e

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    iput-object v0, p0, Lknl;->c:Loml;

    :cond_e
    return-void
.end method

.method public final c()V
    .registers 41

    invoke-virtual/range {p0 .. p0}, Lknl;->b()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lknl;->e:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_b
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_47a

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzu7;

    iget-byte v2, v1, Lzu7;->a:B

    iget-object v1, v1, Lzu7;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_47c

    check-cast v1, Lsmi;

    iget-object v2, v1, Lsmi;->n:Lj3i;

    iget-object v2, v2, Lj3i;->b:Ljava/lang/Object;

    check-cast v2, Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ltsd;->r(Ljava/lang/Object;)V

    move-object/from16 v17, v0

    goto/16 :goto_476

    :pswitch_31
    move-object v2, v1

    check-cast v2, Lev7;

    iget-object v1, v2, Lev7;->k:Ljava/lang/Object;

    check-cast v1, Lxh5;

    iget-object v3, v2, Lev7;->b:Ljava/lang/Object;

    move-object v9, v3

    check-cast v9, Ljava/util/LinkedHashMap;

    iget-object v3, v2, Lev7;->g:Ljava/lang/Object;

    check-cast v3, Liv7;

    iget-object v4, v3, Liv7;->e:Lpde;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Leri;

    iget-object v4, v3, Liv7;->f:Lpde;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Leri;

    iget-object v3, v3, Liv7;->g:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Ll42;

    iget-object v3, v2, Lev7;->f:Ljava/lang/Object;

    check-cast v3, Lvs;

    iget-object v3, v3, Lvs;->d:Ljava/lang/Object;

    move-object v10, v3

    check-cast v10, Lcom/google/android/material/chip/ChipGroup;

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v11

    const/high16 v3, 0x41400000    # 12.0f

    invoke-static {v11, v3}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v3

    iget v4, v10, Lcom/google/android/material/chip/ChipGroup;->e:I

    if-eq v4, v3, :cond_7a

    iput v3, v10, Lcom/google/android/material/chip/ChipGroup;->e:I

    iput v3, v10, Lcom/google/android/material/chip/ChipGroup;->b:I

    invoke-virtual {v10}, Landroid/view/View;->requestLayout()V

    :cond_7a
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    sget-object v3, Lhri;->c:Lhri;

    sget-object v4, Lhri;->b:Lhri;

    sget-object v5, Lhri;->a:Lhri;

    filled-new-array {v3, v4, v5}, [Lhri;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :goto_92
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_35f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lhri;

    invoke-interface {v6}, Leri;->getId()J

    move-result-wide v16

    invoke-interface {v7}, Leri;->getId()J

    move-result-wide v18

    cmp-long v16, v16, v18

    if-nez v16, :cond_ad

    const/16 v16, 0x1

    goto :goto_af

    :cond_ad
    const/16 v16, 0x0

    :goto_af
    if-eqz v8, :cond_bd

    invoke-interface {v7}, Leri;->getId()J

    move-result-wide v17

    iget-wide v14, v8, Ll6e;->b:J

    cmp-long v14, v17, v14

    if-nez v14, :cond_bd

    const/4 v14, 0x1

    goto :goto_be

    :cond_bd
    const/4 v14, 0x0

    :goto_be
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    move-object/from16 v17, v0

    if-eqz v15, :cond_d7

    const/4 v0, 0x1

    if-eq v15, v0, :cond_d4

    const/4 v0, 0x2

    if-ne v15, v0, :cond_cf

    move/from16 v24, v16

    goto :goto_e0

    :cond_cf
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_476

    :cond_d4
    move/from16 v24, v14

    goto :goto_e0

    :cond_d7
    if-nez v16, :cond_de

    if-nez v14, :cond_de

    const/16 v24, 0x1

    goto :goto_e0

    :cond_de
    const/16 v24, 0x0

    :goto_e0
    iget-object v0, v2, Lev7;->a:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    if-eqz v15, :cond_297

    move-object/from16 v18, v0

    const/4 v0, 0x1

    if-eq v15, v0, :cond_271

    const/4 v0, 0x2

    if-ne v15, v0, :cond_26c

    invoke-virtual/range {v18 .. v18}, Lekc;->g()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Luv7;

    iget-object v15, v15, Luv7;->c:Lvv7;

    invoke-virtual {v15}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    move-object/from16 v31, v3

    if-eqz v15, :cond_134

    const/4 v3, 0x1

    if-eq v15, v3, :cond_112

    if-eq v15, v0, :cond_112

    const/4 v0, 0x3

    if-eq v15, v0, :cond_112

    const/4 v0, 0x4

    if-eq v15, v0, :cond_112

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_476

    :cond_112
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    sget-object v27, Lfri;->a:Lfri;

    invoke-interface {v6}, Leri;->getTitle()Ljava/lang/String;

    move-result-object v29

    new-instance v25, Lcv7;

    const/16 v28, 0x1

    const/16 v30, 0x0

    move-object/from16 v26, v0

    invoke-direct/range {v25 .. v30}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    move/from16 v32, v4

    move-object/from16 v33, v6

    :goto_12d
    move-object/from16 v18, v7

    :goto_12f
    move-object/from16 v0, v25

    :goto_131
    const/4 v15, 0x0

    goto/16 :goto_2cd

    :cond_134
    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual/range {v18 .. v18}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Luv7;

    iget-object v15, v3, Luv7;->d:Lyl2;

    if-eqz v15, :cond_1b5

    sget-object v18, Lhk6;->i:Lh58;

    invoke-virtual/range {v18 .. v18}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_148
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_16b

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    move/from16 v32, v4

    move-object/from16 v4, v21

    check-cast v4, Lhk6;

    iget-object v4, v4, Lhk6;->d:Ljava/lang/String;

    move-object/from16 v33, v6

    invoke-interface {v15}, Lyl2;->h()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_171

    move/from16 v4, v32

    move-object/from16 v6, v33

    goto :goto_148

    :cond_16b
    move/from16 v32, v4

    move-object/from16 v33, v6

    const/16 v21, 0x0

    :cond_171
    move-object/from16 v4, v21

    check-cast v4, Lhk6;

    if-eqz v4, :cond_184

    iget v4, v4, Lhk6;->b:I

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v4, v6}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    move-object/from16 v26, v4

    goto :goto_186

    :cond_184
    const/16 v26, 0x0

    :goto_186
    if-eqz v26, :cond_19b

    new-instance v25, Lcv7;

    sget-object v27, Lfri;->d:Lfri;

    const v3, 0x7f14087c

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v30}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    goto :goto_12d

    :cond_19b
    new-instance v4, Lpqh;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-instance v6, Ltn;

    move-object/from16 v18, v7

    const/4 v7, 0x0

    invoke-direct {v6, v7, v2, v4, v0}, Ltn;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v15, v6}, Lyl2;->e(Lxl2;)Z

    iget-object v4, v4, Lpqh;->a:Ljava/lang/Object;

    if-eqz v4, :cond_1bb

    move-object/from16 v25, v4

    check-cast v25, Lcv7;

    goto/16 :goto_12f

    :cond_1b5
    move/from16 v32, v4

    move-object/from16 v33, v6

    move-object/from16 v18, v7

    :cond_1bb
    iget-object v4, v3, Luv7;->e:Lpvb;

    const v6, 0x7f141471

    if-eqz v4, :cond_20f

    invoke-interface {v4}, Lpvb;->m()Li1;

    move-result-object v4

    if-eqz v4, :cond_20f

    iget-object v7, v4, Li1;->e:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    if-eqz v7, :cond_1f4

    iget-object v7, v4, Li1;->d:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    if-eqz v7, :cond_1f4

    new-instance v25, Lcv7;

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const/4 v7, 0x0

    invoke-direct {v3, v7}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    sget-object v27, Lfri;->a:Lfri;

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v29

    new-instance v0, Lcv2;

    const/16 v6, 0x1d

    invoke-direct {v0, v2, v4, v6}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/16 v28, 0x0

    move-object/from16 v30, v0

    move-object/from16 v26, v3

    invoke-direct/range {v25 .. v30}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    goto/16 :goto_12f

    :cond_1f4
    iget v4, v4, Li1;->c:I

    if-eqz v4, :cond_20f

    invoke-static {v4, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v26

    if-eqz v26, :cond_20f

    new-instance v25, Lcv7;

    sget-object v27, Lfri;->d:Lfri;

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v30}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    goto/16 :goto_12f

    :cond_20f
    iget-object v4, v3, Luv7;->b:Llbf;

    sget-object v7, Llbf;->d:Llbf;

    if-ne v4, v7, :cond_23a

    iget-object v3, v3, Luv7;->c:Lvv7;

    sget-object v4, Lvv7;->a:Lvv7;

    if-ne v3, v4, :cond_23a

    iget-object v3, v2, Lev7;->n:Ljava/lang/Object;

    check-cast v3, Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v26, v3

    check-cast v26, Landroid/graphics/drawable/Drawable;

    if-eqz v26, :cond_23a

    new-instance v25, Lcv7;

    sget-object v27, Lfri;->a:Lfri;

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v30}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    goto/16 :goto_12f

    :cond_23a
    iget-object v3, v2, Lev7;->m:Ljava/lang/Object;

    check-cast v3, Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v26, v3

    check-cast v26, Landroid/graphics/drawable/Drawable;

    if-eqz v26, :cond_259

    new-instance v25, Lcv7;

    sget-object v27, Lfri;->d:Lfri;

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v25 .. v30}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    goto/16 :goto_12f

    :cond_259
    new-instance v34, Lcv7;

    sget-object v36, Lfri;->a:Lfri;

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v35, 0x0

    const/16 v37, 0x0

    invoke-direct/range {v34 .. v39}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    move-object/from16 v0, v34

    goto/16 :goto_131

    :cond_26c
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_476

    :cond_271
    move-object/from16 v31, v3

    move/from16 v32, v4

    move-object/from16 v33, v6

    move-object/from16 v18, v7

    new-instance v25, Lcv7;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v7, 0x0

    invoke-direct {v0, v7}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    sget-object v27, Lfri;->c:Lfri;

    if-eqz v8, :cond_28a

    iget-object v3, v8, Ll6e;->c:Ljava/lang/String;

    move-object/from16 v29, v3

    goto :goto_28c

    :cond_28a
    const/16 v29, 0x0

    :goto_28c
    const/16 v30, 0x0

    const/16 v28, 0x1

    move-object/from16 v26, v0

    invoke-direct/range {v25 .. v30}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    goto/16 :goto_12f

    :cond_297
    move-object/from16 v31, v3

    move/from16 v32, v4

    move-object/from16 v33, v6

    move-object/from16 v18, v7

    new-instance v21, Lcv7;

    if-eqz v24, :cond_2b6

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v15, 0x0

    invoke-direct {v0, v15}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    sget-object v3, Lfri;->c:Lfri;

    invoke-interface/range {v18 .. v18}, Leri;->getTitle()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v25, v4

    :goto_2b1
    move-object/from16 v22, v0

    move-object/from16 v23, v3

    goto :goto_2c6

    :cond_2b6
    const/4 v15, 0x0

    iget-object v0, v2, Lev7;->l:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    sget-object v3, Lfri;->b:Lfri;

    const/16 v25, 0x0

    goto :goto_2b1

    :goto_2c6
    const/16 v26, 0x0

    invoke-direct/range {v21 .. v26}, Lcv7;-><init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V

    move-object/from16 v0, v21

    :goto_2cd
    new-instance v3, Lgri;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_2ec

    const/4 v6, 0x1

    if-eq v4, v6, :cond_2e7

    const/4 v6, 0x2

    if-ne v4, v6, :cond_2e2

    invoke-interface/range {v33 .. v33}, Leri;->getId()J

    move-result-wide v6

    :goto_2df
    move-wide/from16 v21, v6

    goto :goto_2f5

    :cond_2e2
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_476

    :cond_2e7
    if-eqz v8, :cond_2f3

    iget-wide v6, v8, Ll6e;->b:J

    goto :goto_2df

    :cond_2ec
    if-eqz v24, :cond_2f3

    invoke-interface/range {v18 .. v18}, Leri;->getId()J

    move-result-wide v6

    goto :goto_2df

    :cond_2f3
    const-wide/16 v21, -0x1

    :goto_2f5
    if-nez v16, :cond_2fb

    if-nez v14, :cond_2fb

    move v4, v15

    goto :goto_2fc

    :cond_2fb
    const/4 v4, 0x1

    :goto_2fc
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_317

    const/4 v7, 0x1

    if-eq v6, v7, :cond_310

    const/4 v7, 0x2

    if-ne v6, v7, :cond_30b

    move/from16 v23, v4

    goto :goto_319

    :cond_30b
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_476

    :cond_310
    if-eqz v8, :cond_314

    if-nez v4, :cond_317

    :cond_314
    move/from16 v23, v15

    goto :goto_319

    :cond_317
    const/16 v23, 0x1

    :goto_319
    iget-object v4, v0, Lcv7;->d:Ljava/lang/String;

    iget-object v6, v0, Lcv7;->a:Landroid/graphics/drawable/Drawable;

    iget-object v7, v0, Lcv7;->b:Lfri;

    iget-boolean v14, v0, Lcv7;->c:Z

    sget-object v15, Lhri;->a:Lhri;

    if-ne v5, v15, :cond_32a

    if-eqz v24, :cond_32a

    const/16 v29, 0x1

    goto :goto_32c

    :cond_32a
    const/16 v29, 0x0

    :goto_32c
    iget-object v0, v0, Lcv7;->e:Lcv2;

    move-object/from16 v30, v0

    move-object/from16 v20, v3

    move-object/from16 v25, v4

    move-object/from16 v26, v6

    move-object/from16 v27, v7

    move/from16 v28, v14

    invoke-direct/range {v20 .. v30}, Lgri;-><init>(JZZLjava/lang/String;Landroid/graphics/drawable/Drawable;Lfri;ZZLcv2;)V

    move-object/from16 v0, v20

    if-eqz v23, :cond_350

    new-instance v3, Lkotlin/Pair;

    add-int/lit8 v4, v32, 0x1

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_352

    :cond_350
    move/from16 v4, v32

    :goto_352
    invoke-interface {v9, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v0, v17

    move-object/from16 v7, v18

    move-object/from16 v3, v31

    move-object/from16 v6, v33

    goto/16 :goto_92

    :cond_35f
    move-object/from16 v17, v0

    move-object/from16 v33, v6

    move-object/from16 v18, v7

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v10}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v14

    const/4 v15, 0x0

    :goto_36f
    if-ge v15, v14, :cond_3b7

    invoke-virtual {v10, v15}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lx83;

    iget-object v4, v3, Lx83;->A:Lhri;

    invoke-virtual {v9, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lgri;

    iget-object v4, v3, Lx83;->A:Lhri;

    invoke-interface {v13, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    iget-boolean v6, v5, Lgri;->b:Z

    if-eqz v6, :cond_3a9

    if-eqz v4, :cond_3a9

    invoke-virtual {v3, v5}, Lx83;->p(Lgri;)V

    new-instance v4, Ltu7;

    const/4 v6, 0x1

    invoke-direct {v4, v3, v6}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lzx1;

    const/16 v7, 0x9

    invoke-direct {v6, v4, v7}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    iget-object v4, v3, Lx83;->A:Lhri;

    move-object/from16 v7, v18

    move-object/from16 v6, v33

    invoke-virtual/range {v2 .. v8}, Lev7;->h(Lx83;Lhri;Lgri;Leri;Leri;Ll42;)V

    goto :goto_3b0

    :cond_3a9
    move-object/from16 v7, v18

    move-object/from16 v6, v33

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_3b0
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v33, v6

    move-object/from16 v18, v7

    goto :goto_36f

    :cond_3b7
    move-object/from16 v7, v18

    move-object/from16 v6, v33

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_3c0
    if-ge v4, v3, :cond_3d5

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lx83;

    invoke-virtual {v10, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v5, v5, Lx83;->D:Landroid/view/TouchDelegate;

    iget-object v13, v1, Lxh5;->a:Ljava/util/ArrayList;

    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_3c0

    :cond_3d5
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v14, 0x0

    :cond_3da
    :goto_3da
    if-ge v14, v0, :cond_476

    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v14, v14, 0x1

    check-cast v3, Lkotlin/Pair;

    iget-object v4, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v4, Lhri;

    iget-object v3, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-virtual {v9, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lgri;

    if-eqz v5, :cond_3da

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v13

    if-eqz v13, :cond_418

    const/4 v15, 0x1

    if-eq v13, v15, :cond_410

    const/4 v15, 0x2

    if-ne v13, v15, :cond_40c

    new-instance v13, Lgv6;

    sget-object v15, Lhri;->c:Lhri;

    invoke-direct {v13, v11, v15}, Lx83;-><init>(Landroid/content/Context;Lhri;)V

    goto :goto_41f

    :cond_40c
    invoke-static {}, Lh9o;->p()V

    goto :goto_476

    :cond_410
    new-instance v13, Lmg;

    sget-object v15, Lhri;->b:Lhri;

    invoke-direct {v13, v11, v15}, Lx83;-><init>(Landroid/content/Context;Lhri;)V

    goto :goto_41f

    :cond_418
    new-instance v13, Lmg;

    sget-object v15, Lhri;->a:Lhri;

    invoke-direct {v13, v11, v15}, Lx83;-><init>(Landroid/content/Context;Lhri;)V

    :goto_41f
    sget-object v15, Lq9n;->c:Ll5b;

    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-static {v15}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v15

    move/from16 p0, v0

    if-eqz v15, :cond_44c

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    move-object/from16 v16, v9

    const/4 v9, 0x2

    iput v9, v0, Landroid/util/TypedValue;->type:I

    const v9, 0x7f040557

    iput v9, v0, Landroid/util/TypedValue;->resourceId:I

    iput v9, v0, Landroid/util/TypedValue;->data:I

    new-instance v9, Lff2;

    move-object/from16 v18, v2

    sget-object v2, Lu8n;->h:[I

    invoke-direct {v9, v2, v0}, Lff2;-><init>([ILandroid/util/TypedValue;)V

    const/4 v0, 0x0

    invoke-static {v15, v13, v9, v0}, Lu8n;->f(Ldll;Landroid/view/View;Lff2;Ljava/util/ArrayDeque;)V

    goto :goto_450

    :cond_44c
    move-object/from16 v18, v2

    move-object/from16 v16, v9

    :goto_450
    invoke-virtual {v10, v13, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    iget-object v2, v13, Lx83;->D:Landroid/view/TouchDelegate;

    iget-object v3, v1, Lxh5;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v13, v5}, Lx83;->p(Lgri;)V

    move-object v3, v13

    move-object/from16 v2, v18

    invoke-virtual/range {v2 .. v8}, Lev7;->h(Lx83;Lhri;Lgri;Leri;Leri;Ll42;)V

    iget-object v4, v2, Lev7;->d:Ljava/lang/Object;

    check-cast v4, Lfe5;

    iget-object v4, v4, Lfe5;->b:Lqdc;

    iget-object v5, v2, Lev7;->i:Ljava/lang/Object;

    check-cast v5, Ldv7;

    invoke-static {v3, v4, v5}, Laib;->C(Lw6f;Ltcc;Ljava/lang/Object;)V

    move/from16 v0, p0

    move-object/from16 v9, v16

    goto/16 :goto_3da

    :cond_476
    :goto_476
    move-object/from16 v0, v17

    goto/16 :goto_b

    :cond_47a
    return-void

    nop

    :pswitch_data_47c
    .packed-switch 0x0
        :pswitch_31
    .end packed-switch
.end method
