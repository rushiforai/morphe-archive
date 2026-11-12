.class public final Legj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lufj;


# instance fields
.field public final a:Lufj;

.field public final b:Li9c;


# direct methods
.method public constructor <init>(Lufj;Li9c;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Legj;->a:Lufj;

    iput-object p2, p0, Legj;->b:Li9c;

    return-void
.end method


# virtual methods
.method public final a(Li9c;JLesd;Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p5, Lbgj;

    if-eqz v0, :cond_14

    move-object v0, p5

    check-cast v0, Lbgj;

    iget v1, v0, Lbgj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lbgj;->v:I

    :goto_12
    move-object p5, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lbgj;

    invoke-direct {v0, p0, p5}, Lbgj;-><init>(Legj;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object v0, p5, Lbgj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, p5, Lbgj;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v0, Lt0i;

    iget-object p0, v0, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, p5, Lbgj;->v:I

    iget-object p0, p0, Legj;->a:Lufj;

    invoke-interface/range {p0 .. p5}, Lufj;->a(Li9c;JLesd;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_42

    return-object v1

    :cond_42
    return-object p0
.end method

.method public final b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lvfj;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lvfj;

    iget v1, v0, Lvfj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lvfj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lvfj;

    invoke-direct {v0, p0, p2}, Lvfj;-><init>(Legj;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lvfj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lvfj;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v3, :cond_2b

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, v0, Lvfj;->v:I

    iget-object p0, p0, Legj;->a:Lufj;

    invoke-interface {p0, p1, v0}, Lufj;->b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_40

    return-object v1

    :cond_40
    return-object p0
.end method

.method public final c(Li9c;JLesd;Lnt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p5, Lzfj;

    if-eqz v0, :cond_14

    move-object v0, p5

    check-cast v0, Lzfj;

    iget v1, v0, Lzfj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lzfj;->v:I

    :goto_12
    move-object p5, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lzfj;

    invoke-direct {v0, p0, p5}, Lzfj;-><init>(Legj;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object v0, p5, Lzfj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, p5, Lzfj;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v0, Lt0i;

    iget-object p0, v0, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, p5, Lzfj;->v:I

    iget-object p0, p0, Legj;->a:Lufj;

    invoke-interface/range {p0 .. p5}, Lufj;->c(Li9c;JLesd;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_42

    return-object v1

    :cond_42
    return-object p0
.end method

.method public final d(Li9c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p6, Ldgj;

    if-eqz v0, :cond_14

    move-object v0, p6

    check-cast v0, Ldgj;

    iget v1, v0, Ldgj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Ldgj;->v:I

    :goto_12
    move-object p6, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Ldgj;

    invoke-direct {v0, p0, p6}, Ldgj;-><init>(Legj;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object v0, p6, Ldgj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, p6, Ldgj;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2d

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v0, Lt0i;

    iget-object p0, v0, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, p6, Ldgj;->v:I

    iget-object p0, p0, Legj;->a:Lufj;

    invoke-interface/range {p0 .. p6}, Lufj;->d(Li9c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_42

    return-object v1

    :cond_42
    return-object p0
.end method

.method public final e(Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p3, Lxfj;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lxfj;

    iget v1, v0, Lxfj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lxfj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lxfj;

    invoke-direct {v0, p0, p3}, Lxfj;-><init>(Legj;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lxfj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lxfj;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v3, :cond_2b

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p3, Lt0i;

    iget-object p0, p3, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_32
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, v0, Lxfj;->v:I

    iget-object p0, p0, Legj;->a:Lufj;

    invoke-interface {p0, p1, p2, v0}, Lufj;->e(Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_40

    return-object v1

    :cond_40
    return-object p0
.end method

.method public final f(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lwfj;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lwfj;

    iget v1, v0, Lwfj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lwfj;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lwfj;

    invoke-direct {v0, p0, p2}, Lwfj;-><init>(Legj;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lwfj;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lwfj;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v3, :cond_2b

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, v0, Lwfj;->v:I

    iget-object p2, p0, Legj;->b:Li9c;

    invoke-virtual {p0, p2, p1, v0}, Legj;->e(Li9c;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_40

    return-object v1

    :cond_40
    return-object p0
.end method

.method public final g(JLesd;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p4, Lyfj;

    if-eqz v0, :cond_14

    move-object v0, p4

    check-cast v0, Lyfj;

    iget v1, v0, Lyfj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lyfj;->v:I

    :goto_12
    move-object v6, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lyfj;

    invoke-direct {v0, p0, p4}, Lyfj;-><init>(Legj;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p4, v6, Lyfj;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v6, Lyfj;->v:I

    const/4 v2, 0x1

    if-eqz v1, :cond_34

    if-ne v1, v2, :cond_2d

    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p4, Lt0i;

    iget-object p0, p4, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    iput v2, v6, Lyfj;->v:I

    iget-object v2, p0, Legj;->b:Li9c;

    move-object v1, p0

    move-wide v3, p1

    move-object v5, p3

    invoke-virtual/range {v1 .. v6}, Legj;->c(Li9c;JLesd;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_45

    return-object v0

    :cond_45
    return-object p0
.end method

.method public final h(JLesd;Lnt5;)Ljava/lang/Object;
    .registers 12

    instance-of v0, p4, Lagj;

    if-eqz v0, :cond_14

    move-object v0, p4

    check-cast v0, Lagj;

    iget v1, v0, Lagj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lagj;->v:I

    :goto_12
    move-object v6, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lagj;

    invoke-direct {v0, p0, p4}, Lagj;-><init>(Legj;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p4, v6, Lagj;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v6, Lagj;->v:I

    const/4 v2, 0x1

    if-eqz v1, :cond_34

    if-ne v1, v2, :cond_2d

    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p4, Lt0i;

    iget-object p0, p4, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    iput v2, v6, Lagj;->v:I

    iget-object v2, p0, Legj;->b:Li9c;

    move-object v1, p0

    move-wide v3, p1

    move-object v5, p3

    invoke-virtual/range {v1 .. v6}, Legj;->a(Li9c;JLesd;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_45

    return-object v0

    :cond_45
    return-object p0
.end method

.method public final i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p5, Lcgj;

    if-eqz v0, :cond_14

    move-object v0, p5

    check-cast v0, Lcgj;

    iget v1, v0, Lcgj;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_14

    sub-int/2addr v1, v2

    iput v1, v0, Lcgj;->v:I

    :goto_12
    move-object v7, v0

    goto :goto_1a

    :cond_14
    new-instance v0, Lcgj;

    invoke-direct {v0, p0, p5}, Lcgj;-><init>(Legj;Lnt5;)V

    goto :goto_12

    :goto_1a
    iget-object p5, v7, Lcgj;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, v7, Lcgj;->v:I

    const/4 v2, 0x1

    if-eqz v1, :cond_34

    if-ne v1, v2, :cond_2d

    invoke-static {p5}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p5, Lt0i;

    iget-object p0, p5, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_34
    invoke-static {p5}, Lybh;->y(Ljava/lang/Object;)V

    iput v2, v7, Lcgj;->v:I

    iget-object v2, p0, Legj;->b:Li9c;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v1 .. v7}, Legj;->d(Li9c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_47

    return-object v0

    :cond_47
    return-object p0
.end method
