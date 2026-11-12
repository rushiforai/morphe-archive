.class public final Lmel;
.super La7f;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Loel;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Loel;B)V
    .registers 4

    iput-byte p3, p0, Lmel;->c:B

    iput-object p2, p0, Lmel;->d:Loel;

    invoke-direct {p0, p1}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lmel;->c:B

    iget-object p0, p0, Lmel;->d:Loel;

    packed-switch v0, :pswitch_data_86

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const v0, 0x7f0a055c

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_22
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v0, 0x7f0a0555

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_33
    check-cast p2, Lnil;

    check-cast p1, Lnil;

    const v0, 0x7f0a0557

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_3e
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const v0, 0x7f0a055d

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_59
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v0, 0x7f0a0558

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_6a
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const v0, 0x7f0a0556

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_59
        :pswitch_3e
        :pswitch_33
        :pswitch_22
    .end packed-switch
.end method
