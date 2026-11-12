.class public final synthetic Lx37;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/util/LinkedHashMap;


# direct methods
.method public synthetic constructor <init>(Ljava/util/LinkedHashMap;B)V
    .registers 3

    iput-byte p2, p0, Lx37;->a:B

    iput-object p1, p0, Lx37;->b:Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lx37;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lx37;->b:Ljava/util/LinkedHashMap;

    packed-switch v0, :pswitch_data_fc

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_1b

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-ne p0, v3, :cond_1b

    move v2, v3

    :cond_1b
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_20
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Laln;

    return-object p0

    :pswitch_29
    check-cast p1, Lnd0;

    new-instance v0, Lx37;

    invoke-direct {v0, p0, v3}, Lx37;-><init>(Ljava/util/LinkedHashMap;B)V

    iget-object p0, p1, Lnd0;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lld0;

    invoke-virtual {v0, p0}, Lx37;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3e
    check-cast p1, Lld0;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_48
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrkm;

    iget-object v5, p1, Lld0;->a:Lzpa;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzpa;->y()Lhd0;

    move-result-object v5

    iget-object v6, p1, Lld0;->b:Lkd0;

    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    if-eqz v8, :cond_81

    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_81

    new-instance v9, Lif0;

    invoke-direct {v9, v6, v7, v8}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_8e

    :cond_81
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v6, v7, v3, v8}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v9, Lif0;

    invoke-direct {v9, v6, v7, v8}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_8e
    invoke-virtual {v9, v4, v5}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, v0, Lrkm;->a:Ljava/lang/String;

    invoke-virtual {v5, v2, v4}, Lhd0;->y(ILjava/lang/String;)V

    iget-wide v6, v0, Lrkm;->b:J

    invoke-virtual {v5, v3, v3, v6, v7}, Ljf0;->p(IIJ)V

    iget-wide v6, v0, Lrkm;->c:J

    invoke-virtual {v5, v1, v3, v6, v7}, Ljf0;->p(IIJ)V

    goto :goto_48

    :cond_a1
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a4
    check-cast p1, Ljava/lang/String;

    const/16 v0, 0x20

    invoke-static {v3, p1, v0}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v4, 0x6

    if-ne v0, v4, :cond_f9

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v4, 0x5

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/16 v4, 0x28

    invoke-static {p1, v4}, Lkotlin/text/StringsKt;->c0(Ljava/lang/String;C)Z

    move-result v4

    if-eqz v4, :cond_d4

    const/16 v4, 0x29

    invoke-static {p1, v4}, Lkotlin/text/StringsKt;->I(Ljava/lang/String;C)Z

    move-result v4

    if-eqz v4, :cond_d4

    invoke-static {v1, v3, p1}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_d4
    const/16 v1, 0x2c

    invoke-static {v2, p1, v1}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v4, v2

    :cond_df
    if-ge v4, v1, :cond_f2

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ljava/lang/String;

    const-string v6, "rw"

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_df

    move v2, v3

    :cond_f2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f9
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_data_fc
    .packed-switch 0x0
        :pswitch_a4
        :pswitch_3e
        :pswitch_29
        :pswitch_20
    .end packed-switch
.end method
