.class public final Lcom/google/android/gms/internal/ads/n1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/ckt0;

.field public final b:Ll/bkt0;


# direct methods
.method public constructor <init>(Ll/ckt0;Ll/bkt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/google/android/gms/internal/ads/n1;->b:Ll/bkt0;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/n1;->a:Ll/ckt0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/n1;->b:Ll/bkt0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/bkt0;->a:Ll/wit0;

    .line 8
    .line 9
    check-cast p0, Lcom/google/android/gms/internal/ads/zzckf;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzckf;->B0()Ll/gjt0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const-string p0, "Unable to pass GMSG, no AdWebViewClient for AdWebView!"

    .line 18
    .line 19
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-interface {p0, p1}, Ll/nkt0;->zzj(Landroid/net/Uri;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public getClickSignals(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "Click string is empty, not proceeding."

    .line 10
    .line 11
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/n1;->a:Ll/ckt0;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/ikt0;->p()Ll/v2s0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    const-string p0, "Signal utils is empty, ignoring."

    .line 24
    .line 25
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_1
    invoke-virtual {v2}, Ll/v2s0;->c()Ll/r2s0;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-interface {v0}, Ll/ckt0;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    const-string p0, "Context is null, ignoring."

    .line 40
    .line 41
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-object v1

    .line 45
    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/n1;->a:Ll/ckt0;

    .line 46
    .line 47
    invoke-interface {p0}, Ll/ckt0;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {p0}, Ll/ckt0;->zzi()Landroid/app/Activity;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast p0, Landroid/view/View;

    .line 56
    .line 57
    invoke-interface {v2, v0, p1, p0, v1}, Ll/r2s0;->g(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;Landroid/app/Activity;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public getViewSignals()Ljava/lang/String;
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/n1;->a:Ll/ckt0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/ikt0;->p()Ll/v2s0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, ""

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string p0, "Signal utils is empty, ignoring."

    .line 12
    .line 13
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object v2

    .line 17
    :cond_0
    invoke-virtual {v1}, Ll/v2s0;->c()Ll/r2s0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v0}, Ll/ckt0;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const-string p0, "Context is null, ignoring."

    .line 28
    .line 29
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-object v2

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/n1;->a:Ll/ckt0;

    .line 34
    .line 35
    invoke-interface {p0}, Ll/ckt0;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {p0}, Ll/ckt0;->zzi()Landroid/app/Activity;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast p0, Landroid/view/View;

    .line 44
    .line 45
    invoke-interface {v1, v0, p0, v2}, Ll/r2s0;->h(Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public notify(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "URL is empty, ignoring message"

    .line 8
    .line 9
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 14
    .line 15
    new-instance v1, Ll/akt0;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/akt0;-><init>(Lcom/google/android/gms/internal/ads/n1;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method
