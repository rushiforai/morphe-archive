.class public Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public b:Landroid/widget/ProgressBar;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Landroid/content/Context;

.field public j:Ll/w0c;

.field public k:Ll/x20;

.field public l:Z

.field public m:Z

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 84
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 83
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->k:Ll/x20;

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->l:Z

    .line 9
    .line 10
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->m:Z

    .line 11
    .line 12
    const-string p2, "transparent"

    .line 13
    .line 14
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->n:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget p3, Ll/sec0;->k0:I

    .line 21
    .line 22
    invoke-static {p2, p3, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->e:Landroid/view/View;

    .line 27
    .line 28
    sget p3, Ll/gdc0;->d0:I

    .line 29
    .line 30
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->e:Landroid/view/View;

    .line 39
    .line 40
    sget p3, Ll/gdc0;->G:I

    .line 41
    .line 42
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Landroid/widget/ProgressBar;

    .line 47
    .line 48
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->b:Landroid/widget/ProgressBar;

    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->e:Landroid/view/View;

    .line 51
    .line 52
    sget p3, Ll/gdc0;->o:I

    .line 53
    .line 54
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->c:Landroid/view/View;

    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->e:Landroid/view/View;

    .line 61
    .line 62
    sget p3, Ll/gdc0;->H:I

    .line 63
    .line 64
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->d:Landroid/view/View;

    .line 69
    .line 70
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->e:Landroid/view/View;

    .line 71
    .line 72
    sget p3, Ll/gdc0;->f:I

    .line 73
    .line 74
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->f:Landroid/view/View;

    .line 79
    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->i:Landroid/content/Context;

    .line 81
    .line 82
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->m(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic b(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
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

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->k:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->f:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->c:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->i:Landroid/content/Context;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Lcom/hellogroup/mk/business/base/ui/MKWebView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Landroid/widget/ProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->b:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->g:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->h:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public getPageListener()Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->j:Ll/w0c;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;Ll/nxl;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public k(Ljava/util/Map;)V
    .locals 5
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    new-instance v0, Ll/w0c;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/w0c;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->j:Ll/w0c;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->i:Landroid/content/Context;

    .line 17
    .line 18
    instance-of v2, v1, Landroid/app/Activity;

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    check-cast v1, Landroid/app/Activity;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->j:Ll/w0c;

    .line 30
    .line 31
    new-instance v1, Ll/ulw;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/ulw;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->J(Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$a;)V

    .line 37
    .line 38
    .line 39
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->l:Z

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->j:Ll/w0c;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/w0c;->N()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->i:Landroid/content/Context;

    .line 52
    .line 53
    instance-of v1, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 54
    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->j:Ll/w0c;

    .line 58
    .line 59
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->h:Ljava/lang/String;

    .line 64
    .line 65
    const-string v4, ""

    .line 66
    .line 67
    invoke-virtual {v1, v0, v4, v2, v3}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->l()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->getPageListener()Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 87
    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->h:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1, p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->h:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v1, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    return-void
.end method

.method public final l()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->n:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->n:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->n:Ljava/lang/String;

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->n:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->o()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->h:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->g:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->i:Landroid/content/Context;

    .line 6
    .line 7
    instance-of p1, p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->k(Ljava/util/Map;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->i:Landroid/content/Context;

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/slw;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/slw;-><init>(Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final o()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->j:Ll/w0c;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w0c;->K()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/webkit/WebView;->clearHistory()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->destroy()V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 55
    .line 56
    :cond_1
    return-void
.end method
