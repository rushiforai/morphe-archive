.class public Lcom/p1/mobile/putong/ui/LauncherView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Ll/kcg0;

.field public final b:Landroid/graphics/PointF;

.field public c:D


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/LauncherView;->b:Landroid/graphics/PointF;

    .line 10
    .line 11
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/ui/LauncherView;->c:D

    .line 14
    .line 15
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/data/ADInfo;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 18
    .line 19
    const-string v2, "browser"

    .line 20
    .line 21
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 30
    .line 31
    const-string v2, "webview"

    .line 32
    .line 33
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 42
    .line 43
    const-string v2, "deeplink"

    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 54
    .line 55
    const-string v2, "tantanWebview"

    .line 56
    .line 57
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p0}, Landroid/webkit/URLUtil;->isValidUrl(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_2

    .line 72
    .line 73
    return v0

    .line 74
    :cond_2
    const/4 p0, 0x1

    .line 75
    return p0
.end method

.method public static b(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/ui/webview/WebViewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "hideNavigationBar"

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    const-string p0, "url"

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const-string p0, "AD_WebView"

    .line 20
    .line 21
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    return-object v0
.end method


# virtual methods
.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/LauncherView;->a:Ll/kcg0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/LauncherView;->a:Ll/kcg0;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    throw p0
.end method
