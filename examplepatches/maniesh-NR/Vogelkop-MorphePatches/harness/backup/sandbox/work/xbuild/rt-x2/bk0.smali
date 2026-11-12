.class public final Lbk0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ln9a;

.field public final b:Lw56;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Ln9a;Lw56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbk0;->a:Ln9a;

    iput-object p2, p0, Lbk0;->b:Lw56;

    new-instance p1, Lwj0;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lwj0;-><init>(Lbk0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lwj0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lwj0;-><init>(Lbk0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lwj0;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lwj0;-><init>(Lbk0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lwj0;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lwj0;-><init>(Lbk0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lbk0;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 8

    iget-object v0, p0, Lbk0;->a:Ln9a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lbq0;

    const/4 v2, -0x1

    const/4 v3, 0x3

    const/16 v4, 0x97f

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    iget-object p0, p0, Lbk0;->b:Lw56;

    const/16 v2, 0xf

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_26

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_26

    new-instance v4, Lif0;

    invoke-direct {v4, p0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_34

    :cond_26
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {p0, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, p0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_34
    invoke-virtual {v4, p1, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lcq0;

    invoke-direct {p0, v0, v1}, Lcq0;-><init>(Ln9a;Lbq0;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    iget-object v0, p0, Lbk0;->a:Ln9a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lzp0;

    const/4 v1, -0x1

    const/4 v2, 0x3

    const/16 v3, 0x97f

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p0, p0, Lbk0;->b:Lw56;

    const/16 v1, 0xe

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_26

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_26

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_34

    :cond_26
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_34
    invoke-virtual {v3, p1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Laq0;

    invoke-direct {p0, v0}, Laq0;-><init>(Lzp0;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
