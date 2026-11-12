.class public final synthetic Lq5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Lvb0;


# direct methods
.method public synthetic constructor <init>(JLvb0;B)V
    .registers 5

    iput-byte p4, p0, Lq5f;->a:B

    iput-wide p1, p0, Lq5f;->b:J

    iput-object p3, p0, Lq5f;->c:Lvb0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lq5f;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, -0x1

    const/16 v4, 0x98b

    iget-object v5, p0, Lq5f;->c:Lvb0;

    iget-wide v6, p0, Lq5f;->b:J

    const/4 p0, 0x1

    check-cast p1, Lyb0;

    packed-switch v0, :pswitch_data_80

    iget-object v0, p1, Lyb0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lf66;

    invoke-direct {v0, v4, v3, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lyb0;->b:Lxb0;

    const/16 v2, 0x36

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_33

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_33

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3c

    :cond_33
    invoke-static {p1, v2, p0}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3c
    invoke-virtual {v4, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1, p0, v6, v7}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, p0, p0, v5}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_48
    iget-object v0, p1, Lyb0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lg66;

    invoke-direct {v0, v4, v3, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lyb0;->b:Lxb0;

    const/16 v2, 0x35

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_6a

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6a

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_73

    :cond_6a
    invoke-static {p1, v2, p0}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_73
    invoke-virtual {v4, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1, p0, v6, v7}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, p0, p0, v5}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_48
    .end packed-switch
.end method
