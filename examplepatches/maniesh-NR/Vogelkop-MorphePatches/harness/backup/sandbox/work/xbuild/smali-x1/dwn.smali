.class public final Ldwn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lan6;

.field public final b:Lnx5;

.field public final c:Ljdj;

.field public final d:Ljkc;

.field public final e:Lpfe;

.field public final f:Ljava/util/HashMap;

.field public g:I


# direct methods
.method public constructor <init>(Lan6;Lnx5;La64;Ljdj;Ljkc;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldwn;->a:Lan6;

    iput-object p2, p0, Ldwn;->b:Lnx5;

    iput-object p4, p0, Ldwn;->c:Ljdj;

    iput-object p5, p0, Ldwn;->d:Ljkc;

    new-instance p1, Lpfe;

    invoke-direct {p1}, Lpfe;-><init>()V

    iput-object p1, p0, Ldwn;->e:Lpfe;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Ldwn;->f:Ljava/util/HashMap;

    new-instance p1, Lsbl;

    const/16 p2, 0x8

    const/4 p4, 0x0

    invoke-direct {p1, p2, p4, p0}, Lsbl;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p2, 0x3

    invoke-static {p3, p4, p4, p1, p2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    new-instance p2, Lqfl;

    const/16 p3, 0x1a

    invoke-direct {p2, p0, p3}, Lqfl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lxob;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    return-void
.end method


# virtual methods
.method public final a(Ljava/io/IOException;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lxvn;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lxvn;

    iget v1, v0, Lxvn;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lxvn;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lxvn;

    invoke-direct {v0, p0, p2}, Lxvn;-><init>(Ldwn;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lxvn;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lxvn;->x:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_34

    if-ne v2, v3, :cond_2e

    iget-object p1, v0, Lxvn;->u:Lpfe;

    iget-object v0, v0, Lxvn;->t:Ljava/io/IOException;

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

    iget-object p2, p0, Ldwn;->e:Lpfe;

    iput-object p1, v0, Lxvn;->t:Ljava/io/IOException;

    iput-object p2, v0, Lxvn;->u:Lpfe;

    iput v3, v0, Lxvn;->x:I

    invoke-virtual {p2, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_46

    return-object v1

    :cond_46
    :goto_46
    :try_start_46
    sget-object v0, Lhzc;->c:Lgzc;

    const-string v1, "RemoteNode"

    invoke-virtual {v0, v1}, Lhzc;->c(Ljava/lang/String;)Lhzc;

    move-result-object v0

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->b:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_61

    const-string v3, "Cancelling requests"

    invoke-virtual {v0, v2, v1, v3, v4}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_61
    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    iget-object p1, p0, Ldwn;->f:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_72
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_99

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltvn;

    iget-object v1, v1, Ltvn;->e:Lnak;

    :cond_80
    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lt0i;

    if-eqz v3, :cond_8c

    iget-object v3, v3, Lt0i;->a:Ljava/lang/Object;

    goto :goto_8d

    :cond_8c
    move-object v3, v0

    :goto_8d
    new-instance v5, Lt0i;

    invoke-direct {v5, v3}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v5}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_80

    goto :goto_72

    :cond_99
    iget-object p0, p0, Ldwn;->f:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_a0
    .catchall {:try_start_46 .. :try_end_a0} :catchall_a4

    invoke-virtual {p2, v4}, Lpfe;->l(Ljava/lang/Object;)V

    return-object p0

    :catchall_a4
    move-exception p0

    invoke-virtual {p2, v4}, Lpfe;->l(Ljava/lang/Object;)V

    throw p0
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lyvn;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lyvn;

    iget v1, v0, Lyvn;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lyvn;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lyvn;

    invoke-direct {v0, p0, p1}, Lyvn;-><init>(Ldwn;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lyvn;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lyvn;->w:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_2a

    iget-object v0, v0, Lyvn;->t:Lpfe;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_41

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Ldwn;->e:Lpfe;

    iput-object p1, v0, Lyvn;->t:Lpfe;

    iput v3, v0, Lyvn;->w:I

    invoke-virtual {p1, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_40

    return-object v1

    :cond_40
    move-object v0, p1

    :goto_41
    :try_start_41
    iget p1, p0, Ldwn;->g:I

    add-int/lit8 v1, p1, 0x1

    iput v1, p0, Ldwn;->g:I

    new-instance p0, Ljava/lang/Integer;

    invoke-direct {p0, p1}, Ljava/lang/Integer;-><init>(I)V
    :try_end_4c
    .catchall {:try_start_41 .. :try_end_4c} :catchall_50

    invoke-virtual {v0, v4}, Lpfe;->l(Ljava/lang/Object;)V

    return-object p0

    :catchall_50
    move-exception p0

    invoke-virtual {v0, v4}, Lpfe;->l(Ljava/lang/Object;)V

    throw p0
.end method

.method public final c(ILjava/lang/Exception;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p3, Lzvn;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lzvn;

    iget v1, v0, Lzvn;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lzvn;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lzvn;

    invoke-direct {v0, p0, p3}, Lzvn;-><init>(Ldwn;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lzvn;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lzvn;->w:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v4, :cond_2a

    iget-object p2, v0, Lzvn;->t:Ljava/lang/Exception;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3e

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p2, v0, Lzvn;->t:Ljava/lang/Exception;

    iput v4, v0, Lzvn;->w:I

    invoke-virtual {p0, p1, v0}, Ldwn;->e(ILnt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_3e

    return-object v1

    :cond_3e
    :goto_3e
    check-cast p3, Ltvn;

    if-eqz p3, :cond_51

    iget-object p0, p3, Ltvn;->e:Lnak;

    new-instance p1, Lq0i;

    invoke-direct {p1, p2}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance p2, Lt0i;

    invoke-direct {p2, p1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v3, p2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_51
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final d(Lkotlinx/serialization/json/c;Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p2, Lawn;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lawn;

    iget v1, v0, Lawn;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lawn;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lawn;

    invoke-direct {v0, p0, p2}, Lawn;-><init>(Ldwn;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lawn;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lawn;->w:I

    const-string v3, "id"

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    iget-object p1, v0, Lawn;->t:Lkotlinx/serialization/json/c;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_56

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p1, v3}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/json/b;

    if-eqz p2, :cond_59

    invoke-static {p2}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p2

    invoke-static {p2}, Lqqb;->f(Lkotlinx/serialization/json/d;)Ljava/lang/Integer;

    move-result-object p2

    if-eqz p2, :cond_59

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    iput-object p1, v0, Lawn;->t:Lkotlinx/serialization/json/c;

    iput v4, v0, Lawn;->w:I

    invoke-virtual {p0, p2, v0}, Ldwn;->e(ILnt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_56

    return-object v1

    :cond_56
    :goto_56
    check-cast p2, Ltvn;

    goto :goto_5a

    :cond_59
    move-object p2, v5

    :goto_5a
    if-nez p2, :cond_fb

    const-string p2, "method"

    invoke-virtual {p1, p2}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/json/b;

    if-eqz p2, :cond_6f

    invoke-static {p2}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p2

    invoke-static {p2}, Lz5i;->L(Lkotlinx/serialization/json/d;)Ljava/lang/String;

    move-result-object p2

    goto :goto_70

    :cond_6f
    move-object p2, v5

    :goto_70
    const-string v0, "eth_subscription"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_f5

    const-string p2, "result"

    const-string v1, "subscription"

    :try_start_7c
    const-string v2, "params"

    invoke-virtual {p1, v2}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_c2

    check-cast v2, Lkotlinx/serialization/json/b;

    invoke-static {v2}, Lqqb;->h(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/c;

    move-result-object v2

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v4, "type"

    invoke-static {v0}, Lqqb;->c(Ljava/lang/String;)Lkotlinx/serialization/json/d;

    move-result-object v0

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    invoke-virtual {v2, v1}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    if-eqz v0, :cond_a9

    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    :cond_a9
    invoke-virtual {v2, p2}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    if-eqz v0, :cond_b7

    invoke-interface {v3, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlinx/serialization/json/b;

    :cond_b7
    new-instance p2, Lkotlinx/serialization/json/c;

    invoke-direct {p2, v3}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    iget-object p0, p0, Ldwn;->c:Ljdj;

    invoke-virtual {p0, p2}, Ljdj;->i(Ljava/lang/Object;)Z

    goto :goto_f2

    :cond_c2
    const-string p0, "Required value was null."

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_ca
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7c .. :try_end_ca} :catch_ca

    :catch_ca
    move-exception p0

    sget-object p2, Lhzc;->c:Lgzc;

    const-string v0, "RemoteNode"

    invoke-virtual {p2, v0}, Lhzc;->c(Ljava/lang/String;)Lhzc;

    move-result-object p2

    iget-object v0, p2, Lhzc;->b:Ljava/lang/String;

    sget-object v1, Leaj;->e:Leaj;

    iget-object v2, p2, Lhzc;->a:Letb;

    iget-object v2, v2, Letb;->a:Leaj;

    invoke-virtual {v2, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    if-gtz v2, :cond_f2

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Failed to parse json: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v1, v0, p1, p0}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_f2
    :goto_f2
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_f5
    const-string p0, "No request found"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v5

    :cond_fb
    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-boolean v0, p2, Ltvn;->d:Z

    if-eqz v0, :cond_112

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0}, Lqqb;->a(Ljava/lang/Boolean;)Lkotlinx/serialization/json/d;

    move-result-object v0

    const-string v1, "is_subscription"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    :cond_112
    iget-object v0, p2, Ltvn;->b:Lkotlinx/serialization/json/b;

    if-eqz v0, :cond_11c

    invoke-interface {p0, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    :cond_11c
    new-instance v0, Lkotlinx/serialization/json/c;

    invoke-direct {v0, p0}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    invoke-static {p1, v0}, Lrbd;->e(Ljava/util/Map;Ljava/util/Map;)Ljava/util/LinkedHashMap;

    move-result-object p0

    new-instance p1, Lkotlinx/serialization/json/c;

    invoke-direct {p1, p0}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    iget-object p0, p2, Ltvn;->e:Lnak;

    sget-object p2, Lt0i;->b:Lp0i;

    invoke-virtual {p1}, Lkotlinx/serialization/json/c;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lt0i;

    invoke-direct {p2, p1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v5, p2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final e(ILnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lbwn;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lbwn;

    iget v1, v0, Lbwn;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lbwn;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lbwn;

    invoke-direct {v0, p0, p2}, Lbwn;-><init>(Ldwn;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lbwn;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lbwn;->x:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_32

    if-ne v2, v3, :cond_2c

    iget p1, v0, Lbwn;->t:I

    iget-object v0, v0, Lbwn;->u:Lpfe;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_45

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p2, p0, Ldwn;->e:Lpfe;

    iput-object p2, v0, Lbwn;->u:Lpfe;

    iput p1, v0, Lbwn;->t:I

    iput v3, v0, Lbwn;->x:I

    invoke-virtual {p2, v0}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v1, :cond_44

    return-object v1

    :cond_44
    move-object v0, p2

    :goto_45
    :try_start_45
    iget-object p0, p0, Ldwn;->f:Ljava/util/HashMap;

    new-instance p2, Ljava/lang/Integer;

    invoke-direct {p2, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {p0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltvn;
    :try_end_52
    .catchall {:try_start_45 .. :try_end_52} :catchall_56

    invoke-virtual {v0, v4}, Lpfe;->l(Ljava/lang/Object;)V

    return-object p0

    :catchall_56
    move-exception p0

    invoke-virtual {v0, v4}, Lpfe;->l(Ljava/lang/Object;)V

    throw p0
.end method

.method public final f(Lqfb;Lnt5;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    const-string v3, "Sending json: "

    instance-of v4, v2, Lcwn;

    if-eqz v4, :cond_1b

    move-object v4, v2

    check-cast v4, Lcwn;

    iget v5, v4, Lcwn;->C:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_1b

    sub-int/2addr v5, v6

    iput v5, v4, Lcwn;->C:I

    goto :goto_20

    :cond_1b
    new-instance v4, Lcwn;

    invoke-direct {v4, v1, v2}, Lcwn;-><init>(Ldwn;Lnt5;)V

    :goto_20
    iget-object v2, v4, Lcwn;->A:Ljava/lang/Object;

    sget-object v5, Lpx5;->a:Lpx5;

    iget v6, v4, Lcwn;->C:I

    const-string v7, "RemoteNode"

    const-string v8, "id"

    const/4 v9, 0x5

    const/4 v10, 0x4

    const/4 v11, 0x3

    const/4 v12, 0x2

    const/4 v13, 0x1

    const/4 v14, 0x0

    if-eqz v6, :cond_8b

    if-eq v6, v13, :cond_7d

    if-eq v6, v12, :cond_6a

    if-eq v6, v11, :cond_56

    if-eq v6, v10, :cond_47

    if-ne v6, v9, :cond_41

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_20d

    :cond_41
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v14

    :cond_47
    iget-boolean v0, v4, Lcwn;->z:Z

    iget v1, v4, Lcwn;->y:I

    iget-object v3, v4, Lcwn;->x:Lpfe;

    check-cast v3, Ljava/lang/Exception;

    iget-object v3, v4, Lcwn;->w:Ltvn;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1e9

    :cond_56
    iget-boolean v3, v4, Lcwn;->z:Z

    iget v6, v4, Lcwn;->y:I

    iget-object v0, v4, Lcwn;->x:Lpfe;

    check-cast v0, Lan6;

    iget-object v8, v4, Lcwn;->w:Ltvn;

    :try_start_60
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_63} :catch_65

    goto/16 :goto_1ec

    :catch_65
    move-exception v0

    move v2, v3

    :goto_67
    move-object v3, v8

    goto/16 :goto_1b8

    :cond_6a
    iget-boolean v0, v4, Lcwn;->z:Z

    iget v6, v4, Lcwn;->y:I

    iget-object v8, v4, Lcwn;->x:Lpfe;

    iget-object v12, v4, Lcwn;->w:Ltvn;

    iget-object v13, v4, Lcwn;->v:Lkotlinx/serialization/json/c;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move-object v2, v12

    move-object v12, v8

    move-object v8, v2

    :goto_7a
    move v2, v0

    goto/16 :goto_116

    :cond_7d
    iget-object v0, v4, Lcwn;->u:Lkotlinx/serialization/json/b;

    iget-object v6, v4, Lcwn;->t:Lqfb;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v16, v2

    move-object v2, v0

    move-object v0, v6

    move-object/from16 v6, v16

    goto :goto_a4

    :cond_8b
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v0, Lqfb;->b:Ljava/lang/Object;

    check-cast v2, Lkotlinx/serialization/json/c;

    invoke-virtual {v2, v8}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/json/b;

    iput-object v0, v4, Lcwn;->t:Lqfb;

    iput-object v2, v4, Lcwn;->u:Lkotlinx/serialization/json/b;

    iput v13, v4, Lcwn;->C:I

    invoke-virtual {v1, v4}, Ldwn;->b(Lnt5;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v5, :cond_20c

    :goto_a4
    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    iget-object v0, v0, Lqfb;->b:Ljava/lang/Object;

    check-cast v0, Lkotlinx/serialization/json/c;

    new-instance v13, Ljava/util/LinkedHashMap;

    invoke-direct {v13}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v15, Ljava/lang/Integer;

    invoke-direct {v15, v6}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {v15}, Lqqb;->b(Ljava/lang/Number;)Lkotlinx/serialization/json/d;

    move-result-object v15

    invoke-interface {v13, v8, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkotlinx/serialization/json/b;

    new-instance v8, Lkotlinx/serialization/json/c;

    invoke-direct {v8, v13}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    invoke-static {v0, v8}, Lrbd;->e(Ljava/util/Map;Ljava/util/Map;)Ljava/util/LinkedHashMap;

    move-result-object v0

    new-instance v13, Lkotlinx/serialization/json/c;

    invoke-direct {v13, v0}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    const-string v0, "method"

    invoke-virtual {v13, v0}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    if-eqz v0, :cond_ef

    instance-of v8, v0, Lkotlinx/serialization/json/d;

    if-eqz v8, :cond_e1

    check-cast v0, Lkotlinx/serialization/json/d;

    goto :goto_e2

    :cond_e1
    move-object v0, v14

    :goto_e2
    if-eqz v0, :cond_ef

    invoke-virtual {v0}, Lkotlinx/serialization/json/d;->c()Z

    move-result v8

    if-eqz v8, :cond_ef

    invoke-virtual {v0}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object v0

    goto :goto_f0

    :cond_ef
    move-object v0, v14

    :goto_f0
    const-string v8, "eth_subscribe"

    invoke-static {v0, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    new-instance v8, Ltvn;

    invoke-direct {v8, v6, v2, v13, v0}, Ltvn;-><init>(ILkotlinx/serialization/json/b;Lkotlinx/serialization/json/c;Z)V

    iget-object v2, v1, Ldwn;->e:Lpfe;

    iput-object v14, v4, Lcwn;->t:Lqfb;

    iput-object v14, v4, Lcwn;->u:Lkotlinx/serialization/json/b;

    iput-object v13, v4, Lcwn;->v:Lkotlinx/serialization/json/c;

    iput-object v8, v4, Lcwn;->w:Ltvn;

    iput-object v2, v4, Lcwn;->x:Lpfe;

    iput v6, v4, Lcwn;->y:I

    iput-boolean v0, v4, Lcwn;->z:Z

    iput v12, v4, Lcwn;->C:I

    invoke-virtual {v2, v4}, Lpfe;->i(Lmt5;)Ljava/lang/Object;

    move-result-object v12

    if-eq v12, v5, :cond_20c

    move-object v12, v2

    goto/16 :goto_7a

    :goto_116
    :try_start_116
    iget-object v0, v1, Ldwn;->f:Ljava/util/HashMap;

    new-instance v15, Ljava/lang/Integer;

    invoke-direct {v15, v6}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v15, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_120
    .catchall {:try_start_116 .. :try_end_120} :catchall_215

    invoke-virtual {v12, v14}, Lpfe;->l(Ljava/lang/Object;)V

    :try_start_123
    sget-object v0, Lhzc;->c:Lgzc;

    invoke-virtual {v0, v7}, Lhzc;->c(Ljava/lang/String;)Lhzc;

    move-result-object v0

    iget-object v12, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v15, Leaj;->b:Leaj;

    iget-object v9, v0, Lhzc;->a:Letb;

    iget-object v9, v9, Letb;->a:Leaj;

    invoke-virtual {v9, v15}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v9

    if-gtz v9, :cond_146

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v15, v12, v3, v14}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_146
    iget-object v0, v1, Ldwn;->a:Lan6;

    const-class v3, Lkotlinx/serialization/json/c;

    invoke-static {v3}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v9
    :try_end_14e
    .catch Ljava/lang/Exception; {:try_start_123 .. :try_end_14e} :catch_1b5

    :try_start_14e
    invoke-static {v3}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v3
    :try_end_152
    .catchall {:try_start_14e .. :try_end_152} :catchall_153

    goto :goto_154

    :catchall_153
    move-object v3, v14

    :goto_154
    :try_start_154
    new-instance v12, Lx9m;

    invoke-direct {v12, v9, v3}, Lx9m;-><init>(Litb;Lcam;)V

    iput-object v14, v4, Lcwn;->t:Lqfb;

    iput-object v14, v4, Lcwn;->u:Lkotlinx/serialization/json/b;

    iput-object v14, v4, Lcwn;->v:Lkotlinx/serialization/json/c;

    iput-object v8, v4, Lcwn;->w:Ltvn;

    iput-object v14, v4, Lcwn;->x:Lpfe;

    iput v6, v4, Lcwn;->y:I

    iput-boolean v2, v4, Lcwn;->z:Z

    iput v11, v4, Lcwn;->C:I

    iget-object v3, v0, Lan6;->b:Ltna;

    iget-object v3, v3, Ltna;->a:Lpna;

    sget-object v9, Liwn;->d:Ltmj;

    sget-object v11, Lgoa;->a:Ljf2;

    iget-object v3, v3, Lpna;->h:Lpj5;

    sget-object v11, Lgoa;->a:Ljf2;

    invoke-virtual {v3, v11}, Lpj5;->e(Ljf2;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpj5;

    if-eqz v3, :cond_186

    invoke-virtual {v9}, Ltmj;->getKey()Ljf2;

    move-result-object v9

    invoke-virtual {v3, v9}, Lpj5;->e(Ljf2;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_187

    :cond_186
    move-object v3, v14

    :goto_187
    check-cast v3, Liwn;

    if-eqz v3, :cond_18e

    iget-object v3, v3, Liwn;->b:Lwub;

    goto :goto_18f

    :cond_18e
    move-object v3, v14

    :goto_18f
    if-eqz v3, :cond_1ad

    iget-object v9, v0, Lan6;->b:Ltna;

    iget-object v9, v9, Ltna;->b:Lrpa;

    if-nez v9, :cond_198

    move-object v9, v14

    :cond_198
    invoke-interface {v9}, Lyoa;->a()Ld9a;

    move-result-object v9

    invoke-static {v9}, Loup;->t0(Ld9a;)Ljava/nio/charset/Charset;

    invoke-static {v0, v13, v12, v3, v4}, Luyg;->o(Luvn;Lkotlinx/serialization/json/c;Lx9m;Lwub;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    sget-object v3, Lpx5;->a:Lpx5;

    if-eq v0, v3, :cond_1a9

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_1a9
    if-eq v0, v5, :cond_20c

    move v3, v2

    goto :goto_1ec

    :cond_1ad
    new-instance v0, Ldzn;

    const-string v3, "No converter was found for websocket"

    invoke-direct {v0, v3, v14}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
    :try_end_1b5
    .catch Ljava/lang/Exception; {:try_start_154 .. :try_end_1b5} :catch_1b5

    :catch_1b5
    move-exception v0

    goto/16 :goto_67

    :goto_1b8
    sget-object v8, Lhzc;->c:Lgzc;

    invoke-virtual {v8, v7}, Lhzc;->c(Ljava/lang/String;)Lhzc;

    move-result-object v7

    iget-object v8, v7, Lhzc;->b:Ljava/lang/String;

    sget-object v9, Leaj;->e:Leaj;

    iget-object v11, v7, Lhzc;->a:Letb;

    iget-object v11, v11, Letb;->a:Leaj;

    invoke-virtual {v11, v9}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v11

    if-gtz v11, :cond_1d1

    const-string v11, "Failed writing to a web socket"

    invoke-virtual {v7, v9, v8, v11, v0}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1d1
    iput-object v14, v4, Lcwn;->t:Lqfb;

    iput-object v14, v4, Lcwn;->u:Lkotlinx/serialization/json/b;

    iput-object v14, v4, Lcwn;->v:Lkotlinx/serialization/json/c;

    iput-object v3, v4, Lcwn;->w:Ltvn;

    iput-object v14, v4, Lcwn;->x:Lpfe;

    iput v6, v4, Lcwn;->y:I

    iput-boolean v2, v4, Lcwn;->z:Z

    iput v10, v4, Lcwn;->C:I

    invoke-virtual {v1, v6, v0, v4}, Ldwn;->c(ILjava/lang/Exception;Lnt5;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, v5, :cond_20c

    move v0, v2

    move v1, v6

    :goto_1e9
    move v6, v1

    move-object v8, v3

    move v3, v0

    :goto_1ec
    iget-object v0, v8, Ltvn;->e:Lnak;

    new-instance v1, Lyc1;

    const/16 v2, 0xd

    invoke-direct {v1, v0, v2}, Lyc1;-><init>(Lf99;B)V

    iput-object v14, v4, Lcwn;->t:Lqfb;

    iput-object v14, v4, Lcwn;->u:Lkotlinx/serialization/json/b;

    iput-object v14, v4, Lcwn;->v:Lkotlinx/serialization/json/c;

    iput-object v14, v4, Lcwn;->w:Ltvn;

    iput-object v14, v4, Lcwn;->x:Lpfe;

    iput v6, v4, Lcwn;->y:I

    iput-boolean v3, v4, Lcwn;->z:Z

    const/4 v2, 0x5

    iput v2, v4, Lcwn;->C:I

    invoke-static {v1, v4}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v5, :cond_20d

    :cond_20c
    return-object v5

    :cond_20d
    :goto_20d
    check-cast v2, Lt0i;

    iget-object v0, v2, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    return-object v0

    :catchall_215
    move-exception v0

    invoke-virtual {v12, v14}, Lpfe;->l(Ljava/lang/Object;)V

    throw v0
.end method
