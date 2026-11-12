.class public Lcom/opera/android/vpn/VpnProReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7

    invoke-static {p1}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_6b

    if-eqz p2, :cond_6b

    const-string p0, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6b

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p1

    iget-object p2, p1, Lydn;->k:Lrdn;

    iget-object v0, p1, Lydn;->l:Landroid/content/Context;

    invoke-static {p2}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object p2, p1, Lydn;->c:Lgfn;

    invoke-interface {p2}, Lgfn;->isEnabled()Z

    move-result p2

    if-eqz p2, :cond_56

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p2

    iget-object p2, p2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "vpn.vpnpro_auto_connect"

    const/4 v2, 0x0

    invoke-interface {p2, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    const/4 v1, 0x1

    if-ne p2, v1, :cond_56

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p2

    invoke-virtual {p2}, Lru9;->b()Lnv6;

    move-result-object p2

    iget-object v0, p2, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v3, "vpn.auto_enable_on_start"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p2}, Lnv6;->w()V

    invoke-virtual {p1, v1}, Lydn;->C(Z)V

    :cond_56
    iget-object p1, p1, Lydn;->f:Lqq8;

    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1}, Lqq8;->n(J)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->S()Lien;

    move-result-object p1

    invoke-virtual {p1}, Lyi2;->p()V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->T()Lyen;

    move-result-object p0

    invoke-virtual {p0}, Lyi2;->p()V

    :cond_6b
    return-void
.end method
