.class public final synthetic Loc3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpc3;


# direct methods
.method public synthetic constructor <init>(Lpc3;B)V
    .registers 3

    iput-byte p2, p0, Loc3;->a:B

    iput-object p1, p0, Loc3;->b:Lpc3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Loc3;->a:B

    iget-object p0, p0, Loc3;->b:Lpc3;

    packed-switch v0, :pswitch_data_1a

    sget-object v0, Lt8;->a:Landroid/content/Context;

    iget-object p0, p0, Lpc3;->c:Lup1;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void

    :pswitch_f
    sget-object v0, Lt8;->a:Landroid/content/Context;

    iget-object v1, p0, Lpc3;->c:Lup1;

    iget-object p0, p0, Lpc3;->b:Landroid/content/IntentFilter;

    invoke-static {v0, v1, p0}, Lt8;->Q(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
