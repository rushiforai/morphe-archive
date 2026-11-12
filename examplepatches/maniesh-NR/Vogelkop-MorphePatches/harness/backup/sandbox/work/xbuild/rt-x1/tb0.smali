.class public final Ltb0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lq56;


# direct methods
.method public constructor <init>(Lzpa;Lq56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltb0;->a:Lzpa;

    iput-object p2, p0, Ltb0;->b:Lq56;

    new-instance p1, Lsb0;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lsb0;-><init>(Ltb0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lsb0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lsb0;-><init>(Ltb0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 9

    iget-object v0, p0, Ltb0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lw60;

    const/16 v2, 0x98b

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljf0;-><init>(III)V

    iget-object p0, p0, Ltb0;->b:Lq56;

    const/16 v2, 0x1d

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_26

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_26

    new-instance v4, Lif0;

    invoke-direct {v4, p0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_33

    :cond_26
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, p0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_33
    invoke-virtual {v4, p1, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lx60;

    invoke-direct {p0, v0, v1}, Lx60;-><init>(Lzpa;Lw60;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
