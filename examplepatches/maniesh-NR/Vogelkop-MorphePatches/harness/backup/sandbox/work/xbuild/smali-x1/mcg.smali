.class public final synthetic Lmcg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Locg;


# direct methods
.method public synthetic constructor <init>(Locg;B)V
    .registers 3

    iput-byte p2, p0, Lmcg;->a:B

    iput-object p1, p0, Lmcg;->b:Locg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Lmcg;->a:B

    iget-object v0, v0, Lmcg;->b:Locg;

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v1, :pswitch_data_100

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v5, p2

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    and-int/lit8 v6, v5, 0x3

    if-eq v6, v2, :cond_1e

    move v6, v4

    goto :goto_1f

    :cond_1e
    move v6, v3

    :goto_1f
    and-int/2addr v5, v4

    check-cast v1, Lvt9;

    invoke-virtual {v1, v5, v6}, Lvt9;->N(IZ)Z

    move-result v5

    if-eqz v5, :cond_c6

    invoke-virtual {v0}, Locg;->f0()Lzcg;

    move-result-object v5

    iget-object v10, v5, Lzcg;->p:Leef;

    invoke-virtual {v0}, Locg;->f0()Lzcg;

    move-result-object v5

    iget-object v5, v5, Lzcg;->n:Lwnm;

    sget-object v6, Ll08;->a:Ll08;

    invoke-static {v5, v6, v1}, Lp37;->c0(Lekc;Ljava/lang/Object;Lvt9;)Lafe;

    move-result-object v5

    sget-object v6, Lj41;->a:Lhp7;

    invoke-virtual {v1, v6}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/res/Configuration;

    iget v6, v6, Landroid/content/res/Configuration;->orientation:I

    if-ne v6, v4, :cond_48

    move v7, v4

    goto :goto_49

    :cond_48
    move v7, v3

    :goto_49
    iget-object v8, v0, Locg;->a:Lkotlin/Pair;

    invoke-virtual {v0}, Locg;->f0()Lzcg;

    move-result-object v6

    iget-object v9, v6, Lzcg;->m:Ljava/util/List;

    invoke-virtual {v1, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v6

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v11

    sget-object v12, Lhh5;->a:Lzpa;

    if-nez v6, :cond_5f

    if-ne v11, v12, :cond_67

    :cond_5f
    new-instance v11, Lncg;

    invoke-direct {v11, v0, v3}, Lncg;-><init>(Locg;B)V

    invoke-virtual {v1, v11}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_67
    check-cast v11, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v1, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v6

    if-nez v3, :cond_75

    if-ne v6, v12, :cond_7d

    :cond_75
    new-instance v6, Lncg;

    invoke-direct {v6, v0, v4}, Lncg;-><init>(Locg;B)V

    invoke-virtual {v1, v6}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_7d
    check-cast v6, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v0}, Locg;->f0()Lzcg;

    move-result-object v3

    iget-object v13, v3, Lzcg;->o:Lagm;

    invoke-interface {v5}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Ljava/util/List;

    invoke-virtual {v1, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v3, :cond_98

    if-ne v4, v12, :cond_a0

    :cond_98
    new-instance v4, Lncg;

    invoke-direct {v4, v0, v2}, Lncg;-><init>(Locg;B)V

    invoke-virtual {v1, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_a0
    move-object v15, v4

    check-cast v15, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v1, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    if-nez v2, :cond_af

    if-ne v3, v12, :cond_b9

    :cond_af
    new-instance v3, Ld8e;

    const/16 v2, 0xd

    invoke-direct {v3, v0, v2}, Ld8e;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_b9
    move-object/from16 v16, v3

    check-cast v16, Lkotlin/jvm/functions/Function0;

    const/16 v18, 0x1000

    move-object/from16 v17, v1

    move-object v12, v6

    invoke-static/range {v7 .. v18}, Lp37;->i(ZLkotlin/Pair;Ljava/util/List;Leef;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lagm;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lih5;I)V

    goto :goto_cb

    :cond_c6
    move-object/from16 v17, v1

    invoke-virtual/range {v17 .. v17}, Lvt9;->Q()V

    :goto_cb
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ce
    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v5, p2

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    and-int/lit8 v6, v5, 0x3

    if-eq v6, v2, :cond_df

    move v3, v4

    :cond_df
    and-int/2addr v5, v4

    check-cast v1, Lvt9;

    invoke-virtual {v1, v5, v3}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_f9

    new-instance v2, Lmcg;

    invoke-direct {v2, v0, v4}, Lmcg;-><init>(Locg;B)V

    const v0, 0x723ee9f8

    invoke-static {v0, v2, v1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v0

    const/4 v2, 0x6

    invoke-static {v0, v1, v2}, Lrof;->a(Lue5;Lih5;I)V

    goto :goto_fc

    :cond_f9
    invoke-virtual {v1}, Lvt9;->Q()V

    :goto_fc
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_100
    .packed-switch 0x0
        :pswitch_ce
    .end packed-switch
.end method
