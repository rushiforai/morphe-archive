.class public final Lmbi;
.super Landroid/content/ContextWrapper;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lmbi;->a:B

    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Lnxo;Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lmbi;->a:B

    iput-object p1, p0, Lmbi;->b:Ljava/lang/Object;

    invoke-direct {p0, p2}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final getApplicationInfo()Landroid/content/pm/ApplicationInfo;
    .registers 3

    iget-byte v0, p0, Lmbi;->a:B

    packed-switch v0, :pswitch_data_1c

    invoke-super {p0}, Landroid/content/ContextWrapper;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Landroid/content/pm/ApplicationInfo;

    invoke-super {p0}, Landroid/content/ContextWrapper;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    invoke-direct {v0, p0}, Landroid/content/pm/ApplicationInfo;-><init>(Landroid/content/pm/ApplicationInfo;)V

    iget p0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v1, 0x400000

    or-int/2addr p0, v1

    iput p0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    return-object v0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lmbi;->a:B

    packed-switch v0, :pswitch_data_2c

    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_a
    const-string v0, "layout_inflater"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object p1, p0, Lmbi;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/LayoutInflater;

    if-nez p1, :cond_2b

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lmbi;->b:Ljava/lang/Object;

    goto :goto_2b

    :cond_27
    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    :cond_2b
    :goto_2b
    return-object p1

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    .registers 4

    iget-byte v0, p0, Lmbi;->a:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0, p1, p2}, Landroid/content/ContextWrapper;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    .line 29
    :pswitch_a
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
    .registers 5

    iget-byte v0, p0, Lmbi;->a:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0, p1, p2, p3}, Landroid/content/ContextWrapper;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    .line 30
    :pswitch_a
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;
    .registers 6

    iget-byte v0, p0, Lmbi;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1, p2, p3, p4}, Landroid/content/ContextWrapper;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :pswitch_a
    const-string v0, "com.google.android.gms.auth.api.phone.SMS_CODE_RETRIEVED"

    invoke-virtual {p2, v0}, Landroid/content/IntentFilter;->hasAction(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    iput-object p1, p0, Lmbi;->b:Ljava/lang/Object;

    :cond_14
    invoke-super {p0, p1, p2, p3, p4}, Landroid/content/ContextWrapper;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;
    .registers 7

    iget-byte v0, p0, Lmbi;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super/range {p0 .. p5}, Landroid/content/ContextWrapper;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    .line 26
    :pswitch_a
    const-string v0, "com.google.android.gms.auth.api.phone.SMS_CODE_RETRIEVED"

    invoke-virtual {p2, v0}, Landroid/content/IntentFilter;->hasAction(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 27
    iput-object p1, p0, Lmbi;->b:Ljava/lang/Object;

    .line 28
    :cond_14
    invoke-super/range {p0 .. p5}, Landroid/content/ContextWrapper;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final startActivity(Landroid/content/Intent;)V
    .registers 4

    iget-byte v0, p0, Lmbi;->a:B

    packed-switch v0, :pswitch_data_34

    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_9
    iget-object v0, p0, Lmbi;->b:Ljava/lang/Object;

    check-cast v0, Lnxo;

    iget-object v1, v0, Lnxo;->q:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_2f

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2f

    iget-object p0, v0, Lnxo;->q:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/ad/interstitial/AdActivity;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0, p1}, Lcom/opera/ad/interstitial/AdActivity;->a(Lcom/opera/ad/interstitial/AdActivity;Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p0, p1}, Lcom/opera/ad/interstitial/AdActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_32

    :cond_2f
    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->startActivity(Landroid/content/Intent;)V

    :cond_32
    :goto_32
    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    .registers 3

    iget-byte v0, p0, Lmbi;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void

    :pswitch_9
    iget-object v0, p0, Lmbi;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/BroadcastReceiver;

    if-ne p1, v0, :cond_12

    const/4 v0, 0x0

    iput-object v0, p0, Lmbi;->b:Ljava/lang/Object;

    :cond_12
    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
