.class public final Liu1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly43;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk8;


# direct methods
.method public synthetic constructor <init>(Lk8;B)V
    .registers 3

    iput-byte p2, p0, Liu1;->a:B

    iput-object p1, p0, Liu1;->b:Lk8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final O(Lx43;)V
    .registers 3

    iget-byte v0, p0, Liu1;->a:B

    iget-object p0, p0, Liu1;->b:Lk8;

    packed-switch v0, :pswitch_data_30

    check-cast p0, Lju1;

    iget-object p0, p0, Lju1;->p:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lavl;

    iget-object p1, p1, Lx43;->a:Lyul;

    invoke-static {v0, p1}, Lavl;->a(Lavl;Lyul;)Lavl;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_1b
    check-cast p0, Lju1;

    iget-object p0, p0, Lju1;->p:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lavl;

    iget-object p1, p1, Lx43;->a:Lyul;

    invoke-static {v0, p1}, Lavl;->a(Lavl;Lyul;)Lavl;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method

.method public final p(F)V
    .registers 3

    iget-byte v0, p0, Liu1;->a:B

    iget-object p0, p0, Liu1;->b:Lk8;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Lju1;

    iget-object p0, p0, Lju1;->r:Lkze;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_13
    check-cast p0, Lju1;

    iget-object p0, p0, Lju1;->r:Lkze;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

.method public final v(F)V
    .registers 3

    iget-byte v0, p0, Liu1;->a:B

    iget-object p0, p0, Liu1;->b:Lk8;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Lju1;

    iget-object p0, p0, Lju1;->q:Lkze;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :pswitch_13
    check-cast p0, Lju1;

    iget-object p0, p0, Lju1;->q:Lkze;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
