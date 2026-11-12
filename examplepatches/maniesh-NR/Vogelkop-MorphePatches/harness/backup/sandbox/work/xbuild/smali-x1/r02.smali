.class public final Lr02;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ld12;


# instance fields
.field public final a:Lumi;

.field public final b:Ljava/util/LinkedHashMap;

.field public c:Loml;


# direct methods
.method public constructor <init>(Lumi;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr02;->a:Lumi;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lr02;->b:Ljava/util/LinkedHashMap;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;Lvr9;)V
    .registers 8

    invoke-virtual {p0}, Lr02;->i()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_8
    if-ge v1, v0, :cond_20

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lkotlin/Pair;

    iget-object v3, v2, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v2, v2, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v4, p0, Lr02;->b:Ljava/util/LinkedHashMap;

    invoke-interface {v4, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    :cond_20
    invoke-virtual {p2}, Lvr9;->run()V

    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 3

    invoke-virtual {p0}, Lr02;->i()V

    iget-object p0, p0, Lr02;->b:Ljava/util/LinkedHashMap;

    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final c(Lra;)V
    .registers 2

    invoke-virtual {p0}, Lr02;->i()V

    iget-object p0, p0, Lr02;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-virtual {p1, p0}, Lra;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final d()V
    .registers 5

    iget-object v0, p0, Lr02;->c:Loml;

    if-nez v0, :cond_24

    new-instance v0, Lq02;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lq02;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lr02;->a:Lumi;

    invoke-interface {v1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    iput-object v1, p0, Lr02;->c:Loml;

    sget-object p0, Lpn7;->b:Lon7;

    const/4 p0, 0x5

    sget-object v0, Lun7;->f:Lun7;

    invoke-static {p0, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    const/4 p0, 0x0

    invoke-static {v1, p0, v2, v3}, Lcoh;->k(Loml;Ljava/lang/Object;J)V

    :cond_24
    return-void
.end method

.method public final e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 3

    invoke-virtual {p0}, Lr02;->i()V

    iget-object p0, p0, Lr02;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final f(Ljava/util/ArrayList;Lra;)V
    .registers 8

    invoke-virtual {p0}, Lr02;->i()V

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_13
    if-ge v2, v1, :cond_29

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lr02;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_29
    invoke-virtual {p2, v0}, Lra;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 4

    invoke-virtual {p0}, Lr02;->i()V

    iget-object p0, p0, Lr02;->b:Ljava/util/LinkedHashMap;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final h()V
    .registers 1

    invoke-virtual {p0}, Lr02;->i()V

    return-void
.end method

.method public final i()V
    .registers 3

    iget-object v0, p0, Lr02;->c:Loml;

    if-eqz v0, :cond_b

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lr02;->c:Loml;

    :cond_b
    return-void
.end method
