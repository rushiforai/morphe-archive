.class public final Ltd0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lqd0;

.field public final c:Lzyk;

.field public final d:Lzyk;

.field public final e:Lzyk;


# direct methods
.method public constructor <init>(Lzpa;Lqd0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltd0;->a:Lzpa;

    iput-object p2, p0, Ltd0;->b:Lqd0;

    new-instance p1, Lrd0;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lrd0;-><init>(Ltd0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ltd0;->c:Lzyk;

    new-instance p1, Lrd0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lrd0;-><init>(Ltd0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lrd0;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lrd0;-><init>(Ltd0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lrd0;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lrd0;-><init>(Ltd0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lrd0;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lrd0;-><init>(Ltd0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ltd0;->d:Lzyk;

    new-instance p1, Lrd0;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lrd0;-><init>(Ltd0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ltd0;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lkotlin/jvm/functions/Function1;)V
    .registers 6

    iget-object v0, p0, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lji0;

    const/4 v1, -0x1

    const/4 v2, 0x5

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p0, p0, Ltd0;->b:Lqd0;

    const/16 v1, 0x47

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_26

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_26

    new-instance v3, Lhf0;

    invoke-direct {v3, p0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_30

    :cond_26
    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_30
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    new-instance p0, Lki0;

    invoke-direct {p0, v0}, Lki0;-><init>(Lji0;)V

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b(Lkotlin/jvm/functions/Function1;)V
    .registers 2

    iget-object p0, p0, Ltd0;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyb0;

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final c(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    iget-object v0, p0, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lz60;

    const/4 v1, -0x1

    const/4 v2, 0x3

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p0, p0, Ltd0;->b:Lqd0;

    const/16 v1, 0x40

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_26

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_26

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_34

    :cond_26
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_34
    invoke-virtual {v3, p1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, La70;

    invoke-direct {p0, v0}, La70;-><init>(Lz60;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final d(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    iget-object v0, p0, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lyg0;

    const/4 v1, -0x1

    const/4 v2, 0x3

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p0, p0, Ltd0;->b:Lqd0;

    const/16 v1, 0x46

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_26

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_26

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_34

    :cond_26
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_34
    invoke-virtual {v3, p1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lzg0;

    invoke-direct {p0, v0}, Lzg0;-><init>(Lyg0;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    iget-object v0, p0, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ldl0;

    const/4 v1, -0x1

    const/4 v2, 0x3

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p0, p0, Ltd0;->b:Lqd0;

    const/16 v1, 0x41

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_26

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_26

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_34

    :cond_26
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_34
    invoke-virtual {v3, p1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lel0;

    invoke-direct {p0, v0}, Lel0;-><init>(Ldl0;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
