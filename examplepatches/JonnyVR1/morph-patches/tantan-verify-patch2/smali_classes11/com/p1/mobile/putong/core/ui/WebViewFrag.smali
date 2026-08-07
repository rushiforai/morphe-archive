.class public Lcom/p1/mobile/putong/core/ui/WebViewFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public B:Landroid/widget/ProgressBar;

.field public C:Landroid/widget/FrameLayout;

.field public D:Landroid/widget/FrameLayout;

.field public E:Landroid/widget/ImageView;

.field public F:Ljava/lang/String;

.field public G:Ljava/lang/String;

.field public H:Ll/zpq;

.field public I:Ll/x20;

.field public z:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/aup0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/aup0;-><init>(Lcom/p1/mobile/putong/core/ui/WebViewFrag;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/bup0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/bup0;-><init>(Lcom/p1/mobile/putong/core/ui/WebViewFrag;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->I:Ll/x20;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/ui/WebViewFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->X4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/ui/WebViewFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->Y4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/ui/WebViewFrag;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->W4(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic P4(Lcom/p1/mobile/putong/core/ui/WebViewFrag;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->F:Ljava/lang/String;

    return-object p0
.end method

.method private synthetic W4(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "tantan"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    return-object p0
.end method

.method private synthetic X4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->F:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->F:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->V4(Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public Q4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dup0;->b(Lcom/p1/mobile/putong/core/ui/WebViewFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public R4()Ll/zpq;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->H:Ll/zpq;

    .line 2
    .line 3
    return-object p0
.end method

.method public S4()Ll/qcj;
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
    new-instance v0, Ll/cup0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cup0;-><init>(Lcom/p1/mobile/putong/core/ui/WebViewFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public T4()Ll/rx3$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/WebViewFrag$a;-><init>(Lcom/p1/mobile/putong/core/ui/WebViewFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public U4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->G:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public V4(Ljava/util/Map;)V
    .locals 4
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->G:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->R4()Ll/zpq;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 20
    .line 21
    const-string v2, "tantan"

    .line 22
    .line 23
    invoke-virtual {v1, v0, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    new-instance v0, Ll/rx3;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->S4()Ll/qcj;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-direct {v0, v1, v2, v3}, Ll/rx3;-><init>(Landroid/content/Context;Ll/qcj;Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->T4()Ll/rx3$a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ll/rx3;->setListener(Ll/rx3$a;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebViewClientX(Lcom/p1/mobile/putong/app/web/WebViewClientX;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 53
    .line 54
    new-instance v1, Ll/wqp0;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/wqp0;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebChromeClientX(Ll/wqp0;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->G:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v1, p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->G:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, p0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    return-void
.end method

.method public final synthetic Y4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->H:Ll/zpq;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->H:Ll/zpq;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/zpq;->k()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Landroid/view/ViewGroup;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/webkit/WebView;->clearHistory()V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 56
    .line 57
    invoke-virtual {p1}, Lv/VWebView;->destroy()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->A:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->Q4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->F:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->G:Ljava/lang/String;

    .line 34
    .line 35
    :cond_0
    return-void
.end method
