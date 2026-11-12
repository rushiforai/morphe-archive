.class public final Llk0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lkk0;


# direct methods
.method public constructor <init>(Lzpa;Lkk0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llk0;->a:Lzpa;

    iput-object p2, p0, Llk0;->b:Lkk0;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .registers 7

    iget-object v0, p0, Llk0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lmk0;

    const/4 v1, -0x1

    const/4 v2, 0x3

    const/16 v3, 0x98b

    invoke-direct {v0, v3, v1, v2}, Ljf0;-><init>(III)V

    iget-object p0, p0, Llk0;->b:Lkk0;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_25

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_25

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_33

    :cond_25
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lif0;

    invoke-direct {v3, p0, v1, v2}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_33
    invoke-virtual {v3, p1, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lnk0;

    invoke-direct {p0, v0}, Lnk0;-><init>(Lmk0;)V

    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
