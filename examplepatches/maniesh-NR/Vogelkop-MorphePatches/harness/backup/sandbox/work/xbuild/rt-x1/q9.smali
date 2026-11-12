.class public final Lq9;
.super Ldx4;
.source "SourceFile"


# instance fields
.field public final synthetic g:B

.field public final h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lq9;->g:B

    packed-switch p1, :pswitch_data_1e

    sget-object p1, Ld9j;->a:[Ld9j;

    const/16 p1, 0x3e8

    invoke-direct {p0, p1}, Ldx4;-><init>(I)V

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lq9;->h:Ljava/lang/Object;

    return-void

    :pswitch_11
    sget-object p1, Ld9j;->a:[Ld9j;

    const/16 p1, 0x36b0

    invoke-direct {p0, p1}, Ldx4;-><init>(I)V

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lq9;->h:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_11
    .end packed-switch
.end method

.method public constructor <init>(Llw3;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lq9;->g:B

    .line 30
    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0x32c8

    .line 31
    invoke-direct {p0, v0}, Ldx4;-><init>(I)V

    .line 32
    iput-object p1, p0, Lq9;->h:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final b(Lhx4;)Lix4;
    .registers 3

    iget-byte v0, p0, Lq9;->g:B

    packed-switch v0, :pswitch_data_30

    invoke-super {p0, p1}, Ldx4;->b(Lhx4;)Lix4;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lq9;->h:Ljava/lang/Object;

    check-cast p0, Llw3;

    invoke-virtual {p0}, Llw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_21

    sget-object p0, Lub6;->a:[Lub6;

    const/4 p0, 0x7

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    goto :goto_2b

    :cond_21
    sget-object p0, Lub6;->a:[Lub6;

    const/4 p0, 0x2

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    const/4 p0, 0x6

    invoke-virtual {p1, p0}, Lhx4;->b(I)V

    :goto_2b
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0

    :pswitch_data_30
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final d()Ljava/util/List;
    .registers 2

    iget-byte v0, p0, Lq9;->g:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0}, Lex4;->d()Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lq9;->h:Ljava/lang/Object;

    check-cast p0, Ll08;

    return-object p0

    :pswitch_f
    iget-object p0, p0, Lq9;->h:Ljava/lang/Object;

    check-cast p0, Ll08;

    return-object p0

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_f
        :pswitch_a
    .end packed-switch
.end method

.method public final h(Lr6j;I)Lr6j;
    .registers 11

    iget-byte p0, p0, Lq9;->g:B

    const-class v0, Ld8j;

    packed-switch p0, :pswitch_data_64

    new-instance v3, Lx6j;

    new-instance p0, Lah5;

    const/16 v1, 0x18

    invoke-direct {p0, v1}, Lah5;-><init>(B)V

    invoke-direct {v3, v0, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v6, Ltb6;

    const/4 p0, 0x0

    invoke-direct {v6, p0}, Ltb6;-><init>(B)V

    const/16 v7, 0x18

    const v4, 0x7f140fb8

    const/4 v5, 0x0

    move-object v1, p1

    move v2, p2

    invoke-static/range {v1 .. v7}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_26
    move-object v1, p1

    move v2, p2

    new-instance p0, Lx6j;

    new-instance p1, Lali;

    const/4 p2, 0x7

    invoke-direct {p1, p2}, Lali;-><init>(B)V

    invoke-direct {p0, v0, p1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    const/4 v5, 0x0

    const/16 v6, 0x38

    const v3, 0x7f140f12

    const/4 v4, 0x0

    move-object v0, v1

    move v1, v2

    move-object v2, p0

    invoke-static/range {v0 .. v6}, Lr6j;->b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_42
    move-object v1, p1

    move v2, p2

    new-instance p0, Lx6j;

    new-instance p1, Lve5;

    const/4 p2, 0x4

    invoke-direct {p1, p2}, Lve5;-><init>(B)V

    invoke-direct {p0, v0, p1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v6, Ly2;

    const/4 p1, 0x2

    invoke-direct {v6, p1}, Ly2;-><init>(B)V

    const v3, 0x7f140f48

    const v4, 0x7f0804d9

    const/4 v5, 0x1

    move-object v0, v1

    move v1, v2

    move-object v2, p0

    invoke-virtual/range {v0 .. v6}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_42
        :pswitch_26
    .end packed-switch
.end method
