.class public final Lhi0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lfi0;

.field public final c:Lzyk;

.field public final d:Lzyk;

.field public final e:Lzyk;


# direct methods
.method public constructor <init>(Lzpa;Lfi0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhi0;->a:Lzpa;

    iput-object p2, p0, Lhi0;->b:Lfi0;

    new-instance p1, Lgi0;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lgi0;-><init>(Lhi0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhi0;->c:Lzyk;

    new-instance p1, Lgi0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lgi0;-><init>(Lhi0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lgi0;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lgi0;-><init>(Lhi0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lgi0;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lgi0;-><init>(Lhi0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lgi0;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lgi0;-><init>(Lhi0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lgi0;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lgi0;-><init>(Lhi0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhi0;->d:Lzyk;

    new-instance p1, Lgi0;

    const/4 p2, 0x6

    invoke-direct {p1, p0, p2}, Lgi0;-><init>(Lhi0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Lgi0;

    const/4 p2, 0x7

    invoke-direct {p1, p0, p2}, Lgi0;-><init>(Lhi0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lhi0;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final a()Lvg0;
    .registers 1

    iget-object p0, p0, Lhi0;->d:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvg0;

    return-object p0
.end method

.method public final b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    iget-object v0, p0, Lhi0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lqt0;

    const/4 v1, -0x1

    const/4 v2, 0x3

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p0, p0, Lhi0;->b:Lfi0;

    const/16 v1, 0x2f

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

    new-instance p0, Lrt0;

    invoke-direct {p0, v0}, Lrt0;-><init>(Lqt0;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
