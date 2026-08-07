.class public final Ll/urs0;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/internal/consent_sdk/zzbr;Ll/dts0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->f(Lcom/google/android/gms/internal/consent_sdk/zzbr;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->a(Lcom/google/android/gms/internal/consent_sdk/zzbr;)Ll/z1t0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p2}, Ll/z1t0;->d(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->e(Lcom/google/android/gms/internal/consent_sdk/zzbr;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->b(Lcom/google/android/gms/internal/consent_sdk/zzbr;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->a(Lcom/google/android/gms/internal/consent_sdk/zzbr;)Ll/z1t0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p2, p3, p4}, Ll/z1t0;->e(ILjava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    .line 1
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p2, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 10
    .line 11
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->f(Lcom/google/android/gms/internal/consent_sdk/zzbr;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->a(Lcom/google/android/gms/internal/consent_sdk/zzbr;)Ll/z1t0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p1}, Ll/z1t0;->d(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 0

    .line 30
    iget-object p1, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->f(Lcom/google/android/gms/internal/consent_sdk/zzbr;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Ll/urs0;->zza:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    invoke-static {p0}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->a(Lcom/google/android/gms/internal/consent_sdk/zzbr;)Ll/z1t0;

    move-result-object p0

    .line 31
    invoke-virtual {p0, p2}, Ll/z1t0;->d(Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
