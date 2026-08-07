.class public Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public B:Landroid/widget/ProgressBar;

.field public C:Landroid/widget/FrameLayout;

.field public D:Landroid/widget/FrameLayout;

.field public E:Landroid/widget/ImageView;

.field public F:Z

.field public G:Z

.field public H:Ljava/lang/String;

.field public I:Z

.field public J:Ljava/lang/String;

.field public K:Ljava/lang/String;

.field public L:Ll/w0c;

.field public M:Ll/x20;

.field public z:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->F:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->G:Z

    .line 8
    .line 9
    const-string v1, "transparent"

    .line 10
    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->H:Ljava/lang/String;

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->I:Z

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->M:Ll/x20;

    .line 17
    .line 18
    new-instance v0, Ll/olw;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/olw;-><init>(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/plw;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/plw;-><init>(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->X4()V

    return-void
.end method

.method public static synthetic N4(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
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

.method public static synthetic O4(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->W4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static bridge synthetic P4(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->J:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic Q4(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->K:Ljava/lang/String;

    return-object p0
.end method

.method private V4()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->H:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->H:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->H:Ljava/lang/String;

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->H:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method private synthetic W4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->J:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->J:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->U4(Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic X4()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->L:Ll/w0c;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w0c;->K()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/webkit/WebView;->clearHistory()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->destroy()V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 55
    .line 56
    :cond_1
    return-void
.end method


# virtual methods
.method public R4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rlw;->b(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->L:Ll/w0c;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->L:Ll/w0c;

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

.method public T4()Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->L:Ll/w0c;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag$a;-><init>(Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;Ll/nxl;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public U4(Ljava/util/Map;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->K:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->L:Ll/w0c;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->L:Ll/w0c;

    .line 26
    .line 27
    new-instance v1, Ll/qlw;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/qlw;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->J(Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$a;)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->F:Z

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->L:Ll/w0c;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/w0c;->N()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->L:Ll/w0c;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 56
    .line 57
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->K:Ljava/lang/String;

    .line 58
    .line 59
    const-string v4, ""

    .line 60
    .line 61
    invoke-virtual {v0, v1, v4, v2, v3}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->G:Z

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->B:Landroid/widget/ProgressBar;

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    const/16 v0, 0x8

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/4 v0, 0x0

    .line 77
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->V4()V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->T4()Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->A:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 97
    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->K:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v1, p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->K:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v1, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->R4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "title"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->J:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "url"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->K:Ljava/lang/String;

    .line 34
    .line 35
    :cond_0
    return-void
.end method
