.class public final synthetic Lyok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lapk;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lapk;Ljava/util/List;B)V
    .registers 4

    iput-byte p3, p0, Lyok;->a:B

    iput-object p1, p0, Lyok;->b:Lapk;

    iput-object p2, p0, Lyok;->c:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lyok;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lyok;->c:Ljava/util/List;

    iget-object p0, p0, Lyok;->b:Lapk;

    check-cast p1, Losk;

    packed-switch v0, :pswitch_data_4c

    iget-object p0, p0, Lapk;->f:Lnb2;

    invoke-virtual {p0, p1, v4}, Lkfo;->P(Losk;Ljava/lang/Iterable;)V

    return-object v2

    :pswitch_14
    iget-object p1, p0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v0, Lr4k;

    const/16 v2, 0xf

    invoke-direct {v0, v2}, Lr4k;-><init>(B)V

    invoke-static {p1, v3, v1, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lyok;

    invoke-direct {v0, p0, v4, v3}, Lyok;-><init>(Lapk;Ljava/util/List;B)V

    invoke-static {p1, v3, v1, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2e
    iget-object p1, p0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v0, Lr4k;

    const/16 v2, 0x12

    invoke-direct {v0, v2}, Lr4k;-><init>(B)V

    invoke-static {p1, v3, v1, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    new-instance v0, Lyok;

    const/4 v2, 0x3

    invoke-direct {v0, p0, v4, v2}, Lyok;-><init>(Lapk;Ljava/util/List;B)V

    invoke-static {p1, v3, v1, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_46
    iget-object p0, p0, Lapk;->d:Lnb2;

    invoke-virtual {p0, p1, v4}, Lkfo;->P(Losk;Ljava/lang/Iterable;)V

    return-object v2

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_46
        :pswitch_2e
        :pswitch_14
    .end packed-switch
.end method
