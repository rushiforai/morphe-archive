.class public final synthetic Le51;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lu9d;


# direct methods
.method public synthetic constructor <init>(Lu9d;B)V
    .registers 3

    iput-byte p2, p0, Le51;->a:B

    iput-object p1, p0, Le51;->b:Lu9d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Le51;->a:B

    iget-object p0, p0, Le51;->b:Lu9d;

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_c0

    check-cast p1, Lt60;

    const-wide/16 v3, 0x1

    iget-object v0, p1, Lt60;->b:Ls60;

    invoke-virtual {v0, v1, v2, v3, v4}, Ljf0;->p(IIJ)V

    invoke-virtual {p0}, Lu9d;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p1, Lt60;->a:Lzpa;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lh60;

    const/16 v5, 0x98b

    const/4 v6, -0x1

    invoke-direct {v4, v5, v6, v2}, Ljf0;-><init>(III)V

    iget-object v5, p1, Lt60;->b:Ls60;

    invoke-virtual {v5, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-eqz v6, :cond_4f

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4f

    new-instance v7, Lif0;

    invoke-direct {v7, v5, v2, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_5c

    :cond_4f
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v5, v2, v2, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v7, Lif0;

    invoke-direct {v7, v5, v2, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_5c
    invoke-virtual {v7, v3, v4}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    int-to-long v5, v0

    invoke-virtual {v4, v1, v2, v5, v6}, Ljf0;->p(IIJ)V

    goto :goto_1a

    :cond_6e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_71
    check-cast p1, Ljava/lang/String;

    new-array v0, v2, [C

    const/16 v3, 0x20

    aput-char v3, v0, v1

    invoke-static {p1, v0}, Lkotlin/text/StringsKt;->X(Ljava/lang/CharSequence;[C)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v3, 0x6

    if-ne v0, v3, :cond_bd

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v3, 0x5

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/16 v3, 0x28

    invoke-static {p1, v3}, Lkotlin/text/StringsKt;->c0(Ljava/lang/String;C)Z

    move-result v3

    if-eqz v3, :cond_a6

    const/16 v3, 0x29

    invoke-static {p1, v3}, Lkotlin/text/StringsKt;->I(Ljava/lang/String;C)Z

    move-result v3

    if-eqz v3, :cond_a6

    invoke-static {v2, v2, p1}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_a6
    new-array v2, v2, [C

    const/16 v3, 0x2c

    aput-char v3, v2, v1

    invoke-static {p1, v2}, Lkotlin/text/StringsKt;->X(Ljava/lang/CharSequence;[C)Ljava/util/List;

    move-result-object p1

    const-string v1, "rw"

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_bd
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_data_c0
    .packed-switch 0x0
        :pswitch_71
    .end packed-switch
.end method
