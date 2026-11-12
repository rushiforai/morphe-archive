.class public final synthetic Lvj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lak0;


# direct methods
.method public synthetic constructor <init>(Lak0;B)V
    .registers 3

    iput-byte p2, p0, Lvj0;->a:B

    iput-object p1, p0, Lvj0;->b:Lak0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lvj0;->a:B

    const/4 v1, 0x2

    const/16 v2, 0x12

    const/16 v3, 0x92e

    iget-object p0, p0, Lvj0;->b:Lak0;

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_f8

    new-instance v0, Lsd0;

    iget-object v5, p0, Lak0;->a:Lqs7;

    iget-object p0, p0, Lak0;->b:Lv56;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lpd0;

    if-nez v6, :cond_2a

    new-instance v6, Lpd0;

    invoke-direct {v6, v3, v4, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v4, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lpd0;

    :cond_2a
    invoke-direct {v0, v5, v6}, Lsd0;-><init>(Lqs7;Lpd0;)V

    return-object v0

    :pswitch_2e
    new-instance v0, Lms0;

    iget-object p0, p0, Lak0;->b:Lv56;

    const/16 v2, 0x11

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lks0;

    if-nez v5, :cond_4b

    new-instance v5, Lks0;

    invoke-direct {v5, v3, v4, v1}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v2, v4, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Lks0;

    :cond_4b
    invoke-direct {v0, v5}, Lms0;-><init>(Lks0;)V

    return-object v0

    :pswitch_4f
    new-instance v0, Lsr0;

    iget-object p0, p0, Lak0;->b:Lv56;

    const/16 v1, 0x10

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqr0;

    if-nez v2, :cond_6d

    new-instance v2, Lqr0;

    const/4 v5, 0x4

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lqr0;

    :cond_6d
    invoke-direct {v0, v2}, Lsr0;-><init>(Lqr0;)V

    return-object v0

    :pswitch_71
    new-instance v0, Ljn0;

    iget-object p0, p0, Lak0;->b:Lv56;

    const/16 v1, 0xf

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lhn0;

    if-nez v2, :cond_90

    new-instance v2, Lhn0;

    const/16 v5, 0x9

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lhn0;

    :cond_90
    invoke-direct {v0, v2}, Ljn0;-><init>(Lhn0;)V

    return-object v0

    :pswitch_94
    new-instance v0, Lwf0;

    iget-object p0, p0, Lak0;->b:Lv56;

    const/16 v1, 0xe

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrf0;

    if-nez v2, :cond_b1

    new-instance v2, Lrf0;

    invoke-direct {v2, v3, v4, v4}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lrf0;

    :cond_b1
    invoke-direct {v0, v2}, Lwf0;-><init>(Lrf0;)V

    return-object v0

    :pswitch_b5
    new-instance v0, Lrb0;

    iget-object p0, p0, Lak0;->b:Lv56;

    const/16 v1, 0xd

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lob0;

    if-nez v2, :cond_d3

    new-instance v2, Lob0;

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v1, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lob0;

    :cond_d3
    invoke-direct {v0, v2}, Lrb0;-><init>(Lob0;)V

    return-object v0

    :pswitch_d7
    new-instance v0, Lzpa;

    iget-object p0, p0, Lak0;->b:Lv56;

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfk0;

    if-nez v1, :cond_f3

    new-instance v1, Lfk0;

    const/16 v5, 0x8

    invoke-direct {v1, v3, v4, v5}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v4, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfk0;

    :cond_f3
    invoke-direct {v0, v2}, Lzpa;-><init>(B)V

    return-object v0

    nop

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_d7
        :pswitch_b5
        :pswitch_94
        :pswitch_71
        :pswitch_4f
        :pswitch_2e
    .end packed-switch
.end method
