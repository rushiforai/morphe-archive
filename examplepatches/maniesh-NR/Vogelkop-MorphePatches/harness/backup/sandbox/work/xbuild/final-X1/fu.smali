.class public final synthetic Lfu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lju;


# direct methods
.method public synthetic constructor <init>(Lju;B)V
    .registers 3

    iput-byte p2, p0, Lfu;->a:B

    iput-object p1, p0, Lfu;->b:Lju;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lfu;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lfu;->b:Lju;

    packed-switch v0, :pswitch_data_96

    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    new-array v0, v1, [Lst;

    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lst;

    iput-object p1, p0, Lju;->n:[Lst;

    invoke-virtual {p0}, Lju;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c
    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    new-array v0, v1, [Lst;

    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lst;

    iput-object p1, p0, Lju;->m:[Lst;

    invoke-virtual {p0}, Lju;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_30
    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    new-array v0, v1, [Lst;

    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lst;

    iput-object p1, p0, Lju;->l:[Lst;

    invoke-virtual {p0}, Lju;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_44
    check-cast p1, Ljava/util/LinkedHashMap;

    iput-object p1, p0, Lju;->j:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Lju;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4e
    check-cast p1, Ljava/util/List;

    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    new-array v2, v1, [Lst;

    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lst;

    iput-object v0, p0, Lju;->k:[Lst;

    iget-object v0, p0, Lju;->r:Lhu;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_6a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_88

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lst;

    iget-object v4, v3, Lst;->b:Ljava/lang/String;

    iget-object v3, v3, Lst;->g:Ljava/lang/String;

    filled-new-array {v4, v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3, v2}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_6a

    :cond_88
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    const/4 v2, 0x2

    invoke-static {v0, p1, v1, v2}, Lns;->e(Lns;Ljava/util/Set;II)V

    invoke-virtual {p0}, Lju;->f()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_4e
        :pswitch_44
        :pswitch_30
        :pswitch_1c
    .end packed-switch
.end method
