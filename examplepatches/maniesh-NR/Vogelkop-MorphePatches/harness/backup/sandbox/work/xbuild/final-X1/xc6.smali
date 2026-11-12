.class public final Lxc6;
.super Le1g;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final f:Ll08;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lxc6;->e:B

    packed-switch p1, :pswitch_data_42

    sget-object p1, Ld9j;->a:[Ld9j;

    const/16 p1, 0x5208

    invoke-direct {p0, p1}, Le1g;-><init>(I)V

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lxc6;->f:Ll08;

    return-void

    :pswitch_11
    sget-object p1, Ld9j;->a:[Ld9j;

    const p1, 0xbf68

    invoke-direct {p0, p1}, Le1g;-><init>(I)V

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lxc6;->f:Ll08;

    return-void

    :pswitch_1e
    sget-object p1, Ld9j;->a:[Ld9j;

    const/16 p1, 0x4650

    invoke-direct {p0, p1}, Le1g;-><init>(I)V

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lxc6;->f:Ll08;

    return-void

    :pswitch_2a
    sget-object p1, Ld9j;->a:[Ld9j;

    const/16 p1, 0x4e20

    invoke-direct {p0, p1}, Le1g;-><init>(I)V

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lxc6;->f:Ll08;

    return-void

    :pswitch_36
    sget-object p1, Ld9j;->a:[Ld9j;

    const/16 p1, 0x4a38

    invoke-direct {p0, p1}, Le1g;-><init>(I)V

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lxc6;->f:Ll08;

    return-void

    :pswitch_data_42
    .packed-switch 0x1
        :pswitch_36
        :pswitch_2a
        :pswitch_1e
        :pswitch_11
    .end packed-switch
.end method


# virtual methods
.method public final d()Ljava/util/List;
    .registers 2

    iget-byte v0, p0, Lxc6;->e:B

    packed-switch v0, :pswitch_data_14

    iget-object p0, p0, Lxc6;->f:Ll08;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lxc6;->f:Ll08;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Lxc6;->f:Ll08;

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lxc6;->f:Ll08;

    return-object p0

    :pswitch_11
    iget-object p0, p0, Lxc6;->f:Ll08;

    return-object p0

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public final g(I)Lr6j;
    .registers 12

    iget-byte p0, p0, Lxc6;->e:B

    packed-switch p0, :pswitch_data_c8

    new-instance v0, Lr6j;

    new-instance v2, Lx6j;

    new-instance p0, Lrag;

    const/16 v1, 0x15

    invoke-direct {p0, v1}, Lrag;-><init>(B)V

    const-class v1, Ld8j;

    invoke-direct {v2, v1, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Lu4h;

    const/4 p0, 0x5

    invoke-direct {v7, p0}, Lu4h;-><init>(B)V

    const/16 v8, 0x60

    const v3, 0x7f141131

    const v4, 0x7f140b7a

    const v5, 0x7f08059e

    const/4 v6, 0x0

    move v1, p1

    invoke-direct/range {v0 .. v8}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v0

    :pswitch_2c
    move v2, p1

    new-instance v1, Lr6j;

    new-instance v3, Lx6j;

    new-instance p0, Lnf8;

    const/16 p1, 0x16

    invoke-direct {p0, p1}, Lnf8;-><init>(B)V

    const-class p1, Ld8j;

    invoke-direct {v3, p1, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v8, Lzbe;

    const/16 p0, 0x10

    invoke-direct {v8, p0}, Lzbe;-><init>(B)V

    const/16 v9, 0x60

    const v4, 0x7f141131

    const v5, 0x7f14103d

    const v6, 0x7f08059e

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v9}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v1

    :pswitch_54
    move v2, p1

    new-instance v1, Lr6j;

    new-instance v3, Lx6j;

    new-instance p0, Lnf8;

    const/4 p1, 0x6

    invoke-direct {p0, p1}, Lnf8;-><init>(B)V

    const-class p1, Ld8j;

    invoke-direct {v3, p1, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v8, Lq9a;

    const/4 p0, 0x1

    invoke-direct {v8, p0}, Lq9a;-><init>(B)V

    const/16 v9, 0x40

    const v4, 0x7f140fe8

    const v5, 0x7f140fe9

    const v6, 0x7f080569

    const/4 v7, 0x1

    invoke-direct/range {v1 .. v9}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v1

    :pswitch_7a
    move v2, p1

    new-instance v1, Lr6j;

    new-instance v3, Lx6j;

    new-instance p0, Lnf8;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lnf8;-><init>(B)V

    const-class p1, Ld8j;

    invoke-direct {v3, p1, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v8, Ld58;

    const/16 p0, 0xf

    invoke-direct {v8, p0}, Ld58;-><init>(B)V

    const/16 v9, 0x60

    const v4, 0x7f140fdd

    const v5, 0x7f140fde

    const v6, 0x7f080543

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v9}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v1

    :pswitch_a1
    move v2, p1

    new-instance v1, Lr6j;

    new-instance v3, Lx6j;

    new-instance p0, Lah5;

    const/16 p1, 0x19

    invoke-direct {p0, p1}, Lah5;-><init>(B)V

    const-class p1, Lwc6;

    invoke-direct {v3, p1, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v8, Ltb6;

    const/4 p0, 0x2

    invoke-direct {v8, p0}, Ltb6;-><init>(B)V

    const/16 v9, 0x40

    const v4, 0x7f140fbe

    const v5, 0x7f140fba

    const v6, 0x7f08053b

    const/4 v7, 0x1

    invoke-direct/range {v1 .. v9}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v1

    :pswitch_data_c8
    .packed-switch 0x0
        :pswitch_a1
        :pswitch_7a
        :pswitch_54
        :pswitch_2c
    .end packed-switch
.end method
