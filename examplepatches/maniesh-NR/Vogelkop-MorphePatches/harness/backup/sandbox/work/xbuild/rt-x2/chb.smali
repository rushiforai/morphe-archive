.class public final Lchb;
.super Lbzo;
.source "SourceFile"


# instance fields
.field public o:Lioo;

.field public p:Lqb7;

.field public q:Ll45;

.field public final r:Luuj;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    sget-object v0, Ldro;->b:Ldro;

    invoke-direct {p0, p1, p2, v0}, Lbzo;-><init>(Landroid/content/Context;Ljava/lang/String;Ldro;)V

    new-instance p1, Luuj;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    sget-object p2, Lahb;->b:Lahb;

    iput-object p2, p1, Luuj;->b:Ljava/lang/Object;

    iput-object p1, p0, Lchb;->r:Luuj;

    return-void
.end method


# virtual methods
.method public final b(Lvho;Lpqo;)Z
    .registers 33

    move-object/from16 v2, p0

    move-object/from16 v8, p1

    iget-object v0, v8, Lvho;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1cb

    iget-object v11, v8, Lvho;->a:Lw06;

    iput-object v11, v2, Lbzo;->d:Lw06;

    iget-object v0, v8, Lvho;->g:Lfio;

    iput-object v0, v2, Lbzo;->f:Lfio;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v0

    iget-object v0, v0, Llho;->a:Lxho;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v3

    iget-object v3, v3, Llho;->g:Ljava/lang/String;

    iput-object v3, v2, Lbzo;->j:Ljava/lang/String;

    new-instance v3, Lzgb;

    invoke-direct {v3, v2, v1}, Lzgb;-><init>(Lchb;B)V

    iget-object v5, v2, Lchb;->r:Luuj;

    iput-object v3, v5, Luuj;->c:Ljava/lang/Object;

    sget-object v3, Lbhb;->a:[I

    invoke-virtual {v11}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x1

    if-eq v3, v4, :cond_143

    const/4 v6, 0x2

    if-eq v3, v6, :cond_143

    const/4 v7, 0x3

    const/4 v15, 0x0

    if-eq v3, v7, :cond_de

    const/4 v6, 0x4

    if-eq v3, v6, :cond_44

    const/4 v6, 0x5

    if-ne v3, v6, :cond_1cb

    :cond_44
    sget-boolean v13, Lx79;->g:Z

    sget-object v1, Lw06;->b:Lw06;

    if-ne v11, v1, :cond_54

    if-eqz v13, :cond_50

    const v1, 0x7f0d003f

    goto :goto_5d

    :cond_50
    const v1, 0x7f0d003e

    goto :goto_5d

    :cond_54
    if-eqz v13, :cond_5a

    const v1, 0x7f0d0045

    goto :goto_5d

    :cond_5a
    const v1, 0x7f0d0044

    :goto_5d
    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v3

    iget v3, v3, Llho;->e:I

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v6

    iget-object v6, v6, Llho;->b:Ljava/lang/String;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v7

    iget-object v7, v7, Llho;->c:Ljava/lang/String;

    iget-object v9, v0, Lxho;->d:Ljava/lang/String;

    new-instance v10, Lzg;

    invoke-direct {v10, v3, v6, v7, v9}, Lzg;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v12, Llro;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v3

    iget-object v3, v3, Llho;->d:Ljava/util/ArrayList;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v6

    iget-object v6, v6, Llho;->i:Loam;

    iget-object v7, v2, Lbzo;->j:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_c1

    new-instance v16, Lp12;

    iget-object v7, v0, Lxho;->b:Ljava/lang/String;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v9

    iget-object v9, v9, Llho;->k:Ljava/lang/String;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v11

    iget-object v11, v11, Llho;->l:Ljava/lang/String;

    new-instance v14, Lzgb;

    invoke-direct {v14, v2, v4}, Lzgb;-><init>(Lchb;B)V

    iget-object v15, v2, Lbzo;->k:Ljava/lang/String;

    iget-object v4, v2, Lbzo;->l:Ljava/lang/String;

    move-object/from16 v25, v0

    iget-object v0, v2, Lbzo;->m:Ljava/lang/String;

    move-object/from16 v23, v0

    iget-object v0, v2, Lbzo;->n:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    move-object/from16 v22, v4

    move-object/from16 v17, v7

    move-object/from16 v18, v9

    move-object/from16 v19, v11

    move-object/from16 v20, v14

    move-object/from16 v21, v15

    invoke-direct/range {v16 .. v24}, Lp12;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/Serializable;)V

    move-object/from16 v21, v16

    goto :goto_c5

    :cond_c1
    move-object/from16 v25, v0

    move-object/from16 v21, v15

    :goto_c5
    iget-object v0, v2, Lbzo;->f:Lfio;

    iget-object v14, v2, Lbzo;->a:Landroid/content/Context;

    move-object/from16 v22, v0

    move v15, v1

    move-object/from16 v18, v3

    move-object/from16 v20, v5

    move-object/from16 v19, v6

    move-object/from16 v16, v10

    move-object/from16 v17, v25

    invoke-direct/range {v12 .. v22}, Llro;-><init>(ZLandroid/content/Context;ILzg;Lxho;Ljava/util/ArrayList;Loam;Luuj;Lp12;Lfio;)V

    iput-object v12, v2, Lchb;->o:Lioo;

    const/4 v9, 0x1

    goto/16 :goto_1b7

    :cond_de
    move-object/from16 v20, v5

    new-instance v1, Ljoo;

    new-instance v3, Lw6j;

    iget-object v10, v0, Lxho;->h:Ljava/lang/String;

    iget-object v12, v2, Lbzo;->c:Lltm;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v0

    iget-object v13, v0, Llho;->d:Ljava/util/ArrayList;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v0

    iget-object v14, v0, Llho;->i:Loam;

    move-object v9, v3

    invoke-direct/range {v9 .. v14}, Lw6j;-><init>(Ljava/lang/String;Lw06;Lltm;Ljava/util/ArrayList;Loam;)V

    iget-object v4, v2, Lchb;->q:Ll45;

    iget-object v0, v2, Lbzo;->j:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_133

    new-instance v21, Lp12;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v0

    iget-object v0, v0, Llho;->k:Ljava/lang/String;

    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v5

    iget-object v5, v5, Llho;->l:Ljava/lang/String;

    new-instance v7, Lzgb;

    invoke-direct {v7, v2, v6}, Lzgb;-><init>(Lchb;B)V

    iget-object v6, v2, Lbzo;->k:Ljava/lang/String;

    iget-object v9, v2, Lbzo;->l:Ljava/lang/String;

    iget-object v10, v2, Lbzo;->m:Ljava/lang/String;

    iget-object v11, v2, Lbzo;->n:Ljava/util/ArrayList;

    const/16 v22, 0x0

    move-object/from16 v23, v0

    move-object/from16 v24, v5

    move-object/from16 v26, v6

    move-object/from16 v25, v7

    move-object/from16 v27, v9

    move-object/from16 v28, v10

    move-object/from16 v29, v11

    invoke-direct/range {v21 .. v29}, Lp12;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/Serializable;)V

    move-object/from16 v6, v21

    goto :goto_134

    :cond_133
    move-object v6, v15

    :goto_134
    iget-object v7, v2, Lbzo;->f:Lfio;

    move-object v0, v1

    iget-object v1, v2, Lbzo;->a:Landroid/content/Context;

    move-object/from16 v5, v20

    const/4 v9, 0x1

    invoke-direct/range {v0 .. v7}, Ljoo;-><init>(Landroid/content/Context;Lchb;Lw6j;Ll45;Luuj;Lp12;Lfio;)V

    :goto_13f
    iput-object v0, v2, Lchb;->o:Lioo;

    goto/16 :goto_1b7

    :cond_143
    move v9, v4

    iget-object v0, v0, Lxho;->G:Leyi;

    new-instance v1, Lnxo;

    iget-object v3, v2, Lbzo;->a:Landroid/content/Context;

    invoke-direct {v1, v3, v9}, Lnxo;-><init>(Landroid/content/Context;Z)V

    iget-object v3, v1, Lnxo;->k:Ljava/lang/Object;

    if-nez v3, :cond_1a7

    iget-object v3, v1, Lnxo;->h:Lha6;

    if-eqz v3, :cond_1a7

    iget-object v3, v1, Lnxo;->b:Lix5;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lkz;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    sget-object v4, Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$AutoPlayState;->UNKNOWN:Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$AutoPlayState;

    iput-object v4, v3, Lkz;->d:Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$AutoPlayState;

    sget-object v4, Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$MutePlayState;->UNKNOWN:Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$MutePlayState;

    iput-object v4, v3, Lkz;->e:Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$MutePlayState;

    sget-object v4, Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$ContinuousPlayState;->UNKNOWN:Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$ContinuousPlayState;

    iput-object v4, v3, Lkz;->f:Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$ContinuousPlayState;

    iget-boolean v4, v0, Leyi;->b:Z

    iget-object v0, v0, Leyi;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-eqz v4, :cond_176

    iput-object v0, v3, Lkz;->a:Ljava/lang/String;

    goto :goto_178

    :cond_176
    iput-object v0, v3, Lkz;->b:Ljava/lang/String;

    :goto_178
    sget-object v0, Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$AutoPlayState;->CLICK:Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$AutoPlayState;

    iput-object v0, v3, Lkz;->d:Lcom/google/ads/interactivemedia/v3/impl/AdsRequestImpl$AutoPlayState;

    iget-object v0, v1, Lnxo;->c:Lrwo;

    iput-object v0, v3, Lkz;->c:Lrwo;

    const/high16 v0, 0x45fa0000    # 8000.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, v3, Lkz;->g:Ljava/lang/Float;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Lnxo;->k:Ljava/lang/Object;

    iput-object v0, v3, Lkz;->h:Ljava/lang/Object;

    iget-object v0, v1, Lnxo;->h:Lha6;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lypp;

    const/4 v6, 0x6

    invoke-direct {v4, v0, v3, v6}, Lypp;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v3, v0, Lha6;->o:Ljava/lang/Object;

    check-cast v3, Lcom/google/ads/interactivemedia/v3/internal/zzsx;

    iget-object v0, v0, Lha6;->b:Ljava/lang/Object;

    check-cast v0, Lcom/google/ads/interactivemedia/v3/internal/zztd;

    invoke-virtual {v0, v4, v3}, Lcom/google/ads/interactivemedia/v3/internal/zzrh;->b(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    :cond_1a7
    new-instance v0, Lfzo;

    iget-object v3, v2, Lchb;->q:Ll45;

    invoke-direct {v0, v3}, Lk8;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Lnxo;->c(Lfzo;)V

    new-instance v0, Lkoo;

    invoke-direct {v0, v1, v5}, Lkoo;-><init>(Lnxo;Luuj;)V

    goto :goto_13f

    :goto_1b7
    invoke-virtual {v8}, Lvho;->a()Llho;

    move-result-object v0

    iget-wide v0, v0, Llho;->h:D

    iput-wide v0, v2, Lbzo;->e:D

    iget-object v0, v2, Lchb;->o:Lioo;

    if-eqz v0, :cond_1ca

    iget-object v1, v2, Lchb;->p:Lqb7;

    if-eqz v1, :cond_1ca

    invoke-interface {v0, v1}, Lioo;->p(Lqb7;)V

    :cond_1ca
    return v9

    :cond_1cb
    return v1
.end method

.method public final unregister()V
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method
