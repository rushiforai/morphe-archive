.class public final synthetic Lzok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lapk;

.field public final synthetic c:Lc3g;


# direct methods
.method public synthetic constructor <init>(Lapk;Lc3g;B)V
    .registers 4

    iput-byte p3, p0, Lzok;->a:B

    iput-object p1, p0, Lzok;->b:Lapk;

    iput-object p2, p0, Lzok;->c:Lc3g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lzok;->a:B

    iget-object v1, p0, Lzok;->c:Lc3g;

    iget-object p0, p0, Lzok;->b:Lapk;

    check-cast p1, Losk;

    packed-switch v0, :pswitch_data_2e

    iget-object p1, p0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance v0, Lr4k;

    const/16 v2, 0xe

    invoke-direct {v0, v2}, Lr4k;-><init>(B)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {p1, v2, v3, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lzok;

    invoke-direct {v0, p0, v1, v2}, Lzok;-><init>(Lapk;Lc3g;B)V

    invoke-static {p1, v2, v3, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27
    iget-object p0, p0, Lapk;->e:Lnb2;

    invoke-virtual {p0, p1, v1}, Lkfo;->Q(Losk;Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
