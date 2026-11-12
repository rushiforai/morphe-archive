.class public final synthetic Lk5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(BJJ)V
    .registers 6

    iput-byte p1, p0, Lk5f;->a:B

    iput-wide p2, p0, Lk5f;->b:J

    iput-wide p4, p0, Lk5f;->c:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lk5f;->a:B

    const/4 v1, 0x1

    iget-wide v2, p0, Lk5f;->c:J

    iget-wide v4, p0, Lk5f;->b:J

    packed-switch v0, :pswitch_data_68

    check-cast p1, Lak0;

    iget-object p0, p1, Lak0;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljn0;

    sub-long/2addr v4, v2

    iget-object p0, p0, Ljn0;->a:Lhn0;

    const/4 p1, 0x7

    invoke-virtual {p0, p1, v1, v4, v5}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1e
    check-cast p1, Lck0;

    iget-object p0, p1, Lck0;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvc0;

    iget-object p1, p0, Lvc0;->a:Lzpa;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lpm0;

    const/4 v0, -0x1

    const/4 v6, 0x2

    const/16 v7, 0x98b

    invoke-direct {p1, v7, v0, v6}, Ljf0;-><init>(III)V

    iget-object p0, p0, Lvc0;->b:Luc0;

    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    if-eqz v6, :cond_4e

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4e

    new-instance v7, Lhf0;

    invoke-direct {v7, p0, v0, v6}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_5b

    :cond_4e
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, v0, v1, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v7, Lhf0;

    invoke-direct {v7, p0, v0, v6}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_5b
    invoke-virtual {v7, p1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x0

    invoke-virtual {p1, p0, v1, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {p1, v1, v1, v2, v3}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
