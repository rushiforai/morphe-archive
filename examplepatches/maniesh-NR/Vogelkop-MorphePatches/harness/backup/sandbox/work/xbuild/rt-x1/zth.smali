.class public interface abstract Lzth;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lzth;Ltth;ILnt5;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p3

    instance-of v1, v0, Lyth;

    if-eqz v1, :cond_17

    move-object v1, v0

    check-cast v1, Lyth;

    iget v2, v1, Lyth;->C:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_17

    sub-int/2addr v2, v3

    iput v2, v1, Lyth;->C:I

    move-object/from16 v2, p0

    goto :goto_1e

    :cond_17
    new-instance v1, Lyth;

    move-object/from16 v2, p0

    invoke-direct {v1, v2, v0}, Lyth;-><init>(Lzth;Lnt5;)V

    :goto_1e
    iget-object v0, v1, Lyth;->A:Ljava/lang/Object;

    sget-object v3, Lpx5;->a:Lpx5;

    iget v4, v1, Lyth;->C:I

    const-string v5, "\': "

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v4, :cond_70

    if-eq v4, v7, :cond_4e

    if-ne v4, v6, :cond_48

    iget v2, v1, Lyth;->y:I

    iget-byte v4, v1, Lyth;->x:B

    iget-object v9, v1, Lyth;->w:Lpqh;

    iget-object v10, v1, Lyth;->v:Lhzc;

    iget-object v11, v1, Lyth;->u:Ltth;

    iget-object v12, v1, Lyth;->t:Lzth;

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 p3, v9

    move-object v9, v1

    move-object v1, v11

    move-object/from16 v11, p3

    move/from16 p3, v7

    goto/16 :goto_164

    :cond_48
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v8

    :cond_4e
    iget v2, v1, Lyth;->z:I

    iget v4, v1, Lyth;->y:I

    iget-byte v9, v1, Lyth;->x:B

    iget-object v10, v1, Lyth;->w:Lpqh;

    iget-object v11, v1, Lyth;->v:Lhzc;

    iget-object v12, v1, Lyth;->u:Ltth;

    iget-object v13, v1, Lyth;->t:Lzth;

    :try_start_5c
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_5f
    .catch Lhth; {:try_start_5c .. :try_end_5f} :catch_109
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_63

    move/from16 p3, v7

    goto/16 :goto_ce

    :catch_63
    move-exception v0

    move-object/from16 p3, v10

    move v10, v2

    move v2, v4

    move-object v4, v12

    move-object v12, v11

    move-object/from16 v11, p3

    move/from16 p3, v7

    goto/16 :goto_11c

    :cond_70
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object v0, Lhzc;->c:Lgzc;

    const-string v4, "RemoteNode"

    invoke-virtual {v0, v4}, Lhzc;->c(Ljava/lang/String;)Lhzc;

    move-result-object v0

    new-instance v4, Lpqh;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    const/4 v9, 0x0

    move-object v12, v0

    move-object v11, v4

    move v10, v9

    move/from16 v4, p2

    move-object v9, v1

    move-object/from16 v1, p1

    :goto_89
    if-ge v10, v4, :cond_197

    :try_start_8b
    new-instance v0, Lqfb;

    iget-object v13, v1, Ltth;->a:Ljava/lang/String;

    iget-object v14, v1, Ltth;->b:[Lkotlinx/serialization/json/b;

    array-length v15, v14

    invoke-static {v14, v15}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v14

    check-cast v14, [Lkotlinx/serialization/json/b;

    invoke-direct {v0, v13, v14}, Lqfb;-><init>(Ljava/lang/String;[Lkotlinx/serialization/json/b;)V

    iput-object v2, v9, Lyth;->t:Lzth;

    iput-object v1, v9, Lyth;->u:Ltth;

    iput-object v12, v9, Lyth;->v:Lhzc;

    iput-object v11, v9, Lyth;->w:Lpqh;

    iput-byte v4, v9, Lyth;->x:B

    iput v10, v9, Lyth;->y:I

    iput v10, v9, Lyth;->z:I

    iput v7, v9, Lyth;->C:I

    move-object v13, v2

    check-cast v13, Lece;

    iget-object v14, v13, Lece;->c:Lcb7;

    check-cast v14, Lkzd;

    iget-object v14, v14, Lkzd;->a:Lab7;

    invoke-interface {v14}, Lab7;->c()Ldx5;

    move-result-object v14

    new-instance v15, Lp71;
    :try_end_ba
    .catch Lhth; {:try_start_8b .. :try_end_ba} :catch_118
    .catch Ljava/io/IOException; {:try_start_8b .. :try_end_ba} :catch_10e

    move/from16 p3, v7

    const/16 v7, 0x11

    :try_start_be
    invoke-direct {v15, v13, v0, v8, v7}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v14, v15, v9}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v0
    :try_end_c5
    .catch Lhth; {:try_start_be .. :try_end_c5} :catch_118
    .catch Ljava/io/IOException; {:try_start_be .. :try_end_c5} :catch_10c

    if-eq v0, v3, :cond_15d

    move v2, v10

    move-object v10, v11

    move-object v11, v12

    move-object v12, v1

    move-object v1, v9

    move v9, v4

    move v4, v2

    :goto_ce
    :try_start_ce
    check-cast v0, Ljava/lang/String;

    invoke-static {v0, v12}, Ly4h;->s(Ljava/lang/String;Ltth;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v11}, Lhzc;->a()Ljava/lang/String;

    move-result-object v7

    sget-object v14, Leaj;->c:Leaj;

    iget-object v15, v11, Lhzc;->a:Letb;

    iget-object v15, v15, Letb;->a:Leaj;

    invoke-virtual {v15, v14}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v15

    if-gtz v15, :cond_fe

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Got result from remote method \'"

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v11, v14, v7, v6, v8}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_fe
    .catch Lhth; {:try_start_ce .. :try_end_fe} :catch_109
    .catch Ljava/io/IOException; {:try_start_ce .. :try_end_fe} :catch_ff

    :cond_fe
    return-object v0

    :catch_ff
    move-exception v0

    move-object/from16 v16, v10

    move v10, v2

    move v2, v4

    move-object v4, v12

    move-object v12, v11

    move-object/from16 v11, v16

    goto :goto_11c

    :catch_109
    move-exception v0

    goto/16 :goto_16d

    :catch_10c
    move-exception v0

    goto :goto_111

    :catch_10e
    move-exception v0

    move/from16 p3, v7

    :goto_111
    move v13, v4

    move-object v4, v1

    move-object v1, v9

    move v9, v13

    move-object v13, v2

    move v2, v10

    goto :goto_11c

    :catch_118
    move-exception v0

    move-object v11, v12

    move-object v12, v1

    goto :goto_16d

    :goto_11c
    invoke-virtual {v12}, Lhzc;->a()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Leaj;->c:Leaj;

    iget-object v14, v12, Lhzc;->a:Letb;

    iget-object v14, v14, Letb;->a:Leaj;

    invoke-virtual {v14, v7}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v14

    if-gtz v14, :cond_142

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Couldn\'t call remote method \'"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v15, "\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v7, v6, v14, v0}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_142
    iput-object v0, v11, Lpqh;->a:Ljava/lang/Object;

    iput-object v13, v1, Lyth;->t:Lzth;

    iput-object v4, v1, Lyth;->u:Ltth;

    iput-object v12, v1, Lyth;->v:Lhzc;

    iput-object v11, v1, Lyth;->w:Lpqh;

    iput-byte v9, v1, Lyth;->x:B

    iput v2, v1, Lyth;->y:I

    iput v10, v1, Lyth;->z:I

    const/4 v6, 0x2

    iput v6, v1, Lyth;->C:I

    const-wide/16 v14, 0x3e8

    invoke-static {v14, v15, v1}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v3, :cond_15e

    :cond_15d
    return-object v3

    :cond_15e
    move v10, v9

    move-object v9, v1

    move-object v1, v4

    move v4, v10

    move-object v10, v12

    move-object v12, v13

    :goto_164
    add-int/lit8 v0, v2, 0x1

    move/from16 v7, p3

    move-object v2, v12

    move-object v12, v10

    move v10, v0

    goto/16 :goto_89

    :goto_16d
    invoke-virtual {v11}, Lhzc;->a()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Leaj;->c:Leaj;

    iget-object v3, v11, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_196

    iget-object v3, v0, Lhth;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "Got error from remote method \'"

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v1, v3, v8}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_196
    throw v0

    :cond_197
    new-instance v0, Lhth;

    iget-object v2, v11, Lpqh;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Exception;

    if-eqz v2, :cond_1a3

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v8

    :cond_1a3
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Remote method \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\' failed with an error: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v11, Lpqh;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Throwable;

    invoke-direct {v0, v1, v2}, Lhth;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static b(Lzth;Ltth;Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p2, Lxth;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lxth;

    iget v1, v0, Lxth;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lxth;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lxth;

    invoke-direct {v0, p0, p2}, Lxth;-><init>(Lzth;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lxth;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lxth;->w:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v4, :cond_2a

    iget-object p1, v0, Lxth;->t:Ltth;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_61

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lqfb;

    iget-object v2, p1, Ltth;->a:Ljava/lang/String;

    iget-object v5, p1, Ltth;->b:[Lkotlinx/serialization/json/b;

    array-length v6, v5

    invoke-static {v5, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lkotlinx/serialization/json/b;

    invoke-direct {p2, v2, v5}, Lqfb;-><init>(Ljava/lang/String;[Lkotlinx/serialization/json/b;)V

    iput-object p1, v0, Lxth;->t:Ltth;

    iput v4, v0, Lxth;->w:I

    check-cast p0, Lece;

    iget-object v2, p0, Lece;->c:Lcb7;

    check-cast v2, Lkzd;

    iget-object v2, v2, Lkzd;->a:Lab7;

    invoke-interface {v2}, Lab7;->c()Ldx5;

    move-result-object v2

    new-instance v4, Lp71;

    const/16 v5, 0x11

    invoke-direct {v4, p0, p2, v3, v5}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v2, v4, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_61

    return-object v1

    :cond_61
    :goto_61
    check-cast p2, Ljava/lang/String;

    invoke-static {p2, p1}, Ly4h;->s(Ljava/lang/String;Ltth;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static c(Lzth;Ltth;Lnt5;)Ljava/lang/Object;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    invoke-static {p0, p1, v0, p2}, Lzth;->a(Lzth;Ltth;ILnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
