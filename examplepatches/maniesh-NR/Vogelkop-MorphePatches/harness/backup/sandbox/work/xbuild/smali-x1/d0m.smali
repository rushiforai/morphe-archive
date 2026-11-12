.class public final Ld0m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpfe;

.field public final b:Ljava/util/LinkedHashMap;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lpfe;

    invoke-direct {v0}, Lpfe;-><init>()V

    iput-object v0, p0, Ld0m;->a:Lpfe;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Ld0m;->b:Ljava/util/LinkedHashMap;

    return-void
.end method


# virtual methods
.method public final a(Lzzl;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, La0m;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, La0m;

    iget v1, v0, La0m;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, La0m;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, La0m;

    invoke-direct {v0, p0, p2}, La0m;-><init>(Ld0m;Lnt5;)V

    :goto_18
    iget-object p2, v0, La0m;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, La0m;->x:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2e

    iget-object p1, v0, La0m;->u:Lpfe;

    iget-object v0, v0, La0m;->t:Lzzl;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object p2, p1

    move-object p1, v0

    goto :goto_46

    :cond_2e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_34
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, La0m;->t:Lzzl;

    iget-object p2, p0, Ld0m;->a:Lpfe;

    iput-object p2, v0, La0m;->u:Lpfe;

    iput v3, v0, La0m;->x:I

    invoke-virtual {p2, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_46

    return-object v1

    :cond_46
    :goto_46
    :try_start_46
    iget-object p0, p0, Ld0m;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/math/BigInteger;
    :try_end_4e
    .catchall {:try_start_46 .. :try_end_4e} :catchall_52

    invoke-virtual {p2, v4}, Lpfe;->l(Ljava/lang/Object;)V

    return-object p0

    :catchall_52
    move-exception p0

    invoke-virtual {p2, v4}, Lpfe;->l(Ljava/lang/Object;)V

    throw p0
.end method

.method public final b(Lzzl;Lnt5;)Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Ld0m;->b:Ljava/util/LinkedHashMap;

    instance-of v1, p2, Lb0m;

    if-eqz v1, :cond_15

    move-object v1, p2

    check-cast v1, Lb0m;

    iget v2, v1, Lb0m;->x:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_15

    sub-int/2addr v2, v3

    iput v2, v1, Lb0m;->x:I

    goto :goto_1a

    :cond_15
    new-instance v1, Lb0m;

    invoke-direct {v1, p0, p2}, Lb0m;-><init>(Ld0m;Lnt5;)V

    :goto_1a
    iget-object p2, v1, Lb0m;->v:Ljava/lang/Object;

    sget-object v2, Lpx5;->a:Lpx5;

    iget v3, v1, Lb0m;->x:I

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_34

    if-ne v3, v4, :cond_2e

    iget-object p0, v1, Lb0m;->u:Lpfe;

    iget-object p1, v1, Lb0m;->t:Lzzl;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_46

    :cond_2e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_34
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v1, Lb0m;->t:Lzzl;

    iget-object p0, p0, Ld0m;->a:Lpfe;

    iput-object p0, v1, Lb0m;->u:Lpfe;

    iput v4, v1, Lb0m;->x:I

    invoke-virtual {p0, v1}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v2, :cond_46

    return-object v2

    :cond_46
    :goto_46
    :try_start_46
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/math/BigInteger;

    if-eqz p2, :cond_56

    sget-object v1, Lpe3;->b:Ljava/math/BigInteger;

    invoke-virtual {p2, v1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p2

    if-nez p2, :cond_58

    :cond_56
    sget-object p2, Lpe3;->b:Ljava/math/BigInteger;

    :cond_58
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_5d
    .catchall {:try_start_46 .. :try_end_5d} :catchall_61

    invoke-virtual {p0, v5}, Lpfe;->l(Ljava/lang/Object;)V

    return-object p1

    :catchall_61
    move-exception p1

    invoke-virtual {p0, v5}, Lpfe;->l(Ljava/lang/Object;)V

    throw p1
.end method

.method public final c(Lzzl;Ljava/math/BigInteger;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p3, Lc0m;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lc0m;

    iget v1, v0, Lc0m;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lc0m;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Lc0m;

    invoke-direct {v0, p0, p3}, Lc0m;-><init>(Ld0m;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lc0m;->w:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lc0m;->y:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_36

    if-ne v2, v3, :cond_30

    iget-object p1, v0, Lc0m;->v:Lpfe;

    iget-object p2, v0, Lc0m;->u:Ljava/math/BigInteger;

    iget-object v0, v0, Lc0m;->t:Lzzl;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    move-object p3, p1

    move-object p1, v0

    goto :goto_4a

    :cond_30
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_36
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lc0m;->t:Lzzl;

    iput-object p2, v0, Lc0m;->u:Ljava/math/BigInteger;

    iget-object p3, p0, Ld0m;->a:Lpfe;

    iput-object p3, v0, Lc0m;->v:Lpfe;

    iput v3, v0, Lc0m;->y:I

    invoke-virtual {p3, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_4a

    return-object v1

    :cond_4a
    :goto_4a
    :try_start_4a
    iget-object p0, p0, Ld0m;->b:Ljava/util/LinkedHashMap;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_51
    .catchall {:try_start_4a .. :try_end_51} :catchall_55

    invoke-virtual {p3, v4}, Lpfe;->l(Ljava/lang/Object;)V

    return-object p0

    :catchall_55
    move-exception p0

    invoke-virtual {p3, v4}, Lpfe;->l(Ljava/lang/Object;)V

    throw p0
.end method
