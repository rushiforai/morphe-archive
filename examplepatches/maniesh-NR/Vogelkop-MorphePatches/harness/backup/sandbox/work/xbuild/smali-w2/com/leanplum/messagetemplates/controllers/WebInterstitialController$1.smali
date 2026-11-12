.class Lcom/leanplum/messagetemplates/controllers/WebInterstitialController$1;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->createWebView(Landroid/content/Context;)Landroid/webkit/WebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;


# direct methods
.method public constructor <init>(Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController$1;->this$0:Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 5

    iget-object v0, p0, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController$1;->this$0:Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;

    # invokes: Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->handleCloseEvent(Ljava/lang/String;)Z
    invoke-static {v0, p2}, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->access$000(Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    return v1

    :cond_a
    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController$1;->this$0:Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    # invokes: Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->handleGooglePlayUri(Landroid/content/Context;Ljava/lang/String;)Z
    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;->access$100(Lcom/leanplum/messagetemplates/controllers/WebInterstitialController;Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_17

    return v1

    :cond_17
    const/4 p0, 0x0

    return p0
.end method
