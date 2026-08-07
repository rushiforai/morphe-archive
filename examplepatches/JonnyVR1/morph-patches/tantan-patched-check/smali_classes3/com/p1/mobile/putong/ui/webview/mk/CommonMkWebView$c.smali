.class public Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$c;
.super Ll/wc00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->r(Lcom/p1/mobile/putong/ui/webview/mk/a;Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lcom/p1/mobile/putong/ui/webview/mk/a;

.field public final synthetic i:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

.field public final synthetic j:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/p1/mobile/putong/ui/webview/mk/a;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$c;->j:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 2
    .line 3
    iput-object p5, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$c;->h:Lcom/p1/mobile/putong/ui/webview/mk/a;

    .line 4
    .line 5
    iput-object p6, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$c;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 6
    .line 7
    invoke-direct {p0, p2, p3, p4}, Ll/wc00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;->k:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "action"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public v(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 0
    .param p1    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string p1, "closeDialogWebview"

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$c;->h:Lcom/p1/mobile/putong/ui/webview/mk/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p1, "doNextAction"

    .line 16
    .line 17
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$c;->i:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;

    .line 24
    .line 25
    new-instance p1, Ll/ll5;

    .line 26
    .line 27
    invoke-direct {p1, p0, p4}, Ll/ll5;-><init>(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder;Lorg/json/JSONObject;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method
