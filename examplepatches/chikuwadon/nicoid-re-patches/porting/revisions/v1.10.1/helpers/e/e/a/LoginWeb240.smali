.class public final Le/e/a/LoginWeb240;
.super Ljava/lang/Object;
.source "LoginWeb240.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static harden(Landroid/webkit/WebView;)V
    .registers 2

    .line 14
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p0

    .line 15
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    .line 16
    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 17
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 18
    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setSafeBrowsingEnabled(Z)V

    .line 19
    return-void
.end method

.method public static logout()V
    .registers 3

    .line 9
    :try_start_0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    new-instance v1, Le/e/a/LoginWeb240$1;

    invoke-direct {v1}, Le/e/a/LoginWeb240$1;-><init>()V

    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_c} :catch_d

    .line 11
    goto :goto_28

    :catch_d
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Web cookie cleanup unavailable: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    .line 12
    :goto_28
    return-void
.end method
