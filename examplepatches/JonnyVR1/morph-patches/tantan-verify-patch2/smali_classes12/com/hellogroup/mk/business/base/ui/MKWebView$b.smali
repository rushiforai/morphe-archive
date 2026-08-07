.class Lcom/hellogroup/mk/business/base/ui/MKWebView$b;
.super Landroid/webkit/WebView$VisualStateCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/base/ui/MKWebView;->Z0(ZLcom/hellogroup/mk/business/base/ui/MKWebView$h;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/base/ui/MKWebView;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$b;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/webkit/WebView$VisualStateCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onComplete(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$b;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$b;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$b;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Z(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v0, "postVisualStateCallback -----"

    .line 27
    .line 28
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "MK---WebView"

    .line 39
    .line 40
    invoke-static {p1, p0}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
