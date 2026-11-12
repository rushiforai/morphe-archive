.class public abstract Ltlp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/Set;

.field public static final b:Lzyk;

.field public static final c:La5d;

.field public static final d:Lslp;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const-string v4, "com.google.android.webview.debug"

    const-string v5, "com.android.webview"

    const-string v0, "com.google.android.webview"

    const-string v1, "com.google.android.webview.beta"

    const-string v2, "com.google.android.webview.dev"

    const-string v3, "com.google.android.webview.canary"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Ltlp;->a:Ljava/util/Set;

    sget-object v0, Lxvo;->u:Lxvo;

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Ltlp;->b:Lzyk;

    new-instance v0, La5d;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, La5d;-><init>(B)V

    sput-object v0, Ltlp;->c:La5d;

    new-instance v0, Lslp;

    invoke-direct {v0}, Landroid/webkit/WebViewClient;-><init>()V

    sput-object v0, Ltlp;->d:Lslp;

    return-void
.end method

.method public static final a(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V
    .registers 2

    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {p1}, Landroid/webkit/RenderProcessGoneDetail;->didCrash()Z

    invoke-virtual {p1}, Landroid/webkit/RenderProcessGoneDetail;->rendererPriorityAtExit()I

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    sget-object p1, Ltlp;->c:La5d;

    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    sget-object p1, Ltlp;->d:Lslp;

    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    invoke-static {p0}, Lxgh;->g(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/webkit/WebView;->destroy()V

    return-void
.end method
