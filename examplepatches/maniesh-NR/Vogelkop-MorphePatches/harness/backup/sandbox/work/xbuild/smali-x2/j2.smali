.class public final Lj2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll2;


# instance fields
.field public final b:Ljava/util/List;

.field public final c:Ls15;

.field public final d:Z

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj2;->b:Ljava/util/List;

    const-class v0, Ljava/util/List;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    iput-object v0, p0, Lj2;->c:Ls15;

    check-cast p1, Ljava/lang/Iterable;

    instance-of v0, p1, Ljava/util/Collection;

    const/4 v1, 0x0

    if-eqz v0, :cond_1d

    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_34

    :cond_1d
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_21
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll2;

    invoke-interface {v0}, Ll2;->a()Z

    move-result v0

    if-eqz v0, :cond_21

    const/4 v1, 0x1

    :cond_34
    iput-boolean v1, p0, Lj2;->d:Z

    iget-object p1, p0, Lj2;->b:Ljava/util/List;

    move-object v0, p1

    check-cast v0, Ljava/lang/Iterable;

    sget-object v5, Li2;->b:Li2;

    const/16 v6, 0x1e

    const-string v1, ","

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "("

    const-string v1, ")"

    invoke-static {v0, p1, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lj2;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-boolean p0, p0, Lj2;->d:Z

    return p0
.end method

.method public final b(Ljava/lang/String;)Lz1;
    .registers 9

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object p0, p0, Lj2;->b:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v1, 0x0

    move v2, v1

    :goto_d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_61

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll2;

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Ll2;->a()Z

    move-result v5

    if-eqz v5, :cond_50

    sget-object v5, Ll2;->a:Lf2;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lf2;->b:Lk2;

    invoke-virtual {v5, v4}, Lc2;->b(Ljava/lang/String;)Lz1;

    move-result-object v4

    iget-object v5, v4, Lz1;->a:Ljava/lang/Object;

    check-cast v5, Ljava/math/BigInteger;

    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I

    move-result v5

    shl-int/lit8 v5, v5, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ll2;->b(Ljava/lang/String;)Lz1;

    move-result-object v3

    iget v4, v4, Lz1;->b:I

    add-int/2addr v2, v4

    iget v4, v3, Lz1;->b:I

    add-int/2addr v5, v4

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-object v3, v3, Lz1;->a:Ljava/lang/Object;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_50
    invoke-interface {v3, v4}, Ll2;->b(Ljava/lang/String;)Lz1;

    move-result-object v3

    iget v4, v3, Lz1;->b:I

    add-int/2addr v2, v4

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-object v3, v3, Lz1;->a:Ljava/lang/Object;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_61
    new-instance p0, Lz1;

    invoke-direct {p0, v0, v1}, Lz1;-><init>(Ljava/lang/Object;I)V

    return-object p0
.end method

.method public final c(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lj2;->f(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ls15;
    .registers 1

    iget-object p0, p0, Lj2;->c:Ls15;

    return-object p0
.end method

.method public final bridge synthetic e(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lj2;->f(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lj2;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lj2;

    iget-object p0, p0, Lj2;->b:Ljava/util/List;

    iget-object p1, p1, Lj2;->b:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    return v2

    :cond_17
    return v0
.end method

.method public final f(Ljava/util/List;)Ljava/lang/String;
    .registers 14

    iget-object p0, p0, Lj2;->b:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_f2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    check-cast p0, Ljava/lang/Iterable;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p0, p1}, Lkotlin/collections/CollectionsKt;->o0(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v4, 0x0

    move v5, v4

    :goto_2a
    if-ge v5, p1, :cond_8b

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lkotlin/Pair;

    iget-object v7, v6, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v7, Ll2;

    iget-object v6, v6, Lkotlin/Pair;->b:Ljava/lang/Object;

    if-eqz v6, :cond_85

    invoke-interface {v7, v6}, Ll2;->c(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v7}, Ll2;->a()Z

    move-result v7

    if-eqz v7, :cond_81

    const-string v7, ""

    const/16 v8, 0x40

    invoke-static {v8, v7}, Lkotlin/text/StringsKt;->S(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v4

    move v10, v9

    :goto_61
    if-ge v10, v8, :cond_71

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v10, v10, 0x1

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v9, v11

    goto :goto_61

    :cond_71
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v9, Lkotlin/Pair;

    invoke-direct {v9, v7, v8}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    :cond_81
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    :cond_85
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v2

    :cond_8b
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p0

    move p1, v4

    move v2, p1

    :goto_91
    if-ge v2, p0, :cond_a1

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr p1, v5

    goto :goto_91

    :cond_a1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_a5
    if-ge v4, p0, :cond_d5

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v4, v4, 0x1

    check-cast v2, Lkotlin/Pair;

    iget-object v5, v2, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    iget-object v2, v2, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    add-int/2addr v2, p1

    div-int/lit8 v2, v2, 0x2

    sget-object v6, Ll2;->a:Lf2;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Lf2;->b:Lk2;

    invoke-static {v2}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v6, v2}, Lc2;->f(Ljava/math/BigInteger;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v5, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_a5

    :cond_d5
    const/4 v8, 0x0

    const/16 v9, 0x3e

    const-string v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v3 .. v9}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p0

    const/4 v9, 0x0

    const/16 v10, 0x3e

    const-string v5, ""

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v4, v0

    invoke-static/range {v4 .. v10}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_f2
    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v2
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lj2;->e:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lj2;->b:Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    const-string v0, "Tuple(itemTypes="

    const-string v1, ")"

    iget-object p0, p0, Lj2;->b:Ljava/util/List;

    invoke-static {v0, v1, p0}, Lsko;->m(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
