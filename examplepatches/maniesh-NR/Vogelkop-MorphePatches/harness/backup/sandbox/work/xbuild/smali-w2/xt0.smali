.class public final Lxt0;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lef0;->b:Lef0;

    sget-object v1, Lef0;->e:Lef0;

    filled-new-array {v0, v0, v0, v1, v0}, [Lef0;

    move-result-object v0

    sput-object v0, Lxt0;->f:[Lef0;

    sget-object v0, Ldf0;->d:Ldf0;

    filled-new-array {v0, v0, v0, v0, v0}, [Ldf0;

    move-result-object v0

    sput-object v0, Lxt0;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final A()Ljava/util/List;
    .registers 2

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_e

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_e
    const/4 p0, 0x0

    return-object p0
.end method

.method public final B()Ljava/util/List;
    .registers 2

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_e

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_e
    const/4 p0, 0x0

    return-object p0
.end method

.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lxt0;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lxt0;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 6

    check-cast p1, Lxt0;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-static {v1, v2}, Ljf0;->l(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_19

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_19
    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-static {v0, v1}, Ljf0;->i(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2e

    invoke-virtual {p0, v2, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2e
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-static {v1, v3}, Ljf0;->i(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_44

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_44
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh66;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lh66;

    invoke-static {v1, v3}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lh66;

    if-eqz v1, :cond_5c

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5c
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-static {p1, v1}, Ljf0;->i(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_72

    invoke-virtual {p0, v0, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_72
    return-object p0
.end method

.method public final x(Lxt0;Lzpa;)V
    .registers 12

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x2

    const/16 v2, 0x98b

    const/4 v3, 0x1

    if-eqz v0, :cond_67

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    new-instance v4, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_22
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_64

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    new-instance v6, Lbu0;

    const/4 v7, -0x1

    invoke-direct {v6, v2, v7, v1}, Ljf0;-><init>(III)V

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljf0;

    check-cast v5, Lbu0;

    invoke-virtual {v5, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_51

    invoke-virtual {v5, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v6, p2, v3, v8}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_51
    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_60

    invoke-virtual {v5, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v6, v3, v3, v5}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_60
    invoke-virtual {v4, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_22

    :cond_64
    invoke-virtual {p1, p2, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_67
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_160

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh66;

    new-instance v4, Lh66;

    const/16 v5, 0xe

    invoke-direct {v4, v2, v3, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_8a

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v4, p2, v3, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_8a
    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_99

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {v4, v3, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_99
    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_a8

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {v4, v1, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_a8
    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_b7

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {v4, v0, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_b7
    const/4 p2, 0x4

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_c7

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v4, p2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_c7
    const/4 p2, 0x5

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_d7

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v4, p2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_d7
    const/4 p2, 0x6

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_e7

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v4, p2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_e7
    const/4 p2, 0x7

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_f7

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v4, p2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_f7
    const/16 p2, 0x8

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_108

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v4, p2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_108
    const/16 p2, 0x9

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_119

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leu0;

    invoke-virtual {v4, p2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_119
    const/16 p2, 0xa

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_12a

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v4, p2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_12a
    const/16 p2, 0xb

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_13b

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v4, p2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_13b
    const/16 p2, 0xc

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_14c

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhc0;

    invoke-virtual {v4, p2, v3, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_14c
    const/16 p2, 0xd

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_15d

    invoke-virtual {p0, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {v4, p2, v3, p0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_15d
    invoke-virtual {p1, v0, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_160
    return-void
.end method

.method public final y()Ljava/util/List;
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_e

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_e
    const/4 p0, 0x0

    return-object p0
.end method

.method public final z()Ljava/util/Map;
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_e

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_e
    const/4 p0, 0x0

    return-object p0
.end method
