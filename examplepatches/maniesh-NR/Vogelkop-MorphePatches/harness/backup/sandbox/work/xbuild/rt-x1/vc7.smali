.class public final Lvc7;
.super Lqa3;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lvc7;->a:B

    iput-object p1, p0, Lvc7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final C()V
    .registers 2

    iget-byte v0, p0, Lvc7;->a:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lvc7;->b:Ljava/lang/Object;

    check-cast p0, Lndn;

    invoke-virtual {p0}, Lndn;->b()V

    return-void

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final s()V
    .registers 2

    iget-byte v0, p0, Lvc7;->a:B

    iget-object p0, p0, Lvc7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_14

    return-void

    :pswitch_8
    check-cast p0, Lvbf;

    invoke-virtual {p0}, Lvbf;->v()V

    return-void

    :pswitch_e
    check-cast p0, Lwc7;

    invoke-virtual {p0}, Lwc7;->c()V

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_e
        :pswitch_8
    .end packed-switch
.end method
