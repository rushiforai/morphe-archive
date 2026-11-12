.class public final Lxu1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnwe;
.implements Lcxe;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lxu1;->a:B

    iput-object p1, p0, Lxu1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final B()V
    .registers 2

    iget-byte v0, p0, Lxu1;->a:B

    iget-object p0, p0, Lxu1;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1a

    check-cast p0, Ldaj;

    invoke-virtual {p0}, Ldaj;->g()V

    return-void

    :pswitch_d
    check-cast p0, Lkxe;

    invoke-virtual {p0}, Lkxe;->J0()V

    return-void

    :pswitch_13
    check-cast p0, Lyu1;

    invoke-virtual {p0}, Lyu1;->c()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final y(Z)V
    .registers 2

    iget-byte p1, p0, Lxu1;->a:B

    iget-object p0, p0, Lxu1;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_1a

    check-cast p0, Ldaj;

    invoke-virtual {p0}, Ldaj;->g()V

    return-void

    :pswitch_d
    check-cast p0, Lkxe;

    invoke-virtual {p0}, Lkxe;->J0()V

    return-void

    :pswitch_13
    check-cast p0, Lyu1;

    invoke-virtual {p0}, Lyu1;->c()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
