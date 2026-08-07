.class public Ll/rjn;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/sjn;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/nus;

.field public final b:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;

.field public c:Ll/hk4;

.field public d:Ll/w0c;

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;Ll/nus;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/cyr;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/rjn;->e:Z

    .line 6
    .line 7
    iput-object p2, p0, Ll/rjn;->a:Ll/nus;

    .line 8
    .line 9
    iput-object p1, p0, Ll/rjn;->b:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;

    .line 10
    .line 11
    new-instance p2, Ll/hk4;

    .line 12
    .line 13
    invoke-direct {p2, p1}, Ll/hk4;-><init>(Ll/ner;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/rjn;->c:Ll/hk4;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic q2(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/16 v0, 0x64

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private u2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/sjn;

    .line 4
    .line 5
    iget-object v0, v0, Ll/sjn;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/sjn;

    .line 14
    .line 15
    iget-object v0, v0, Ll/sjn;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x2

    .line 22
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p0, Ll/sjn;

    .line 28
    .line 29
    iget-object p0, p0, Ll/sjn;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public r2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rjn;->d:Ll/w0c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/w0c;->L()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/rjn;->d:Ll/w0c;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/w0c;->L()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ll/wc00;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/wc00;->x()Ll/ad00;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-array v0, v0, [Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p1, v0}, Ll/ad00;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public s2()V
    .locals 5

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->u4()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    new-instance v1, Ll/w0c;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/w0c;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/rjn;->d:Ll/w0c;

    .line 21
    .line 22
    iget-object v2, p0, Ll/rjn;->b:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast v3, Ll/sjn;

    .line 31
    .line 32
    iget-object v3, v3, Ll/sjn;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/rjn;->d:Ll/w0c;

    .line 38
    .line 39
    new-instance v2, Ll/qjn;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/qjn;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->J(Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$a;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/rjn;->d:Ll/w0c;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/w0c;->N()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_0

    .line 54
    .line 55
    iget-object v1, p0, Ll/rjn;->d:Ll/w0c;

    .line 56
    .line 57
    iget-object v2, p0, Ll/rjn;->b:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lcom/p1/mobile/putong/app/PutongAct;

    .line 64
    .line 65
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 66
    .line 67
    check-cast v3, Ll/sjn;

    .line 68
    .line 69
    iget-object v3, v3, Ll/sjn;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 70
    .line 71
    const-string v4, ""

    .line 72
    .line 73
    invoke-virtual {v1, v2, v4, v3, v0}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    invoke-direct {p0}, Ll/rjn;->u2()V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 80
    .line 81
    check-cast p0, Ll/sjn;

    .line 82
    .line 83
    iget-object p0, p0, Ll/sjn;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method public v2()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/rjn;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rjn;->s2()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/rjn;->e:Z

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string v0, "reloadPage"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/rjn;->r2(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
