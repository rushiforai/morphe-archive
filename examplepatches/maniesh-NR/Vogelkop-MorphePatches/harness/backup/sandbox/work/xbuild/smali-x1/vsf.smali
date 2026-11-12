.class public final synthetic Lvsf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkl0;


# direct methods
.method public synthetic constructor <init>(Lwsf;Lkl0;B)V
    .registers 4

    iput-byte p3, p0, Lvsf;->a:B

    iput-object p2, p0, Lvsf;->b:Lkl0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lvsf;->a:B

    const-wide/16 v1, 0x1

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/4 v5, -0x1

    const/16 v6, 0x92e

    iget-object p0, p0, Lvsf;->b:Lkl0;

    check-cast p1, Lak0;

    packed-switch v0, :pswitch_data_90

    iget-object p1, p1, Lak0;->h:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsd0;

    invoke-static {p0}, Lwsf;->b(Lkl0;)Ljava/lang/String;

    move-result-object p0

    iget-object v0, p1, Lsd0;->a:Lqs7;

    new-instance v0, Lpg0;

    invoke-direct {v0, v6, v5, v4}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lsd0;->b:Lpd0;

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    if-eqz v4, :cond_39

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_39

    new-instance v5, Lif0;

    invoke-direct {v5, p1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_46

    :cond_39
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v3, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lif0;

    invoke-direct {v5, p1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_46
    invoke-virtual {v5, p0, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v3, v1, v2}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_50
    iget-object p1, p1, Lak0;->h:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsd0;

    invoke-static {p0}, Lwsf;->b(Lkl0;)Ljava/lang/String;

    move-result-object p0

    iget-object v0, p1, Lsd0;->a:Lqs7;

    new-instance v0, Lpg0;

    invoke-direct {v0, v6, v5, v4}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lsd0;->b:Lpd0;

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    if-eqz v4, :cond_79

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_79

    new-instance v5, Lif0;

    invoke-direct {v5, p1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_86

    :cond_79
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v3, v3, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lif0;

    invoke-direct {v5, p1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_86
    invoke-virtual {v5, p0, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v3, v3, v1, v2}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_50
    .end packed-switch
.end method
