.class public final Lqte;
.super Lcx4;
.source "SourceFile"


# instance fields
.field public final synthetic h:B


# direct methods
.method public synthetic constructor <init>(Lekc;IB)V
    .registers 4

    iput-byte p3, p0, Lqte;->h:B

    invoke-direct {p0, p1, p2}, Lcx4;-><init>(Lekc;I)V

    return-void
.end method


# virtual methods
.method public final a(Lhx4;Ljava/lang/Object;)Lix4;
    .registers 5

    iget-byte v0, p0, Lqte;->h:B

    const/4 v1, 0x4

    packed-switch v0, :pswitch_data_68

    invoke-super {p0, p1, p2}, Lcx4;->a(Lhx4;Ljava/lang/Object;)Lix4;

    move-result-object p0

    return-object p0

    :pswitch_b
    check-cast p2, Lvxk;

    iget-boolean p0, p2, Lvxk;->i:Z

    if-nez p0, :cond_14

    invoke-virtual {p1, v1}, Lhx4;->b(I)V

    :cond_14
    iget-boolean p0, p2, Lvxk;->j:Z

    if-nez p0, :cond_1c

    const/4 p0, 0x5

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    :cond_1c
    iget-boolean p0, p2, Lvxk;->k:Z

    if-nez p0, :cond_24

    const/4 p0, 0x6

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    :cond_24
    iget-boolean p0, p2, Lvxk;->l:Z

    if-nez p0, :cond_2c

    const/4 p0, 0x7

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    :cond_2c
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0

    :pswitch_31
    check-cast p2, Luzj;

    iget-boolean p0, p2, Luzj;->a:Z

    if-nez p0, :cond_45

    sget-object p0, Ltzj;->a:[Ltzj;

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    const/4 p0, 0x2

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    const/4 p0, 0x3

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    :cond_45
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0

    :pswitch_4a
    check-cast p2, Lh6g;

    iget-object p0, p2, Lh6g;->c:Lns2;

    iget-boolean p0, p0, Lns2;->a:Z

    if-nez p0, :cond_57

    sget-object p0, Lg6g;->a:[Lg6g;

    invoke-virtual {p1, v1}, Lhx4;->b(I)V

    :cond_57
    iget-boolean p0, p2, Lh6g;->h:Z

    if-eqz p0, :cond_62

    sget-object p0, Lg6g;->a:[Lg6g;

    const/16 p0, 0x9

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    :cond_62
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_4a
        :pswitch_31
        :pswitch_b
    .end packed-switch
.end method

.method public final h(Lr6j;Ljava/lang/Object;I)Lr6j;
    .registers 14

    iget-byte p0, p0, Lqte;->h:B

    const/16 v0, 0x1d

    const/4 v1, 0x1

    const/16 v2, 0x13

    packed-switch p0, :pswitch_data_96

    check-cast p2, Lvxk;

    new-instance v5, Lx6j;

    new-instance p0, Lvoj;

    invoke-direct {p0, v2}, Lvoj;-><init>(B)V

    const-class p2, Lhxk;

    invoke-direct {v5, p2, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v8, Lbvk;

    invoke-direct {v8, v1}, Lbvk;-><init>(B)V

    const/16 v9, 0x18

    const v6, 0x7f1411e6

    const/4 v7, 0x0

    move-object v3, p1

    move v4, p3

    invoke-static/range {v3 .. v9}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_2a
    move-object v3, p1

    move v1, p3

    check-cast p2, Luzj;

    new-instance v2, Lx6j;

    new-instance p0, Lvoj;

    const/16 p1, 0xe

    invoke-direct {p0, p1}, Lvoj;-><init>(B)V

    const-class p1, Ld8j;

    invoke-direct {v2, p1, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v6, Lbli;

    invoke-direct {v6, v0}, Lbli;-><init>(B)V

    move-object v0, v3

    const v3, 0x7f141173

    const v4, 0x7f0805fa

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v6}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_4e
    move-object v3, p1

    move v4, p3

    check-cast p2, Lh6g;

    new-instance v2, Lx6j;

    new-instance p0, Lnf8;

    invoke-direct {p0, v0}, Lnf8;-><init>(B)V

    const-class p1, Ljt2;

    invoke-direct {v2, p1, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v6, Lm3g;

    invoke-direct {v6, v1}, Lm3g;-><init>(B)V

    move-object v0, v3

    const v3, 0x7f1410cd

    move v1, v4

    const v4, 0x7f0805ac

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v6}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_71
    move-object v0, p1

    move v1, p3

    check-cast p2, Lste;

    move p0, v2

    new-instance v2, Lx6j;

    new-instance p1, Lnf8;

    invoke-direct {p1, p0}, Lnf8;-><init>(B)V

    const-class p0, Lwre;

    invoke-direct {v2, p0, p1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v6, Lzbe;

    const/16 p0, 0x8

    invoke-direct {v6, p0}, Lzbe;-><init>(B)V

    const v3, 0x7f14101a

    const v4, 0x7f0805d3

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v6}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_71
        :pswitch_4e
        :pswitch_2a
    .end packed-switch
.end method
