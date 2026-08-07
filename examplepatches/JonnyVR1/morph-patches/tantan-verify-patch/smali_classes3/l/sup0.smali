.class public Ll/sup0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/lup0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public A:Ll/zpq;

.field public B:Ll/rx3;

.field public C:Ll/k7f0;

.field public D:Ll/x20;

.field public E:Ljava/lang/String;

.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public e:Landroid/widget/ProgressBar;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/widget/ImageView;

.field public i:Ll/lup0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field public final j:Lcom/p1/mobile/putong/app/PutongAct;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/sup0;->D:Ll/x20;

    .line 6
    .line 7
    iput-object p1, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    return-void
.end method

.method private C()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/sup0;->t:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Ll/sup0;->t:Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, "transparent"

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    iget-object v0, p0, Ll/sup0;->t:Ljava/lang/String;

    .line 38
    .line 39
    const-string v3, "#"

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget-object v4, p0, Ll/sup0;->t:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    :goto_0
    :try_start_0
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :goto_1
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/4 v1, 0x2

    .line 78
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 82
    .line 83
    const/4 v0, 0x1

    .line 84
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :catch_0
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method private synthetic F(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/sup0;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-string v0, "http"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/erq;->a(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/sup0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0, p1}, Ll/erq;->c(Landroid/content/Context;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/sup0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0, p1}, Ll/erq;->c(Landroid/content/Context;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    const-string v0, "tantan"

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-boolean v0, p0, Ll/sup0;->z:Z

    .line 46
    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_2
    const-string v0, "https://wx.tenpay.com"

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    new-instance v0, Ljava/util/HashMap;

    .line 66
    .line 67
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 68
    .line 69
    .line 70
    iget-boolean v1, p0, Ll/sup0;->z:Z

    .line 71
    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    const-string v1, "Referer"

    .line 75
    .line 76
    const-string v2, "https://npay.meituan.com"

    .line 77
    .line 78
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    :cond_3
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 82
    .line 83
    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 84
    .line 85
    .line 86
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_4
    invoke-virtual {p0, p1}, Ll/sup0;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_5

    .line 98
    .line 99
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 105
    .line 106
    return-object p0

    .line 107
    :cond_5
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 108
    .line 109
    return-object p0
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onHomePressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/sup0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/sup0;->H(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method public static synthetic b(Ll/sup0;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sup0;->F(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/sup0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sup0;->G(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/sup0;)Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    return-object p0
.end method

.method private z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sup0;->u:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/sup0;->u:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "transparent"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object v0, p0, Ll/sup0;->u:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "#"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v2, p0, Ll/sup0;->u:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    :goto_0
    :try_start_0
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    iget-object p0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 67
    .line 68
    .line 69
    :catch_0
    return-void
.end method


# virtual methods
.method public A(Ljava/util/Map;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "JavascriptInterface"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/sup0;->w:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/sup0;->q()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_9

    .line 20
    .line 21
    iget-boolean v0, p0, Ll/sup0;->p:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/sup0;->A:Ll/zpq;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    new-instance v0, Ll/zpq;

    .line 30
    .line 31
    iget-object v2, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    const-string v3, ""

    .line 34
    .line 35
    iget-object v4, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 36
    .line 37
    invoke-direct {v0, v2, v3, v4}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/sup0;->A:Ll/zpq;

    .line 41
    .line 42
    :cond_1
    invoke-virtual {p0}, Ll/sup0;->p()Ll/zpq;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    iget-boolean v2, p0, Ll/sup0;->r:Z

    .line 53
    .line 54
    if-nez v2, :cond_2

    .line 55
    .line 56
    iget-object v2, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 57
    .line 58
    const-string v3, "tantan"

    .line 59
    .line 60
    invoke-virtual {v2, v0, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-boolean v0, p0, Ll/sup0;->r:Z

    .line 64
    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/4 v2, 0x0

    .line 74
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 78
    .line 79
    new-instance v2, Ll/qup0;

    .line 80
    .line 81
    invoke-direct {v2, p0}, Ll/qup0;-><init>(Ll/sup0;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-boolean v2, p0, Ll/sup0;->o:Z

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 99
    .line 100
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const/16 v2, 0x64

    .line 105
    .line 106
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    .line 107
    .line 108
    .line 109
    iget-boolean v0, p0, Ll/sup0;->y:Z

    .line 110
    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 114
    .line 115
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    const/4 v2, 0x1

    .line 120
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 121
    .line 122
    .line 123
    :cond_4
    iget-boolean v0, p0, Ll/sup0;->m:Z

    .line 124
    .line 125
    if-eqz v0, :cond_5

    .line 126
    .line 127
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 128
    .line 129
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    if-eqz v0, :cond_5

    .line 134
    .line 135
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 136
    .line 137
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 142
    .line 143
    .line 144
    :cond_5
    iget-boolean v0, p0, Ll/sup0;->s:Z

    .line 145
    .line 146
    iget-object v2, p0, Ll/sup0;->e:Landroid/widget/ProgressBar;

    .line 147
    .line 148
    if-eqz v0, :cond_6

    .line 149
    .line 150
    const/16 v0, 0x8

    .line 151
    .line 152
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_6
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 157
    .line 158
    .line 159
    :goto_0
    invoke-direct {p0}, Ll/sup0;->C()V

    .line 160
    .line 161
    .line 162
    invoke-direct {p0}, Ll/sup0;->z()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Ll/sup0;->x()V

    .line 166
    .line 167
    .line 168
    new-instance v0, Ll/rx3;

    .line 169
    .line 170
    iget-object v1, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 171
    .line 172
    invoke-virtual {p0}, Ll/sup0;->u()Ll/qcj;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    iget-boolean v3, p0, Ll/sup0;->n:Z

    .line 177
    .line 178
    invoke-direct {v0, v1, v2, v3}, Ll/rx3;-><init>(Landroid/content/Context;Ll/qcj;Z)V

    .line 179
    .line 180
    .line 181
    iput-object v0, p0, Ll/sup0;->B:Ll/rx3;

    .line 182
    .line 183
    invoke-virtual {p0}, Ll/sup0;->v()Ll/rx3$a;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {v0, v1}, Ll/rx3;->setListener(Ll/rx3$a;)V

    .line 188
    .line 189
    .line 190
    new-instance v0, Ll/k7f0;

    .line 191
    .line 192
    iget-object v1, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 193
    .line 194
    invoke-direct {v0, v1}, Ll/k7f0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 195
    .line 196
    .line 197
    iput-object v0, p0, Ll/sup0;->C:Ll/k7f0;

    .line 198
    .line 199
    iget-object v1, p0, Ll/sup0;->E:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Ll/k7f0;->setSelectFileType(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-boolean v0, p0, Ll/sup0;->r:Z

    .line 205
    .line 206
    if-eqz v0, :cond_7

    .line 207
    .line 208
    iget-object v0, p0, Ll/sup0;->C:Ll/k7f0;

    .line 209
    .line 210
    invoke-virtual {v0}, Ll/k7f0;->setADWebViewSet()V

    .line 211
    .line 212
    .line 213
    :cond_7
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 214
    .line 215
    iget-object v1, p0, Ll/sup0;->B:Ll/rx3;

    .line 216
    .line 217
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebViewClientX(Lcom/p1/mobile/putong/app/web/WebViewClientX;)V

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 221
    .line 222
    iget-object v1, p0, Ll/sup0;->C:Ll/k7f0;

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebChromeClientX(Ll/wqp0;)V

    .line 225
    .line 226
    .line 227
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    iget-object v1, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 232
    .line 233
    if-eqz v0, :cond_8

    .line 234
    .line 235
    invoke-virtual {p0}, Ll/sup0;->q()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-virtual {v1, p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_8
    invoke-virtual {p0}, Ll/sup0;->q()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    invoke-virtual {v1, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    :cond_9
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sup0;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic H(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sup0;->n(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final J(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sup0;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    :try_start_0
    iget-object p0, p0, Ll/sup0;->l:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "1"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    return p0

    .line 27
    :catch_0
    :cond_0
    return v1
.end method

.method public K(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    const-string p1, "WebViewViewModel url try to load extra file : "

    .line 2
    .line 3
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "title"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/sup0;->k:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "url"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/sup0;->l:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "hideNavigationBar"

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v3, 0x1

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Ll/sup0;->J(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move v0, v2

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    :goto_0
    move v0, v3

    .line 57
    :goto_1
    iput-boolean v0, p0, Ll/sup0;->m:Z

    .line 58
    .line 59
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "hardwareAccelerated"

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput-boolean v0, p0, Ll/sup0;->n:Z

    .line 72
    .line 73
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v1, "playbackRequiresUserGesture"

    .line 80
    .line 81
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput-boolean v0, p0, Ll/sup0;->o:Z

    .line 86
    .line 87
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-string v1, "advanceInitJsBridge"

    .line 94
    .line 95
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput-boolean v0, p0, Ll/sup0;->p:Z

    .line 100
    .line 101
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v1, "transparent_status_bar"

    .line 108
    .line 109
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iput-boolean v0, p0, Ll/sup0;->q:Z

    .line 114
    .line 115
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v1, "AD_WebView"

    .line 122
    .line 123
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_3

    .line 128
    .line 129
    invoke-virtual {p0, v1}, Ll/sup0;->J(Ljava/lang/String;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_2

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_2
    move v0, v2

    .line 137
    goto :goto_3

    .line 138
    :cond_3
    :goto_2
    move v0, v3

    .line 139
    :goto_3
    iput-boolean v0, p0, Ll/sup0;->r:Z

    .line 140
    .line 141
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 142
    .line 143
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const-string v1, "skipLoading"

    .line 148
    .line 149
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_5

    .line 154
    .line 155
    invoke-virtual {p0, v1}, Ll/sup0;->J(Ljava/lang/String;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_4

    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_4
    move v0, v2

    .line 163
    goto :goto_5

    .line 164
    :cond_5
    :goto_4
    move v0, v3

    .line 165
    :goto_5
    iput-boolean v0, p0, Ll/sup0;->s:Z

    .line 166
    .line 167
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 168
    .line 169
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const-string v1, "webviewColor"

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iput-object v0, p0, Ll/sup0;->t:Ljava/lang/String;

    .line 180
    .line 181
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 182
    .line 183
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    const-string v1, "notchColor"

    .line 188
    .line 189
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iput-object v0, p0, Ll/sup0;->u:Ljava/lang/String;

    .line 194
    .line 195
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 196
    .line 197
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    const-string v1, "hideNotch"

    .line 202
    .line 203
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-nez v0, :cond_7

    .line 208
    .line 209
    invoke-virtual {p0, v1}, Ll/sup0;->J(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-eqz v0, :cond_6

    .line 214
    .line 215
    goto :goto_6

    .line 216
    :cond_6
    move v3, v2

    .line 217
    :cond_7
    :goto_6
    iput-boolean v3, p0, Ll/sup0;->v:Z

    .line 218
    .line 219
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 220
    .line 221
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    const-string v1, "transparent_webview"

    .line 226
    .line 227
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    iput-boolean v0, p0, Ll/sup0;->w:Z

    .line 232
    .line 233
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 234
    .line 235
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    const-string v1, "disable_keybord_back"

    .line 240
    .line 241
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    iput-boolean v0, p0, Ll/sup0;->x:Z

    .line 246
    .line 247
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 248
    .line 249
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    const-string v1, "autofill"

    .line 254
    .line 255
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    iput-boolean v0, p0, Ll/sup0;->y:Z

    .line 260
    .line 261
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 262
    .line 263
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    const-string v1, "is_mt_pay"

    .line 268
    .line 269
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    iput-boolean v0, p0, Ll/sup0;->z:Z

    .line 274
    .line 275
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 276
    .line 277
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    const-string v1, "selectFileType"

    .line 282
    .line 283
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    iput-object v0, p0, Ll/sup0;->E:Ljava/lang/String;

    .line 288
    .line 289
    :try_start_0
    iget-object v0, p0, Ll/sup0;->l:Ljava/lang/String;

    .line 290
    .line 291
    if-eqz v0, :cond_8

    .line 292
    .line 293
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    const-string v1, "file:"

    .line 298
    .line 299
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_8

    .line 304
    .line 305
    iget-object v0, p0, Ll/sup0;->l:Ljava/lang/String;

    .line 306
    .line 307
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    new-instance v1, Ljava/io/File;

    .line 316
    .line 317
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {p0}, Ll/sup0;->C0()Landroid/content/Context;

    .line 325
    .line 326
    .line 327
    move-result-object v1

    .line 328
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v1

    .line 340
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    if-nez v0, :cond_8

    .line 345
    .line 346
    new-instance v0, Ljava/lang/Exception;

    .line 347
    .line 348
    new-instance v1, Ljava/lang/StringBuilder;

    .line 349
    .line 350
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    iget-object p1, p0, Ll/sup0;->l:Ljava/lang/String;

    .line 354
    .line 355
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object p1

    .line 362
    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 366
    .line 367
    .line 368
    const-string p1, "about:blank"

    .line 369
    .line 370
    iput-object p1, p0, Ll/sup0;->l:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 371
    .line 372
    :cond_8
    return-void

    .line 373
    :catchall_0
    move-exception p0

    .line 374
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 375
    .line 376
    .line 377
    return-void
.end method

.method public L(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p0, "url"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "params"

    .line 8
    .line 9
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "e_intl_android_web_vue"

    .line 18
    .line 19
    const-string p2, "p_intl_android_web_vue"

    .line 20
    .line 21
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public M()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sup0;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sup0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/sup0;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/sup0;->b:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    iget-object p0, p0, Ll/sup0;->k:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public N()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sup0;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/sup0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sup0;->A:Ll/zpq;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/sup0;->A:Ll/zpq;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/zpq;->k()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/sup0;->l()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tup0;->b(Ll/sup0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/lup0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sup0;->i:Ll/lup0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lup0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sup0;->i(Ll/lup0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sup0;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sup0;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/sup0;->c:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    iget-object v1, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/webkit/WebView;->clearHistory()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 33
    .line 34
    invoke-virtual {v0}, Lv/VWebView;->destroy()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sup0;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public final n(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.intent.action.VIEW"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "android.intent.category.BROWSABLE"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public p()Ll/zpq;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->A:Ll/zpq;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final s(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    sget-object p0, Ll/erq;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, ""

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    const-string p0, "\\?"

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object p1, Ll/erq;->b:Ljava/util/Map;

    .line 38
    .line 39
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ljava/lang/String;

    .line 44
    .line 45
    array-length v0, p0

    .line 46
    const/4 v2, 0x2

    .line 47
    if-lt v0, v2, :cond_1

    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    aget-object v1, p0, v0

    .line 51
    .line 52
    :cond_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_2

    .line 57
    .line 58
    new-instance p0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, "?"

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_2
    return-object p1

    .line 80
    :cond_3
    return-object v1
.end method

.method public u()Ll/qcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/qcj<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rup0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rup0;-><init>(Ll/sup0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public v()Ll/rx3$a;
    .locals 1

    .line 1
    new-instance v0, Ll/sup0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sup0$a;-><init>(Ll/sup0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public w()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final x()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/sup0;->v:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/high16 v1, -0x80000000

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/high16 v1, 0x4000000

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    const/16 v2, 0x510

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/4 v1, 0x1

    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->FlymeSetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->MIUISetStatusBarLightMode(Landroid/view/Window;Z)Z

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    iget-object p0, p0, Ll/sup0;->j:Lcom/p1/mobile/putong/app/PutongAct;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const/4 v0, 0x0

    .line 88
    invoke-virtual {p0, v0}, Ll/c30;->A(F)V

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sup0;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Ll/abc0;->n:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/sup0;->b:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/pup0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/pup0;-><init>(Ll/sup0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/sup0;->j()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/sup0;->b:Lv/navigationbar/VNavigationBar;

    .line 25
    .line 26
    const/16 v0, 0x8

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
