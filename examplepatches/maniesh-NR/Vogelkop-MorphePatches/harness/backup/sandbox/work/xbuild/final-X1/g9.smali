.class public final synthetic Lg9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 16
    iput-byte p4, p0, Lg9;->a:B

    iput-object p1, p0, Lg9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lg9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lg9;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IB)V
    .registers 6

    .line 14
    iput-byte p5, p0, Lg9;->a:B

    iput-object p1, p0, Lg9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lg9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lg9;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IBZ)V
    .registers 7

    .line 15
    iput-byte p5, p0, Lg9;->a:B

    iput-object p1, p0, Lg9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lg9;->d:Ljava/lang/Object;

    iput-object p3, p0, Lg9;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;Lrul;Lkotlin/jvm/functions/Function0;)V
    .registers 5

    const/16 v0, 0x16

    iput-byte v0, p0, Lg9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg9;->d:Ljava/lang/Object;

    iput-object p2, p0, Lg9;->b:Ljava/lang/Object;

    iput-object p3, p0, Lg9;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 33

    move-object/from16 v0, p0

    iget-byte v1, v0, Lg9;->a:B

    const/4 v3, 0x0

    const/4 v4, 0x7

    sget-object v5, Lhh5;->a:Lzpa;

    const/16 v6, 0x9

    const/16 v7, 0x181

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x1

    iget-object v11, v0, Lg9;->c:Ljava/lang/Object;

    iget-object v12, v0, Lg9;->d:Ljava/lang/Object;

    iget-object v0, v0, Lg9;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_6d2

    check-cast v0, Lsjl;

    check-cast v12, [Ljava/lang/Object;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10}, Laoh;->m(I)I

    move-result v2

    invoke-virtual {v0, v12, v11, v1, v2}, Lsjl;->b([Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_33
    check-cast v0, Ln01;

    check-cast v11, Ljava/lang/String;

    check-cast v12, Lue5;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lkfo;->n(Ln01;Ljava/lang/String;Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4e
    move-object v3, v0

    check-cast v3, Ly8k;

    move-object v2, v11

    check-cast v2, Lt0g;

    move-object v4, v12

    check-cast v4, Lch5;

    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v5, v1, 0x3

    if-eq v5, v8, :cond_68

    move v9, v10

    :cond_68
    and-int/2addr v1, v10

    move-object v13, v0

    check-cast v13, Lvt9;

    invoke-virtual {v13, v1, v9}, Lvt9;->N(IZ)Z

    move-result v0

    if-eqz v0, :cond_92

    iget-object v0, v3, Ly8k;->c:Likc;

    sget-object v1, Lr9k;->a:Lr9k;

    invoke-static {v0, v1, v13}, Lp37;->c0(Lekc;Ljava/lang/Object;Lvt9;)Lafe;

    move-result-object v5

    sget-object v10, Lnof;->a:Lnof;

    new-instance v1, Lpx0;

    const/16 v6, 0xe

    invoke-direct/range {v1 .. v6}, Lpx0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const v0, 0x6d4c2ae4

    invoke-static {v0, v1, v13}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v12

    const/16 v14, 0x1b6

    const/4 v15, 0x0

    const/4 v11, 0x0

    invoke-static/range {v10 .. v15}, Lrof;->c(Lnof;ZLue5;Lih5;II)V

    goto :goto_95

    :cond_92
    invoke-virtual {v13}, Lvt9;->Q()V

    :goto_95
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_98
    check-cast v0, Lmqh;

    check-cast v11, Lspi;

    check-cast v12, Lqpi;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, v0, Lmqh;->a:F

    sub-float/2addr v1, v2

    invoke-virtual {v11, v1}, Lspi;->e(F)F

    move-result v1

    invoke-virtual {v11, v1}, Lspi;->i(F)J

    move-result-wide v1

    iget-object v3, v12, Lqpi;->a:Lspi;

    iget-object v4, v3, Lspi;->k:Ltoi;

    invoke-virtual {v3, v4, v1, v2, v10}, Lspi;->d(Ltoi;JI)J

    move-result-wide v1

    invoke-virtual {v11, v1, v2}, Lspi;->h(J)F

    move-result v1

    invoke-virtual {v11, v1}, Lspi;->e(F)F

    move-result v1

    iget v2, v0, Lmqh;->a:F

    add-float/2addr v2, v1

    iput v2, v0, Lmqh;->a:F

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_d0
    check-cast v0, Ljava/util/List;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    check-cast v12, Ljava/util/ArrayList;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v6, v2, 0x3

    if-eq v6, v8, :cond_e8

    move v6, v10

    goto :goto_e9

    :cond_e8
    move v6, v9

    :goto_e9
    and-int/2addr v2, v10

    check-cast v1, Lvt9;

    invoke-virtual {v1, v2, v6}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_14b

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_150

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v6, v9, 0x1

    if-ltz v9, :cond_147

    check-cast v2, Lrdf;

    invoke-virtual {v1, v11}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v7

    invoke-virtual {v1, v2}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v7, v8

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v8

    if-nez v7, :cond_119

    if-ne v8, v5, :cond_121

    :cond_119
    new-instance v8, Ls4f;

    invoke-direct {v8, v11, v2, v4}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v8}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_121
    move-object v13, v8

    check-cast v13, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v14, v7

    check-cast v14, Ljava/lang/String;

    iget-boolean v2, v2, Lrdf;->b:Z

    const/16 v24, 0x0

    const/16 v25, 0xfbc

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v23, v1

    move/from16 v19, v2

    invoke-static/range {v13 .. v25}, Lvtp;->j(Lkotlin/jvm/functions/Function0;Ljava/lang/String;Lc8e;Likl;Lu8i;Lgyi;ZFLhyf;Lgo3;Lih5;II)V

    move v9, v6

    goto :goto_f8

    :cond_147
    invoke-static {}, Lj95;->n()V

    throw v3

    :cond_14b
    move-object/from16 v23, v1

    invoke-virtual/range {v23 .. v23}, Lvt9;->Q()V

    :cond_150
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_153
    check-cast v0, Llld;

    check-cast v11, Laof;

    check-cast v12, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lic4;->b(Llld;Laof;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_16e
    check-cast v0, Lue5;

    check-cast v11, Lwd9;

    check-cast v12, Lue5;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    and-int/lit8 v4, v2, 0x3

    if-eq v4, v8, :cond_18a

    move v4, v10

    goto :goto_18b

    :cond_18a
    move v4, v9

    :goto_18b
    and-int/2addr v2, v10

    check-cast v1, Lvt9;

    invoke-virtual {v1, v2, v4}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_1ad

    invoke-virtual {v0, v11, v1, v3}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v12, :cond_1a3

    const v0, -0x29876ff5

    invoke-virtual {v1, v0}, Lvt9;->W(I)V

    :goto_19f
    invoke-virtual {v1, v9}, Lvt9;->p(Z)V

    goto :goto_1b0

    :cond_1a3
    const v0, -0x646fb94a

    invoke-virtual {v1, v0}, Lvt9;->W(I)V

    invoke-virtual {v12, v11, v1, v3}, Lue5;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19f

    :cond_1ad
    invoke-virtual {v1}, Lvt9;->Q()V

    :goto_1b0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1b3
    move-object v2, v12

    check-cast v2, Lkotlin/jvm/functions/Function0;

    check-cast v0, Lrul;

    check-cast v11, Lkotlin/jvm/functions/Function0;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v3, p2

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    and-int/lit8 v4, v3, 0x3

    if-eq v4, v8, :cond_1cb

    move v9, v10

    :cond_1cb
    and-int/2addr v3, v10

    check-cast v1, Lvt9;

    invoke-virtual {v1, v3, v9}, Lvt9;->N(IZ)Z

    move-result v3

    if-eqz v3, :cond_1f7

    const v3, 0x7f1409d6

    invoke-static {v1, v3}, Lmzg;->q(Lih5;I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ly35;

    invoke-direct {v4, v11, v10}, Ly35;-><init>(Lkotlin/jvm/functions/Function0;B)V

    const v5, -0x53c65bcb

    invoke-static {v5, v4, v1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v9

    const/high16 v11, 0x6000000

    const/16 v12, 0x7c

    move-object v10, v1

    move-object v1, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v8, v0

    invoke-static/range {v1 .. v12}, Lzi4;->f(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lc8e;Ltof;Lhyf;Ljava/lang/String;Lcec;Lrul;Lue5;Lih5;II)V

    goto :goto_1fb

    :cond_1f7
    move-object v10, v1

    invoke-virtual {v10}, Lvt9;->Q()V

    :goto_1fb
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1fe
    check-cast v0, Ljava/lang/String;

    check-cast v11, Ljava/lang/String;

    check-cast v12, Lkotlin/jvm/functions/Function0;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lp37;->g(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_219
    check-cast v0, Lb9c;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    check-cast v12, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lf8c;->d(Lb9c;Lkotlin/jvm/functions/Function1;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_234
    check-cast v0, Ll7c;

    check-cast v12, Lkotlin/jvm/functions/Function0;

    check-cast v11, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v12, v11, v1, v2}, Lf8c;->g(Ll7c;Lkotlin/jvm/functions/Function0;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_24f
    check-cast v0, Ljava/lang/String;

    check-cast v11, Lc8e;

    check-cast v12, Lue5;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lf8c;->f(Ljava/lang/String;Lc8e;Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_26a
    check-cast v0, Landroid/content/Context;

    check-cast v11, Lx5f;

    check-cast v12, Lwsf;

    move-object/from16 v1, p1

    check-cast v1, Lhg0;

    move-object/from16 v5, p2

    check-cast v5, Lcom/android/installreferrer/api/ReferrerDetails;

    const-string v7, "install_intent_referrer"

    const-string v13, "play_referrer_install_time"

    const-string v14, "play_referrer_click_time"

    if-eqz v5, :cond_2af

    invoke-static {v0}, Lvtp;->L(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v15

    invoke-interface {v15}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v15

    invoke-virtual {v5}, Lcom/android/installreferrer/api/ReferrerDetails;->getReferrerClickTimestampSeconds()J

    move-result-wide v16

    const-wide/16 v18, 0x3e8

    move-object/from16 p0, v5

    mul-long v4, v16, v18

    invoke-interface {v15, v14, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/android/installreferrer/api/ReferrerDetails;->getInstallBeginTimestampSeconds()J

    move-result-wide v16

    mul-long v2, v16, v18

    invoke-interface {v4, v13, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual/range {p0 .. p0}, Lcom/android/installreferrer/api/ReferrerDetails;->getInstallReferrer()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2ac

    :try_start_2a5
    invoke-static {v2}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v15, v7, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_2ac
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2a5 .. :try_end_2ac} :catch_2ac

    :catch_2ac
    :cond_2ac
    invoke-interface {v15}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_2af
    invoke-static {v0, v9}, Lvtp;->H(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v10}, Lvtp;->H(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0}, Lvtp;->L(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v7, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v9}, Lvtp;->N(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0}, Lvtp;->J(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0}, Letg;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v0}, Lvtp;->L(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v15

    move-object/from16 p0, v7

    const-wide/16 v6, -0x1

    move/from16 v18, v10

    invoke-interface {v15, v13, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    invoke-static {v0}, Lvtp;->L(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v15

    invoke-interface {v15, v14, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v14

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    iget-object v6, v11, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    move-object/from16 v19, v0

    invoke-virtual {v7, v6}, Lx56;->y(Lzpa;)Lra0;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Li90;

    const/4 v8, 0x5

    if-eqz v22, :cond_309

    move-object/from16 v24, v11

    move-object/from16 v23, v13

    move/from16 v11, v18

    move-object/from16 v0, v22

    const/4 v13, 0x2

    move-object/from16 v22, v12

    goto :goto_322

    :cond_309
    move-object/from16 v22, v12

    new-instance v12, Li90;

    move-object/from16 v23, v13

    const/16 v13, 0x98b

    move-object/from16 v24, v11

    move/from16 v11, v18

    invoke-direct {v12, v13, v11, v8}, Ljf0;-><init>(III)V

    const/4 v13, 0x2

    invoke-virtual {v0, v13, v11, v12}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v13}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li90;

    :goto_322
    invoke-static {v11, v2}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/4 v8, 0x0

    invoke-virtual {v0, v8, v12}, Li90;->x(ILjava/lang/String;)V

    const/4 v8, 0x3

    invoke-static {v8, v2}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v13, v12}, Li90;->x(ILjava/lang/String;)V

    const/4 v12, 0x4

    invoke-static {v12, v2}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v11, v13}, Li90;->x(ILjava/lang/String;)V

    const/4 v13, 0x5

    invoke-static {v13, v2}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v8, v11}, Li90;->x(ILjava/lang/String;)V

    const/4 v11, 0x2

    invoke-static {v11, v2}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v12, v13}, Li90;->x(ILjava/lang/String;)V

    invoke-virtual {v7, v6}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v0

    invoke-static {v12, v5}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v8, v6}, Lin0;->x(ILjava/lang/String;)V

    const/4 v11, 0x1

    invoke-static {v11, v5}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v12, v6}, Lin0;->x(ILjava/lang/String;)V

    invoke-static {v8, v5}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x5

    invoke-virtual {v0, v13, v6}, Lin0;->x(ILjava/lang/String;)V

    const/4 v6, 0x6

    invoke-virtual {v0, v6, v5}, Lin0;->x(ILjava/lang/String;)V

    move-object/from16 v5, p0

    invoke-static {v12, v5}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x7

    invoke-virtual {v0, v13, v6}, Lin0;->x(ILjava/lang/String;)V

    const/16 v6, 0x8

    invoke-static {v11, v5}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v6, v13}, Lin0;->x(ILjava/lang/String;)V

    invoke-static {v8, v5}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/16 v8, 0x9

    invoke-virtual {v0, v8, v6}, Lin0;->x(ILjava/lang/String;)V

    const/16 v6, 0xa

    invoke-virtual {v0, v6, v5}, Lin0;->x(ILjava/lang/String;)V

    const/16 v5, 0xb

    invoke-virtual {v0, v5, v2}, Lin0;->x(ILjava/lang/String;)V

    const/16 v5, 0xc

    invoke-virtual {v0, v5, v4}, Lin0;->x(ILjava/lang/String;)V

    const/16 v5, 0xd

    invoke-static {v12, v4}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lin0;->x(ILjava/lang/String;)V

    const/16 v5, 0xe

    const/4 v11, 0x1

    invoke-static {v11, v4}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v5, v4}, Lin0;->x(ILjava/lang/String;)V

    const-wide/16 v4, 0x0

    cmp-long v6, v9, v4

    if-ltz v6, :cond_3b2

    const/16 v6, 0x25

    invoke-virtual {v0, v6, v11, v9, v10}, Ljf0;->p(IIJ)V

    :cond_3b2
    cmp-long v4, v14, v4

    if-ltz v4, :cond_3bb

    const/16 v4, 0x26

    invoke-virtual {v0, v4, v11, v14, v15}, Ljf0;->p(IIJ)V

    :cond_3bb
    if-nez v1, :cond_3bf

    const/4 v9, 0x0

    goto :goto_3c0

    :cond_3bf
    move v9, v11

    :goto_3c0
    const/16 v4, 0xf

    invoke-virtual {v0, v4, v9, v1}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1, v11, v3}, Ljf0;->r(IIZ)V

    const/4 v13, 0x7

    invoke-static {v13, v2}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x11

    invoke-virtual {v0, v3, v1}, Lin0;->x(ILjava/lang/String;)V

    move-object/from16 v11, v24

    invoke-virtual {v11, v7}, Lx5f;->U0(Lx56;)V

    sget-object v0, Lhs3;->a:Ln9a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static/range {v19 .. v19}, Ln9a;->t(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v19 .. v19}, Lvtp;->J(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v19 .. v19}, Letg;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v19 .. v19}, Lvtp;->L(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    move-object/from16 v1, v23

    const-wide/16 v3, -0x1

    invoke-interface {v0, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v28

    new-instance v23, Lai;

    move-object/from16 v27, v2

    invoke-direct/range {v23 .. v28}, Lai;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    move-object/from16 v12, v22

    move-object/from16 v1, v23

    move-object/from16 v0, v27

    invoke-virtual {v12, v1}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-static/range {v19 .. v19}, Lhd;->o(Landroid/content/Context;)Lhd;

    move-result-object v1

    iget-object v1, v1, Lhd;->f:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-static {v1}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "npt_install_referrer"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/16 v29, 0x2

    invoke-static/range {v29 .. v29}, Lcak;->a(I)V

    const/16 v0, 0x22

    move-object/from16 v1, v19

    const/4 v11, 0x1

    invoke-static {v11, v1}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lks3;->I(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_437
    check-cast v0, Lhea;

    check-cast v12, Lkotlin/jvm/functions/Function0;

    check-cast v11, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v2, 0x189

    invoke-static {v2}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v12, v11, v1, v2}, Ly9m;->g(Lhea;Lkotlin/jvm/functions/Function0;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_454
    check-cast v0, Lzca;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    check-cast v12, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v18, 0x1

    invoke-static/range {v18 .. v18}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Ly9m;->i(Lzca;Lkotlin/jvm/functions/Function1;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_471
    move/from16 v18, v10

    check-cast v0, Ljava/lang/Boolean;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    check-cast v12, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static/range {v18 .. v18}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Laib;->b(Ljava/lang/Boolean;Lkotlin/jvm/functions/Function1;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_48e
    check-cast v0, Lg1b;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    check-cast v12, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v16, 0x9

    invoke-static/range {v16 .. v16}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Laib;->f(Lg1b;Lkotlin/jvm/functions/Function1;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4ab
    check-cast v0, Lc8e;

    check-cast v11, Ldil;

    check-cast v12, Lue5;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lcs5;->g(Lc8e;Ldil;Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4c6
    check-cast v0, Lv31;

    check-cast v11, Ltb1;

    check-cast v12, Lue5;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v18, 0x1

    invoke-static/range {v18 .. v18}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lmi5;->a(Lv31;Ltb1;Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4e3
    move/from16 v18, v10

    check-cast v0, Lpej;

    check-cast v12, Lkotlin/jvm/functions/Function0;

    check-cast v11, Lue5;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static/range {v18 .. v18}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v12, v11, v1, v2}, Lwyh;->f(Lpej;Lkotlin/jvm/functions/Function0;Lue5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_500
    check-cast v0, Ldg5;

    check-cast v11, Lxg5;

    check-cast v12, Lue5;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v3, v2, 0x3

    const/4 v13, 0x2

    if-eq v3, v13, :cond_51b

    const/4 v9, 0x1

    :goto_518
    const/16 v18, 0x1

    goto :goto_51d

    :cond_51b
    const/4 v9, 0x0

    goto :goto_518

    :goto_51d
    and-int/lit8 v2, v2, 0x1

    check-cast v1, Lvt9;

    invoke-virtual {v1, v2, v9}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_53b

    new-instance v2, Lfx0;

    const/16 v3, 0x11

    invoke-direct {v2, v11, v12, v3}, Lfx0;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const v3, 0x542ec881

    invoke-static {v3, v2, v1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v2

    const/16 v3, 0x30

    invoke-static {v0, v2, v1, v3}, Liba;->a(Ldg5;Lue5;Lih5;I)V

    goto :goto_53e

    :cond_53b
    invoke-virtual {v1}, Lvt9;->Q()V

    :goto_53e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_541
    check-cast v0, Lxvf;

    check-cast v12, Lg1b;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v18, 0x1

    invoke-static/range {v18 .. v18}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v12, v11, v1, v2}, Lkfo;->a(Lxvf;Lg1b;Lkotlin/jvm/functions/Function1;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_55e
    move/from16 v18, v10

    check-cast v0, Lg1b;

    check-cast v11, Ljava/lang/Integer;

    check-cast v12, Lkotlin/jvm/functions/Function0;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static/range {v18 .. v18}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lz5i;->a(Lg1b;Ljava/lang/Integer;Lkotlin/jvm/functions/Function0;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_57b
    move/from16 v18, v10

    check-cast v0, Ljava/lang/Integer;

    check-cast v12, Lkotlin/jvm/functions/Function0;

    check-cast v11, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static/range {v18 .. v18}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v12, v11, v1, v2}, Ljpo;->e(Ljava/lang/Integer;Lkotlin/jvm/functions/Function0;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_598
    check-cast v0, Lgpm;

    check-cast v11, Lo13;

    check-cast v12, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lwxe;->b(Lgpm;Lo13;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5b3
    check-cast v0, Lj23;

    check-cast v11, Lkotlin/jvm/functions/Function2;

    check-cast v12, Lc8e;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lwxe;->a(Lj23;Lkotlin/jvm/functions/Function2;Lc8e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5ce
    check-cast v0, Lu22;

    check-cast v11, Lb2l;

    check-cast v12, Lb22;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v0}, Lu22;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_60a

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_5f8

    check-cast v11, Ld7l;

    invoke-virtual {v11}, Ld7l;->g0()Ljava/lang/String;

    move-result-object v1

    :cond_5f8
    move-object v4, v1

    iget-object v0, v12, Lb22;->y:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luv0;

    iget-object v3, v0, Luv0;->d:Lwth;

    const/4 v9, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x3

    const/4 v7, 0x1

    invoke-virtual/range {v3 .. v9}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    :cond_60a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_60d
    check-cast v0, Lc8e;

    check-cast v11, Lafe;

    check-cast v12, Lue5;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v3, v2, 0x3

    const/4 v13, 0x2

    if-eq v3, v13, :cond_628

    const/4 v3, 0x1

    :goto_625
    const/16 v18, 0x1

    goto :goto_62a

    :cond_628
    const/4 v3, 0x0

    goto :goto_625

    :goto_62a
    and-int/lit8 v2, v2, 0x1

    check-cast v1, Lvt9;

    invoke-virtual {v1, v2, v3}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_694

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v5, :cond_643

    new-instance v2, Lgb1;

    const/4 v8, 0x0

    invoke-direct {v2, v11, v8}, Lgb1;-><init>(Lafe;B)V

    invoke-virtual {v1, v2}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_643
    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v2}, Lna2;->H(Lc8e;Lkotlin/jvm/functions/Function1;)Lc8e;

    move-result-object v0

    sget-object v2, Lrbe;->b:Ltd3;

    const/4 v11, 0x1

    invoke-static {v2, v11}, Lnr3;->c(Ltd3;Z)Ltfd;

    move-result-object v2

    iget-wide v3, v1, Lvt9;->T:J

    invoke-static {v3, v4}, Ljava/lang/Long;->hashCode(J)I

    move-result v3

    invoke-virtual {v1}, Lvt9;->l()Loag;

    move-result-object v4

    invoke-static {v1, v0}, Lqyn;->P(Lih5;Lc8e;)Lc8e;

    move-result-object v0

    sget-object v5, Lbh5;->To:Lujp;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lvt9;->a0()V

    iget-boolean v5, v1, Lvt9;->S:Z

    if-eqz v5, :cond_670

    sget-object v5, Lm3c;->S:Lfza;

    invoke-virtual {v1, v5}, Lvt9;->k(Lkotlin/jvm/functions/Function0;)V

    goto :goto_673

    :cond_670
    invoke-virtual {v1}, Lvt9;->j0()V

    :goto_673
    sget-object v5, Lujp;->f:Lah5;

    invoke-static {v1, v2, v5}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    sget-object v2, Lujp;->e:Lah5;

    invoke-static {v1, v4, v2}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Lujp;->g:Lah5;

    invoke-static {v1, v2, v3}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v1}, Ly4h;->m(Lih5;)V

    sget-object v2, Lujp;->d:Lah5;

    invoke-static {v1, v0, v2}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    const/4 v8, 0x0

    const/4 v11, 0x1

    invoke-static {v8, v12, v1, v11}, Lo18;->r(ILue5;Lvt9;Z)V

    goto :goto_697

    :cond_694
    invoke-virtual {v1}, Lvt9;->Q()V

    :goto_697
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_69a
    check-cast v0, Lfd;

    check-cast v11, Lpc;

    check-cast v12, Ljf;

    move-object/from16 v1, p1

    check-cast v1, Landroid/view/View;

    move-object/from16 v2, p2

    check-cast v2, Lef;

    iget-object v0, v0, Lfd;->a:Lwhf;

    invoke-virtual {v0, v11, v2}, Lwhf;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v12, Ljf;->a:Lkotlin/jvm/functions/Function2;

    invoke-interface {v0, v1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6b5
    check-cast v0, Lndc;

    check-cast v11, Lkotlin/jvm/functions/Function1;

    check-cast v12, Lkotlin/jvm/functions/Function0;

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v18, 0x1

    invoke-static/range {v18 .. v18}, Laoh;->m(I)I

    move-result v2

    invoke-static {v0, v11, v12, v1, v2}, Lfr3;->b(Lndc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_6d2
    .packed-switch 0x0
        :pswitch_6b5
        :pswitch_69a
        :pswitch_60d
        :pswitch_5ce
        :pswitch_5b3
        :pswitch_598
        :pswitch_57b
        :pswitch_55e
        :pswitch_541
        :pswitch_500
        :pswitch_4e3
        :pswitch_4c6
        :pswitch_4ab
        :pswitch_48e
        :pswitch_471
        :pswitch_454
        :pswitch_437
        :pswitch_26a
        :pswitch_24f
        :pswitch_234
        :pswitch_219
        :pswitch_1fe
        :pswitch_1b3
        :pswitch_16e
        :pswitch_153
        :pswitch_d0
        :pswitch_98
        :pswitch_4e
        :pswitch_33
    .end packed-switch
.end method
