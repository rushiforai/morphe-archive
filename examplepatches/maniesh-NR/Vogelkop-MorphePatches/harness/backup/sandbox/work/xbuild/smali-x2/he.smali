.class public final Lhe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll24;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lhe;->a:B

    iput-object p1, p0, Lhe;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final V()Z
    .registers 1

    iget-byte p0, p0, Lhe;->a:B

    const/4 p0, 0x0

    return p0
.end method

.method public final Z()Z
    .registers 1

    iget-byte p0, p0, Lhe;->a:B

    const/4 p0, 0x0

    return p0
.end method

.method public final j()Z
    .registers 2

    iget-byte v0, p0, Lhe;->a:B

    iget-object p0, p0, Lhe;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2a

    check-cast p0, Lh0h;

    invoke-virtual {p0}, Lo73;->b()Z

    move-result p0

    return p0

    :pswitch_e
    check-cast p0, Lakg;

    invoke-virtual {p0}, Lo73;->b()Z

    move-result p0

    return p0

    :pswitch_15
    check-cast p0, Lbk5;

    sget-object v0, Lxle;->e:Lxle;

    invoke-virtual {p0, v0}, Lbk5;->b(Lp58;)Z

    move-result p0

    return p0

    :pswitch_1e
    const/4 p0, 0x0

    return p0

    :pswitch_20
    check-cast p0, Lie;

    iget-object p0, p0, Lie;->a:Lge;

    invoke-virtual {p0}, Lo73;->b()Z

    move-result p0

    return p0

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_20
        :pswitch_1e
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method

.method public final u()Z
    .registers 2

    iget-byte v0, p0, Lhe;->a:B

    iget-object p0, p0, Lhe;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_32

    check-cast p0, Lh0h;

    invoke-virtual {p0}, Lo73;->b()Z

    move-result p0

    return p0

    :pswitch_e
    check-cast p0, Lakg;

    invoke-virtual {p0}, Lo73;->b()Z

    move-result p0

    return p0

    :pswitch_15
    check-cast p0, Lbk5;

    sget-object v0, Lxle;->e:Lxle;

    invoke-virtual {p0, v0}, Lbk5;->b(Lp58;)Z

    move-result p0

    return p0

    :pswitch_1e
    check-cast p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/w;->X()Z

    const/4 p0, 0x1

    return p0

    :pswitch_29
    check-cast p0, Lie;

    iget-object p0, p0, Lie;->a:Lge;

    invoke-virtual {p0}, Lo73;->b()Z

    move-result p0

    return p0

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_29
        :pswitch_1e
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method
