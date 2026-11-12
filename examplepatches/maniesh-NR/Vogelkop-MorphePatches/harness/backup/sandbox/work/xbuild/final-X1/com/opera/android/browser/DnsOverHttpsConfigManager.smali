.class public final Lcom/opera/android/browser/DnsOverHttpsConfigManager;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static getSecureDnsMode()I
    .registers 2

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->B:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwc7;

    invoke-virtual {v0}, Lwc7;->a()I

    move-result v0

    return v0
.end method

.method public static getServerTemplate()Ljava/lang/String;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->B:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwc7;

    invoke-virtual {v0}, Lwc7;->b()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static onProbeResult(Lcom/opera/api/Callback;Z)V
    .registers 2
    .param p0    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Z)V"
        }
    .end annotation

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method
