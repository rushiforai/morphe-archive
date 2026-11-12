.class public final Ltz1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll32;

.field public final b:Lkul;

.field public final c:Lru9;

.field public final d:Lbw3;

.field public final e:Lnx5;

.field public final f:Ljg8;

.field public final g:Lqca;

.field public final h:Lode;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lcom/opera/android/webaiassistant/db/HistoryDatabase;Ll32;Lkul;Lru9;Lbw3;Lk51;Lnx5;Ljg8;)V
    .registers 19

    move-object/from16 v0, p9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Ltz1;->a:Ll32;

    iput-object p5, p0, Ltz1;->b:Lkul;

    iput-object p6, p0, Ltz1;->c:Lru9;

    iput-object p7, p0, Ltz1;->d:Lbw3;

    iput-object v0, p0, Ltz1;->e:Lnx5;

    move-object/from16 v1, p10

    iput-object v1, p0, Ltz1;->f:Ljg8;

    invoke-virtual {p3}, Lcom/opera/android/webaiassistant/db/HistoryDatabase;->x()Lqca;

    move-result-object p3

    iput-object p3, p0, Ltz1;->g:Lqca;

    new-instance p3, Lode;

    invoke-direct {p3}, Lekc;-><init>()V

    iput-object p3, p0, Ltz1;->h:Lode;

    new-instance p3, Llz1;

    invoke-direct {p3, p0}, Llz1;-><init>(Ltz1;)V

    new-instance v1, Lsz1;

    invoke-direct {v1, p0}, Lsz1;-><init>(Ltz1;)V

    new-instance v2, Lhz1;

    const/4 v7, 0x0

    const/4 v6, 0x0

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v2 .. v7}, Lhz1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v0, v6, v6, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    iget-object p0, p5, Lkul;->e:Li7f;

    invoke-virtual {p0, p3}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p4, Ll32;->e:Li7f;

    invoke-virtual {p0, v1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 11

    instance-of v0, p1, Lkz1;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lkz1;

    iget v1, v0, Lkz1;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lkz1;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lkz1;

    invoke-direct {v0, p0, p1}, Lkz1;-><init>(Ltz1;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lkz1;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lkz1;->v:I

    const/4 v3, 0x5

    const/4 v4, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x2

    iget-object v7, p0, Ltz1;->h:Lode;

    const/4 v8, 0x1

    if-eqz v2, :cond_40

    if-eq v2, v8, :cond_3c

    if-eq v2, v6, :cond_38

    if-ne v2, v5, :cond_32

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_cf

    :cond_32
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_38
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_67

    :cond_3c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_51

    :cond_40
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_51

    iput v8, v0, Lkz1;->v:I

    invoke-static {v7, v0}, Lxf8;->v(Lekc;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_ce

    :cond_51
    :goto_51
    iput v6, v0, Lkz1;->v:I

    iget-object p1, p0, Ltz1;->g:Lqca;

    iget-object p1, p1, Lqca;->a:Ly5i;

    new-instance v2, Lq9a;

    invoke-direct {v2, v3}, Lq9a;-><init>(B)V

    const/4 v6, 0x0

    invoke-static {v0, p1, v6, v8, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_65

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_65
    if-eq p1, v1, :cond_ce

    :goto_67
    iput v5, v0, Lkz1;->v:I

    new-instance p1, Lbhi;

    invoke-static {v0}, Lhib;->b(Lmt5;)Lmt5;

    move-result-object v0

    invoke-direct {p1, v0}, Lbhi;-><init>(Lmt5;)V

    new-instance v0, Lig;

    invoke-direct {v0, p1, v3}, Lig;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Ltz1;->a:Ll32;

    iget-object v2, p0, Ll32;->a:Lumi;

    new-instance v3, Lrml;

    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v3, v5, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v2, Lb32;

    invoke-direct {v2, p0, v8}, Lb32;-><init>(Ll32;B)V

    invoke-virtual {v3, v2}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v2

    new-instance v3, Lt02;

    const/4 v5, 0x6

    invoke-direct {v3, v0, v5}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    iget-object p0, p0, Ll32;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a2
    :goto_a2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ld32;

    if-eqz v2, :cond_a2

    iget-object v2, v2, Ld32;->a:Le32;

    iput-object v4, v2, Lf12;->a:Ld12;

    iput-object v4, v2, Lf12;->b:Ljava/util/ArrayList;

    goto :goto_a2

    :cond_c3
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->clear()V

    invoke-virtual {p1}, Lbhi;->a()Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, v1, :cond_cf

    :cond_ce
    return-object v1

    :cond_cf
    :goto_cf
    sget-object p0, Ll08;->a:Ll08;

    invoke-virtual {v7, p0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lmz1;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lmz1;

    iget v1, v0, Lmz1;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lmz1;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lmz1;

    invoke-direct {v0, p0, p2}, Lmz1;-><init>(Ltz1;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lmz1;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lmz1;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p1, v0, Lmz1;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4e

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lmz1;->t:Ljava/lang/String;

    iput v3, v0, Lmz1;->w:I

    iget-object p2, p0, Ltz1;->g:Lqca;

    iget-object p2, p2, Lqca;->a:Ly5i;

    new-instance v2, Ltx0;

    const/16 v4, 0x11

    invoke-direct {v2, p1, v4}, Ltx0;-><init>(Ljava/lang/String;B)V

    const/4 v4, 0x0

    invoke-static {v0, p2, v4, v3, v2}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_4b

    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_4b
    if-ne p2, v1, :cond_4e

    return-object v1

    :cond_4e
    :goto_4e
    iget-object p2, p0, Ltz1;->a:Ll32;

    iget-object v0, p2, Ll32;->a:Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lq3;

    const/16 v4, 0x15

    invoke-direct {v0, p2, p1, v4}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    iget-object p2, p2, Ll32;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_7f

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld32;

    if-nez v0, :cond_7d

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7f

    :cond_7d
    iput-boolean v3, v0, Ld32;->c:Z

    :cond_7f
    :goto_7f
    new-instance p2, Lr62;

    new-instance v0, Lwx;

    const/4 v1, 0x5

    invoke-direct {v0, p1, p0, v1}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Ltz1;->h:Lode;

    invoke-direct {p2, p0, v0, v3}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    return-object v2
.end method

.method public final c(Lnt5;)Ljava/lang/Object;
    .registers 16

    instance-of v0, p1, Lnz1;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lnz1;

    iget v1, v0, Lnz1;->A:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lnz1;->A:I

    goto :goto_18

    :cond_13
    new-instance v0, Lnz1;

    invoke-direct {v0, p0, p1}, Lnz1;-><init>(Ltz1;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lnz1;->y:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lnz1;->A:I

    const/4 v3, 0x0

    const-string v4, ".data"

    const/16 v5, 0xa

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v2, :cond_5a

    if-eq v2, v8, :cond_54

    if-eq v2, v7, :cond_48

    if-ne v2, v6, :cond_42

    iget-object v1, v0, Lnz1;->x:Ljava/util/Map;

    check-cast v1, Ljava/util/Map;

    iget-object v2, v0, Lnz1;->w:Lpqh;

    check-cast v2, Ljava/util/List;

    iget-object v2, v0, Lnz1;->v:Lpqh;

    iget-object v0, v0, Lnz1;->u:Ljava/util/List;

    check-cast v0, Ljava/util/List;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_11f

    :cond_42
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v9

    :cond_48
    iget-object v2, v0, Lnz1;->w:Lpqh;

    iget-object v7, v0, Lnz1;->v:Lpqh;

    iget-object v8, v0, Lnz1;->u:Ljava/util/List;

    check-cast v8, Ljava/util/List;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_99

    :cond_54
    iget-object v2, v0, Lnz1;->t:Li07;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_7b

    :cond_5a
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lpz1;

    invoke-direct {p1, p0, v9, v8}, Lpz1;-><init>(Ltz1;Lmt5;B)V

    iget-object v2, p0, Ltz1;->e:Lnx5;

    invoke-static {v2, v9, v9, p1, v6}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object p1

    new-instance v10, Lpz1;

    invoke-direct {v10, p0, v9, v3}, Lpz1;-><init>(Ltz1;Lmt5;B)V

    invoke-static {v2, v9, v9, v10, v6}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v2

    iput-object v2, v0, Lnz1;->t:Li07;

    iput v8, v0, Lnz1;->A:I

    invoke-virtual {p1, v0}, Lxob;->A(Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_11b

    :goto_7b
    check-cast p1, Ljava/util/List;

    new-instance v8, Lpqh;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    iput-object v9, v0, Lnz1;->t:Li07;

    move-object v10, p1

    check-cast v10, Ljava/util/List;

    iput-object v10, v0, Lnz1;->u:Ljava/util/List;

    iput-object v8, v0, Lnz1;->v:Lpqh;

    iput-object v8, v0, Lnz1;->w:Lpqh;

    iput v7, v0, Lnz1;->A:I

    invoke-interface {v2, v0}, Lh07;->X(Lmt5;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v1, :cond_11b

    move-object v7, v8

    move-object v8, p1

    move-object p1, v2

    move-object v2, v7

    :goto_99
    iput-object p1, v2, Lpqh;->a:Ljava/lang/Object;

    move-object p1, v8

    check-cast p1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-static {p1, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v2, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_ab
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_ca

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lh32;

    new-instance v11, Lkotlin/Pair;

    iget-object v10, v10, Lh32;->a:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v4}, Lkotlin/text/StringsKt;->U(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v10, v12}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_ab

    :cond_ca
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v10

    :cond_d3
    :goto_d3
    if-ge v3, v10, :cond_ee

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v3, v3, 0x1

    move-object v12, v11

    check-cast v12, Lkotlin/Pair;

    iget-object v13, v7, Lpqh;->a:Ljava/lang/Object;

    check-cast v13, Ljava/util/Map;

    iget-object v12, v12, Lkotlin/Pair;->b:Ljava/lang/Object;

    invoke-interface {v13, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_d3

    invoke-virtual {p1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d3

    :cond_ee
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_126

    iget-object v2, v7, Lpqh;->a:Ljava/lang/Object;

    check-cast v2, Ljava/util/Map;

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3, v2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    iput-object v3, v7, Lpqh;->a:Ljava/lang/Object;

    new-instance v2, Loz1;

    invoke-direct {v2, p1, p0, v9}, Loz1;-><init>(Ljava/util/ArrayList;Ltz1;Lmt5;)V

    iput-object v9, v0, Lnz1;->t:Li07;

    move-object p1, v8

    check-cast p1, Ljava/util/List;

    iput-object p1, v0, Lnz1;->u:Ljava/util/List;

    iput-object v7, v0, Lnz1;->v:Lpqh;

    iput-object v9, v0, Lnz1;->w:Lpqh;

    iput-object v3, v0, Lnz1;->x:Ljava/util/Map;

    iput v6, v0, Lnz1;->A:I

    iget-object p1, p0, Ltz1;->f:Ljg8;

    invoke-static {p1, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_11c

    :cond_11b
    return-object v1

    :cond_11c
    move-object v1, v3

    move-object v2, v7

    move-object v0, v8

    :goto_11f
    check-cast p1, Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    move-object v8, v0

    move-object v7, v2

    :cond_126
    check-cast v8, Ljava/lang/Iterable;

    new-instance p1, Ljava/util/ArrayList;

    invoke-static {v8, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_135
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_164

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh32;

    iget-object v2, v1, Lh32;->a:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v4}, Lkotlin/text/StringsKt;->U(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v7, Lpqh;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v3, :cond_159

    const-string v3, ""

    :cond_159
    new-instance v5, Ljz1;

    iget-object v1, v1, Lh32;->b:Lebb;

    invoke-direct {v5, v2, v3, v3, v1}, Ljz1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lebb;)V

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_135

    :cond_164
    iget-object p0, p0, Ltz1;->h:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final d(Landroid/content/Context;Lumi;Lnt5;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p3, Lqz1;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lqz1;

    iget v1, v0, Lqz1;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lqz1;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lqz1;

    invoke-direct {v0, p0, p3}, Lqz1;-><init>(Ltz1;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lqz1;->v:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lqz1;->x:I

    const/4 v3, 0x0

    const-string v4, "ai.bottomsheet.migration"

    iget-object v5, p0, Ltz1;->c:Lru9;

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v2, :cond_3f

    if-eq v2, v7, :cond_37

    if-ne v2, v6, :cond_31

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_be

    :cond_31
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v8

    :cond_37
    iget-object p1, v0, Lqz1;->u:Lrii;

    iget-object p2, v0, Lqz1;->t:La12;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_87

    :cond_3f
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p3, v5, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {p3, v4, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    if-lt p3, v7, :cond_4d

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_4d
    new-instance p3, La12;

    invoke-direct {p3, p1, p2}, La12;-><init>(Landroid/content/Context;Ltcl;)V

    new-instance v2, Lrii;

    const/16 v9, 0x15

    invoke-direct {v2, p3, v9}, Lrii;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2}, Lrii;->j()Z

    move-result v9

    if-eqz v9, :cond_a4

    new-instance v9, Lqb7;

    new-instance v10, Lvk6;

    invoke-direct {v10, p1, p2}, Lvk6;-><init>(Landroid/content/Context;Lumi;)V

    new-instance p1, Lwth;

    const/16 p2, 0xa

    invoke-direct {p1, p3, p2}, Lwth;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v9, v10, p1}, Lqb7;-><init>(Lvk6;Lwth;)V

    iget-object p1, v9, Lqb7;->c:Ljava/lang/Object;

    check-cast p1, Lkze;

    new-instance p2, Lrz1;

    invoke-direct {p2, v6, v8, v3}, Lrz1;-><init>(ILmt5;B)V

    iput-object p3, v0, Lqz1;->t:La12;

    iput-object v2, v0, Lqz1;->u:Lrii;

    iput v7, v0, Lqz1;->x:I

    invoke-static {p1, p2, v0}, Lxf8;->w(Lekc;Lkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_bd

    move-object p2, p3

    move-object p1, v2

    :goto_87
    iget-object p1, p1, Lrii;->b:Ljava/lang/Object;

    check-cast p1, La12;

    iget-object p1, p1, La12;->b:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p3, "ofa-migration-version"

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, p3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    move-object p3, p2

    :cond_a4
    new-instance p1, Lole;

    iget-object p2, p0, Ltz1;->f:Ljg8;

    invoke-direct {p1, p2}, Lole;-><init>(Ljava/lang/Object;)V

    iget-object p2, p0, Ltz1;->a:Ll32;

    iget-object p2, p2, Ll32;->d:Lk32;

    iput-object v8, v0, Lqz1;->t:La12;

    iput-object v8, v0, Lqz1;->u:Lrii;

    iput v6, v0, Lqz1;->x:I

    iget-object p0, p0, Ltz1;->g:Lqca;

    invoke-virtual {p1, p3, p2, p0, v0}, Lole;->x(La12;Lesk;Lqca;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_be

    :cond_bd
    return-object v1

    :cond_be
    :goto_be
    invoke-virtual {v5}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v4, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
