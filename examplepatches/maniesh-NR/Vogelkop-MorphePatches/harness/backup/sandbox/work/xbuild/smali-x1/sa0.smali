.class public final synthetic Lsa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyqa;


# direct methods
.method public synthetic constructor <init>(Lyqa;B)V
    .registers 3

    iput-byte p2, p0, Lsa0;->a:B

    iput-object p1, p0, Lsa0;->b:Lyqa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lsa0;->a:B

    const/4 v1, 0x5

    const/4 v2, 0x4

    const/16 v3, 0x11

    const/16 v4, 0x97f

    iget-object p0, p0, Lsa0;->b:Lyqa;

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_104

    new-instance v0, Lqs7;

    iget-object v1, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Ln9a;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lqa0;

    const/16 v2, 0xe

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lpb0;

    if-nez v6, :cond_34

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lpb0;

    const/4 v6, 0x7

    invoke-direct {v1, v4, v5, v6}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v5, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpb0;

    :cond_34
    invoke-direct {v0, v3}, Lqs7;-><init>(B)V

    return-object v0

    :pswitch_38
    new-instance v0, Ln9a;

    iget-object v1, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Ln9a;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lqa0;

    const/16 v3, 0xc

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfp0;

    if-nez v6, :cond_5d

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lfp0;

    invoke-direct {v1, v4, v5, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v3, v5, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfp0;

    :cond_5d
    const/16 p0, 0x13

    invoke-direct {v0, p0}, Ln9a;-><init>(B)V

    return-object v0

    :pswitch_63
    new-instance v0, Lpsp;

    iget-object v1, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Ln9a;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lqa0;

    const/16 v3, 0xb

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Loo0;

    if-nez v6, :cond_88

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Loo0;

    invoke-direct {v1, v4, v5, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v3, v5, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loo0;

    :cond_88
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_8c
    new-instance v0, Lulp;

    iget-object v2, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Ln9a;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lqa0;

    const/4 v6, 0x6

    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lfh0;

    if-nez v7, :cond_b0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lfh0;

    invoke-direct {v2, v4, v5, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v6, v5, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfh0;

    :cond_b0
    invoke-direct {v0, v3}, Lulp;-><init>(B)V

    return-object v0

    :pswitch_b4
    new-instance v0, Lqii;

    iget-object v2, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Ln9a;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lqa0;

    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lh90;

    if-nez v6, :cond_d8

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lh90;

    invoke-direct {v2, v4, v5, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v3, v5, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lh90;

    :cond_d8
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_dc
    new-instance v0, Ly55;

    iget-object v1, p0, Lyqa;->b:Ljava/lang/Object;

    check-cast v1, Ln9a;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lqa0;

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ln70;

    if-nez v2, :cond_100

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ln70;

    const/4 v2, 0x3

    invoke-direct {v1, v4, v5, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v5, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ln70;

    :cond_100
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_data_104
    .packed-switch 0x0
        :pswitch_dc
        :pswitch_b4
        :pswitch_8c
        :pswitch_63
        :pswitch_38
    .end packed-switch
.end method
