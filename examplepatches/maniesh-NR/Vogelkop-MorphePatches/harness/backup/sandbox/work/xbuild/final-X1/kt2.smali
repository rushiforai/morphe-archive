.class public final synthetic Lkt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lot2;

.field public final synthetic c:[I


# direct methods
.method public synthetic constructor <init>(Lot2;[IB)V
    .registers 4

    iput-byte p3, p0, Lkt2;->a:B

    iput-object p1, p0, Lkt2;->b:Lot2;

    iput-object p2, p0, Lkt2;->c:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Lkt2;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    iget-object v3, p0, Lkt2;->c:[I

    iget-object p0, p0, Lkt2;->b:Lot2;

    packed-switch v0, :pswitch_data_2c

    iget-object p0, p0, Lot2;->b:Lgjm;

    new-instance v0, La6g;

    new-instance v4, Loba;

    invoke-direct {v4, v1, v2, v3}, Loba;-><init>(II[I)V

    invoke-direct {v0, v4}, La6g;-><init>(Loba;)V

    invoke-virtual {p0, v0, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_1b
    iget-object p0, p0, Lot2;->b:Lgjm;

    new-instance v0, Lxk4;

    new-instance v4, Loba;

    invoke-direct {v4, v1, v2, v3}, Loba;-><init>(II[I)V

    invoke-direct {v0, v4}, Lxk4;-><init>(Loba;)V

    invoke-virtual {p0, v0, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
