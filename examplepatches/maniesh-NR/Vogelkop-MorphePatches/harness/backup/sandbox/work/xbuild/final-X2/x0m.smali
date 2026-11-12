.class public final Lx0m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzth;

.field public final b:Lcb7;

.field public final c:Lk57;

.field public final d:Lhl5;

.field public final e:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lzth;Lcb7;Lk57;Lhl5;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx0m;->a:Lzth;

    iput-object p2, p0, Lx0m;->b:Lcb7;

    iput-object p3, p0, Lx0m;->c:Lk57;

    iput-object p4, p0, Lx0m;->d:Lhl5;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lx0m;->e:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final a(Lyzl;Luzl;ZLnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p4, Lr0m;

    if-eqz v0, :cond_13

    move-object v0, p4

    check-cast v0, Lr0m;

    iget v1, v0, Lr0m;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lr0m;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Lr0m;

    invoke-direct {v0, p0, p4}, Lr0m;-><init>(Lx0m;Lnt5;)V

    :goto_18
    iget-object p4, v0, Lr0m;->w:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lr0m;->y:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_3e

    if-eq v2, v5, :cond_34

    if-eq v2, v4, :cond_30

    if-eq v2, v3, :cond_30

    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_30
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    return-object p4

    :cond_34
    iget-boolean p3, v0, Lr0m;->v:Z

    iget-object p2, v0, Lr0m;->u:Luzl;

    iget-object p1, v0, Lr0m;->t:Lyzl;

    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_59

    :cond_3e
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p4, p0, Lx0m;->d:Lhl5;

    iget-boolean p4, p4, Lhl5;->a:Z

    if-nez p4, :cond_6b

    sget-object p4, Lo67;->a:Lj5j;

    iput-object p1, v0, Lr0m;->t:Lyzl;

    iput-object p2, v0, Lr0m;->u:Luzl;

    iput-boolean p3, v0, Lr0m;->v:Z

    iput v5, v0, Lr0m;->y:I

    iget-object v2, p0, Lx0m;->c:Lk57;

    invoke-virtual {v2, p4, v0}, Lk57;->a(Lj5j;Lnt5;)Ljava/lang/Object;

    move-result-object p4

    if-eq p4, v1, :cond_8b

    :goto_59
    check-cast p4, Lo5j;

    iget-object v2, p4, Lo5j;->b:Ljava/lang/Object;

    if-nez v2, :cond_63

    iget-object p4, p4, Lo5j;->a:Lj5j;

    iget-object v2, p4, Lj5j;->e:Ljava/lang/Object;

    :cond_63
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-nez p4, :cond_6c

    :cond_6b
    const/4 v5, 0x0

    :cond_6c
    if-eqz v5, :cond_7d

    iput-object v6, v0, Lr0m;->t:Lyzl;

    iput-object v6, v0, Lr0m;->u:Luzl;

    iput-boolean p3, v0, Lr0m;->v:Z

    iput v4, v0, Lr0m;->y:I

    invoke-virtual {p0, p1, p2, p3, v0}, Lx0m;->c(Lyzl;Luzl;ZLnt5;)Ljava/lang/Object;

    move-result-object p0

    if-eq p0, v1, :cond_8b

    return-object p0

    :cond_7d
    iput-object v6, v0, Lr0m;->t:Lyzl;

    iput-object v6, v0, Lr0m;->u:Luzl;

    iput-boolean p3, v0, Lr0m;->v:Z

    iput v3, v0, Lr0m;->y:I

    invoke-virtual {p0, p1, p2, v0}, Lx0m;->b(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_8c

    :cond_8b
    return-object v1

    :cond_8c
    return-object p0
.end method

.method public final b(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p3, Ls0m;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Ls0m;

    iget v1, v0, Ls0m;->A:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ls0m;->A:I

    goto :goto_18

    :cond_13
    new-instance v0, Ls0m;

    invoke-direct {v0, p0, p3}, Ls0m;-><init>(Lx0m;Lnt5;)V

    :goto_18
    iget-object p3, v0, Ls0m;->y:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ls0m;->A:I

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_48

    if-eq v2, v5, :cond_3a

    if-ne v2, v4, :cond_34

    iget-object p0, v0, Ls0m;->x:Ljava/math/BigInteger;

    iget-object p1, v0, Ls0m;->w:Ljava/math/BigInteger;

    iget-object p2, v0, Ls0m;->v:Lh46;

    iget-object v0, v0, Ls0m;->u:Luzl;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_95

    :cond_34
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_3a
    iget-object p1, v0, Ls0m;->v:Lh46;

    iget-object p2, v0, Ls0m;->u:Luzl;

    iget-object v2, v0, Ls0m;->t:Lyzl;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    move-object v7, p3

    move-object p3, p1

    move-object p1, v2

    move-object v2, v7

    goto :goto_5d

    :cond_48
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p3, p2, Luzl;->a:Lh46;

    iget-object v2, p1, Lyzl;->a:Lnle;

    iput-object p1, v0, Ls0m;->t:Lyzl;

    iput-object p2, v0, Ls0m;->u:Luzl;

    iput-object p3, v0, Ls0m;->v:Lh46;

    iput v5, v0, Ls0m;->A:I

    invoke-virtual {p0, p3, v2, v0}, Lx0m;->e(Lh46;Lnle;Lnt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_8f

    :goto_5d
    check-cast v2, Lq0m;

    iget-object v5, p2, Luzl;->b:Ljava/math/BigInteger;

    if-nez v5, :cond_71

    iget-object v5, v2, Lq0m;->b:Ljava/math/BigInteger;

    sget-object v6, Ly0m;->c:Ljava/math/BigInteger;

    invoke-virtual {v5, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    sget-object v6, Ly0m;->a:Ljava/math/BigInteger;

    invoke-virtual {v5, v6}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    :cond_71
    iget-object v6, p2, Luzl;->c:Ljava/math/BigInteger;

    if-nez v6, :cond_7c

    iget-object v2, v2, Lq0m;->a:Ljava/math/BigInteger;

    invoke-virtual {v2, v5}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    goto :goto_7d

    :cond_7c
    move-object v2, v6

    :goto_7d
    iput-object v3, v0, Ls0m;->t:Lyzl;

    iput-object p2, v0, Ls0m;->u:Luzl;

    iput-object p3, v0, Ls0m;->v:Lh46;

    iput-object v5, v0, Ls0m;->w:Ljava/math/BigInteger;

    iput-object v2, v0, Ls0m;->x:Ljava/math/BigInteger;

    iput v4, v0, Ls0m;->A:I

    invoke-virtual {p0, p1, p3, v0}, Lx0m;->f(Lyzl;Lh46;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_90

    :cond_8f
    return-object v1

    :cond_90
    move-object v0, p2

    move-object p2, p3

    move-object p1, v5

    move-object p3, p0

    move-object p0, v2

    :goto_95
    check-cast p3, Ljava/math/BigInteger;

    iget-object v0, v0, Luzl;->d:Ljava/math/BigInteger;

    if-nez v0, :cond_9d

    sget-object v0, Lpe3;->a:Ljava/math/BigInteger;

    :cond_9d
    invoke-interface {v0, p3}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_a4

    move-object p3, v0

    :cond_a4
    new-instance v0, Luzl;

    invoke-direct {v0, p2, p1, p0, p3}, Luzl;-><init>(Lh46;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    return-object v0
.end method

.method public final c(Lyzl;Luzl;ZLnt5;)Ljava/lang/Object;
    .registers 13

    instance-of v0, p4, Lt0m;

    if-eqz v0, :cond_13

    move-object v0, p4

    check-cast v0, Lt0m;

    iget v1, v0, Lt0m;->z:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lt0m;->z:I

    goto :goto_18

    :cond_13
    new-instance v0, Lt0m;

    invoke-direct {v0, p0, p4}, Lt0m;-><init>(Lx0m;Lnt5;)V

    :goto_18
    iget-object p4, v0, Lt0m;->x:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lt0m;->z:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_44

    if-eq v2, v4, :cond_37

    if-ne v2, v3, :cond_31

    iget-boolean p0, v0, Lt0m;->w:Z

    iget-object p1, v0, Lt0m;->v:Ljava/math/BigInteger;

    iget-object p2, v0, Lt0m;->u:Lh46;

    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6f

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_37
    iget-boolean p3, v0, Lt0m;->w:Z

    iget-object p1, v0, Lt0m;->u:Lh46;

    iget-object p2, v0, Lt0m;->t:Lyzl;

    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    move-object v7, p2

    move-object p2, p1

    move-object p1, v7

    goto :goto_57

    :cond_44
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p2, Luzl;->a:Lh46;

    iput-object p1, v0, Lt0m;->t:Lyzl;

    iput-object p2, v0, Lt0m;->u:Lh46;

    iput-boolean p3, v0, Lt0m;->w:Z

    iput v4, v0, Lt0m;->z:I

    invoke-virtual {p0, p1, p2, v0}, Lx0m;->f(Lyzl;Lh46;Lnt5;)Ljava/lang/Object;

    move-result-object p4

    if-eq p4, v1, :cond_6b

    :goto_57
    check-cast p4, Ljava/math/BigInteger;

    iget-object p1, p1, Lyzl;->a:Lnle;

    iput-object v5, v0, Lt0m;->t:Lyzl;

    iput-object p2, v0, Lt0m;->u:Lh46;

    iput-object p4, v0, Lt0m;->v:Ljava/math/BigInteger;

    iput-boolean p3, v0, Lt0m;->w:Z

    iput v3, v0, Lt0m;->z:I

    invoke-virtual {p0, p2, p1, v0}, Lx0m;->e(Lh46;Lnle;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_6c

    :cond_6b
    return-object v1

    :cond_6c
    move-object p1, p4

    move-object p4, p0

    move p0, p3

    :goto_6f
    check-cast p4, Lq0m;

    if-eqz p0, :cond_116

    iget-object p0, p4, Lq0m;->a:Ljava/math/BigInteger;

    iget-object p3, p4, Lq0m;->b:Ljava/math/BigInteger;

    sget-object v0, Ly0m;->c:Ljava/math/BigInteger;

    invoke-virtual {p3, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p3

    sget-object v0, Ly0m;->a:Ljava/math/BigInteger;

    invoke-virtual {p3, v0}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p3

    sget-object v0, Lx8e;->Companion:Ln8e;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/math/BigDecimal;

    const-wide v1, 0x3fa0ad03d9a95422L    # 0.03257

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    new-instance v1, Lw8e;

    sget-object v2, Ly8e;->a:Ljava/math/RoundingMode;

    invoke-virtual {p2}, Lh46;->d()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/math/BigDecimal;->scaleByPowerOfTen(I)Ljava/math/BigDecimal;

    move-result-object v0

    sget-object v2, Ly8e;->a:Ljava/math/RoundingMode;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toBigIntegerExact()Ljava/math/BigInteger;

    move-result-object v0

    invoke-direct {v1, v0, p2}, Lw8e;-><init>(Ljava/math/BigInteger;Lh46;)V

    iget-object v0, v1, Lw8e;->d:Lh46;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lpe3;->d:Ljava/math/BigInteger;

    iget v0, v0, Lh46;->d:I

    rsub-int/lit8 v0, v0, 0x12

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v0

    iget-object v1, v1, Lw8e;->c:Ljava/math/BigInteger;

    invoke-virtual {v1, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    new-instance v1, Ljava/math/BigDecimal;

    const-wide v5, 0x3f741205bc01a36eL    # 0.0049

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    new-instance v5, Lw8e;

    invoke-virtual {p2}, Lh46;->d()I

    move-result v6

    invoke-virtual {v1, v6}, Ljava/math/BigDecimal;->scaleByPowerOfTen(I)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v1, v3, v2}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigDecimal;->toBigIntegerExact()Ljava/math/BigInteger;

    move-result-object v1

    invoke-direct {v5, v1, p2}, Lw8e;-><init>(Ljava/math/BigInteger;Lh46;)V

    iget-object v1, v5, Lw8e;->d:Lh46;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v1, Lh46;->d:I

    rsub-int/lit8 v1, v1, 0x12

    invoke-virtual {v4, v1}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v1

    iget-object v2, v5, Lw8e;->c:Ljava/math/BigInteger;

    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v1

    if-lez v1, :cond_10a

    move-object v0, p0

    :cond_10a
    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-interface {p3, p0}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_118

    move-object p3, p0

    goto :goto_118

    :cond_116
    iget-object p3, p4, Lq0m;->b:Ljava/math/BigInteger;

    :cond_118
    :goto_118
    iget-object p0, p4, Lq0m;->a:Ljava/math/BigInteger;

    invoke-virtual {p0, p3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    new-instance p4, Luzl;

    invoke-direct {p4, p2, p3, p0, p1}, Luzl;-><init>(Lh46;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    return-object p4
.end method

.method public final d(Lh46;Lnle;Lnt5;)Ljava/lang/Object;
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    instance-of v2, v1, Lu0m;

    if-eqz v2, :cond_17

    move-object v2, v1

    check-cast v2, Lu0m;

    iget v3, v2, Lu0m;->z:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_17

    sub-int/2addr v3, v4

    iput v3, v2, Lu0m;->z:I

    goto :goto_1c

    :cond_17
    new-instance v2, Lu0m;

    invoke-direct {v2, v0, v1}, Lu0m;-><init>(Lx0m;Lnt5;)V

    :goto_1c
    iget-object v1, v2, Lu0m;->x:Ljava/lang/Object;

    sget-object v3, Lpx5;->a:Lpx5;

    iget v4, v2, Lu0m;->z:I

    const/4 v5, 0x5

    iget-object v6, v0, Lx0m;->a:Lzth;

    const-string v7, "latest"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-eqz v4, :cond_4d

    if-eq v4, v11, :cond_40

    if-ne v4, v10, :cond_3a

    iget-object v0, v2, Lu0m;->w:Ljava/math/BigInteger;

    iget-object v2, v2, Lu0m;->v:Ljava/math/BigInteger;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1d3

    :cond_3a
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v9

    :cond_40
    iget-object v0, v2, Lu0m;->u:Lnle;

    iget-object v4, v2, Lu0m;->t:Lh46;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v23, v1

    move-object v1, v0

    move-object/from16 v0, v23

    goto :goto_ad

    :cond_4d
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v12, Lldh;

    sget-object v14, Lrpb;->d:Lqpb;

    const/16 v18, 0x0

    const/16 v19, 0x7

    const/4 v13, 0x1

    const-class v15, Lqpb;

    const-string v16, "decodeFromString"

    const-string v17, "decodeFromString(Ljava/lang/String;)Ljava/lang/Object;"

    invoke-direct/range {v12 .. v19}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v0, Lr40;

    invoke-direct {v0, v5, v7, v8}, Lr40;-><init>(BLjava/lang/String;Z)V

    new-instance v1, Lj06;

    const/16 v4, 0x1b

    invoke-direct {v1, v4}, Lj06;-><init>(B)V

    new-array v4, v10, [Lsth;

    aput-object v0, v4, v8

    aput-object v1, v4, v11

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v10}, Ljava/util/ArrayList;-><init>(I)V

    move v1, v8

    :goto_7a
    if-ge v1, v10, :cond_88

    aget-object v13, v4, v1

    invoke-interface {v13}, Lsth;->k()Lkotlinx/serialization/json/b;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_7a

    :cond_88
    new-array v1, v8, [Lkotlinx/serialization/json/b;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkotlinx/serialization/json/b;

    new-instance v1, Ltth;

    const-string v4, "eth_getBlockByNumber"

    invoke-direct {v1, v4, v0, v12}, Ltth;-><init>(Ljava/lang/String;[Lkotlinx/serialization/json/b;Lkotlin/jvm/functions/Function1;)V

    move-object/from16 v0, p1

    iput-object v0, v2, Lu0m;->t:Lh46;

    move-object/from16 v4, p2

    iput-object v4, v2, Lu0m;->u:Lnle;

    iput v11, v2, Lu0m;->z:I

    invoke-static {v6, v1, v2}, Lzth;->c(Lzth;Ltth;Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v3, :cond_1d1

    move-object/from16 v23, v4

    move-object v4, v0

    move-object v0, v1

    move-object/from16 v1, v23

    :goto_ad
    check-cast v0, Lkotlinx/serialization/json/c;

    sget-object v12, Lke3;->Companion:Lie3;

    const-string v13, "baseFeePerGas"

    invoke-virtual {v0, v13}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_1e7

    check-cast v13, Lkotlinx/serialization/json/b;

    invoke-static {v13}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object v13

    invoke-static {v13}, Lz5i;->L(Lkotlinx/serialization/json/d;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v12, Lke3;

    new-instance v14, Ljava/math/BigInteger;

    invoke-static {v13}, Lk1g;->N(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const/16 v15, 0x10

    invoke-direct {v14, v13, v15}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-direct {v12, v8, v14}, Lle3;-><init>(ILjava/math/BigInteger;)V

    const-string v12, "extraData"

    invoke-virtual {v0, v12}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    if-eqz v0, :cond_f5

    instance-of v12, v0, Lkotlinx/serialization/json/d;

    if-eqz v12, :cond_e7

    check-cast v0, Lkotlinx/serialization/json/d;

    goto :goto_e8

    :cond_e7
    move-object v0, v9

    :goto_e8
    if-eqz v0, :cond_f5

    invoke-virtual {v0}, Lkotlinx/serialization/json/d;->c()Z

    move-result v12

    if-eqz v12, :cond_f5

    invoke-virtual {v0}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object v0

    goto :goto_f6

    :cond_f5
    move-object v0, v9

    :goto_f6
    if-eqz v0, :cond_138

    invoke-static {v0}, Lk1g;->N(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :try_start_fc
    sget-object v12, Lt0i;->b:Lp0i;

    invoke-static {v0}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_102
    .catchall {:try_start_fc .. :try_end_102} :catchall_103

    goto :goto_10c

    :catchall_103
    move-exception v0

    sget-object v12, Lt0i;->b:Lp0i;

    new-instance v12, Lq0i;

    invoke-direct {v12, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v12

    :goto_10c
    instance-of v12, v0, Lq0i;

    if-eqz v12, :cond_111

    move-object v0, v9

    :cond_111
    check-cast v0, [B

    if-nez v0, :cond_118

    sget-object v0, Ly0m;->d:Ljava/math/BigInteger;

    goto :goto_13a

    :cond_118
    array-length v12, v0

    const/16 v13, 0x9

    if-ge v12, v13, :cond_120

    sget-object v0, Ly0m;->d:Ljava/math/BigInteger;

    goto :goto_13a

    :cond_120
    new-instance v12, Ljava/math/BigInteger;

    array-length v13, v0

    invoke-static {v5, v13}, Ly72;->a(II)V

    invoke-static {v0, v11, v5}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-direct {v12, v11, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    invoke-virtual {v12}, Ljava/math/BigInteger;->signum()I

    move-result v0

    if-gtz v0, :cond_136

    sget-object v0, Ly0m;->d:Ljava/math/BigInteger;

    goto :goto_13a

    :cond_136
    move-object v0, v12

    goto :goto_13a

    :cond_138
    sget-object v0, Ly0m;->d:Ljava/math/BigInteger;

    :goto_13a
    iget-object v12, v4, Lh46;->g:Leme;

    invoke-virtual {v12, v1}, Leme;->u0(Lnle;)Lwv;

    move-result-object v12

    if-nez v12, :cond_148

    new-instance v1, Lo0m;

    invoke-direct {v1, v14, v0}, Lo0m;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    return-object v1

    :cond_148
    iput-object v9, v2, Lu0m;->t:Lh46;

    iput-object v9, v2, Lu0m;->u:Lnle;

    iput-object v14, v2, Lu0m;->v:Ljava/math/BigInteger;

    iput-object v0, v2, Lu0m;->w:Ljava/math/BigInteger;

    iput v10, v2, Lu0m;->z:I

    iget-object v9, v4, Lh46;->g:Leme;

    invoke-virtual {v9, v1}, Leme;->t0(Lnle;)Lwv;

    move-result-object v9

    iget-object v4, v4, Lh46;->h:Leme;

    if-eqz v4, :cond_162

    invoke-virtual {v4, v1}, Leme;->u0(Lnle;)Lwv;

    move-result-object v4

    if-nez v4, :cond_166

    :cond_162
    iget-object v1, v1, Lnle;->d:Lyqj;

    iget-object v4, v1, Lyqj;->a:Lwv;

    :cond_166
    new-instance v1, Ly1;

    sget-object v12, La2;->b:La2;

    invoke-direct {v1, v12, v9}, Ly1;-><init>(Ll2;Ljava/lang/Object;)V

    filled-new-array {v1}, [Ly1;

    move-result-object v1

    const-string v9, "medianRate"

    invoke-static {v9, v1}, Lx1;->a(Ljava/lang/String;[Ly1;)Ljava/lang/String;

    move-result-object v1

    new-instance v15, Lldh;

    const/16 v21, 0x0

    const/16 v22, 0x8

    const/16 v16, 0x1

    sget-object v17, Larj;->c:Lzqj;

    const-class v18, Lzqj;

    const-string v19, "decode"

    const-string v20, "decode(Ljava/lang/String;)Lcom/opera/celopay/model/node/SmartContracts$SortedOracles$MedianRateResult;"

    invoke-direct/range {v15 .. v22}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v9, Lwub;

    const/16 v12, 0x1c

    invoke-direct {v9, v12}, Lwub;-><init>(B)V

    invoke-virtual {v4}, Lle3;->a()Ljava/lang/String;

    move-result-object v4

    const-string v12, "to"

    invoke-virtual {v9, v12, v4}, Lwub;->O(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v9, v1}, Lfac;->o(Lwub;Ljava/lang/String;)V

    new-instance v1, Lr40;

    invoke-direct {v1, v5, v7, v8}, Lr40;-><init>(BLjava/lang/String;Z)V

    new-array v4, v10, [Lsth;

    aput-object v9, v4, v8

    aput-object v1, v4, v11

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v10}, Ljava/util/ArrayList;-><init>(I)V

    move v5, v8

    :goto_1ae
    if-ge v5, v10, :cond_1bc

    aget-object v7, v4, v5

    invoke-interface {v7}, Lsth;->k()Lkotlinx/serialization/json/b;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_1ae

    :cond_1bc
    new-array v4, v8, [Lkotlinx/serialization/json/b;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lkotlinx/serialization/json/b;

    new-instance v4, Ltth;

    const-string v5, "eth_call"

    invoke-direct {v4, v5, v1, v15}, Ltth;-><init>(Ljava/lang/String;[Lkotlinx/serialization/json/b;Lkotlin/jvm/functions/Function1;)V

    invoke-static {v6, v4, v2}, Lzth;->c(Lzth;Ltth;Lnt5;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v3, :cond_1d2

    :cond_1d1
    return-object v3

    :cond_1d2
    move-object v2, v14

    :goto_1d3
    check-cast v1, Larj;

    new-instance v3, Lo0m;

    iget-object v4, v1, Larj;->a:Ljava/math/BigInteger;

    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    iget-object v1, v1, Larj;->b:Ljava/math/BigInteger;

    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-direct {v3, v1, v0}, Lo0m;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    return-object v3

    :cond_1e7
    const-string v0, "Required value was null."

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v9
.end method

.method public final e(Lh46;Lnle;Lnt5;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p3, Lv0m;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lv0m;

    iget v1, v0, Lv0m;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lv0m;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lv0m;

    invoke-direct {v0, p0, p3}, Lv0m;-><init>(Lx0m;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lv0m;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lv0m;->w:I

    iget-object v3, p0, Lx0m;->e:Ljava/util/HashMap;

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2b

    iget-object p0, v0, Lv0m;->t:Lwv;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_73

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_32
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p3, p1, Lh46;->f:Leme;

    invoke-virtual {p3, p2}, Leme;->t0(Lnle;)Lwv;

    move-result-object p3

    invoke-virtual {v3, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lp0m;

    if-eqz v2, :cond_50

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-wide v7, v2, Lp0m;->b:J

    cmp-long v5, v5, v7

    if-gez v5, :cond_50

    iget-object p0, v2, Lp0m;->a:Lq0m;

    return-object p0

    :cond_50
    iput-object p3, v0, Lv0m;->t:Lwv;

    iput v4, v0, Lv0m;->w:I

    iget-object v2, p0, Lx0m;->b:Lcb7;

    check-cast v2, Lkzd;

    iget-object v2, v2, Lkzd;->a:Lab7;

    invoke-interface {v2}, Lab7;->c()Ldx5;

    move-result-object v2

    new-instance v4, Ljj4;

    const/16 v9, 0x12

    const/4 v8, 0x0

    move-object v5, p0

    move-object v6, p1

    move-object v7, p2

    invoke-direct/range {v4 .. v9}, Ljj4;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v2, v4, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_70

    return-object v1

    :cond_70
    move-object v10, p3

    move-object p3, p0

    move-object p0, v10

    :goto_73
    check-cast p3, Lq0m;

    new-instance p1, Lp0m;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v4, Ly0m;->e:J

    add-long/2addr v0, v4

    invoke-direct {p1, p3, v0, v1}, Lp0m;-><init>(Lq0m;J)V

    invoke-virtual {v3, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p3
.end method

.method public final f(Lyzl;Lh46;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p3, Lw0m;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lw0m;

    iget v1, v0, Lw0m;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lw0m;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lw0m;

    invoke-direct {v0, p0, p3}, Lw0m;-><init>(Lx0m;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lw0m;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lw0m;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4e

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, v0, Lw0m;->v:I

    iget-object p3, p0, Lx0m;->b:Lcb7;

    check-cast p3, Lkzd;

    iget-object p3, p3, Lkzd;->a:Lab7;

    invoke-interface {p3}, Lab7;->c()Ldx5;

    move-result-object p3

    new-instance v2, Lcek;

    const/4 v7, 0x6

    const/4 v6, 0x0

    move-object v5, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v2 .. v7}, Lcek;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p3, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_4e

    return-object v1

    :cond_4e
    :goto_4e
    check-cast p3, Ljava/math/BigInteger;

    sget-object p0, Ly0m;->b:Ljava/math/BigInteger;

    invoke-virtual {p3, p0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    sget-object p1, Ly0m;->a:Ljava/math/BigInteger;

    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method
