.class public final Lld7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpke;


# instance fields
.field public final synthetic a:B

.field public final b:Lqke;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lqke;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lld7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lld7;->c:Ljava/lang/Object;

    iput-object p1, p0, Lld7;->b:Lqke;

    invoke-virtual {p1, p0}, Lqke;->W(Lpke;)V

    return-void
.end method

.method public constructor <init>(Lqke;Lj4c;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lld7;->a:B

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lld7;->b:Lqke;

    .line 21
    iput-object p2, p0, Lld7;->c:Ljava/lang/Object;

    .line 22
    invoke-virtual {p1, p0}, Lqke;->W(Lpke;)V

    return-void
.end method


# virtual methods
.method public final w(Lb2l;Loke;JZ)V
    .registers 12

    iget-byte p3, p0, Lld7;->a:B

    iget-object p0, p0, Lld7;->c:Ljava/lang/Object;

    packed-switch p3, :pswitch_data_138

    iget-boolean p3, p2, Loke;->d:Z

    if-nez p3, :cond_ed

    if-eqz p5, :cond_ed

    iget-boolean p2, p2, Loke;->c:Z

    if-nez p2, :cond_ed

    check-cast p1, Ld7l;

    iget-object p2, p1, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->G()Ljava/lang/String;

    move-result-object p2

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p2, p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_30
    :goto_30
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_47

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    move-object p4, p3

    check-cast p4, Ljava/lang/String;

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p4

    if-lez p4, :cond_30

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_30

    :cond_47
    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnzl;

    iget-object p1, p0, Lnzl;->d:Lrlh;

    iget-object p1, p1, Lrlh;->a:Lnak;

    invoke-virtual {p1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_ed

    new-instance p3, Ljava/util/LinkedHashSet;

    invoke-direct {p3}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p4

    const/4 p5, 0x0

    :cond_69
    :goto_69
    if-ge p5, p4, :cond_cc

    invoke-virtual {p2, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 p5, p5, 0x1

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lwqm;->s(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_c6

    invoke-static {v0}, Lwqm;->u(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_c6

    invoke-static {v0}, Lj7h;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_c6

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_90
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_ba

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lwqm;->s(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_90

    invoke-static {v4}, Lwqm;->u(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_90

    invoke-static {v4}, Lj7h;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_90

    goto :goto_bb

    :cond_ba
    move-object v3, v2

    :goto_bb
    check-cast v3, Ljava/util/Map$Entry;

    if-eqz v3, :cond_c6

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    :cond_c6
    if-eqz v2, :cond_69

    invoke-interface {p3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_69

    :cond_cc
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_ed

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    iget-object p3, p0, Lnzl;->a:Lj4c;

    invoke-virtual {p3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ly3i;

    new-instance p4, Lgzl;

    invoke-direct {p4, p2}, Lgzl;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, p4}, Ly3i;->n(Lz1e;)V

    goto :goto_d0

    :cond_ed
    return-void

    :pswitch_ee
    iget-boolean p2, p2, Loke;->d:Z

    if-nez p2, :cond_136

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LJ/N;->MzfubQik(Ljava/lang/Object;)I

    move-result p2

    new-instance p3, Lhd7;

    sget-object p4, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, Laik;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object p4, Lwqm;->e:[Ljava/lang/String;

    invoke-static {p1, p4}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p4

    invoke-direct {p3, p1, p2, p4, p5}, Lhd7;-><init>(Ljava/lang/String;IJ)V

    check-cast p0, Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :cond_117
    :goto_117
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_136

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkd7;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p2, p3, Lhd7;->b:I

    const/4 p4, 0x1

    if-ne p2, p4, :cond_117

    new-instance p2, Lfh4;

    const/16 p4, 0x1c

    invoke-direct {p2, p1, p3, p4}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lldk;->f(Ljava/lang/Runnable;)V

    goto :goto_117

    :cond_136
    return-void

    nop

    :pswitch_data_138
    .packed-switch 0x0
        :pswitch_ee
    .end packed-switch
.end method
