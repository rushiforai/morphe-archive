.class public final Lkz6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lqd6;

.field public final b:Lf99;

.field public final c:Lf99;

.field public final d:Lf99;

.field public final e:Lf99;

.field public final f:Lf99;

.field public final g:Lf99;

.field public final h:Lf99;

.field public final i:Lf99;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    sget-object v0, Lhon;->b:Lke6;

    sget-object v1, Lhon;->a:[Lxtb;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, p1}, Lke6;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqd6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkz6;->a:Lqd6;

    invoke-virtual {p0}, Lkz6;->d()Lx99;

    move-result-object p1

    new-instance v0, Lno6;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Lno6;-><init>(Lx99;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iput-object p1, p0, Lkz6;->b:Lf99;

    invoke-virtual {p0}, Lkz6;->d()Lx99;

    move-result-object p1

    new-instance v0, Lno6;

    const/4 v1, 0x7

    invoke-direct {v0, p1, v1}, Lno6;-><init>(Lx99;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iput-object p1, p0, Lkz6;->c:Lf99;

    invoke-virtual {p0}, Lkz6;->d()Lx99;

    move-result-object p1

    new-instance v0, Lno6;

    const/16 v1, 0x8

    invoke-direct {v0, p1, v1}, Lno6;-><init>(Lx99;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iput-object p1, p0, Lkz6;->d:Lf99;

    invoke-virtual {p0}, Lkz6;->d()Lx99;

    move-result-object p1

    new-instance v0, Lno6;

    const/16 v1, 0x9

    invoke-direct {v0, p1, v1}, Lno6;-><init>(Lx99;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iput-object p1, p0, Lkz6;->e:Lf99;

    invoke-virtual {p0}, Lkz6;->d()Lx99;

    move-result-object p1

    new-instance v0, Lno6;

    const/16 v1, 0xa

    invoke-direct {v0, p1, v1}, Lno6;-><init>(Lx99;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iput-object p1, p0, Lkz6;->f:Lf99;

    invoke-virtual {p0}, Lkz6;->d()Lx99;

    move-result-object p1

    new-instance v0, Lno6;

    const/16 v1, 0xb

    invoke-direct {v0, p1, v1}, Lno6;-><init>(Lx99;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iput-object p1, p0, Lkz6;->g:Lf99;

    invoke-virtual {p0}, Lkz6;->d()Lx99;

    move-result-object p1

    new-instance v0, Lno6;

    const/16 v1, 0xc

    invoke-direct {v0, p1, v1}, Lno6;-><init>(Lx99;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iput-object p1, p0, Lkz6;->h:Lf99;

    invoke-virtual {p0}, Lkz6;->d()Lx99;

    move-result-object p1

    new-instance v0, Lno6;

    const/16 v1, 0xd

    invoke-direct {v0, p1, v1}, Lno6;-><init>(Lx99;B)V

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iput-object p1, p0, Lkz6;->i:Lf99;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p1, Lhy6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lhy6;

    iget v1, v0, Lhy6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lhy6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lhy6;

    invoke-direct {v0, p0, p1}, Lhy6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lhy6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lhy6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_44

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lxf;

    const/4 v2, 0x2

    const/16 v5, 0xb

    invoke-direct {p1, v2, v3, v5}, Lxf;-><init>(ILmt5;B)V

    iput v4, v0, Lhy6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p1, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p1, Liy6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Liy6;

    iget v1, v0, Liy6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Liy6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Liy6;

    invoke-direct {v0, p0, p1}, Liy6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p1, v0, Liy6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Liy6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_44

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lxf;

    const/4 v2, 0x2

    const/16 v5, 0xc

    invoke-direct {p1, v2, v3, v5}, Lxf;-><init>(ILmt5;B)V

    iput v4, v0, Liy6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p1, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final c(Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p1, Ljy6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Ljy6;

    iget v1, v0, Ljy6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ljy6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Ljy6;

    invoke-direct {v0, p0, p1}, Ljy6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p1, v0, Ljy6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ljy6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_44

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lxf;

    const/4 v2, 0x2

    const/16 v5, 0xd

    invoke-direct {p1, v2, v3, v5}, Lxf;-><init>(ILmt5;B)V

    iput v4, v0, Ljy6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p1, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final d()Lx99;
    .registers 5

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0}, Lqd6;->getData()Lf99;

    move-result-object p0

    new-instance v0, Lra6;

    const/4 v1, 0x3

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lra6;-><init>(ILmt5;B)V

    new-instance v1, Lx99;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v0, v2}, Lx99;-><init>(Lf99;Lcr9;B)V

    return-object v1
.end method

.method public final e(ZLnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lky6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lky6;

    iget v1, v0, Lky6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lky6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lky6;

    invoke-direct {v0, p0, p2}, Lky6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lky6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lky6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_42

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lue6;

    const/4 v2, 0x6

    invoke-direct {p2, p1, v3, v2}, Lue6;-><init>(ZLmt5;B)V

    iput v4, v0, Lky6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p2, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_42

    return-object v1

    :cond_42
    :goto_42
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final f(Ljava/util/List;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lly6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lly6;

    iget v1, v0, Lly6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lly6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lly6;

    invoke-direct {v0, p0, p2}, Lly6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lly6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lly6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_42

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lmy6;

    const/4 v2, 0x0

    invoke-direct {p2, p1, v3, v2}, Lmy6;-><init>(Ljava/util/List;Lmt5;B)V

    iput v4, v0, Lly6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p2, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_42

    return-object v1

    :cond_42
    :goto_42
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final g(ZLnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lny6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lny6;

    iget v1, v0, Lny6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lny6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lny6;

    invoke-direct {v0, p0, p2}, Lny6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lny6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lny6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_42

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lue6;

    const/4 v2, 0x7

    invoke-direct {p2, p1, v3, v2}, Lue6;-><init>(ZLmt5;B)V

    iput v4, v0, Lny6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p2, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_42

    return-object v1

    :cond_42
    :goto_42
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final h(Lvv9;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Loy6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Loy6;

    iget v1, v0, Loy6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Loy6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Loy6;

    invoke-direct {v0, p0, p2}, Loy6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Loy6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Loy6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lvr;

    const/16 v2, 0x15

    invoke-direct {p2, v2, v3, p1}, Lvr;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v4, v0, Loy6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p2, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final i(Lzxc;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lpy6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lpy6;

    iget v1, v0, Lpy6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lpy6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lpy6;

    invoke-direct {v0, p0, p2}, Lpy6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lpy6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lpy6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lvr;

    const/16 v2, 0x16

    invoke-direct {p2, v2, v3, p1}, Lvr;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v4, v0, Lpy6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p2, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final j(Lq0e;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lqy6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lqy6;

    iget v1, v0, Lqy6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lqy6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lqy6;

    invoke-direct {v0, p0, p2}, Lqy6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lqy6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lqy6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lvr;

    const/16 v2, 0x17

    invoke-direct {p2, v2, v3, p1}, Lvr;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v4, v0, Lqy6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p2, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final k(Lfxc;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lry6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lry6;

    iget v1, v0, Lry6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lry6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lry6;

    invoke-direct {v0, p0, p2}, Lry6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lry6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lry6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lvr;

    const/16 v2, 0x18

    invoke-direct {p2, v2, v3, p1}, Lvr;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v4, v0, Lry6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p2, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final l(Ldel;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lsy6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lsy6;

    iget v1, v0, Lsy6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lsy6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lsy6;

    invoke-direct {v0, p0, p2}, Lsy6;-><init>(Lkz6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lsy6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lsy6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lvr;

    const/16 v2, 0x19

    invoke-direct {p2, v2, v3, p1}, Lvr;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v4, v0, Lsy6;->v:I

    iget-object p0, p0, Lkz6;->a:Lqd6;

    invoke-interface {p0, p2, v0}, Lqd6;->a(Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
