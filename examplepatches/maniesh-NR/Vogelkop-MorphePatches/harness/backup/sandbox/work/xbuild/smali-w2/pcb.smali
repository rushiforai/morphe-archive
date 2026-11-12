.class public final synthetic Lpcb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljt2;


# direct methods
.method public synthetic constructor <init>(Ljt2;B)V
    .registers 3

    iput-byte p2, p0, Lpcb;->a:B

    iput-object p1, p0, Lpcb;->b:Ljt2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 3

    iget-byte v0, p0, Lpcb;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lpcb;->b:Ljt2;

    packed-switch v0, :pswitch_data_32

    check-cast p0, Lot2;

    iget-object p0, p0, Lot2;->b:Lgjm;

    new-instance v0, Ljp2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_15
    new-array v0, v1, [I

    check-cast p0, Lot2;

    invoke-virtual {p0, v0}, Lot2;->a([I)V

    return-void

    :pswitch_1d
    check-cast p0, Lot2;

    iget-object p0, p0, Lot2;->b:Lgjm;

    new-instance v0, Llp2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_2a
    new-array v0, v1, [I

    check-cast p0, Lot2;

    invoke-virtual {p0, v0}, Lot2;->b([I)V

    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_1d
        :pswitch_15
    .end packed-switch
.end method
