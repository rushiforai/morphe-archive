.class public Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;
.super Lcom/leanplum/messagetemplates/controllers/BaseController;
.source "SourceFile"


# instance fields
.field private webOptions:Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;)V
    .registers 3
    .param p2    # Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/controllers/BaseController;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->webOptions:Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->init()V

    return-void
.end method

.method public static synthetic access$000(Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;Ljava/lang/String;)Z
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->handleCloseEvent(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic access$100(Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;Landroid/content/Context;Ljava/lang/String;)Z
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->handleGooglePlayUri(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private createWebView(Landroid/content/Context;)Landroid/webkit/WebView;
    .registers 4

    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p1, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController$1;

    invoke-direct {p1, p0}, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController$1;-><init>(Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;)V

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->webOptions:Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-object v0
.end method

.method private handleCloseEvent(Ljava/lang/String;)Z
    .registers 8

    iget-object v0, p0, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->webOptions:Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;

    invoke-virtual {v0}, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->getCloseUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_47

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->runDismissAction()V

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->cancel()V

    const-string p0, "\\?"

    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length p1, p0

    const/4 v0, 0x1

    if-le p1, v0, :cond_46

    aget-object p0, p0, v0

    const-string p1, "&"

    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length p1, p0

    move v2, v1

    :goto_27
    if-ge v2, p1, :cond_46

    aget-object v3, p0, v2

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    if-le v4, v0, :cond_43

    aget-object v4, v3, v1

    const-string v5, "result"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_43

    aget-object v3, v3, v0

    invoke-static {v3}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;)V

    :cond_43
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    :cond_46
    return v0

    :cond_47
    return v1
.end method

.method private handleGooglePlayUri(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 5

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string p2, "market"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_20

    :try_start_11
    new-instance p2, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {p2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1e
    .catch Landroid/content/ActivityNotFoundException; {:try_start_11 .. :try_end_1e} :catch_20

    const/4 p0, 0x1

    return p0

    :catch_20
    :cond_20
    return v0
.end method


# virtual methods
.method public addMessageChildViews(Landroid/widget/RelativeLayout;)V
    .registers 3

    iget-object v0, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->activity:Landroid/app/Activity;

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->createWebView(Landroid/content/Context;)Landroid/webkit/WebView;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method

.method public applyWindowDecoration()V
    .registers 3

    invoke-static {}, Lcom/leanplum/messagetemplates/MessageTemplates;->getCustomizer()Lcom/leanplum/messagetemplates/DialogCustomizer;

    move-result-object v0

    if-eqz v0, :cond_b

    iget-object v1, p0, Lcom/leanplum/messagetemplates/controllers/BaseController;->contentView:Landroid/widget/RelativeLayout;

    invoke-interface {v0, p0, v1}, Lcom/leanplum/messagetemplates/DialogCustomizer;->customizeWebInterstitial(Landroid/app/Dialog;Landroid/view/View;)V

    :cond_b
    return-void
.end method

.method public bridge synthetic cancel()V
    .registers 1

    invoke-super {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->cancel()V

    return-void
.end method

.method public createLayoutParams()Landroid/widget/RelativeLayout$LayoutParams;
    .registers 2

    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p0, v0, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method public bridge synthetic getContentView()Landroid/view/View;
    .registers 1

    invoke-super {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->getContentView()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public getWebOptions()Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->webOptions:Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;

    return-object p0
.end method

.method public hasDismissButton()Z
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->webOptions:Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->hasDismissButton()Z

    move-result p0

    return p0
.end method

.method public isFullscreen()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public bridge synthetic onBackPressed()V
    .registers 1

    invoke-super {p0}, Lcom/leanplum/messagetemplates/controllers/BaseController;->onBackPressed()V

    return-void
.end method

.method public runDismissAction()V
    .registers 1

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->webOptions:Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/options/WebInterstitialOptions;->dismiss()V

    return-void
.end method
