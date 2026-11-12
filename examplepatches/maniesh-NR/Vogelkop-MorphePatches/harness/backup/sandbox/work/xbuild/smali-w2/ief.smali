.class public final synthetic Lief;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldr9;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lnx5;

.field public final synthetic c:Lu6c;

.field public final synthetic d:Lndf;

.field public final synthetic e:Lagm;

.field public final synthetic f:Ljava/util/Map;

.field public final synthetic g:Lfef;

.field public final synthetic h:Lafe;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lnx5;Lu6c;Lndf;Lagm;Ljava/util/Map;Lfef;Lafe;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lief;->a:Ljava/util/List;

    iput-object p2, p0, Lief;->b:Lnx5;

    iput-object p3, p0, Lief;->c:Lu6c;

    iput-object p4, p0, Lief;->d:Lndf;

    iput-object p5, p0, Lief;->e:Lagm;

    iput-object p6, p0, Lief;->f:Ljava/util/Map;

    iput-object p7, p0, Lief;->g:Lfef;

    iput-object p8, p0, Lief;->h:Lafe;

    return-void
.end method


# virtual methods
.method public final j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Ly4c;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move-object/from16 v1, p3

    check-cast v1, Lih5;

    move-object/from16 v2, p4

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v4, v2, 0x30

    const/16 v5, 0x20

    if-nez v4, :cond_2e

    move-object v4, v1

    check-cast v4, Lvt9;

    invoke-virtual {v4, v3}, Lvt9;->d(I)Z

    move-result v4

    if-eqz v4, :cond_2b

    move v4, v5

    goto :goto_2d

    :cond_2b
    const/16 v4, 0x10

    :goto_2d
    or-int/2addr v2, v4

    :cond_2e
    and-int/lit16 v4, v2, 0x91

    const/16 v6, 0x90

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eq v4, v6, :cond_38

    move v4, v8

    goto :goto_39

    :cond_38
    move v4, v7

    :goto_39
    and-int/lit8 v6, v2, 0x1

    check-cast v1, Lvt9;

    invoke-virtual {v1, v6, v4}, Lvt9;->N(IZ)Z

    move-result v4

    if-eqz v4, :cond_d8

    iget-object v4, v0, Lief;->a:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    rem-int v9, v3, v6

    add-int/2addr v9, v6

    rem-int/2addr v9, v6

    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Leef;

    shr-int/lit8 v4, v2, 0x3

    move v6, v7

    iget-object v7, v0, Lief;->d:Lndf;

    iget v9, v7, Lndf;->d:F

    and-int/lit8 v11, v4, 0xe

    xor-int/lit8 v11, v11, 0x6

    const/4 v12, 0x4

    if-le v11, v12, :cond_68

    invoke-virtual {v1, v3}, Lvt9;->d(I)Z

    move-result v11

    if-nez v11, :cond_6c

    :cond_68
    and-int/lit8 v4, v4, 0x6

    if-ne v4, v12, :cond_6e

    :cond_6c
    move v4, v8

    goto :goto_6f

    :cond_6e
    move v4, v6

    :goto_6f
    invoke-virtual {v1, v9}, Lvt9;->c(F)Z

    move-result v9

    or-int/2addr v4, v9

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v9

    move v11, v6

    iget-object v6, v0, Lief;->c:Lu6c;

    sget-object v12, Lhh5;->a:Lzpa;

    if-nez v4, :cond_81

    if-ne v9, v12, :cond_8e

    :cond_81
    new-instance v4, Lq14;

    const/4 v9, 0x5

    invoke-direct {v4, v6, v7, v3, v9}, Lq14;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    invoke-static {v4}, Lluj;->b(Lkotlin/jvm/functions/Function0;)Li37;

    move-result-object v9

    invoke-virtual {v1, v9}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_8e
    check-cast v9, Liak;

    iget-object v4, v0, Lief;->b:Lnx5;

    invoke-virtual {v1, v4}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v13

    invoke-virtual {v1, v6}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v14

    or-int/2addr v13, v14

    invoke-virtual {v1, v7}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v14

    or-int/2addr v13, v14

    and-int/lit8 v2, v2, 0x70

    if-ne v2, v5, :cond_a5

    move v11, v8

    :cond_a5
    or-int/2addr v13, v11

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    if-nez v13, :cond_ae

    if-ne v2, v12, :cond_b9

    :cond_ae
    new-instance v2, Ljef;

    move-object v5, v4

    iget-object v4, v0, Lief;->h:Lafe;

    invoke-direct/range {v2 .. v7}, Ljef;-><init>(ILafe;Lnx5;Lu6c;Lndf;)V

    invoke-virtual {v1, v2}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_b9
    check-cast v2, Lkotlin/jvm/functions/Function0;

    invoke-interface {v9}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v11

    iget-wide v13, v7, Lndf;->a:J

    const/16 v18, 0x0

    iget-object v12, v0, Lief;->e:Lagm;

    iget-object v15, v0, Lief;->f:Ljava/util/Map;

    iget-object v0, v0, Lief;->g:Lfef;

    move-object/from16 v16, v0

    move-object/from16 v17, v1

    move-object v9, v2

    invoke-static/range {v9 .. v18}, Lfr3;->d(Lkotlin/jvm/functions/Function0;Leef;FLagm;JLjava/util/Map;Lfef;Lih5;I)V

    goto :goto_dd

    :cond_d8
    move-object/from16 v17, v1

    invoke-virtual/range {v17 .. v17}, Lvt9;->Q()V

    :goto_dd
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method
