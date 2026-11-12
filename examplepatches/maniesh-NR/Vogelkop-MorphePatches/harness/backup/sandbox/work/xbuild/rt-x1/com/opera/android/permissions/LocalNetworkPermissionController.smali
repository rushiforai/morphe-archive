.class public final Lcom/opera/android/permissions/LocalNetworkPermissionController;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/opera/api/Callback;Lorg/chromium/ui/base/WindowAndroid;)V
    .registers 5

    const-string v0, "android.permission.ACCESS_LOCAL_NETWORK"

    invoke-virtual {p1, v0}, Lorg/chromium/ui/base/WindowAndroid;->hasPermission(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {p1, v0}, Lorg/chromium/ui/base/WindowAndroid;->hasPermission(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_36

    invoke-static {}, Lipe;->G()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {p1, v0}, Lg91;->canRequestPermission(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Llw0;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p1, v0, v1}, Lorg/chromium/ui/base/WindowAndroid;->e([Ljava/lang/String;Lp9g;)V

    return-void

    :cond_26
    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lf03;->n(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    new-instance v1, Lwuc;

    invoke-direct {v1, p0, p1}, Lwuc;-><init>(Lcom/opera/api/Callback;Lorg/chromium/ui/base/WindowAndroid;)V

    const/4 p0, 0x0

    invoke-virtual {p1, v0, v1, p0}, Lorg/chromium/ui/base/WindowAndroid;->t(Landroid/content/Intent;Lr1o;Ljava/lang/Integer;)Z

    return-void

    :cond_36
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public static hasPermission(Lorg/chromium/ui/base/WindowAndroid;)Z
    .registers 2
    .param p0    # Lorg/chromium/ui/base/WindowAndroid;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "android.permission.ACCESS_LOCAL_NETWORK"

    invoke-virtual {p0, v0}, Lorg/chromium/ui/base/WindowAndroid;->hasPermission(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static nativeRequestPermission(Lorg/chromium/content_public/browser/WebContents;)V
    .registers 3
    .param p0    # Lorg/chromium/content_public/browser/WebContents;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    invoke-static {p0}, LJ/N;->Mo8CJari(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-nez p0, :cond_f

    const/4 p0, 0x0

    invoke-static {p0}, LJ/N;->MLWmh7HR(Z)V

    return-void

    :cond_f
    iget-object v0, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    const-string v1, "android.permission.ACCESS_LOCAL_NETWORK"

    invoke-virtual {v0, v1}, Lorg/chromium/ui/base/WindowAndroid;->hasPermission(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2b

    invoke-static {}, Lipe;->G()Z

    move-result v1

    if-eqz v1, :cond_2b

    new-instance v0, Lwen;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lwen;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, v0}, Lcom/opera/android/browser/dialog/DialogDelegate;->a(Lnz0;)V

    return-void

    :cond_2b
    invoke-static {v0}, LJ/N;->MLWmh7HR(Z)V

    return-void
.end method
