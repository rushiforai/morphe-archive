.class public final synthetic Lta0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz8b;


# direct methods
.method public synthetic constructor <init>(Lz8b;B)V
    .registers 3

    iput-byte p2, p0, Lta0;->a:B

    iput-object p1, p0, Lta0;->b:Lz8b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lta0;->a:B

    const/16 v1, 0x10

    const/4 v2, 0x5

    const/4 v3, 0x4

    const/16 v4, 0x98b

    const/4 v5, 0x1

    iget-object p0, p0, Lta0;->b:Lz8b;

    packed-switch v0, :pswitch_data_ee

    new-instance v0, Ln9a;

    iget-object v1, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast v1, Lzpa;

    iget-object p0, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Lra0;

    invoke-virtual {p0, v1}, Lra0;->x(Lzpa;)Lqb0;

    const/16 p0, 0x11

    invoke-direct {v0, p0}, Ln9a;-><init>(B)V

    return-object v0

    :pswitch_21
    new-instance v0, Lzpa;

    iget-object v1, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast v1, Lzpa;

    iget-object p0, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Lra0;

    const/16 v2, 0xc

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgp0;

    if-nez v6, :cond_46

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lgp0;

    invoke-direct {v1, v4, v5, v3}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v5, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgp0;

    :cond_46
    const/16 p0, 0x13

    invoke-direct {v0, p0}, Lzpa;-><init>(B)V

    return-object v0

    :pswitch_4c
    new-instance v0, Ly55;

    iget-object v1, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast v1, Lzpa;

    iget-object p0, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Lra0;

    const/16 v2, 0xb

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lpo0;

    if-nez v6, :cond_71

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lpo0;

    invoke-direct {v1, v4, v5, v3}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v5, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpo0;

    :cond_71
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_75
    new-instance v0, Lpsp;

    iget-object v1, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast v1, Lzpa;

    iget-object p0, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Lra0;

    const/4 v3, 0x6

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgh0;

    if-nez v6, :cond_99

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lgh0;

    invoke-direct {v1, v4, v5, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v3, v5, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgh0;

    :cond_99
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_9d
    new-instance v0, Lydp;

    iget-object v3, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast v3, Lzpa;

    iget-object p0, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Lra0;

    const/4 v6, 0x2

    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Li90;

    if-nez v7, :cond_c1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Li90;

    invoke-direct {v3, v4, v5, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v6, v5, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Li90;

    :cond_c1
    invoke-direct {v0, v1}, Lydp;-><init>(B)V

    return-object v0

    :pswitch_c5
    new-instance v0, Lqs7;

    iget-object v2, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast v2, Lzpa;

    iget-object p0, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Lra0;

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lo70;

    if-nez v3, :cond_e9

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lo70;

    const/4 v3, 0x3

    invoke-direct {v2, v4, v5, v3}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v5, v5, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo70;

    :cond_e9
    invoke-direct {v0, v1}, Lqs7;-><init>(B)V

    return-object v0

    nop

    :pswitch_data_ee
    .packed-switch 0x0
        :pswitch_c5
        :pswitch_9d
        :pswitch_75
        :pswitch_4c
        :pswitch_21
    .end packed-switch
.end method
