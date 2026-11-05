.class public Lcom/sauzask/nicoid/ModernLoginActivity$Client;
.super Landroid/webkit/WebViewClient;
.source "ModernLoginActivity.java"


# instance fields
.field private final owner:Lcom/sauzask/nicoid/ModernLoginActivity;


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/ModernLoginActivity;)V
    .registers 2

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    iput-object p1, p0, Lcom/sauzask/nicoid/ModernLoginActivity$Client;->owner:Lcom/sauzask/nicoid/ModernLoginActivity;

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 7

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/ModernLoginActivity$Client;->owner:Lcom/sauzask/nicoid/ModernLoginActivity;

    invoke-static {v0, p2}, Lcom/sauzask/nicoid/ModernLoginActivity;->capture(Lcom/sauzask/nicoid/ModernLoginActivity;Ljava/lang/String;)V

    new-instance v1, Lcom/sauzask/nicoid/ModernLoginRetry;

    invoke-direct {v1, v0, p2}, Lcom/sauzask/nicoid/ModernLoginRetry;-><init>(Lcom/sauzask/nicoid/ModernLoginActivity;Ljava/lang/String;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {p1, v1, v2, v3}, Landroid/webkit/WebView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .registers 7

    const-string v0, "Login WebView renderer stopped"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/webkit/WebView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_12

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_12
    invoke-virtual {p1}, Landroid/webkit/WebView;->destroy()V

    iget-object v0, p0, Lcom/sauzask/nicoid/ModernLoginActivity$Client;->owner:Lcom/sauzask/nicoid/ModernLoginActivity;

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v2, "\u30ed\u30b0\u30a4\u30f3\u753b\u9762\u306e\u8868\u793a\u304c\u505c\u6b62\u3057\u307e\u3057\u305f\u3002\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v2, 0x18

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    const/4 v0, 0x1

    return v0
.end method
