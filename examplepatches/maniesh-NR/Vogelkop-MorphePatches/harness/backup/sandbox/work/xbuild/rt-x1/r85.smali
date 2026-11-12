.class public final synthetic Lr85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkg;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lr85;->a:B

    iput-object p1, p0, Lr85;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final q(Leri;Z)V
    .registers 3

    iget-byte p1, p0, Lr85;->a:B

    iget-object p0, p0, Lr85;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_2e

    check-cast p0, Lzg;

    invoke-virtual {p0}, Lzg;->l()V

    return-void

    :pswitch_d
    check-cast p0, Liv7;

    iget-object p1, p0, Liv7;->f:Lpde;

    iget-object p2, p0, Liv7;->c:Llg;

    invoke-virtual {p2}, Llg;->b()Leri;

    move-result-object p2

    invoke-static {p1, p2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p1, p0, Liv7;->k:Lpde;

    invoke-virtual {p0}, Liv7;->a()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {p1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_28
    check-cast p0, Lu85;

    invoke-virtual {p0}, Lu85;->g()V

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_28
        :pswitch_d
    .end packed-switch
.end method
