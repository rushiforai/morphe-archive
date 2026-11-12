.class public final Laha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbag;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;B)V
    .registers 3

    iput-byte p2, p0, Laha;->a:B

    iput-object p1, p0, Laha;->b:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final p(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/opera/api/Callback;)Lb87;
    .registers 5

    iget-byte p0, p0, Laha;->a:B

    packed-switch p0, :pswitch_data_1e

    new-instance p0, Lzga;

    check-cast p3, Lrl;

    check-cast p2, Lvdf;

    check-cast p4, Lo8f;

    invoke-direct {p0, p3, p2, p4}, Lzga;-><init>(Lrl;Lvdf;Lo8f;)V

    return-object p0

    :pswitch_11
    new-instance p0, Lzga;

    check-cast p2, Lvdf;

    check-cast p3, Lrl;

    check-cast p4, Lo8f;

    invoke-direct {p0, p2, p3, p4}, Lzga;-><init>(Lvdf;Lrl;Lo8f;)V

    return-object p0

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method

.method public final s()V
    .registers 2

    iget-byte v0, p0, Laha;->a:B

    iget-object p0, p0, Laha;->b:Ljava/lang/Runnable;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Lvdf;

    invoke-virtual {p0}, Lvdf;->run()V

    return-void

    :pswitch_d
    check-cast p0, Lnh4;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lc0f;

    if-eqz v0, :cond_1e

    sget-object v0, Lt0i;->b:Lp0i;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_1e
    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final t()V
    .registers 2

    iget-byte v0, p0, Laha;->a:B

    iget-object p0, p0, Laha;->b:Ljava/lang/Runnable;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Lvdf;

    invoke-virtual {p0}, Lvdf;->run()V

    return-void

    :pswitch_d
    check-cast p0, Lnh4;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lc0f;

    if-eqz v0, :cond_1e

    sget-object v0, Lt0i;->b:Lp0i;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_1e
    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
