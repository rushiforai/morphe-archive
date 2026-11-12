.class public final Lmc2;
.super Ld1g;
.source "SourceFile"


# instance fields
.field public final synthetic f:B

.field public final g:Ll08;


# direct methods
.method public constructor <init>(Lami;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lmc2;->f:B

    .line 26
    iget-object p1, p1, Lami;->f:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    .line 27
    sget-object v0, Ld9j;->a:[Ld9j;

    const v0, 0xc350

    .line 28
    invoke-direct {p0, p1, v0}, Ld1g;-><init>(Lekc;I)V

    .line 29
    sget-object p1, Ll08;->a:Ll08;

    .line 30
    iput-object p1, p0, Lmc2;->g:Ll08;

    return-void
.end method

.method public constructor <init>(Ligi;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lmc2;->f:B

    iget-object p1, p1, Ligi;->d:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    sget-object v0, Ld9j;->a:[Ld9j;

    const v0, 0xb3b0

    invoke-direct {p0, p1, v0}, Ld1g;-><init>(Lekc;I)V

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lmc2;->g:Ll08;

    return-void
.end method

.method public constructor <init>(Lpsi;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lmc2;->f:B

    .line 31
    iget-object p1, p1, Lpsi;->t:Lf99;

    .line 32
    invoke-static {p1}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object p1

    .line 33
    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0x4268

    .line 34
    invoke-direct {p0, p1, v0}, Ld1g;-><init>(Lekc;I)V

    .line 35
    sget-object p1, Ll08;->a:Ll08;

    .line 36
    iput-object p1, p0, Lmc2;->g:Ll08;

    return-void
.end method


# virtual methods
.method public final a(Lhx4;Ljava/lang/Object;)Lix4;
    .registers 5

    iget-byte v0, p0, Lmc2;->f:B

    const/16 v1, 0xb

    packed-switch v0, :pswitch_data_74

    :pswitch_7
    invoke-super {p0, p1, p2}, Ld1g;->a(Lhx4;Ljava/lang/Object;)Lix4;

    move-result-object p0

    return-object p0

    :pswitch_c
    check-cast p2, Lmsi;

    iget-boolean v0, p2, Lmsi;->t:Z

    if-nez v0, :cond_19

    sget-object v0, Ljsi;->a:[Ljsi;

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_19
    iget-boolean v0, p2, Lmsi;->n:Z

    if-nez v0, :cond_22

    sget-object v0, Ljsi;->a:[Ljsi;

    invoke-virtual {p1, v1}, Lhx4;->b(I)V

    :cond_22
    iget-boolean v0, p2, Lmsi;->p:Z

    if-nez v0, :cond_2d

    sget-object v0, Ljsi;->a:[Ljsi;

    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_2d
    iget-boolean v0, p2, Lmsi;->v:Z

    if-nez v0, :cond_38

    sget-object v0, Ljsi;->a:[Ljsi;

    const/16 v0, 0xe

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_38
    iget-boolean v0, p2, Lmsi;->b:Z

    if-nez v0, :cond_43

    sget-object v0, Ljsi;->a:[Ljsi;

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_43
    iget-boolean v0, p2, Lmsi;->f:Z

    if-nez v0, :cond_4d

    sget-object v0, Ljsi;->a:[Ljsi;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_4d
    invoke-super {p0, p1, p2}, Ld1g;->a(Lhx4;Ljava/lang/Object;)Lix4;

    move-result-object p0

    return-object p0

    :pswitch_52
    check-cast p2, Lnc2;

    iget-boolean v0, p2, Lnc2;->b:Z

    if-eqz v0, :cond_5c

    iget-boolean v0, p2, Lnc2;->d:Z

    if-nez v0, :cond_62

    :cond_5c
    sget-object v0, Llc2;->a:[Llc2;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_62
    iget-boolean v0, p2, Lnc2;->b:Z

    if-eqz v0, :cond_6a

    iget-boolean v0, p2, Lnc2;->c:Z

    if-nez v0, :cond_6f

    :cond_6a
    sget-object v0, Llc2;->a:[Llc2;

    invoke-virtual {p1, v1}, Lhx4;->b(I)V

    :cond_6f
    invoke-super {p0, p1, p2}, Ld1g;->a(Lhx4;Ljava/lang/Object;)Lix4;

    move-result-object p0

    return-object p0

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_52
        :pswitch_7
        :pswitch_c
    .end packed-switch
.end method

.method public final d()Ljava/util/List;
    .registers 2

    iget-byte v0, p0, Lmc2;->f:B

    packed-switch v0, :pswitch_data_e

    iget-object p0, p0, Lmc2;->g:Ll08;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lmc2;->g:Ll08;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Lmc2;->g:Ll08;

    return-object p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public final g(ILjava/lang/Object;)Lr6j;
    .registers 14

    iget-byte p0, p0, Lmc2;->f:B

    const-class v0, Ld8j;

    packed-switch p0, :pswitch_data_7a

    check-cast p2, Lmsi;

    new-instance v1, Lr6j;

    new-instance v3, Lx6j;

    new-instance p0, Lali;

    const/4 p2, 0x6

    invoke-direct {p0, p2}, Lali;-><init>(B)V

    invoke-direct {v3, v0, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v8, Lbli;

    invoke-direct {v8, p2}, Lbli;-><init>(B)V

    const/16 v9, 0x40

    const v4, 0x7f141099

    const v5, 0x7f141098

    const v6, 0x7f0805e5

    const/4 v7, 0x1

    move v2, p1

    invoke-direct/range {v1 .. v9}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v1

    :pswitch_2c
    move v3, p1

    check-cast p2, Lxo3;

    new-instance v2, Lr6j;

    new-instance v4, Lx6j;

    new-instance p0, Lq92;

    const/4 p1, 0x4

    invoke-direct {p0, p1}, Lq92;-><init>(B)V

    invoke-direct {v4, v0, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v9, Lf32;

    const/16 p0, 0x1c

    invoke-direct {v9, p0}, Lf32;-><init>(B)V

    const/16 v10, 0x40

    const v5, 0x7f140523

    const v6, 0x7f140520

    const v7, 0x7f080535

    const/4 v8, 0x1

    invoke-direct/range {v2 .. v10}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v2

    :pswitch_53
    move v3, p1

    check-cast p2, Lnc2;

    new-instance v2, Lr6j;

    new-instance v4, Lx6j;

    new-instance p0, Lq92;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lq92;-><init>(B)V

    invoke-direct {v4, v0, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    iget-boolean v9, p2, Lnc2;->a:Z

    new-instance v10, Lf32;

    const/4 p0, 0x7

    invoke-direct {v10, p0}, Lf32;-><init>(B)V

    const v5, 0x7f1401dc

    const v6, 0x7f140112

    const v7, 0x7f0803ec

    const/4 v8, 0x1

    invoke-direct/range {v2 .. v10}, Lr6j;-><init>(ILx6j;IIIZZLkotlin/jvm/functions/Function1;)V

    return-object v2

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_53
        :pswitch_2c
    .end packed-switch
.end method
