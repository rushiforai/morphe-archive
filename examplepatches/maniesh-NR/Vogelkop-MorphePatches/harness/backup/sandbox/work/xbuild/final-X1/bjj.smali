.class public final Lbjj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lsjj;


# direct methods
.method public constructor <init>(Lsjj;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbjj;->a:Lsjj;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lavb;Lzij;Lnt5;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    instance-of v4, v3, Lajj;

    if-eqz v4, :cond_1b

    move-object v4, v3

    check-cast v4, Lajj;

    iget v5, v4, Lajj;->v:I

    const/high16 v6, -0x80000000

    and-int v7, v5, v6

    if-eqz v7, :cond_1b

    sub-int/2addr v5, v6

    iput v5, v4, Lajj;->v:I

    goto :goto_20

    :cond_1b
    new-instance v4, Lajj;

    invoke-direct {v4, v0, v3}, Lajj;-><init>(Lbjj;Lnt5;)V

    :goto_20
    iget-object v3, v4, Lajj;->t:Ljava/lang/Object;

    sget-object v5, Lpx5;->a:Lpx5;

    iget v6, v4, Lajj;->v:I

    const-string v7, "0x"

    const/4 v8, 0x4

    const/4 v9, 0x3

    const/4 v10, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v6, :cond_51

    if-eq v6, v11, :cond_4c

    if-eq v6, v10, :cond_47

    if-eq v6, v9, :cond_42

    if-ne v6, v8, :cond_3c

    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1ba

    :cond_3c
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v12

    :cond_42
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1ce

    :cond_47
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1db

    :cond_4c
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1fa

    :cond_51
    invoke-static {v3}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_174

    if-eq v3, v11, :cond_165

    if-eq v3, v10, :cond_15c

    if-ne v3, v9, :cond_156

    sget-object v3, Lrpb;->d:Lqpb;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Ldjk;->Companion:Lcjk;

    invoke-virtual {v6}, Lcjk;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v6

    check-cast v6, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v3, v1, v6}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldjk;

    new-instance v3, Lurj;

    invoke-direct {v3, v10}, Lurj;-><init>(B)V

    new-instance v6, Lajk;

    const-string v13, "name"

    const-string v14, "string"

    invoke-direct {v6, v13, v14}, Lajk;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v13, Lajk;

    const-string v15, "version"

    invoke-direct {v13, v15, v14}, Lajk;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v14, Lajk;

    const-string v15, "chainId"

    move-object/from16 p4, v12

    const-string v12, "uint256"

    invoke-direct {v14, v15, v12}, Lajk;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v12, Lajk;

    const-string v15, "verifyingContract"

    const-string v8, "address"

    invoke-direct {v12, v15, v8}, Lajk;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v8, Lajk;

    const-string v15, "salt"

    const-string v9, "bytes32"

    invoke-direct {v8, v15, v9}, Lajk;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    filled-new-array {v6, v13, v14, v12, v8}, [Lajk;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    iget-object v8, v1, Ldjk;->a:Ljava/util/Map;

    iget-object v9, v1, Ldjk;->d:Lkotlinx/serialization/json/c;

    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12, v8}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    const-string v8, "EIP712Domain"

    invoke-virtual {v12, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    if-nez v13, :cond_c0

    sget-object v13, Ll08;->a:Ll08;

    :cond_c0
    check-cast v13, Ljava/lang/Iterable;

    invoke-static {v13}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v13

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_cf
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_10f

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lajk;

    iget-object v10, v9, Lkotlinx/serialization/json/c;->a:Ljava/util/Map;

    invoke-interface {v10}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v10

    iget-object v11, v15, Lajk;->a:Ljava/lang/String;

    invoke-interface {v10, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_ec

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_ec
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_f0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_cf

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lajk;

    iget-object v11, v11, Lajk;->a:Ljava/lang/String;

    move-object/from16 p1, v6

    iget-object v6, v15, Lajk;->a:Ljava/lang/String;

    invoke-static {v11, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    const/4 v11, 0x1

    if-ne v6, v11, :cond_10c

    invoke-interface {v10}, Ljava/util/Iterator;->remove()V

    :cond_10c
    move-object/from16 v6, p1

    goto :goto_f0

    :cond_10f
    new-instance v6, Lau9;

    const/16 v10, 0x1a

    invoke-direct {v6, v10}, Lau9;-><init>(B)V

    invoke-static {v6, v13}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/util/Collection;

    invoke-virtual {v14, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v12, v8, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v6, v1, Ldjk;->b:Ljava/lang/String;

    iget-object v1, v1, Ldjk;->c:Lkotlinx/serialization/json/c;

    new-instance v10, Ldjk;

    const-string v10, "\u0019\u0001"

    sget-object v11, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v10, v11}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v10

    invoke-virtual {v3, v8, v12, v9}, Lurj;->c(Ljava/lang/String;Ljava/util/Map;Lkotlinx/serialization/json/c;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object v8

    invoke-static {v8}, Laib;->J([B)[B

    move-result-object v8

    invoke-virtual {v3, v6, v12, v1}, Lurj;->c(Ljava/lang/String;Ljava/util/Map;Lkotlinx/serialization/json/c;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Laib;->J([B)[B

    move-result-object v1

    invoke-static {v10, v8}, Lb82;->k([B[B)[B

    move-result-object v3

    invoke-static {v3, v1}, Lb82;->k([B[B)[B

    move-result-object v1

    invoke-static {v1}, Laib;->J([B)[B

    move-result-object v1

    :goto_154
    const/4 v3, 0x2

    goto :goto_18e

    :cond_156
    move-object/from16 p4, v12

    invoke-static {}, Lh9o;->p()V

    return-object p4

    :cond_15c
    move-object/from16 p4, v12

    sget-object v3, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    goto :goto_154

    :cond_165
    move-object/from16 p4, v12

    const-string v3, "\u0019Satoshi Signed Message:"

    invoke-static {v3, v1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    goto :goto_154

    :cond_174
    move-object/from16 p4, v12

    const/4 v3, 0x0

    invoke-static {v1, v7, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_187

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object v1

    goto :goto_18e

    :cond_187
    const/4 v3, 0x2

    sget-object v6, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    :goto_18e
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    iget-object v0, v0, Lbjj;->a:Lsjj;

    const/4 v11, 0x1

    if-eqz v6, :cond_1de

    if-eq v6, v11, :cond_1d1

    if-eq v6, v3, :cond_1c3

    const/4 v3, 0x3

    if-ne v6, v3, :cond_1bd

    const/4 v3, 0x4

    iput v3, v4, Lajj;->v:I

    check-cast v0, Lqa1;

    iget-object v0, v0, Lqa1;->a:Lcb7;

    check-cast v0, Lkzd;

    iget-object v0, v0, Lkzd;->a:Lab7;

    invoke-interface {v0}, Lab7;->a()Ldx5;

    move-result-object v0

    new-instance v3, Lpa1;

    move-object/from16 v6, p4

    invoke-direct {v3, v1, v2, v6, v11}, Lpa1;-><init>([BLavb;Lmt5;B)V

    invoke-static {v0, v3, v4}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v5, :cond_1f9

    :goto_1ba
    check-cast v3, Lljj;

    goto :goto_1fc

    :cond_1bd
    move-object/from16 v6, p4

    invoke-static {}, Lh9o;->p()V

    return-object v6

    :cond_1c3
    const/4 v3, 0x3

    iput v3, v4, Lajj;->v:I

    check-cast v0, Lqa1;

    invoke-virtual {v0, v1, v2, v4}, Lqa1;->a([BLavb;Lnt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v5, :cond_1f9

    :goto_1ce
    check-cast v3, Lljj;

    goto :goto_1fc

    :cond_1d1
    iput v3, v4, Lajj;->v:I

    check-cast v0, Lqa1;

    invoke-virtual {v0, v1, v2, v4}, Lqa1;->a([BLavb;Lnt5;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v5, :cond_1f9

    :goto_1db
    check-cast v3, Lljj;

    goto :goto_1fc

    :cond_1de
    iput v11, v4, Lajj;->v:I

    check-cast v0, Lqa1;

    iget-object v0, v0, Lqa1;->a:Lcb7;

    check-cast v0, Lkzd;

    iget-object v0, v0, Lkzd;->a:Lab7;

    invoke-interface {v0}, Lab7;->a()Ldx5;

    move-result-object v0

    new-instance v3, Lpa1;

    const/4 v6, 0x2

    const/4 v8, 0x0

    invoke-direct {v3, v1, v2, v8, v6}, Lpa1;-><init>([BLavb;Lmt5;B)V

    invoke-static {v0, v3, v4}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v5, :cond_1fa

    :cond_1f9
    return-object v5

    :cond_1fa
    :goto_1fa
    check-cast v3, Lljj;

    :goto_1fc
    new-instance v0, Ld04;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v1, v3, Lljj;->b:Ln54;

    iget-object v1, v1, Ln54;->a:[B

    invoke-virtual {v0, v1}, Ld04;->write([B)V

    iget-object v1, v3, Lljj;->c:Ln54;

    iget-object v1, v1, Ln54;->a:[B

    invoke-virtual {v0, v1}, Ld04;->write([B)V

    iget-object v1, v3, Lljj;->a:Ln54;

    iget-object v1, v1, Ln54;->a:[B

    invoke-virtual {v0, v1}, Ld04;->write([B)V

    iget-wide v1, v0, Ld04;->b:J

    invoke-virtual {v0, v1, v2}, Ld04;->j0(J)[B

    move-result-object v0

    invoke-static {v0}, Lnaa;->g([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
