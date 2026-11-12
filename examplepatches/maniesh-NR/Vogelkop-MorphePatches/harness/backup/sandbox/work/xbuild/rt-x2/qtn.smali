.class public abstract Lqtn;
.super Lorg/chromium/components/embedder_support/delegate/WebContentsDelegateAndroid;
.source "SourceFile"


# virtual methods
.method public final handleKeyboardEvent(Landroid/view/KeyEvent;)V
    .registers 3

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p0

    const/16 v0, 0x4f

    if-eq p0, v0, :cond_13

    const/16 v0, 0xde

    if-eq p0, v0, :cond_13

    packed-switch p0, :pswitch_data_22

    packed-switch p0, :pswitch_data_34

    return-void

    :cond_13
    :pswitch_13
    sget-object p0, Lt8;->a:Landroid/content/Context;

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/media/AudioManager;

    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->dispatchMediaKeyEvent(Landroid/view/KeyEvent;)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x55
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
    .end packed-switch

    :pswitch_data_34
    .packed-switch 0x7e
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
    .end packed-switch
.end method
