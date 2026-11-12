.class public final synthetic Lof5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpf5;

.field public final synthetic c:Lwf5;


# direct methods
.method public synthetic constructor <init>(Lpf5;Lwf5;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lof5;->a:B

    iput-object p1, p0, Lof5;->b:Lpf5;

    iput-object p2, p0, Lof5;->c:Lwf5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lpf5;Lwf5;I)V
    .registers 4

    const/4 p3, 0x1

    iput-byte p3, p0, Lof5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lof5;->b:Lpf5;

    iput-object p2, p0, Lof5;->c:Lwf5;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    iget-byte v1, v0, Lof5;->a:B

    sget-object v2, Lhh5;->a:Lzpa;

    const/4 v3, 0x0

    iget-object v4, v0, Lof5;->c:Lwf5;

    iget-object v0, v0, Lof5;->b:Lpf5;

    const/4 v5, 0x2

    const/4 v6, 0x3

    const/4 v7, 0x1

    packed-switch v1, :pswitch_data_134

    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v8, p2

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    and-int/lit8 v9, v8, 0x3

    if-eq v9, v5, :cond_22

    move v3, v7

    :cond_22
    and-int/2addr v8, v7

    check-cast v1, Lvt9;

    invoke-virtual {v1, v8, v3}, Lvt9;->N(IZ)Z

    move-result v3

    if-eqz v3, :cond_62

    invoke-virtual {v1, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {v1, v4}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v7

    or-int/2addr v3, v7

    invoke-virtual {v1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v7

    if-nez v3, :cond_3c

    if-ne v7, v2, :cond_44

    :cond_3c
    new-instance v7, Lnf5;

    invoke-direct {v7, v0, v4, v5}, Lnf5;-><init>(Lpf5;Lwf5;B)V

    invoke-virtual {v1, v7}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_44
    move-object v9, v7

    check-cast v9, Lkotlin/jvm/functions/Function0;

    new-instance v2, Lj04;

    invoke-direct {v2, v0, v6}, Lj04;-><init>(Ljava/lang/Object;B)V

    const v0, 0x722280e3

    invoke-static {v0, v2, v1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v15

    const/high16 v17, 0x30000000

    const/16 v18, 0x1fe

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v16, v1

    invoke-static/range {v9 .. v18}, Lyi4;->k(Lkotlin/jvm/functions/Function0;Lc8e;ZLpaj;Lz14;Lzvf;Lue5;Lih5;II)V

    goto :goto_67

    :cond_62
    move-object/from16 v16, v1

    invoke-virtual/range {v16 .. v16}, Lvt9;->Q()V

    :goto_67
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6a
    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v6, p2

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    and-int/lit8 v8, v6, 0x3

    if-eq v8, v5, :cond_7b

    move v3, v7

    :cond_7b
    and-int/2addr v6, v7

    move-object v15, v1

    check-cast v15, Lvt9;

    invoke-virtual {v15, v6, v3}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_ba

    invoke-virtual {v15, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v15, v4}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v1, v3

    invoke-virtual {v15}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    if-nez v1, :cond_96

    if-ne v3, v2, :cond_9e

    :cond_96
    new-instance v3, Lnf5;

    invoke-direct {v3, v0, v4, v7}, Lnf5;-><init>(Lpf5;Lwf5;B)V

    invoke-virtual {v15, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_9e
    move-object v8, v3

    check-cast v8, Lkotlin/jvm/functions/Function0;

    new-instance v1, Llf5;

    invoke-direct {v1, v0}, Llf5;-><init>(Lpf5;)V

    const v0, -0x7fc2febc

    invoke-static {v0, v1, v15}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v14

    const/high16 v16, 0x30000000

    const/16 v17, 0x1fe

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v8 .. v17}, Lyi4;->k(Lkotlin/jvm/functions/Function0;Lc8e;ZLpaj;Lz14;Lzvf;Lue5;Lih5;II)V

    goto :goto_bd

    :cond_ba
    invoke-virtual {v15}, Lvt9;->Q()V

    :goto_bd
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_c0
    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v2

    invoke-virtual {v0, v4, v1, v2}, Lpf5;->content(Lwf5;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_d5
    move-object/from16 v1, p1

    check-cast v1, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v8, v2, 0x3

    if-eq v8, v5, :cond_e6

    move v3, v7

    :cond_e6
    and-int/2addr v2, v7

    check-cast v1, Lvt9;

    invoke-virtual {v1, v2, v3}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_12c

    iget v2, v0, Lpf5;->d:I

    invoke-static {v1, v2}, Lmzg;->q(Lih5;I)Ljava/lang/String;

    move-result-object v9

    iget v2, v0, Lpf5;->e:I

    invoke-static {v1, v2}, Lmzg;->q(Lih5;I)Ljava/lang/String;

    move-result-object v10

    new-instance v2, Lof5;

    invoke-direct {v2, v0, v4, v5}, Lof5;-><init>(Lpf5;Lwf5;B)V

    const v3, -0x13729c5f

    invoke-static {v3, v2, v1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v11

    new-instance v2, Lof5;

    invoke-direct {v2, v0, v4, v6}, Lof5;-><init>(Lpf5;Lwf5;B)V

    const v0, -0x218d1cc0

    invoke-static {v0, v2, v1}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v12

    const v22, 0x36000

    const/16 v23, 0xfc3

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v13, 0x0

    const-wide/16 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v21, v1

    invoke-static/range {v7 .. v23}, Lj14;->h(Lc8e;Ldif;Ljava/lang/String;Ljava/lang/String;Lue5;Lue5;JJIIIZLih5;II)V

    goto :goto_131

    :cond_12c
    move-object/from16 v21, v1

    invoke-virtual/range {v21 .. v21}, Lvt9;->Q()V

    :goto_131
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_134
    .packed-switch 0x0
        :pswitch_d5
        :pswitch_c0
        :pswitch_6a
    .end packed-switch
.end method
