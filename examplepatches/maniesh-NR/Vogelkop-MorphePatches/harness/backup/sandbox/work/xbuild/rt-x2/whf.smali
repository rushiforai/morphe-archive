.class public final synthetic Lwhf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lwhf;->a:B

    iput-object p1, p0, Lwhf;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    .line 8
    iput-byte p3, p0, Lwhf;->a:B

    iput-object p1, p0, Lwhf;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 34

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-byte v2, v0, Lwhf;->a:B

    sget-object v3, Lhh5;->a:Lzpa;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x1

    iget-object v0, v0, Lwhf;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_aa2

    check-cast v0, Lnf8;

    move-object/from16 v2, p1

    check-cast v2, Lmqa;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v2, v1}, Lnf8;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_35
    check-cast v0, Lzca;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v4, :cond_46

    move v7, v8

    :cond_46
    and-int/2addr v1, v8

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_a0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_6f

    if-eq v0, v8, :cond_66

    if-ne v0, v4, :cond_62

    sget-object v0, Lahk;->q0:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lshk;

    goto :goto_77

    :cond_62
    invoke-static {}, Lh9o;->p()V

    goto :goto_a7

    :cond_66
    sget-object v0, Lahk;->p0:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lshk;

    goto :goto_77

    :cond_6f
    sget-object v0, Lahk;->n0:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lshk;

    :goto_77
    invoke-static {v0, v2}, Luyg;->q(Lshk;Lih5;)Ljava/lang/String;

    move-result-object v9

    const/16 v29, 0x0

    const v30, 0x3fffe

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const-wide/16 v20, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v28, 0x0

    move-object/from16 v27, v2

    invoke-static/range {v9 .. v30}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_a5

    :cond_a0
    move-object/from16 v27, v2

    invoke-virtual/range {v27 .. v27}, Lvt9;->Q()V

    :goto_a5
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_a7
    return-object v5

    :pswitch_a8
    check-cast v0, Lcaa;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v5, v1, 0x3

    if-eq v5, v4, :cond_b9

    move v7, v8

    :cond_b9
    and-int/2addr v1, v8

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_1d2

    invoke-virtual {v0}, Lcaa;->o0()Leaa;

    move-result-object v1

    iget-object v1, v1, Leaa;->d:Lrlh;

    invoke-static {v1, v2}, Ldyg;->h(Llak;Lih5;)Lafe;

    move-result-object v1

    invoke-interface {v1}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldaa;

    invoke-virtual {v2, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_e0

    if-eq v5, v3, :cond_e0

    move-object v8, v0

    goto :goto_f4

    :cond_e0
    new-instance v6, Lqv7;

    const/4 v12, 0x0

    const/16 v13, 0x9

    const/4 v7, 0x0

    const-class v9, Lcaa;

    const-string v10, "close"

    const-string v11, "close()V"

    move-object v8, v0

    invoke-direct/range {v6 .. v13}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v2, v6}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v5, v6

    :goto_f4
    check-cast v5, Lmtb;

    move-object v9, v5

    check-cast v9, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v8}, Lcaa;->o0()Leaa;

    move-result-object v12

    invoke-virtual {v2, v12}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v0, :cond_109

    if-ne v4, v3, :cond_11d

    :cond_109
    new-instance v10, Lqv7;

    const/16 v16, 0x0

    const/16 v17, 0xa

    const/4 v11, 0x0

    const-class v13, Leaa;

    const-string v14, "onSearchClick"

    const-string v15, "onSearchClick()V"

    invoke-direct/range {v10 .. v17}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v2, v10}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v10

    :cond_11d
    check-cast v4, Lmtb;

    move-object v10, v4

    check-cast v10, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v8}, Lcaa;->o0()Leaa;

    move-result-object v13

    invoke-virtual {v2, v13}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v0, :cond_132

    if-ne v4, v3, :cond_146

    :cond_132
    new-instance v11, Lqv7;

    const/16 v17, 0x0

    const/16 v18, 0xb

    const/4 v12, 0x0

    const-class v14, Leaa;

    const-string v15, "onFaqClicked"

    const-string v16, "onFaqClicked()V"

    invoke-direct/range {v11 .. v18}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v2, v11}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v11

    :cond_146
    check-cast v4, Lmtb;

    move-object v11, v4

    check-cast v11, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v8}, Lcaa;->o0()Leaa;

    move-result-object v14

    invoke-virtual {v2, v14}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v0, :cond_15b

    if-ne v4, v3, :cond_16f

    :cond_15b
    new-instance v12, Lqv7;

    const/16 v18, 0x0

    const/16 v19, 0xc

    const/4 v13, 0x0

    const-class v15, Leaa;

    const-string v16, "onReportAProblemClicked"

    const-string v17, "onReportAProblemClicked()V"

    invoke-direct/range {v12 .. v19}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v2, v12}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v12

    :cond_16f
    check-cast v4, Lmtb;

    move-object v12, v4

    check-cast v12, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v8}, Lcaa;->o0()Leaa;

    move-result-object v15

    invoke-virtual {v2, v15}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v0, :cond_184

    if-ne v4, v3, :cond_198

    :cond_184
    new-instance v13, Lqv7;

    const/16 v19, 0x0

    const/16 v20, 0xd

    const/4 v14, 0x0

    const-class v16, Leaa;

    const-string v17, "onOperaForumsClicked"

    const-string v18, "onOperaForumsClicked()V"

    invoke-direct/range {v13 .. v20}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v2, v13}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v13

    :cond_198
    check-cast v4, Lmtb;

    move-object v13, v4

    check-cast v13, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v8}, Lcaa;->o0()Leaa;

    move-result-object v0

    invoke-virtual {v2, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_1ad

    if-ne v5, v3, :cond_1c3

    :cond_1ad
    new-instance v14, Lci7;

    const/16 v20, 0x0

    const/16 v21, 0x7

    const/4 v15, 0x1

    const-class v17, Leaa;

    const-string v18, "onOperaSocialMediaClicked"

    const-string v19, "onOperaSocialMediaClicked(Lcom/opera/android/settings/help_feedback/OperaSocialMedia;)V"

    move-object/from16 v16, v0

    invoke-direct/range {v14 .. v21}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v2, v14}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v5, v14

    :cond_1c3
    check-cast v5, Lmtb;

    move-object v14, v5

    check-cast v14, Lkotlin/jvm/functions/Function1;

    const/4 v15, 0x0

    const/16 v17, 0x8

    move-object v8, v1

    move-object/from16 v16, v2

    invoke-static/range {v8 .. v17}, Lipe;->a(Ldaa;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lc8e;Lih5;I)V

    goto :goto_1d7

    :cond_1d2
    move-object/from16 v16, v2

    invoke-virtual/range {v16 .. v16}, Lvt9;->Q()V

    :goto_1d7
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1da
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v4, :cond_1e9

    move v7, v8

    :cond_1e9
    and-int/2addr v1, v8

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-nez v1, :cond_1f8

    invoke-virtual {v0}, Lvt9;->Q()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :cond_1f8
    throw v5

    :pswitch_1f9
    check-cast v0, Li07;

    check-cast v1, Ljava/lang/Throwable;

    if-eqz v1, :cond_20f

    instance-of v2, v1, Ljava/util/concurrent/CancellationException;

    if-eqz v2, :cond_206

    move-object v5, v1

    check-cast v5, Ljava/util/concurrent/CancellationException;

    :cond_206
    if-nez v5, :cond_20f

    const-string v2, "CompletableFuture was completed exceptionally"

    invoke-static {v2, v1}, Lna2;->a(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/util/concurrent/CancellationException;

    move-result-object v1

    move-object v5, v1

    :cond_20f
    invoke-virtual {v0, v5}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_215
    move-object v6, v0

    check-cast v6, Lc29;

    move-object/from16 v0, p1

    check-cast v0, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v4, :cond_227

    move v7, v8

    :cond_227
    and-int/2addr v1, v8

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_33b

    invoke-virtual {v6}, Lc29;->o0()Le29;

    move-result-object v1

    iget-object v1, v1, Le29;->f:Lrlh;

    invoke-static {v1, v0}, Ldyg;->h(Llak;Lih5;)Lafe;

    move-result-object v1

    invoke-interface {v1}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld29;

    invoke-virtual {v0, v6}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_24c

    if-ne v4, v3, :cond_25d

    :cond_24c
    new-instance v4, Lqv7;

    const/4 v10, 0x0

    const/4 v11, 0x2

    const/4 v5, 0x0

    const-class v7, Lc29;

    const-string v8, "close"

    const-string v9, "close()V"

    invoke-direct/range {v4 .. v11}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_25d
    check-cast v4, Lmtb;

    move-object v9, v4

    check-cast v9, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v6}, Lc29;->o0()Le29;

    move-result-object v12

    invoke-virtual {v0, v12}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_272

    if-ne v4, v3, :cond_286

    :cond_272
    new-instance v10, Lci7;

    const/16 v16, 0x0

    const/16 v17, 0x3

    const/4 v11, 0x1

    const-class v13, Le29;

    const-string v14, "onAskBeforeDownloadingCheckChanged"

    const-string v15, "onAskBeforeDownloadingCheckChanged(Z)V"

    invoke-direct/range {v10 .. v17}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v10}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v10

    :cond_286
    check-cast v4, Lmtb;

    move-object v10, v4

    check-cast v10, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v6}, Lc29;->o0()Le29;

    move-result-object v13

    invoke-virtual {v0, v13}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_29b

    if-ne v4, v3, :cond_2af

    :cond_29b
    new-instance v11, Lqv7;

    const/16 v17, 0x0

    const/16 v18, 0x3

    const/4 v12, 0x0

    const-class v14, Le29;

    const-string v15, "onConcurrentDownloadsClicked"

    const-string v16, "onConcurrentDownloadsClicked()V"

    invoke-direct/range {v11 .. v18}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v11}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v11

    :cond_2af
    check-cast v4, Lmtb;

    move-object v11, v4

    check-cast v11, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v6}, Lc29;->o0()Le29;

    move-result-object v14

    invoke-virtual {v0, v14}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_2c4

    if-ne v4, v3, :cond_2d8

    :cond_2c4
    new-instance v12, Lqv7;

    const/16 v18, 0x0

    const/16 v19, 0x4

    const/4 v13, 0x0

    const-class v15, Le29;

    const-string v16, "onDownloadsFolderClicked"

    const-string v17, "onDownloadsFolderClicked()V"

    invoke-direct/range {v12 .. v19}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v12}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v12

    :cond_2d8
    check-cast v4, Lmtb;

    move-object v12, v4

    check-cast v12, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v6}, Lc29;->o0()Le29;

    move-result-object v15

    invoke-virtual {v0, v15}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_2ed

    if-ne v4, v3, :cond_301

    :cond_2ed
    new-instance v13, Lqv7;

    const/16 v19, 0x0

    const/16 v20, 0x5

    const/4 v14, 0x0

    const-class v16, Le29;

    const-string v17, "onOfflinePagesFolderClicked"

    const-string v18, "onOfflinePagesFolderClicked()V"

    invoke-direct/range {v13 .. v20}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v13}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v13

    :cond_301
    check-cast v4, Lmtb;

    move-object v13, v4

    check-cast v13, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v6}, Lc29;->o0()Le29;

    move-result-object v2

    invoke-virtual {v0, v2}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v4, :cond_316

    if-ne v5, v3, :cond_32c

    :cond_316
    new-instance v14, Lqv7;

    const/16 v20, 0x0

    const/16 v21, 0x6

    const/4 v15, 0x0

    const-class v17, Le29;

    const-string v18, "onSearchClick"

    const-string v19, "onSearchClick()V"

    move-object/from16 v16, v2

    invoke-direct/range {v14 .. v21}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v14}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v5, v14

    :cond_32c
    check-cast v5, Lmtb;

    move-object v14, v5

    check-cast v14, Lkotlin/jvm/functions/Function0;

    const/4 v15, 0x0

    const/16 v17, 0x8

    move-object/from16 v16, v0

    move-object v8, v1

    invoke-static/range {v8 .. v17}, Lz5i;->f(Ld29;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lc8e;Lih5;I)V

    goto :goto_340

    :cond_33b
    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lvt9;->Q()V

    :goto_340
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_343
    check-cast v0, Landroidx/emoji2/emojipicker/EmojiPickerView;

    move-object/from16 v2, p1

    check-cast v2, Ljy7;

    check-cast v1, Lnz7;

    iget-object v2, v0, Landroidx/emoji2/emojipicker/EmojiPickerView;->k:Lip1;

    if-eqz v2, :cond_352

    invoke-virtual {v2, v1}, Lip1;->accept(Ljava/lang/Object;)V

    :cond_352
    iget-object v2, v0, Landroidx/emoji2/emojipicker/EmojiPickerView;->e:Lf1p;

    iget-object v1, v1, Lnz7;->a:Ljava/lang/String;

    iget-object v3, v2, Lf1p;->a:Ljava/lang/Object;

    move-object v9, v3

    check-cast v9, Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v9, v7, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v1, v2, Lf1p;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const/4 v14, 0x0

    const/16 v15, 0x3e

    const-string v10, ","

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v9 .. v15}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "pref_key_recent_emoji"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    iput-boolean v8, v0, Landroidx/emoji2/emojipicker/EmojiPickerView;->f:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_383
    check-cast v0, Lcom/opera/hype/image/editor/EditImage;

    move-object/from16 v2, p1

    check-cast v2, Landroid/graphics/Canvas;

    check-cast v1, Li97;

    iget-object v3, v0, Lcom/opera/hype/image/editor/EditImage;->f:Lkk7;

    iput-object v1, v3, Lkk7;->b:Li97;

    iget-object v1, v0, Lcom/opera/hype/image/editor/EditImage;->o:Lqk3;

    iget-object v1, v1, Lqk3;->c:Lfz2;

    sget-object v4, Lqk3;->d:[Lxtb;

    aget-object v4, v4, v7

    iget-object v1, v1, La7f;->b:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    iput-object v1, v3, Lkk7;->c:Landroid/graphics/Bitmap;

    iget-object v0, v0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    iget-object v0, v0, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v4, v7

    move v6, v4

    :goto_3a7
    if-ge v6, v1, :cond_3ba

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v6, v6, 0x1

    check-cast v9, Lfya;

    instance-of v10, v9, Lf76;

    if-eqz v10, :cond_3b6

    move v4, v8

    :cond_3b6
    invoke-virtual {v9, v2, v3}, Lfya;->b(Landroid/graphics/Canvas;Lkk7;)V

    goto :goto_3a7

    :cond_3ba
    if-eqz v4, :cond_404

    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v4, v7

    :cond_3c4
    :goto_3c4
    if-ge v4, v1, :cond_3ec

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v4, v4, 0x1

    check-cast v6, Lfya;

    instance-of v8, v6, Lf76;

    if-eqz v8, :cond_3c4

    check-cast v6, Lf76;

    iget-object v6, v6, Lf83;->g:Ls9i;

    if-eqz v6, :cond_3e6

    iget-object v8, v3, Lkk7;->b:Li97;

    iget-object v8, v8, Li97;->b:Landroid/graphics/PointF;

    invoke-virtual {v6, v8}, Ls9i;->P(Landroid/graphics/PointF;)Landroid/graphics/Path;

    move-result-object v6

    sget-object v8, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {v2, v6, v8}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    goto :goto_3c4

    :cond_3e6
    const-string v0, "Cutouts support only path drawing"

    invoke-static {v0}, Lyt7;->k(Ljava/lang/String;)V

    goto :goto_406

    :cond_3ec
    iget-boolean v0, v3, Lkk7;->d:Z

    if-eqz v0, :cond_3fc

    const/high16 v0, -0x1000000

    const/16 v1, 0xcc

    invoke-static {v0, v1}, Lab5;->l(II)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_401

    :cond_3fc
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v2, v7, v0}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    :goto_401
    invoke-virtual {v2}, Landroid/graphics/Canvas;->restore()V

    :cond_404
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_406
    return-object v5

    :pswitch_407
    check-cast v0, Lvpb;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/String;

    check-cast v1, Lod7;

    const-string v3, "domain"

    invoke-static {v3, v2}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v2

    const-string v3, "expireTime"

    iget-wide v4, v1, Lod7;->a:J

    invoke-virtual {v2, v4, v5, v3}, Lorb;->o(JLjava/lang/String;)V

    invoke-virtual {v0, v2}, Lvpb;->a(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_422
    check-cast v0, Lv77;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v8}, Laoh;->m(I)I

    move-result v1

    invoke-virtual {v0, v2, v1}, Lv77;->a(Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_437
    check-cast v0, Le57;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v4, :cond_448

    move v7, v8

    :cond_448
    and-int/2addr v1, v8

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_482

    iget-object v0, v0, Le57;->f:Lby5;

    iget-object v0, v0, Lby5;->a:Ljava/lang/String;

    const-string v1, "Country (default="

    const-string v3, ")"

    invoke-static {v1, v0, v3}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/16 v28, 0x0

    const v29, 0x3fffe

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x0

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v27, 0x0

    move-object/from16 v26, v2

    invoke-static/range {v8 .. v29}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_487

    :cond_482
    move-object/from16 v26, v2

    invoke-virtual/range {v26 .. v26}, Lvt9;->Q()V

    :goto_487
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_48a
    check-cast v0, Lsfl;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lvt9;

    const v1, 0x27b3a34e

    invoke-virtual {v2, v1}, Lvt9;->W(I)V

    iget-object v0, v0, Lsfl;->b:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lvt9;->p(Z)V

    return-object v0

    :pswitch_4a3
    check-cast v0, Ldil;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v8}, Laoh;->m(I)I

    move-result v1

    invoke-static {v0, v2, v1}, Lcs5;->j(Ldil;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4b8
    check-cast v0, Lj1c;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v2, v1, Leg5;

    if-eqz v2, :cond_4e1

    move-object v2, v1

    check-cast v2, Leg5;

    iget-object v3, v0, Lj1c;->h:Ljava/lang/Object;

    check-cast v3, Ltee;

    if-nez v3, :cond_4d7

    sget-object v3, Ljmi;->a:Ltee;

    new-instance v3, Ltee;

    invoke-direct {v3}, Ltee;-><init>()V

    iput-object v3, v0, Lj1c;->h:Ljava/lang/Object;

    :cond_4d7
    invoke-virtual {v3, v2}, Ltee;->k(Ljava/lang/Object;)V

    iget-object v3, v0, Lj1c;->e:Ljava/lang/Object;

    check-cast v3, Ldfe;

    invoke-virtual {v3, v2}, Ldfe;->c(Ljava/lang/Object;)V

    :cond_4e1
    instance-of v2, v1, Lzt9;

    if-eqz v2, :cond_4eb

    move-object v2, v1

    check-cast v2, Lzt9;

    invoke-virtual {v0, v2}, Lj1c;->f(Lzt9;)V

    :cond_4eb
    instance-of v0, v1, Lznh;

    if-eqz v0, :cond_4f5

    move-object v0, v1

    check-cast v0, Lznh;

    invoke-virtual {v0}, Lznh;->c()V

    :cond_4f5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4f8
    check-cast v0, Lih5;

    move-object/from16 v2, p1

    check-cast v2, Lc8e;

    check-cast v1, La8e;

    instance-of v3, v1, Lgh5;

    if-eqz v3, :cond_51b

    check-cast v1, Lgh5;

    iget-object v1, v1, Lgh5;->c:Lcr9;

    invoke-static {v6, v1}, Ly9m;->t(ILjava/lang/Object;)V

    sget-object v3, Lz7e;->b:Lz7e;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v3, v0, v4}, Lcr9;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc8e;

    invoke-static {v0, v1}, Lqyn;->O(Lih5;Lc8e;)Lc8e;

    move-result-object v1

    :cond_51b
    invoke-interface {v2, v1}, Lc8e;->d(Lc8e;)Lc8e;

    move-result-object v0

    return-object v0

    :pswitch_520
    check-cast v0, Lch5;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v8}, Laoh;->m(I)I

    move-result v1

    invoke-virtual {v0, v2, v1}, Lch5;->a(Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_535
    check-cast v0, Ljt3;

    move-object/from16 v2, p1

    check-cast v2, Lpc;

    check-cast v1, Lef;

    iget-object v3, v0, Ljt3;->e:Lqb7;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Ljava/util/GregorianCalendar;

    invoke-direct {v6}, Ljava/util/GregorianCalendar;-><init>()V

    new-instance v9, Lnt3;

    invoke-virtual {v6, v8}, Ljava/util/Calendar;->get(I)I

    move-result v10

    invoke-virtual {v6, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/4 v11, 0x5

    invoke-virtual {v6, v11}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-direct {v9, v10, v4, v6}, Lnt3;-><init>(III)V

    invoke-virtual {v3, v9}, Lqb7;->x(Lnt3;)V

    iget-object v4, v3, Lqb7;->b:Ljava/lang/Object;

    check-cast v4, Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    invoke-interface {v4, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_579

    new-instance v6, Lot3;

    new-instance v10, Ljava/util/LinkedHashSet;

    invoke-direct {v10}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-direct {v6, v9, v10}, Lot3;-><init>(Lnt3;Ljava/util/LinkedHashSet;)V

    invoke-interface {v4, v9, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_579
    check-cast v6, Lot3;

    iget-object v4, v6, Lot3;->b:Ljava/util/LinkedHashSet;

    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_586

    invoke-virtual {v3}, Lqb7;->B()V

    :cond_586
    iget-object v3, v0, Ljt3;->b:Lx5f;

    iget-object v4, v3, Lx5f;->d:Lzpa;

    iget-object v6, v0, Ljt3;->d:Lhw3;

    iget-object v0, v0, Ljt3;->a:Lx5f;

    iget-object v9, v0, Lx5f;->d:Lzpa;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const-wide/16 v10, 0x1

    sget-object v14, Ltk0;->c:Ltk0;

    sget-object v12, Lbf;->a:Lbf;

    sget-object v13, Laf;->a:Laf;

    sget-object v15, Lcf;->a:Lcf;

    packed-switch v2, :pswitch_data_ae0

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_741

    :pswitch_5a6
    iget-object v1, v1, Lef;->a:Ldf;

    invoke-virtual {v1, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_73f

    invoke-virtual {v1, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_73f

    invoke-virtual {v1, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5d2

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_73f

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-static {v9, v1}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v2

    iget-object v2, v2, Lhi0;->b:Lfi0;

    const/16 v3, 0x2e

    invoke-virtual {v2, v3, v8, v10, v11}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v1}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_73f

    :cond_5d2
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_741

    :pswitch_5d7
    iget-object v0, v1, Lef;->a:Ldf;

    invoke-virtual {v0, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_73f

    invoke-virtual {v0, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_73f

    invoke-virtual {v0, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_607

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    invoke-direct {v1, v4, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v1, v1, Lck0;->u:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lys0;

    iget-object v1, v1, Lys0;->b:Lws0;

    const/4 v2, 0x6

    invoke-virtual {v1, v2, v8, v10, v11}, Ljf0;->p(IIJ)V

    invoke-virtual {v3, v0}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_73f

    :cond_607
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_741

    :pswitch_60c
    iget-object v1, v1, Lef;->a:Ldf;

    invoke-virtual {v1, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_73f

    invoke-virtual {v1, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_73f

    invoke-virtual {v1, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_65e

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmbf;

    iget-object v1, v1, Lmbf;->f:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v16

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_73f

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v9, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v3, v2, Lck0;->i:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpk0;

    iget-object v3, v3, Lpk0;->a:Lok0;

    invoke-virtual {v3, v7, v8, v8}, Ljf0;->o(III)V

    new-instance v12, Lha1;

    const/16 v17, 0x2

    sget-object v13, Lqk0;->j:Lqk0;

    const/4 v15, 0x0

    invoke-direct/range {v12 .. v17}, Lha1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {v2, v12}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v1}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_73f

    :cond_65e
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_741

    :pswitch_663
    sget-object v1, Lph0;->G:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto/16 :goto_73f

    :pswitch_66a
    sget-object v1, Lph0;->F:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto/16 :goto_73f

    :pswitch_671
    const/4 v2, 0x0

    iget-object v1, v1, Lef;->a:Ldf;

    invoke-virtual {v1, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_73f

    invoke-virtual {v1, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_73f

    invoke-virtual {v1, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6c4

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmbf;

    iget-object v1, v1, Lmbf;->f:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v16

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_73f

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v3, Lck0;

    invoke-direct {v3, v9, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v4, v3, Lck0;->i:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lpk0;

    iget-object v4, v4, Lpk0;->a:Lok0;

    invoke-virtual {v4, v7, v8, v8}, Ljf0;->o(III)V

    new-instance v12, Lha1;

    const/16 v17, 0x2

    sget-object v13, Lqk0;->i:Lqk0;

    move-object v15, v2

    invoke-direct/range {v12 .. v17}, Lha1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-virtual {v3, v12}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v1}, Lx5f;->U0(Lx56;)V

    goto/16 :goto_73f

    :cond_6c4
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_741

    :pswitch_6c9
    sget-object v1, Lph0;->E:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto/16 :goto_73f

    :pswitch_6d0
    sget-object v1, Lph0;->D:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto/16 :goto_73f

    :pswitch_6d7
    sget-object v1, Lph0;->C:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto :goto_73f

    :pswitch_6dd
    sget-object v1, Lph0;->B:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto :goto_73f

    :pswitch_6e3
    sget-object v1, Lph0;->A:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto :goto_73f

    :pswitch_6e9
    sget-object v1, Lph0;->z:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto :goto_73f

    :pswitch_6ef
    sget-object v1, Lph0;->y:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto :goto_73f

    :pswitch_6f5
    sget-object v1, Lph0;->x:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto :goto_73f

    :pswitch_6fb
    sget-object v1, Lph0;->w:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto :goto_73f

    :pswitch_701
    sget-object v1, Lph0;->v:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    goto :goto_73f

    :pswitch_707
    iget-object v1, v1, Lef;->a:Ldf;

    invoke-virtual {v1, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_73a

    invoke-virtual {v1, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_73a

    invoke-virtual {v1, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_736

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    invoke-direct {v1, v4, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v1, v1, Lck0;->u:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lys0;

    iget-object v1, v1, Lys0;->b:Lws0;

    const/4 v2, 0x7

    invoke-virtual {v1, v2, v8, v10, v11}, Ljf0;->p(IIJ)V

    invoke-virtual {v3, v0}, Lx5f;->U0(Lx56;)V

    goto :goto_73f

    :cond_736
    invoke-static {}, Lh9o;->p()V

    goto :goto_741

    :cond_73a
    sget-object v1, Lph0;->u:Lph0;

    invoke-virtual {v0, v1}, Lx5f;->f0(Lph0;)V

    :cond_73f
    :goto_73f
    :pswitch_73f
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_741
    return-object v5

    :pswitch_742
    check-cast v0, Lfd;

    move-object/from16 v2, p1

    check-cast v2, Landroid/view/View;

    check-cast v1, Lef;

    new-instance v1, Ldd;

    invoke-direct {v1, v0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {v1, v2}, Lo73;->o(Landroid/view/View;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_755
    check-cast v0, Landroid/content/Context;

    move-object/from16 v2, p1

    check-cast v2, Landroid/view/View;

    check-cast v1, Lef;

    new-instance v1, Lrxh;

    const v2, 0x7f140586

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    invoke-static {v0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    new-instance v2, Lgkj;

    invoke-direct {v2, v7, v7}, Lnz0;-><init>(ZZ)V

    iput-object v5, v2, Lgkj;->a:Ljava/lang/String;

    iput-object v5, v2, Lgkj;->b:Ljava/lang/String;

    iput-object v5, v2, Lgkj;->c:Ljava/lang/String;

    iput-object v5, v2, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v5, v2, Lgkj;->e:Lekj;

    iput-object v5, v2, Lgkj;->f:Lfkj;

    iput-object v5, v2, Lgkj;->g:Lqp2;

    iput-object v5, v2, Lgkj;->h:Ldkj;

    iput-object v5, v2, Lgkj;->i:Ldkj;

    iput-object v5, v2, Lgkj;->j:Lql;

    iput v7, v2, Lgkj;->k:I

    const v3, 0x7f140812

    iput v3, v2, Lgkj;->l:I

    iput v7, v2, Lgkj;->m:I

    iput-boolean v8, v2, Lgkj;->n:Z

    iput-object v1, v2, Lgkj;->o:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {v0, v2, v1}, Lr22;->b(Ljjm;Lijm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_79a
    check-cast v0, Ljava/lang/Long;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v8}, Laoh;->m(I)I

    move-result v1

    invoke-static {v0, v2, v1}, Lxf8;->l(Ljava/lang/Long;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7af
    check-cast v0, Lhq3;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Runnable;

    check-cast v1, Lpn7;

    iget-object v0, v0, Ls62;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->J0()Lorg/chromium/ui/base/ViewAndroidDelegate;

    move-result-object v0

    if-eqz v0, :cond_7ce

    iget-object v0, v0, Lorg/chromium/ui/base/ViewAndroidDelegate;->b:Lxr5;

    iget-wide v3, v1, Lpn7;->a:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_7ce
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7d1
    check-cast v0, Ljava/io/DataOutputStream;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    sget-object v2, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    array-length v2, v1

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7ec
    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Runnable;

    check-cast v1, Lpn7;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_803

    iget-wide v3, v1, Lpn7;->a:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_803
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_806
    check-cast v0, Lgpk;

    move-object/from16 v2, p1

    check-cast v2, Landroid/graphics/RectF;

    check-cast v1, Landroid/graphics/RectF;

    invoke-static {v2}, Lxvg;->w(Landroid/graphics/RectF;)Lvoh;

    move-result-object v2

    invoke-static {v1}, Lxvg;->w(Landroid/graphics/RectF;)Lvoh;

    move-result-object v1

    iget-byte v0, v0, Lgpk;->a:B

    packed-switch v0, :pswitch_data_b28

    invoke-virtual {v2}, Lvoh;->b()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lvoh;->a(J)Z

    move-result v0

    goto :goto_828

    :pswitch_824
    invoke-virtual {v2, v1}, Lvoh;->g(Lvoh;)Z

    move-result v0

    :goto_828
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_82d
    check-cast v0, Lo01;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v4, :cond_83e

    move v7, v8

    :cond_83e
    and-int/2addr v1, v8

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_878

    iget-object v1, v0, Lo01;->a:Lshk;

    iget-object v0, v0, Lo01;->b:Ljava/lang/String;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v0, v2}, Luyg;->r(Lshk;[Ljava/lang/Object;Lih5;)Ljava/lang/String;

    move-result-object v8

    const/16 v28, 0x0

    const v29, 0x3fffe

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x0

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v27, 0x0

    move-object/from16 v26, v2

    invoke-static/range {v8 .. v29}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_87d

    :cond_878
    move-object/from16 v26, v2

    invoke-virtual/range {v26 .. v26}, Lvt9;->Q()V

    :goto_87d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_880
    check-cast v0, Lmy0;

    move-object/from16 v2, p1

    check-cast v2, Landroid/view/View;

    check-cast v1, Lef;

    iget-object v1, v0, Lmy0;->d:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lekc;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0}, Lmy0;->b()Z

    move-result v0

    if-eqz v0, :cond_8ab

    if-eqz v1, :cond_8ab

    sget-object v0, Llqm;->I:Llqm;

    invoke-static {v1, v0, v8}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput v8, v0, Lvx3;->c:I

    iput-boolean v7, v0, Lvx3;->f:Z

    invoke-static {v0}, Lam2;->v(Lvx3;)V

    :cond_8ab
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8ae
    check-cast v0, Ljpi;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v0}, Lb8e;->H0()Lnx5;

    move-result-object v3

    new-instance v4, Ly6;

    invoke-direct {v4, v0, v2, v1, v5}, Ly6;-><init>(Ljpi;FFLmt5;)V

    invoke-static {v3, v5, v5, v4, v6}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    :pswitch_8cd
    check-cast v0, Ld4;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v4, :cond_8df

    move v3, v8

    goto :goto_8e0

    :cond_8df
    move v3, v7

    :goto_8e0
    and-int/2addr v1, v8

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v3}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_8ed

    invoke-virtual {v0, v2, v7}, Ld4;->a(Lih5;I)V

    goto :goto_8f0

    :cond_8ed
    invoke-virtual {v2}, Lvt9;->Q()V

    :goto_8f0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8f3
    move-object v11, v0

    check-cast v11, Lu2;

    move-object/from16 v0, p1

    check-cast v0, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v4, :cond_906

    move v2, v8

    goto :goto_907

    :cond_906
    move v2, v7

    :goto_907
    and-int/2addr v1, v8

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v2}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_a62

    invoke-virtual {v11}, Lu2;->o0()Ld3;

    move-result-object v1

    iget-object v1, v1, Ld3;->h:Lrlh;

    invoke-static {v1, v0}, Ldyg;->h(Llak;Lih5;)Lafe;

    move-result-object v1

    invoke-interface {v1}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb3;

    invoke-virtual {v0, v11}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v2, :cond_92c

    if-ne v5, v3, :cond_93f

    :cond_92c
    new-instance v9, Lq2;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/4 v10, 0x0

    const-class v12, Lu2;

    const-string v13, "close"

    const-string v14, "close()V"

    invoke-direct/range {v9 .. v16}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v9}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v5, v9

    :cond_93f
    check-cast v5, Lmtb;

    move-object v13, v5

    check-cast v13, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v11}, Lu2;->o0()Ld3;

    move-result-object v2

    invoke-virtual {v0, v2}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v9

    if-nez v5, :cond_954

    if-ne v9, v3, :cond_96a

    :cond_954
    new-instance v14, Lq2;

    const/16 v20, 0x0

    const/16 v21, 0x1

    const/4 v15, 0x0

    const-class v17, Ld3;

    const-string v18, "onSearchClick"

    const-string v19, "onSearchClick()V"

    move-object/from16 v16, v2

    invoke-direct/range {v14 .. v21}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v14}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v9, v14

    :cond_96a
    check-cast v9, Lmtb;

    move-object v14, v9

    check-cast v14, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v11}, Lu2;->o0()Ld3;

    move-result-object v2

    invoke-virtual {v0, v2}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v9

    if-nez v5, :cond_97f

    if-ne v9, v3, :cond_996

    :cond_97f
    new-instance v15, Lq2;

    const/16 v21, 0x0

    const/16 v22, 0x2

    const/16 v16, 0x0

    const-class v18, Ld3;

    const-string v19, "onUpdatesClick"

    const-string v20, "onUpdatesClick()V"

    move-object/from16 v17, v2

    invoke-direct/range {v15 .. v22}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v15}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v9, v15

    :cond_996
    check-cast v9, Lmtb;

    move-object v15, v9

    check-cast v15, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v11}, Lu2;->o0()Ld3;

    move-result-object v2

    invoke-virtual {v0, v2}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v9

    if-nez v5, :cond_9ab

    if-ne v9, v3, :cond_9c3

    :cond_9ab
    new-instance v16, Lr2;

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v17, 0x1

    const-class v19, Ld3;

    const-string v20, "onInstallationIdClickCount"

    const-string v21, "onInstallationIdClickCount(I)V"

    move-object/from16 v18, v2

    invoke-direct/range {v16 .. v23}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v9, v16

    invoke-virtual {v0, v9}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_9c3
    check-cast v9, Lmtb;

    move-object/from16 v16, v9

    check-cast v16, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v11}, Lu2;->o0()Ld3;

    move-result-object v2

    invoke-virtual {v0, v2}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v9

    if-nez v5, :cond_9d9

    if-ne v9, v3, :cond_9f1

    :cond_9d9
    new-instance v17, Lr2;

    const/16 v23, 0x0

    const/16 v24, 0x1

    const/16 v18, 0x1

    const-class v20, Ld3;

    const-string v21, "onConfigurationClickCount"

    const-string v22, "onConfigurationClickCount(I)V"

    move-object/from16 v19, v2

    invoke-direct/range {v17 .. v24}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v9, v17

    invoke-virtual {v0, v9}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_9f1
    check-cast v9, Lmtb;

    move-object/from16 v17, v9

    check-cast v17, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v0, v11}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v2, :cond_a03

    if-ne v5, v3, :cond_a0b

    :cond_a03
    new-instance v5, Lp2;

    invoke-direct {v5, v11, v7}, Lp2;-><init>(Lu2;B)V

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_a0b
    move-object/from16 v18, v5

    check-cast v18, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0, v11}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v2, :cond_a1b

    if-ne v5, v3, :cond_a23

    :cond_a1b
    new-instance v5, Lp2;

    invoke-direct {v5, v11, v8}, Lp2;-><init>(Lu2;B)V

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_a23
    move-object/from16 v19, v5

    check-cast v19, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0, v11}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v2, :cond_a33

    if-ne v5, v3, :cond_a3b

    :cond_a33
    new-instance v5, Lp2;

    invoke-direct {v5, v11, v4}, Lp2;-><init>(Lu2;B)V

    invoke-virtual {v0, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_a3b
    move-object/from16 v20, v5

    check-cast v20, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0, v11}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_a4b

    if-ne v4, v3, :cond_a53

    :cond_a4b
    new-instance v4, Lp2;

    invoke-direct {v4, v11, v6}, Lp2;-><init>(Lu2;B)V

    invoke-virtual {v0, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_a53
    move-object/from16 v21, v4

    check-cast v21, Lkotlin/jvm/functions/Function0;

    const/16 v22, 0x0

    const/16 v24, 0x0

    move-object/from16 v23, v0

    move-object v12, v1

    invoke-static/range {v12 .. v24}, Ljpo;->a(Lb3;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lc8e;Lih5;I)V

    goto :goto_a67

    :cond_a62
    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lvt9;->Q()V

    :goto_a67
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a6a
    check-cast v0, Lbif;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v4, :cond_a7b

    move v7, v8

    :cond_a7b
    and-int/2addr v1, v8

    move-object v15, v2

    check-cast v15, Lvt9;

    invoke-virtual {v15, v1, v7}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_a9b

    sget-object v1, Lmpj;->a:Li39;

    invoke-static {v1}, Lw7d;->f(Lc8e;)Lc8e;

    move-result-object v10

    iget-object v8, v0, Lbif;->a:Lyg3;

    const/16 v16, 0x61b8

    const/16 v17, 0x68

    const/4 v9, 0x0

    const/4 v11, 0x0

    sget-object v12, Ljr5;->a:Lulp;

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static/range {v8 .. v17}, Lxf8;->j(Lhyf;Ljava/lang/String;Lc8e;Ltd3;Lkr5;FLkh3;Lih5;II)V

    goto :goto_a9e

    :cond_a9b
    invoke-virtual {v15}, Lvt9;->Q()V

    :goto_a9e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_aa2
    .packed-switch 0x0
        :pswitch_a6a
        :pswitch_8f3
        :pswitch_8cd
        :pswitch_8ae
        :pswitch_880
        :pswitch_82d
        :pswitch_806
        :pswitch_7ec
        :pswitch_7d1
        :pswitch_7af
        :pswitch_79a
        :pswitch_755
        :pswitch_742
        :pswitch_535
        :pswitch_520
        :pswitch_4f8
        :pswitch_4b8
        :pswitch_4a3
        :pswitch_48a
        :pswitch_437
        :pswitch_422
        :pswitch_407
        :pswitch_383
        :pswitch_343
        :pswitch_215
        :pswitch_1f9
        :pswitch_1da
        :pswitch_a8
        :pswitch_35
    .end packed-switch

    :pswitch_data_ae0
    .packed-switch 0x0
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_707
        :pswitch_701
        :pswitch_6fb
        :pswitch_6f5
        :pswitch_6ef
        :pswitch_6e9
        :pswitch_6e3
        :pswitch_6dd
        :pswitch_6d7
        :pswitch_6d0
        :pswitch_6c9
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_73f
        :pswitch_671
        :pswitch_73f
        :pswitch_66a
        :pswitch_663
        :pswitch_60c
        :pswitch_5d7
        :pswitch_5a6
    .end packed-switch

    :pswitch_data_b28
    .packed-switch 0x14
        :pswitch_824
    .end packed-switch
.end method
