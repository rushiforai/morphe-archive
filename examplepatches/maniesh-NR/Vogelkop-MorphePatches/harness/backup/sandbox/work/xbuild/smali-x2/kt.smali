.class public final synthetic Lkt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpqh;

.field public final synthetic c:Lpqh;

.field public final synthetic d:Lnt;


# direct methods
.method public synthetic constructor <init>(Lpqh;Lpqh;Lnt;B)V
    .registers 5

    iput-byte p4, p0, Lkt;->a:B

    iput-object p1, p0, Lkt;->b:Lpqh;

    iput-object p2, p0, Lkt;->c:Lpqh;

    iput-object p3, p0, Lkt;->d:Lnt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lkt;->a:B

    iget-object v1, p0, Lkt;->d:Lnt;

    iget-object v2, p0, Lkt;->c:Lpqh;

    iget-object p0, p0, Lkt;->b:Lpqh;

    check-cast p1, Ljava/util/List;

    packed-switch v0, :pswitch_data_3e

    iput-object p1, p0, Lpqh;->a:Ljava/lang/Object;

    iget-object p0, v2, Lpqh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_22

    iget-object v0, v1, Lnt;->f:Ltsd;

    check-cast p1, Ljava/util/Collection;

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0, p1}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v0, p0}, Ltsd;->r(Ljava/lang/Object;)V

    :cond_22
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    iput-object p1, p0, Lpqh;->a:Ljava/lang/Object;

    iget-object p0, v2, Lpqh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_3a

    iget-object v0, v1, Lnt;->f:Ltsd;

    check-cast p0, Ljava/util/Collection;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1, p0}, Lkotlin/collections/CollectionsKt;->V(Ljava/lang/Iterable;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v0, p0}, Ltsd;->r(Ljava/lang/Object;)V

    :cond_3a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method
