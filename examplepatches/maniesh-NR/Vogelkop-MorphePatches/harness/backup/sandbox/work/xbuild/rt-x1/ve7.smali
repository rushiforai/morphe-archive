.class public final Lve7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lve7;->a:B

    iput-object p1, p0, Lve7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final K(Lgql;I)V
    .registers 3

    iget-byte p1, p0, Lve7;->a:B

    iget-object p0, p0, Lve7;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_1e

    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lse3;

    invoke-virtual {p0}, Ld17;->d()V

    return-void

    :pswitch_11
    check-cast p0, Lzkd;

    invoke-virtual {p0}, Lzkd;->T()V

    return-void

    :pswitch_17
    check-cast p0, Lze7;

    invoke-virtual {p0}, Lze7;->K()V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_17
        :pswitch_11
    .end packed-switch
.end method

.method public final P(Z)V
    .registers 2

    iget-byte p1, p0, Lve7;->a:B

    iget-object p0, p0, Lve7;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_1e

    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lse3;

    invoke-virtual {p0}, Ld17;->d()V

    return-void

    :pswitch_11
    check-cast p0, Lzkd;

    invoke-virtual {p0}, Lzkd;->T()V

    return-void

    :pswitch_17
    check-cast p0, Lze7;

    invoke-virtual {p0}, Lze7;->K()V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_17
        :pswitch_11
    .end packed-switch
.end method

.method public final onPositionDiscontinuity(I)V
    .registers 2

    iget-byte p1, p0, Lve7;->a:B

    iget-object p0, p0, Lve7;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_1e

    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lse3;

    invoke-virtual {p0}, Ld17;->d()V

    return-void

    :pswitch_11
    check-cast p0, Lzkd;

    invoke-virtual {p0}, Lzkd;->T()V

    return-void

    :pswitch_17
    check-cast p0, Lze7;

    invoke-virtual {p0}, Lze7;->K()V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_17
        :pswitch_11
    .end packed-switch
.end method
