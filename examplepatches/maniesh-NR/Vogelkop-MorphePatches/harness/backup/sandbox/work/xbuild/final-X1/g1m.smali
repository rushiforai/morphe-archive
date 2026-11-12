.class public final Lg1m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzth;

.field public final b:Lcb7;

.field public final c:Lejj;

.field public final d:Ld0m;


# direct methods
.method public constructor <init>(Lzth;Lcb7;Lejj;Ld0m;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg1m;->a:Lzth;

    iput-object p2, p0, Lg1m;->b:Lcb7;

    iput-object p3, p0, Lg1m;->c:Lejj;

    iput-object p4, p0, Lg1m;->d:Ld0m;

    return-void
.end method


# virtual methods
.method public final a(Lyzl;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lc1m;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lc1m;

    iget v1, v0, Lc1m;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lc1m;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lc1m;

    invoke-direct {v0, p0, p2}, Lc1m;-><init>(Lg1m;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lc1m;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lc1m;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    goto :goto_44

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Ln2h;

    const/4 v2, 0x5

    invoke-direct {p2, p0, p1, v3, v2}, Ln2h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lc1m;->v:I

    invoke-static {p2, v0}, Lupj;->A(Lkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_8e

    move-object p2, p1

    :goto_4b
    if-eqz p2, :cond_56

    instance-of v0, p2, Ljava/net/UnknownHostException;

    if-nez v0, :cond_8e

    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    goto :goto_4b

    :cond_56
    move-object p2, p1

    :goto_57
    if-eqz p2, :cond_62

    instance-of v0, p2, Ljava/net/SocketException;

    if-nez v0, :cond_8e

    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    goto :goto_57

    :cond_62
    move-object p2, p1

    :goto_63
    if-eqz p2, :cond_76

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Network error"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8e

    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    goto :goto_63

    :cond_76
    sget-object p2, Lhzc;->c:Lgzc;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Leaj;->e:Leaj;

    iget-object v1, p2, Lhzc;->a:Letb;

    iget-object v1, v1, Letb;->a:Leaj;

    invoke-virtual {v1, v0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-gtz v1, :cond_8e

    const-string v1, "Failed to fetch nonce"

    const-string v2, ""

    invoke-virtual {p2, v0, v2, v1, p1}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_8e
    sget-object p1, Lpe3;->a:Ljava/math/BigInteger;

    instance-of p2, p0, Lq0i;

    if-eqz p2, :cond_95

    return-object p1

    :cond_95
    return-object p0
.end method

.method public final b(Lyzl;ZLnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p3, Ld1m;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Ld1m;

    iget v1, v0, Ld1m;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ld1m;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Ld1m;

    invoke-direct {v0, p0, p3}, Ld1m;-><init>(Lg1m;Lnt5;)V

    :goto_18
    iget-object p3, v0, Ld1m;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ld1m;->x:I

    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_3c

    if-eq v2, v6, :cond_38

    if-eq v2, v5, :cond_30

    if-eq v2, v4, :cond_38

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    iget-boolean p2, v0, Ld1m;->u:Z

    iget-object p1, v0, Ld1m;->t:Lyzl;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_65

    :cond_38
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    return-object p3

    :cond_3c
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz p2, :cond_4e

    iput-object v3, v0, Ld1m;->t:Lyzl;

    iput-boolean p2, v0, Ld1m;->u:Z

    iput v6, v0, Ld1m;->x:I

    invoke-virtual {p0, p1, v0}, Lg1m;->a(Lyzl;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_75

    return-object p0

    :cond_4e
    new-instance p3, Lzzl;

    iget-object v2, p1, Lyzl;->b:Lwv;

    iget-object v6, p1, Lyzl;->a:Lnle;

    invoke-direct {p3, v2, v6}, Lzzl;-><init>(Lwv;Lnle;)V

    iput-object p1, v0, Ld1m;->t:Lyzl;

    iput-boolean p2, v0, Ld1m;->u:Z

    iput v5, v0, Ld1m;->x:I

    iget-object v2, p0, Lg1m;->d:Ld0m;

    invoke-virtual {v2, p3, v0}, Ld0m;->a(Lzzl;Lnt5;)Ljava/lang/Object;

    move-result-object p3

    if-eq p3, v1, :cond_75

    :goto_65
    check-cast p3, Ljava/math/BigInteger;

    if-nez p3, :cond_77

    iput-object v3, v0, Ld1m;->t:Lyzl;

    iput-boolean p2, v0, Ld1m;->u:Z

    iput v4, v0, Ld1m;->x:I

    invoke-virtual {p0, p1, v0}, Lg1m;->a(Lyzl;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_76

    :cond_75
    return-object v1

    :cond_76
    return-object p0

    :cond_77
    return-object p3
.end method

.method public final c(Lavb;Lxzl;ILnt5;)Ljava/lang/Object;
    .registers 32

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    instance-of v4, v3, Le1m;

    if-eqz v4, :cond_1b

    move-object v4, v3

    check-cast v4, Le1m;

    iget v5, v4, Le1m;->A:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_1b

    sub-int/2addr v5, v6

    iput v5, v4, Le1m;->A:I

    goto :goto_20

    :cond_1b
    new-instance v4, Le1m;

    invoke-direct {v4, v1, v3}, Le1m;-><init>(Lg1m;Lnt5;)V

    :goto_20
    iget-object v3, v4, Le1m;->y:Ljava/lang/Object;

    sget-object v5, Lpx5;->a:Lpx5;

    iget v6, v4, Le1m;->A:I

    const/4 v7, 0x5

    const/4 v8, 0x4

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v6, :cond_75

    if-eq v6, v11, :cond_67

    if-eq v6, v10, :cond_56

    if-eq v6, v9, :cond_47

    if-eq v6, v8, :cond_43

    if-ne v6, v7, :cond_3d

    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_18c

    :cond_3d
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v12

    :cond_43
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    return-object v3

    :cond_47
    iget v0, v4, Le1m;->x:I

    iget-object v2, v4, Le1m;->w:Ljava/lang/Throwable;

    iget-object v6, v4, Le1m;->v:Lyzl;

    iget-object v7, v4, Le1m;->u:Lxzl;

    iget-object v9, v4, Le1m;->t:Lavb;

    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_146

    :cond_56
    iget v2, v4, Le1m;->x:I

    iget-object v0, v4, Le1m;->w:Ljava/lang/Throwable;

    check-cast v0, Lg1m;

    iget-object v6, v4, Le1m;->v:Lyzl;

    iget-object v10, v4, Le1m;->u:Lxzl;

    iget-object v13, v4, Le1m;->t:Lavb;

    :try_start_62
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_65
    .catchall {:try_start_62 .. :try_end_65} :catchall_fe

    goto/16 :goto_f6

    :cond_67
    iget v0, v4, Le1m;->x:I

    iget-object v2, v4, Le1m;->v:Lyzl;

    iget-object v6, v4, Le1m;->u:Lxzl;

    iget-object v13, v4, Le1m;->t:Lavb;

    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    move-object v7, v2

    move v2, v0

    goto :goto_d3

    :cond_75
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v3, v2, Lxzl;->a:Lyzl;

    iput-object v0, v4, Le1m;->t:Lavb;

    iput-object v2, v4, Le1m;->u:Lxzl;

    iput-object v3, v4, Le1m;->v:Lyzl;

    move/from16 v6, p3

    iput v6, v4, Le1m;->x:I

    iput v11, v4, Le1m;->A:I

    iget-object v13, v1, Lg1m;->c:Lejj;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v14, v2, Lxzl;->a:Lyzl;

    iget-object v15, v2, Lxzl;->b:Luzl;

    new-instance v16, Llkh;

    iget-object v7, v14, Lyzl;->a:Lnle;

    iget v8, v7, Lnle;->a:I

    int-to-long v9, v8

    iget-object v8, v14, Lyzl;->g:Ljava/math/BigInteger;

    iget-object v11, v15, Luzl;->d:Ljava/math/BigInteger;

    iget-object v12, v14, Lyzl;->c:Lwv;

    iget-object v2, v14, Lyzl;->d:Lw8e;

    iget-object v2, v2, Lw8e;->c:Ljava/math/BigInteger;

    iget-object v14, v14, Lyzl;->e:Ljava/lang/String;

    move-object/from16 v22, v2

    iget-object v2, v15, Luzl;->b:Ljava/math/BigInteger;

    move-object/from16 v24, v2

    iget-object v2, v15, Luzl;->c:Ljava/math/BigInteger;

    iget-object v15, v15, Luzl;->a:Lh46;

    iget-object v15, v15, Lh46;->g:Leme;

    invoke-virtual {v15, v7}, Leme;->u0(Lnle;)Lwv;

    move-result-object v26

    move-object/from16 v25, v2

    move-object/from16 v19, v8

    move-wide/from16 v17, v9

    move-object/from16 v20, v11

    move-object/from16 v21, v12

    move-object/from16 v23, v14

    invoke-direct/range {v16 .. v26}, Llkh;-><init>(JLjava/math/BigInteger;Ljava/math/BigInteger;Lwv;Ljava/math/BigInteger;Ljava/lang/String;Ljava/math/BigInteger;Ljava/math/BigInteger;Lwv;)V

    move-object/from16 v2, v16

    iget-object v7, v13, Lejj;->a:Ll0m;

    check-cast v7, Ln0m;

    invoke-virtual {v7, v2, v0, v4}, Ln0m;->b(Llkh;Lavb;Lnt5;)Ljava/io/Serializable;

    move-result-object v2

    if-eq v2, v5, :cond_18b

    move-object v13, v0

    move-object v7, v3

    move-object v3, v2

    move v2, v6

    move-object/from16 v6, p2

    :goto_d3
    check-cast v3, [B

    :try_start_d5
    sget-object v0, Lt0i;->b:Lp0i;

    iget-object v0, v1, Lg1m;->a:Lzth;

    invoke-static {v3}, La4h;->p([B)Ltth;

    move-result-object v3

    iput-object v13, v4, Le1m;->t:Lavb;

    iput-object v6, v4, Le1m;->u:Lxzl;

    iput-object v7, v4, Le1m;->v:Lyzl;

    const/4 v8, 0x0

    iput-object v8, v4, Le1m;->w:Ljava/lang/Throwable;

    iput v2, v4, Le1m;->x:I

    const/4 v8, 0x2

    iput v8, v4, Le1m;->A:I

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v3, v4}, Lzth;->b(Lzth;Ltth;Lnt5;)Ljava/lang/Object;

    move-result-object v3
    :try_end_f2
    .catchall {:try_start_d5 .. :try_end_f2} :catchall_103

    if-eq v3, v5, :cond_18b

    move-object v10, v6

    move-object v6, v7

    :goto_f6
    :try_start_f6
    check-cast v3, Ljava/math/BigInteger;

    sget-object v0, Lt0i;->b:Lp0i;
    :try_end_fa
    .catchall {:try_start_f6 .. :try_end_fa} :catchall_fe

    :goto_fa
    move v0, v2

    move-object v7, v10

    move-object v9, v13

    goto :goto_10d

    :catchall_fe
    move-exception v0

    goto :goto_105

    :goto_100
    move-object v10, v6

    move-object v6, v7

    goto :goto_105

    :catchall_103
    move-exception v0

    goto :goto_100

    :goto_105
    sget-object v3, Lt0i;->b:Lp0i;

    new-instance v3, Lq0i;

    invoke-direct {v3, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    goto :goto_fa

    :goto_10d
    invoke-static {v3}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_18e

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v8, 0x0

    if-eqz v3, :cond_124

    const-string v10, "nonce"

    invoke-static {v3, v10, v8}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v3

    const/4 v10, 0x1

    if-ne v3, v10, :cond_125

    goto :goto_133

    :cond_124
    const/4 v10, 0x1

    :cond_125
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_173

    const-string v11, "known transaction"

    invoke-static {v3, v11, v8}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v3

    if-ne v3, v10, :cond_173

    :goto_133
    iput-object v9, v4, Le1m;->t:Lavb;

    iput-object v7, v4, Le1m;->u:Lxzl;

    iput-object v6, v4, Le1m;->v:Lyzl;

    iput-object v2, v4, Le1m;->w:Ljava/lang/Throwable;

    iput v0, v4, Le1m;->x:I

    const/4 v3, 0x3

    iput v3, v4, Le1m;->A:I

    invoke-virtual {v1, v6, v10, v4}, Lg1m;->b(Lyzl;ZLnt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v5, :cond_18b

    :goto_146
    check-cast v3, Ljava/math/BigInteger;

    iget-object v8, v6, Lyzl;->g:Ljava/math/BigInteger;

    invoke-static {v3, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_172

    const/16 v2, 0x3f

    const/4 v8, 0x0

    invoke-static {v6, v8, v8, v3, v2}, Lyzl;->a(Lyzl;Ljava/lang/String;Lrzl;Ljava/math/BigInteger;I)Lyzl;

    move-result-object v2

    iget-object v3, v7, Lxzl;->b:Luzl;

    new-instance v6, Lxzl;

    invoke-direct {v6, v2, v3}, Lxzl;-><init>(Lyzl;Luzl;)V

    iput-object v8, v4, Le1m;->t:Lavb;

    iput-object v8, v4, Le1m;->u:Lxzl;

    iput-object v8, v4, Le1m;->v:Lyzl;

    iput-object v8, v4, Le1m;->w:Ljava/lang/Throwable;

    iput v0, v4, Le1m;->x:I

    const/4 v2, 0x4

    iput v2, v4, Le1m;->A:I

    invoke-virtual {v1, v9, v6, v0, v4}, Lg1m;->c(Lavb;Lxzl;ILnt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v5, :cond_18b

    return-object v0

    :cond_172
    throw v2

    :cond_173
    if-gt v0, v10, :cond_18f

    add-int/lit8 v2, v0, 0x1

    const/4 v8, 0x0

    iput-object v8, v4, Le1m;->t:Lavb;

    iput-object v8, v4, Le1m;->u:Lxzl;

    iput-object v8, v4, Le1m;->v:Lyzl;

    iput-object v8, v4, Le1m;->w:Ljava/lang/Throwable;

    iput v0, v4, Le1m;->x:I

    const/4 v3, 0x5

    iput v3, v4, Le1m;->A:I

    invoke-virtual {v1, v9, v7, v2, v4}, Lg1m;->c(Lavb;Lxzl;ILnt5;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v5, :cond_18c

    :cond_18b
    return-object v5

    :cond_18c
    :goto_18c
    check-cast v3, Ljava/math/BigInteger;

    :cond_18e
    return-object v3

    :cond_18f
    throw v2
.end method
