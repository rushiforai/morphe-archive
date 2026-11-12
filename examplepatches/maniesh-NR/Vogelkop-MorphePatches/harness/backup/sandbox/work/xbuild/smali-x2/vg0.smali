.class public final Lvg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lug0;


# direct methods
.method public constructor <init>(Lzpa;Lug0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvg0;->a:Lzpa;

    iput-object p2, p0, Lvg0;->b:Lug0;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    iget-object v0, p0, Lvg0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lqg0;

    const/4 v1, -0x1

    const/16 v2, 0xd

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p0, p0, Lvg0;->b:Lug0;

    invoke-virtual {p0}, Lug0;->x()Lif0;

    move-result-object p0

    invoke-virtual {p0, p1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lrg0;

    invoke-direct {p0, v0}, Lrg0;-><init>(Lqg0;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 9

    iget-object v0, p0, Lvg0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lik0;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    iget-object p0, p0, Lvg0;->b:Lug0;

    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_25

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_25

    new-instance v4, Lif0;

    invoke-direct {v4, p0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_32

    :cond_25
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, p0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_32
    invoke-virtual {v4, p1, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Ljk0;

    invoke-direct {p0, v0, v1}, Ljk0;-><init>(Lzpa;Lik0;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
