.class public final Lpdh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lndh;


# instance fields
.field public final a:Lpqi;

.field public final b:Lndh;


# direct methods
.method public constructor <init>(Lpqi;Lndh;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpdh;->a:Lpqi;

    iput-object p2, p0, Lpdh;->b:Lndh;

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/Set;
    .registers 5

    sget-object v0, Lmqi;->a:[Lmqi;

    iget-object v0, p0, Lpdh;->a:Lpqi;

    iget-object v1, v0, Lpqi;->b:Ljava/util/Map;

    if-nez v1, :cond_f

    iget-object v1, v0, Lpqi;->a:Loqi;

    invoke-virtual {v1}, Lldk;->i()V

    iget-object v1, v0, Lpqi;->b:Ljava/util/Map;

    :cond_f
    const-string v0, "rsd"

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_4a

    const/16 p0, 0x2c

    const/4 v1, 0x0

    invoke-static {v1, v0, p0}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {p0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_2f
    if-ge v1, v2, :cond_45

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    :cond_45
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p0

    return-object p0

    :cond_4a
    iget-object p0, p0, Lpdh;->b:Lndh;

    invoke-interface {p0}, Lndh;->a()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public final b(I)V
    .registers 13

    sget-object v0, Lmqi;->a:[Lmqi;

    iget-object v0, p0, Lpdh;->a:Lpqi;

    iget-object v1, v0, Lpqi;->b:Ljava/util/Map;

    iget-object v2, v0, Lpqi;->a:Loqi;

    if-nez v1, :cond_f

    invoke-virtual {v2}, Lldk;->i()V

    iget-object v1, v0, Lpqi;->b:Ljava/util/Map;

    :cond_f
    const-string v3, "rsd"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_4c

    invoke-virtual {p0}, Lpdh;->a()Ljava/util/Set;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, p1}, Lb5j;->f(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;

    move-result-object v4

    const/4 v9, 0x0

    const/16 v10, 0x3e

    const-string v5, ","

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v4 .. v10}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lpqi;->b:Ljava/util/Map;

    if-nez p1, :cond_3a

    invoke-virtual {v2}, Lldk;->i()V

    iget-object p1, v0, Lpqi;->b:Ljava/util/Map;

    :cond_3a
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-interface {v1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    iget-boolean p1, v2, Loqi;->l:Z

    invoke-virtual {v0, p0, p1}, Lpqi;->c(Ljava/util/Map;Z)V

    return-void

    :cond_4c
    iget-object p0, p0, Lpdh;->b:Lndh;

    invoke-interface {p0, p1}, Lndh;->b(I)V

    return-void
.end method

.method public final c()V
    .registers 1

    iget-object p0, p0, Lpdh;->b:Lndh;

    invoke-interface {p0}, Lndh;->c()V

    return-void
.end method

.method public final d()V
    .registers 1

    iget-object p0, p0, Lpdh;->b:Lndh;

    invoke-interface {p0}, Lndh;->d()V

    return-void
.end method

.method public final e()Z
    .registers 1

    iget-object p0, p0, Lpdh;->b:Lndh;

    invoke-interface {p0}, Lndh;->e()Z

    move-result p0

    return p0
.end method
