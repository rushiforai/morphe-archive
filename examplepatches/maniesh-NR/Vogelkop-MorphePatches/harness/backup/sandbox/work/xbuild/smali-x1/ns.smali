.class public abstract Lns;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public b:I

.field public c:Z

.field public final d:Lkotlin/jvm/functions/Function1;

.field public e:Ljava/util/Set;

.field public f:Z

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lumi;IZLkotlin/jvm/functions/Function1;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lns;->a:Lumi;

    iput p2, p0, Lns;->b:I

    iput-boolean p3, p0, Lns;->c:Z

    iput-object p4, p0, Lns;->d:Lkotlin/jvm/functions/Function1;

    sget-object p1, Lv08;->a:Lv08;

    iput-object p1, p0, Lns;->e:Ljava/util/Set;

    return-void
.end method

.method public static e(Lns;Ljava/util/Set;II)V
    .registers 5

    and-int/lit8 v0, p3, 0x1

    if-eqz v0, :cond_6

    iget-object p1, p0, Lns;->e:Ljava/util/Set;

    :cond_6
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_c

    iget p2, p0, Lns;->b:I

    :cond_c
    iget-object p3, p0, Lns;->e:Ljava/util/Set;

    invoke-static {p3, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1d

    iget p3, p0, Lns;->b:I

    if-ne p3, p2, :cond_1d

    iget-boolean p3, p0, Lns;->c:Z

    if-nez p3, :cond_1d

    return-void

    :cond_1d
    const/4 p3, 0x0

    iput-boolean p3, p0, Lns;->c:Z

    iput-object p1, p0, Lns;->e:Ljava/util/Set;

    iput p2, p0, Lns;->b:I

    iget-object p1, p0, Lns;->g:Ljava/lang/Object;

    if-eqz p1, :cond_2c

    invoke-virtual {p0, p1}, Lns;->c(Ljava/lang/Object;)V

    return-void

    :cond_2c
    const/4 p1, 0x1

    iput-boolean p1, p0, Lns;->f:Z

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;Ljava/util/Set;I)Ljava/lang/Object;
    .registers 8

    check-cast p1, Ljava/util/LinkedHashMap;

    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_9

    return-object p1

    :cond_9
    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_18
    :goto_18
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_5a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map$Entry;

    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_33
    :goto_33
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lst;

    iget-object v3, v3, Lst;->b:Ljava/lang/String;

    invoke-interface {p2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_33

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_33

    :cond_4c
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p3

    invoke-interface {p0, p3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18

    :cond_5a
    return-object p0
.end method

.method public b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    check-cast p1, Ljq8;

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    iget-object v0, p1, Ljq8;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llq8;

    iget-object v2, v1, Llq8;->b:Ljava/lang/String;

    new-instance v4, Lqxh;

    invoke-direct {v4, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object v5, v1, Llq8;->d:Ljava/lang/String;

    iget-object v10, v1, Llq8;->e:Ljava/lang/String;

    iget-object v6, v1, Llq8;->c:Ljava/lang/String;

    sget-object v8, Lht;->b:Lht;

    iget-object v9, v1, Llq8;->f:Ljava/util/Set;

    new-instance v3, Lst;

    const/4 v11, 0x0

    const/16 v12, 0x188

    const/4 v7, 0x0

    invoke-direct/range {v3 .. v12}, Lst;-><init>(Lpxh;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lht;Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v1, v1, Llq8;->f:Ljava/util/Set;

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkq8;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, v2, v4}, Ljava/util/HashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3b

    :cond_5a
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object p1, p1, Ljq8;->b:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_65
    :goto_65
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkq8;

    iget-boolean v2, v1, Lkq8;->d:Z

    if-eqz v2, :cond_65

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_65

    move-object v3, v2

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_87

    const/4 v2, 0x0

    :cond_87
    if-eqz v2, :cond_65

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_65

    new-instance v3, Lts;

    invoke-direct {v3, v1}, Lts;-><init>(Lkq8;)V

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_65

    :cond_9a
    return-object v0
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 5

    iget-boolean v0, p0, Lns;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lls;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lls;-><init>(Lns;B)V

    iget-object v1, p0, Lns;->a:Lumi;

    invoke-virtual {v1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v1, Lls;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lls;-><init>(Lns;B)V

    invoke-virtual {v0, v1}, Lnml;->c(Ln5o;)Loml;

    move-result-object v0

    new-instance v1, Lms;

    iget-object v2, p0, Lns;->e:Ljava/util/Set;

    iget p0, p0, Lns;->b:I

    invoke-direct {v1, p1, v2, p0}, Lms;-><init>(Ljava/lang/Object;Ljava/util/Set;I)V

    sget-object p0, Lpn7;->b:Lon7;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 p0, 0x0

    invoke-static {v0, v1, p0, p1}, Lcoh;->k(Loml;Ljava/lang/Object;J)V

    return-void
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 5

    new-instance v0, Lls;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lls;-><init>(Lns;B)V

    iget-object v1, p0, Lns;->a:Lumi;

    invoke-virtual {v1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v1, Lls;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lls;-><init>(Lns;B)V

    invoke-virtual {v0, v1}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    sget-object v0, Lpn7;->b:Lon7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    invoke-static {p0, p1, v0, v1}, Lcoh;->k(Loml;Ljava/lang/Object;J)V

    return-void
.end method
