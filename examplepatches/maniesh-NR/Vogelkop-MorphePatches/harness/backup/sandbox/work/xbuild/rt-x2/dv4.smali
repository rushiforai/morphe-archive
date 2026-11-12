.class public final Ldv4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:[Lnf2;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget-object v0, Lnf2;->l:Lnf2;

    sget-object v1, Lnf2;->m:Lnf2;

    sget-object v2, Lnf2;->c:Lnf2;

    sget-object v3, Lnf2;->k:Lnf2;

    filled-new-array {v0, v1, v2, v3}, [Lnf2;

    move-result-object v0

    sput-object v0, Ldv4;->b:[Lnf2;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Ls45;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v2, v1, Ls45;->a:Landroid/os/Bundle;

    const-string v3, "com.opera.android.autofill.EXTRA_SIGNUP_DATA"

    const/4 v4, 0x0

    if-eqz v2, :cond_29

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x22

    if-lt v5, v6, :cond_19

    invoke-static {v2}, Lt8;->z(Landroid/os/Bundle;)Ljava/io/Serializable;

    move-result-object v2

    goto :goto_26

    :cond_19
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    const-class v5, Lujj;

    invoke-virtual {v5, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_26

    move-object v2, v4

    :cond_26
    :goto_26
    check-cast v2, Lujj;

    goto :goto_2a

    :cond_29
    move-object v2, v4

    :goto_2a
    if-nez v2, :cond_39

    new-instance v2, Lujj;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v4, v2, Lujj;->a:Ljava/lang/String;

    iput-object v4, v2, Lujj;->b:Ljava/lang/String;

    iput-object v4, v2, Lujj;->c:Ljava/lang/String;

    iput-object v4, v2, Lujj;->d:Ljava/lang/String;

    :cond_39
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v8, 0x0

    :goto_43
    if-ge v8, v6, :cond_5d

    move-object/from16 v9, p1

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v8, v8, 0x1

    check-cast v10, Lk2g;

    invoke-virtual {v10}, Lk2g;->b()[Lvz8;

    move-result-object v10

    invoke-static {v10}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    check-cast v10, Ljava/lang/Iterable;

    invoke-static {v10, v5}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_43

    :cond_5d
    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x0

    :goto_67
    if-ge v9, v8, :cond_88

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    move-object v11, v10

    check-cast v11, Lvz8;

    iget-object v11, v11, Lvz8;->c:Lnf2;

    invoke-virtual {v6, v11}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-nez v12, :cond_82

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v6, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_82
    check-cast v12, Ljava/util/List;

    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_67

    :cond_88
    sget-object v8, Lnf2;->g:Lnf2;

    sget-object v9, Ll08;->a:Ll08;

    invoke-virtual {v6, v8, v9}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lvz8;

    sget-object v11, Lnf2;->m:Lnf2;

    invoke-virtual {v6, v11, v9}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-static {v11}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lvz8;

    sget-object v12, Lnf2;->c:Lnf2;

    invoke-virtual {v6, v12, v9}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    invoke-static {v12}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lvz8;

    sget-object v13, Lnf2;->k:Lnf2;

    invoke-virtual {v6, v13, v9}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lvz8;

    new-instance v9, Lkotlin/Pair;

    iget-object v13, v2, Lujj;->b:Ljava/lang/String;

    invoke-direct {v9, v11, v13}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v13, Lkotlin/Pair;

    iget-object v14, v2, Lujj;->c:Ljava/lang/String;

    invoke-direct {v13, v12, v14}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v14, Lkotlin/Pair;

    iget-object v15, v2, Lujj;->d:Ljava/lang/String;

    invoke-direct {v14, v6, v15}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v9, v13, v14}, [Lkotlin/Pair;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    check-cast v9, Ljava/lang/Iterable;

    instance-of v13, v9, Ljava/util/Collection;

    const/4 v14, 0x1

    if-eqz v13, :cond_ef

    move-object v15, v9

    check-cast v15, Ljava/util/Collection;

    invoke-interface {v15}, Ljava/util/Collection;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_124

    :cond_ef
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_f3
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_124

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v4, v16

    check-cast v4, Lkotlin/Pair;

    iget-object v4, v4, Lkotlin/Pair;->b:Ljava/lang/Object;

    if-eqz v4, :cond_f3

    if-eqz v10, :cond_124

    iget-object v4, v2, Lujj;->a:Ljava/lang/String;

    if-nez v4, :cond_124

    iget-object v4, v10, Lvz8;->a:Landroid/view/autofill/AutofillId;

    invoke-virtual {v4}, Landroid/view/autofill/AutofillId;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lujj;->a:Ljava/lang/String;

    iget-object v4, v1, Ls45;->a:Landroid/os/Bundle;

    if-nez v4, :cond_11e

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iput-object v4, v1, Ls45;->a:Landroid/os/Bundle;

    :cond_11e
    invoke-virtual {v4, v3, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    iput-boolean v14, v0, Ldv4;->a:Z

    return-void

    :cond_124
    if-eqz v13, :cond_12f

    move-object v4, v9

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_19c

    :cond_12f
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_133
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_19c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lkotlin/Pair;

    iget-object v7, v15, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v7, Lvz8;

    if-eqz v7, :cond_133

    iget-object v7, v7, Lvz8;->a:Landroid/view/autofill/AutofillId;

    invoke-virtual {v7}, Landroid/view/autofill/AutofillId;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v15, v15, Lkotlin/Pair;->b:Ljava/lang/Object;

    invoke-static {v7, v15}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_133

    if-eqz v10, :cond_15e

    iget-object v4, v10, Lvz8;->a:Landroid/view/autofill/AutofillId;

    if-eqz v4, :cond_15e

    invoke-virtual {v4}, Landroid/view/autofill/AutofillId;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_15f

    :cond_15e
    const/4 v4, 0x0

    :goto_15f
    iput-object v4, v2, Lujj;->a:Ljava/lang/String;

    if-eqz v11, :cond_16c

    iget-object v4, v11, Lvz8;->a:Landroid/view/autofill/AutofillId;

    if-eqz v4, :cond_16c

    invoke-virtual {v4}, Landroid/view/autofill/AutofillId;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_16d

    :cond_16c
    const/4 v4, 0x0

    :goto_16d
    iput-object v4, v2, Lujj;->b:Ljava/lang/String;

    if-eqz v12, :cond_17a

    iget-object v4, v12, Lvz8;->a:Landroid/view/autofill/AutofillId;

    if-eqz v4, :cond_17a

    invoke-virtual {v4}, Landroid/view/autofill/AutofillId;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_17b

    :cond_17a
    const/4 v4, 0x0

    :goto_17b
    iput-object v4, v2, Lujj;->c:Ljava/lang/String;

    if-eqz v6, :cond_188

    iget-object v4, v6, Lvz8;->a:Landroid/view/autofill/AutofillId;

    if-eqz v4, :cond_188

    invoke-virtual {v4}, Landroid/view/autofill/AutofillId;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_189

    :cond_188
    const/4 v4, 0x0

    :goto_189
    iput-object v4, v2, Lujj;->d:Ljava/lang/String;

    iget-object v4, v1, Ls45;->a:Landroid/os/Bundle;

    if-nez v4, :cond_196

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iput-object v4, v1, Ls45;->a:Landroid/os/Bundle;

    :cond_196
    invoke-virtual {v4, v3, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    iput-boolean v14, v0, Ldv4;->a:Z

    return-void

    :cond_19c
    if-eqz v13, :cond_1a7

    move-object v1, v9

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1f5

    :cond_1a7
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1ab
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkotlin/Pair;

    iget-object v3, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    if-eqz v3, :cond_1ab

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v1

    const/4 v3, 0x2

    if-lt v1, v3, :cond_1d9

    iget-object v1, v2, Lujj;->a:Ljava/lang/String;

    if-eqz v10, :cond_1cb

    iget-object v3, v10, Lvz8;->a:Landroid/view/autofill/AutofillId;

    goto :goto_1cc

    :cond_1cb
    const/4 v3, 0x0

    :goto_1cc
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d9

    iput-boolean v14, v0, Ldv4;->a:Z

    return-void

    :cond_1d9
    iget-object v1, v2, Lujj;->a:Ljava/lang/String;

    if-eqz v10, :cond_1e0

    iget-object v4, v10, Lvz8;->a:Landroid/view/autofill/AutofillId;

    goto :goto_1e1

    :cond_1e0
    const/4 v4, 0x0

    :goto_1e1
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f5

    if-eqz v10, :cond_1f5

    iget-boolean v1, v10, Lvz8;->e:Z

    if-ne v1, v14, :cond_1f5

    const/4 v3, 0x0

    iput-boolean v3, v0, Ldv4;->a:Z

    return-void

    :cond_1f5
    const/4 v3, 0x0

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_217

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v3

    :cond_201
    if-ge v2, v1, :cond_217

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lvz8;

    sget-object v6, Ldv4;->b:[Lnf2;

    iget-object v4, v4, Lvz8;->c:Lnf2;

    invoke-static {v6, v4}, Le82;->o([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_201

    move v7, v14

    goto :goto_218

    :cond_217
    move v7, v3

    :goto_218
    iput-boolean v7, v0, Ldv4;->a:Z

    return-void
.end method
