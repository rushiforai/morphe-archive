.class public final Lj0m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx0m;

.field public final b:Lcb7;

.field public final c:Lhzc;


# direct methods
.method public constructor <init>(Lx0m;Lcb7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj0m;->a:Lx0m;

    iput-object p2, p0, Lj0m;->b:Lcb7;

    sget-object p1, Lhzc;->c:Lgzc;

    const-string p2, "TransactionCreator"

    invoke-virtual {p1, p2}, Lhzc;->c(Ljava/lang/String;)Lhzc;

    move-result-object p1

    iput-object p1, p0, Lj0m;->c:Lhzc;

    return-void
.end method


# virtual methods
.method public final a(Lxzl;Lw8e;Lnt5;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    instance-of v4, v3, Lf0m;

    if-eqz v4, :cond_1b

    move-object v4, v3

    check-cast v4, Lf0m;

    iget v5, v4, Lf0m;->B:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_1b

    sub-int/2addr v5, v6

    iput v5, v4, Lf0m;->B:I

    goto :goto_20

    :cond_1b
    new-instance v4, Lf0m;

    invoke-direct {v4, v0, v3}, Lf0m;-><init>(Lj0m;Lnt5;)V

    :goto_20
    iget-object v3, v4, Lf0m;->z:Ljava/lang/Object;

    sget-object v5, Lpx5;->a:Lpx5;

    iget v6, v4, Lf0m;->B:I

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v6, :cond_4e

    if-eq v6, v8, :cond_39

    if-ne v6, v7, :cond_33

    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    return-object v3

    :cond_33
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v9

    :cond_39
    iget-object v1, v4, Lf0m;->y:Lrzl;

    iget-object v2, v4, Lf0m;->x:Lw8e;

    iget-object v6, v4, Lf0m;->w:Lw8e;

    iget-object v8, v4, Lf0m;->v:Lw8e;

    iget-object v10, v4, Lf0m;->u:Lyzl;

    iget-object v11, v4, Lf0m;->t:Lw8e;

    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    move-object v12, v6

    move-object v6, v3

    move-object v3, v2

    move-object v2, v11

    goto/16 :goto_c6

    :cond_4e
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v10, v1, Lxzl;->a:Lyzl;

    iget-object v3, v10, Lyzl;->f:Lrzl;

    if-nez v3, :cond_58

    move-object v3, v9

    :cond_58
    if-eqz v3, :cond_11d

    iget-object v6, v3, Lrzl;->b:Lw8e;

    iget-object v11, v1, Lxzl;->b:Luzl;

    iget-object v11, v11, Luzl;->e:Lw8e;

    invoke-virtual {v6, v11}, Lx8e;->d(Lx8e;)V

    sget-object v12, Lx8e;->Companion:Ln8e;

    iget-object v13, v6, Lw8e;->c:Ljava/math/BigInteger;

    iget-object v14, v11, Lw8e;->c:Ljava/math/BigInteger;

    invoke-virtual {v13, v14}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v13

    iget-object v14, v6, Lw8e;->d:Lh46;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v14}, Ln8e;->a(Ljava/math/BigInteger;Li46;)Lx8e;

    move-result-object v12

    check-cast v12, Lw8e;

    iget-object v13, v12, Lw8e;->c:Ljava/math/BigInteger;

    iget-object v14, v2, Lw8e;->c:Ljava/math/BigInteger;

    invoke-virtual {v13, v14}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v13

    if-gtz v13, :cond_83

    return-object v1

    :cond_83
    invoke-virtual {v2, v11}, Lx8e;->d(Lx8e;)V

    iget-object v1, v2, Lw8e;->c:Ljava/math/BigInteger;

    iget-object v11, v11, Lw8e;->c:Ljava/math/BigInteger;

    invoke-virtual {v1, v11}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    iget-object v11, v2, Lw8e;->d:Lh46;

    invoke-static {v1, v11}, Ln8e;->a(Ljava/math/BigInteger;Li46;)Lx8e;

    move-result-object v1

    check-cast v1, Lw8e;

    iget-object v3, v3, Lrzl;->a:Lwv;

    new-instance v11, Lrzl;

    invoke-direct {v11, v3, v1}, Lrzl;-><init>(Lwv;Lw8e;)V

    iput-object v2, v4, Lf0m;->t:Lw8e;

    iput-object v10, v4, Lf0m;->u:Lyzl;

    iput-object v6, v4, Lf0m;->v:Lw8e;

    iput-object v12, v4, Lf0m;->w:Lw8e;

    iput-object v1, v4, Lf0m;->x:Lw8e;

    iput-object v11, v4, Lf0m;->y:Lrzl;

    iput v8, v4, Lf0m;->B:I

    iget-object v8, v0, Lj0m;->b:Lcb7;

    check-cast v8, Lkzd;

    iget-object v8, v8, Lkzd;->a:Lab7;

    invoke-interface {v8}, Lab7;->a()Ldx5;

    move-result-object v8

    new-instance v13, Ludj;

    const/16 v14, 0x8

    invoke-direct {v13, v3, v1, v9, v14}, Ludj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v8, v13, v4}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v5, :cond_11b

    move-object v8, v6

    move-object v6, v3

    move-object v3, v1

    move-object v1, v11

    :goto_c6
    check-cast v6, Ljava/lang/String;

    iget-object v11, v0, Lj0m;->c:Lhzc;

    iget-object v13, v11, Lhzc;->b:Ljava/lang/String;

    sget-object v14, Leaj;->a:Leaj;

    iget-object v15, v11, Lhzc;->a:Letb;

    iget-object v15, v15, Letb;->a:Leaj;

    invoke-virtual {v15, v14}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v15

    if-gtz v15, :cond_f9

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v7, "Total transaction value exceeds the balance: value="

    invoke-direct {v15, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, ", balance="

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ". New value is "

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v14, v13, v2, v9}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_f9
    const/16 v2, 0x4f

    invoke-static {v10, v6, v1, v9, v2}, Lyzl;->a(Lyzl;Ljava/lang/String;Lrzl;Ljava/math/BigInteger;I)Lyzl;

    move-result-object v1

    new-instance v2, Luzl;

    iget-object v3, v8, Lw8e;->d:Lh46;

    invoke-direct {v2, v3, v9, v9, v9}, Luzl;-><init>(Lh46;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    iput-object v9, v4, Lf0m;->t:Lw8e;

    iput-object v9, v4, Lf0m;->u:Lyzl;

    iput-object v9, v4, Lf0m;->v:Lw8e;

    iput-object v9, v4, Lf0m;->w:Lw8e;

    iput-object v9, v4, Lf0m;->x:Lw8e;

    iput-object v9, v4, Lf0m;->y:Lrzl;

    const/4 v3, 0x2

    iput v3, v4, Lf0m;->B:I

    invoke-virtual {v0, v1, v2, v4}, Lj0m;->c(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v5, :cond_11c

    :cond_11b
    return-object v5

    :cond_11c
    return-object v0

    :cond_11d
    const-string v0, "Required value was null."

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v9
.end method

.method public final b(Lnle;Lwv;Lwv;Lw8e;Lw8e;Lnt5;)Ljava/lang/Object;
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    instance-of v5, v4, Lg0m;

    if-eqz v5, :cond_1d

    move-object v5, v4

    check-cast v5, Lg0m;

    iget v6, v5, Lg0m;->C:I

    const/high16 v7, -0x80000000

    and-int v8, v6, v7

    if-eqz v8, :cond_1d

    sub-int/2addr v6, v7

    iput v6, v5, Lg0m;->C:I

    goto :goto_22

    :cond_1d
    new-instance v5, Lg0m;

    invoke-direct {v5, v0, v4}, Lg0m;-><init>(Lj0m;Lnt5;)V

    :goto_22
    iget-object v4, v5, Lg0m;->A:Ljava/lang/Object;

    sget-object v6, Lpx5;->a:Lpx5;

    iget v7, v5, Lg0m;->C:I

    const/4 v8, 0x4

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v7, :cond_69

    if-eq v7, v11, :cond_52

    if-eq v7, v10, :cond_4a

    if-eq v7, v9, :cond_41

    if-ne v7, v8, :cond_3b

    invoke-static {v4}, Lybh;->y(Ljava/lang/Object;)V

    return-object v4

    :cond_3b
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v12

    :cond_41
    iget-object v1, v5, Lg0m;->z:Lxzl;

    iget-object v2, v5, Lg0m;->v:Lw8e;

    invoke-static {v4}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_16e

    :cond_4a
    iget-object v1, v5, Lg0m;->v:Lw8e;

    invoke-static {v4}, Lybh;->y(Ljava/lang/Object;)V

    move-object v2, v1

    goto/16 :goto_152

    :cond_52
    iget-object v1, v5, Lg0m;->y:Lrzl;

    iget-object v2, v5, Lg0m;->x:Leme;

    iget-object v3, v5, Lg0m;->w:Lw8e;

    iget-object v7, v5, Lg0m;->v:Lw8e;

    iget-object v11, v5, Lg0m;->u:Lwv;

    iget-object v13, v5, Lg0m;->t:Lnle;

    invoke-static {v4}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v19, v1

    move-object v1, v3

    move-object v3, v7

    move-object v15, v11

    move-object v14, v13

    goto/16 :goto_11c

    :cond_69
    invoke-static {v4}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz v3, :cond_e2

    invoke-virtual {v3}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v2}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    sget-object v7, Lhe3;->a:Ljava/math/BigDecimal;

    invoke-virtual {v4, v7}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v7

    if-gez v7, :cond_e2

    invoke-virtual {v4}, Ljava/math/BigDecimal;->abs()Ljava/math/BigDecimal;

    move-result-object v4

    iget-object v7, v2, Lw8e;->d:Lh46;

    iget v7, v7, Lh46;->d:I

    invoke-static {v7}, Ly8e;->b(I)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v4

    iget-object v7, v0, Lj0m;->c:Lhzc;

    iget-object v13, v7, Lhzc;->b:Ljava/lang/String;

    const-string v14, ", balance="

    if-gtz v4, :cond_bf

    sget-object v4, Leaj;->b:Leaj;

    iget-object v15, v7, Lhzc;->a:Letb;

    iget-object v15, v15, Letb;->a:Leaj;

    invoke-virtual {v15, v4}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v15

    if-gtz v15, :cond_bd

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v8, "Requested transfer of slightly more money than the balance: money="

    invoke-direct {v15, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v4, v13, v2, v12}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_bd
    move-object v2, v3

    goto :goto_e2

    :cond_bf
    sget-object v4, Leaj;->e:Leaj;

    iget-object v8, v7, Lhzc;->a:Letb;

    iget-object v8, v8, Letb;->a:Leaj;

    invoke-virtual {v8, v4}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gtz v8, :cond_e2

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v15, "Requested transfer of significantly more money than the balance: money="

    invoke-direct {v8, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v4, v13, v8, v12}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_e2
    :goto_e2
    iget-object v4, v2, Lw8e;->d:Lh46;

    iget-object v4, v4, Lh46;->f:Leme;

    new-instance v7, Lrzl;

    invoke-direct {v7, v1, v2}, Lrzl;-><init>(Lwv;Lw8e;)V

    move-object/from16 v8, p1

    iput-object v8, v5, Lg0m;->t:Lnle;

    move-object/from16 v13, p2

    iput-object v13, v5, Lg0m;->u:Lwv;

    iput-object v3, v5, Lg0m;->v:Lw8e;

    iput-object v2, v5, Lg0m;->w:Lw8e;

    iput-object v4, v5, Lg0m;->x:Leme;

    iput-object v7, v5, Lg0m;->y:Lrzl;

    iput v11, v5, Lg0m;->C:I

    iget-object v11, v0, Lj0m;->b:Lcb7;

    check-cast v11, Lkzd;

    iget-object v11, v11, Lkzd;->a:Lab7;

    invoke-interface {v11}, Lab7;->a()Ldx5;

    move-result-object v11

    new-instance v14, Ludj;

    const/16 v15, 0x8

    invoke-direct {v14, v1, v2, v12, v15}, Ludj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v11, v14, v5}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v6, :cond_18e

    move-object v14, v4

    move-object v4, v1

    move-object v1, v2

    move-object v2, v14

    move-object/from16 v19, v7

    move-object v14, v8

    move-object v15, v13

    :goto_11c
    move-object/from16 v18, v4

    check-cast v18, Ljava/lang/String;

    invoke-virtual {v2, v14}, Leme;->t0(Lnle;)Lwv;

    move-result-object v16

    iget-object v2, v1, Lw8e;->d:Lh46;

    new-instance v13, Lyzl;

    new-instance v4, Lw8e;

    sget-object v7, Lpe3;->a:Ljava/math/BigInteger;

    invoke-direct {v4, v7, v2}, Lw8e;-><init>(Ljava/math/BigInteger;Lh46;)V

    const/16 v20, 0x0

    move-object/from16 v17, v4

    invoke-direct/range {v13 .. v20}, Lyzl;-><init>(Lnle;Lwv;Lwv;Lw8e;Ljava/lang/String;Lrzl;Ljava/math/BigInteger;)V

    new-instance v2, Luzl;

    iget-object v1, v1, Lw8e;->d:Lh46;

    invoke-direct {v2, v1, v12, v12, v12}, Luzl;-><init>(Lh46;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    iput-object v12, v5, Lg0m;->t:Lnle;

    iput-object v12, v5, Lg0m;->u:Lwv;

    iput-object v3, v5, Lg0m;->v:Lw8e;

    iput-object v12, v5, Lg0m;->w:Lw8e;

    iput-object v12, v5, Lg0m;->x:Leme;

    iput-object v12, v5, Lg0m;->y:Lrzl;

    iput v10, v5, Lg0m;->C:I

    invoke-virtual {v0, v13, v2, v5}, Lj0m;->c(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v6, :cond_18e

    move-object v2, v3

    :goto_152
    move-object v1, v4

    check-cast v1, Lxzl;

    if-nez v2, :cond_158

    return-object v1

    :cond_158
    iput-object v12, v5, Lg0m;->t:Lnle;

    iput-object v12, v5, Lg0m;->u:Lwv;

    iput-object v2, v5, Lg0m;->v:Lw8e;

    iput-object v12, v5, Lg0m;->w:Lw8e;

    iput-object v12, v5, Lg0m;->x:Leme;

    iput-object v12, v5, Lg0m;->y:Lrzl;

    iput-object v1, v5, Lg0m;->z:Lxzl;

    iput v9, v5, Lg0m;->C:I

    invoke-virtual {v0, v1, v2, v5}, Lj0m;->a(Lxzl;Lw8e;Lnt5;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, v6, :cond_18e

    :goto_16e
    check-cast v4, Lxzl;

    invoke-static {v4, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_177

    return-object v1

    :cond_177
    iput-object v12, v5, Lg0m;->t:Lnle;

    iput-object v12, v5, Lg0m;->u:Lwv;

    iput-object v12, v5, Lg0m;->v:Lw8e;

    iput-object v12, v5, Lg0m;->w:Lw8e;

    iput-object v12, v5, Lg0m;->x:Leme;

    iput-object v12, v5, Lg0m;->y:Lrzl;

    iput-object v12, v5, Lg0m;->z:Lxzl;

    const/4 v1, 0x4

    iput v1, v5, Lg0m;->C:I

    invoke-virtual {v0, v4, v2, v5}, Lj0m;->a(Lxzl;Lw8e;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v6, :cond_18f

    :cond_18e
    return-object v6

    :cond_18f
    return-object v0
.end method

.method public final c(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p3, Lh0m;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lh0m;

    iget v1, v0, Lh0m;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lh0m;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lh0m;

    invoke-direct {v0, p0, p3}, Lh0m;-><init>(Lj0m;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lh0m;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lh0m;->w:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v4, :cond_2a

    iget-object p1, v0, Lh0m;->t:Lyzl;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3e

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lh0m;->t:Lyzl;

    iput v4, v0, Lh0m;->w:I

    invoke-virtual {p0, p1, p2, v0}, Lj0m;->d(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_3e

    return-object v1

    :cond_3e
    :goto_3e
    check-cast p3, Luzl;

    new-instance p2, Lxzl;

    invoke-direct {p2, p1, p3}, Lxzl;-><init>(Lyzl;Luzl;)V

    iget-object p0, p0, Lj0m;->c:Lhzc;

    iget-object p1, p0, Lhzc;->b:Ljava/lang/String;

    sget-object p3, Leaj;->a:Leaj;

    iget-object v0, p0, Lhzc;->a:Letb;

    iget-object v0, v0, Letb;->a:Leaj;

    invoke-virtual {v0, p3}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-gtz v0, :cond_66

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Transaction created: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p3, p1, v0, v3}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_66
    return-object p2
.end method

.method public final d(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p3, Li0m;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Li0m;

    iget v1, v0, Li0m;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Li0m;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Li0m;

    invoke-direct {v0, p0, p3}, Li0m;-><init>(Lj0m;Lnt5;)V

    :goto_18
    iget-object p3, v0, Li0m;->w:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Li0m;->y:I

    iget-object v3, p0, Lj0m;->a:Lx0m;

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v2, :cond_49

    if-eq v2, v6, :cond_41

    if-eq v2, v5, :cond_39

    if-ne v2, v4, :cond_33

    iget-object p0, v0, Li0m;->v:Lhth;

    :try_start_2e
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_31
    .catch Lhth; {:try_start_2e .. :try_end_31} :catch_a0

    goto/16 :goto_9d

    :cond_33
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v7

    :cond_39
    iget-object p0, v0, Li0m;->v:Lhth;

    iget-object p1, v0, Li0m;->u:Luzl;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_8a

    :cond_41
    iget-object p2, v0, Li0m;->u:Luzl;

    iget-object p1, v0, Li0m;->t:Lyzl;

    :try_start_45
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_48
    .catch Lhth; {:try_start_45 .. :try_end_48} :catch_5b

    goto :goto_58

    :cond_49
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_4c
    iput-object p1, v0, Li0m;->t:Lyzl;

    iput-object p2, v0, Li0m;->u:Luzl;

    iput v6, v0, Li0m;->y:I

    invoke-virtual {v3, p1, p2, v6, v0}, Lx0m;->a(Lyzl;Luzl;ZLnt5;)Ljava/lang/Object;

    move-result-object p3

    if-eq p3, v1, :cond_9c

    :goto_58
    check-cast p3, Luzl;
    :try_end_5a
    .catch Lhth; {:try_start_4c .. :try_end_5a} :catch_5b

    return-object p3

    :catch_5b
    move-exception p3

    iget-object v2, p1, Lyzl;->f:Lrzl;

    if-nez v2, :cond_61

    move-object v2, v7

    :cond_61
    if-eqz v2, :cond_a1

    iget-object v2, p1, Lyzl;->d:Lw8e;

    iget-object v2, v2, Lw8e;->d:Lh46;

    new-instance v8, Lw8e;

    sget-object v9, Lpe3;->b:Ljava/math/BigInteger;

    invoke-direct {v8, v9, v2}, Lw8e;-><init>(Ljava/math/BigInteger;Lh46;)V

    new-instance v9, Lxzl;

    new-instance v10, Luzl;

    invoke-direct {v10, v2, v7, v7, v7}, Luzl;-><init>(Lh46;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    invoke-direct {v9, p1, v10}, Lxzl;-><init>(Lyzl;Luzl;)V

    iput-object v7, v0, Li0m;->t:Lyzl;

    iput-object p2, v0, Li0m;->u:Luzl;

    iput-object p3, v0, Li0m;->v:Lhth;

    iput v5, v0, Li0m;->y:I

    invoke-virtual {p0, v9, v8, v0}, Lj0m;->a(Lxzl;Lw8e;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_9c

    move-object p1, p3

    move-object p3, p0

    move-object p0, p1

    move-object p1, p2

    :goto_8a
    check-cast p3, Lxzl;

    iget-object p2, p3, Lxzl;->a:Lyzl;

    :try_start_8e
    iput-object v7, v0, Li0m;->t:Lyzl;

    iput-object v7, v0, Li0m;->u:Luzl;

    iput-object p0, v0, Li0m;->v:Lhth;

    iput v4, v0, Li0m;->y:I

    invoke-virtual {v3, p2, p1, v6, v0}, Lx0m;->a(Lyzl;Luzl;ZLnt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_9d

    :cond_9c
    return-object v1

    :cond_9d
    :goto_9d
    check-cast p3, Luzl;
    :try_end_9f
    .catch Lhth; {:try_start_8e .. :try_end_9f} :catch_a0

    return-object p3

    :catch_a0
    throw p0

    :cond_a1
    throw p3
.end method
