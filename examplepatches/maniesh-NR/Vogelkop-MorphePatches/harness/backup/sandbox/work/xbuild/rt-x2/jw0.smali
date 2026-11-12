.class public final Ljw0;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Ljw0;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljw0;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    .line 16
    iput-byte p2, p0, Ljw0;->a:B

    iput-object p1, p0, Ljw0;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 3

    iget-byte v0, p0, Ljw0;->a:B

    packed-switch v0, :pswitch_data_2c

    invoke-super {p0, p1}, Llim;->onDestroy(Lndc;)V

    return-void

    :pswitch_9
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    new-instance p1, Lqt3;

    const/16 v0, 0x12

    iget-object p0, p0, Ljw0;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p1, p0, v0}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1d
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    sget-object p1, Lcom/opera/android/webcore/AiAssistantUpdateBridge;->a:Ljw0;

    if-ne p1, p0, :cond_2b

    const/4 p0, 0x0

    sput-object p0, Lcom/opera/android/webcore/AiAssistantUpdateBridge;->a:Ljw0;

    :cond_2b
    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_9
    .end packed-switch
.end method

.method public final onStart(Lndc;)V
    .registers 3

    iget-byte v0, p0, Ljw0;->a:B

    packed-switch v0, :pswitch_data_1e

    return-void

    :pswitch_6
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Ljw0;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_1d

    const/4 p1, 0x1

    check-cast p0, Ld7l;

    invoke-virtual {p0, p1}, Ld7l;->M(Z)Z

    :cond_1d
    return-void

    :pswitch_data_1e
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final onStop(Lndc;)V
    .registers 3

    iget-byte p1, p0, Ljw0;->a:B

    packed-switch p1, :pswitch_data_1e

    return-void

    :pswitch_6
    iget-object p0, p0, Ljw0;->b:Lcom/opera/android/BrowserActivity;

    iget-object p1, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    const/4 v0, 0x0

    if-nez p1, :cond_e

    move-object p1, v0

    :cond_e
    invoke-virtual {p1}, Lgbf;->i()Z

    move-result p1

    if-eqz p1, :cond_1c

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz p0, :cond_19

    move-object v0, p0

    :cond_19
    invoke-virtual {v0}, Lgbf;->f()V

    :cond_1c
    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x3
        :pswitch_6
    .end packed-switch
.end method
