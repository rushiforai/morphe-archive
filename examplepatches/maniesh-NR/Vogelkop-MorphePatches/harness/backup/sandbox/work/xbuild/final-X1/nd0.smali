.class public final Lnd0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzpa;

.field public final b:Lmd0;

.field public final c:Lzyk;


# direct methods
.method public constructor <init>(Lmd0;Lzpa;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lnd0;->a:Lzpa;

    iput-object p1, p0, Lnd0;->b:Lmd0;

    new-instance p1, Lpa;

    const/4 p2, 0x7

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lnd0;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lkotlin/jvm/functions/Function1;)V
    .registers 6

    iget-object v0, p0, Lnd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Led0;

    const/16 v1, 0x98b

    const/4 v2, -0x1

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Ljf0;-><init>(III)V

    iget-object p0, p0, Lnd0;->b:Lmd0;

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_24

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_24

    new-instance v2, Lhf0;

    invoke-direct {v2, p0, v3, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_32

    :cond_24
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {p0, v3, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lhf0;

    invoke-direct {v2, p0, v3, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_32
    invoke-virtual {v2, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    new-instance p0, Lfd0;

    invoke-direct {p0, v0}, Lfd0;-><init>(Led0;)V

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
