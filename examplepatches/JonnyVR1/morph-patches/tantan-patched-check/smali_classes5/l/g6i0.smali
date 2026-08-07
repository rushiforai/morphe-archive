.class public Ll/g6i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/e6i0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/cardview/widget/CardView;

.field public b:Lv/VText;

.field public c:Lv/VText_AutoFit;

.field public d:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public e:Landroid/widget/ProgressBar;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/widget/ImageView;

.field public i:Ll/e6i0;

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ll/zpq;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g6i0;->j:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/g6i0;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g6i0;->k(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private j()V
    .locals 4

    .line 1
    new-instance v0, Ll/rx3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g6i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Ll/g6i0;->f()Ll/qcj;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v0, v1, v2, v3}, Ll/rx3;-><init>(Landroid/content/Context;Ll/qcj;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/g6i0;->i()Ll/rx3$a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/rx3;->setListener(Ll/rx3$a;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebViewClientX(Lcom/p1/mobile/putong/app/web/WebViewClientX;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 28
    .line 29
    new-instance v1, Ll/wqp0;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/wqp0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebChromeClientX(Ll/wqp0;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/g6i0;->i:Ll/e6i0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/e6i0;->s0()V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/g6i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g6i0;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/h6i0;->b(Ll/g6i0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/e6i0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g6i0;->i:Ll/e6i0;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g6i0;->c:Lv/VText_AutoFit;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g6i0;->k:Ll/zpq;

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
    iget-object v0, p0, Ll/g6i0;->k:Ll/zpq;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/zpq;->k()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/view/ViewGroup;

    .line 34
    .line 35
    iget-object v1, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/webkit/WebView;->clearHistory()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 52
    .line 53
    invoke-virtual {v0}, Lv/VWebView;->destroy()V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g6i0;->c:Lv/VText_AutoFit;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public f()Ll/qcj;
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
    new-instance v0, Ll/f6i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/f6i0;-><init>(Ll/g6i0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public i()Ll/rx3$a;
    .locals 1

    .line 1
    new-instance v0, Ll/g6i0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/g6i0$a;-><init>(Ll/g6i0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/e6i0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g6i0;->c(Ll/e6i0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g6i0;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic k(Ljava/lang/String;)Ljava/lang/Boolean;
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
    iget-object p0, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

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

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g6i0;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/g6i0;->e:Landroid/widget/ProgressBar;

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->P1:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 4

    .line 1
    new-instance v0, Ll/zpq;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g6i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    iget-object v2, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v3, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2, v3}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/g6i0;->k:Ll/zpq;

    .line 17
    .line 18
    iget-object v1, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 19
    .line 20
    const-string v2, "tantan"

    .line 21
    .line 22
    invoke-virtual {v1, v0, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/g6i0;->i:Ll/e6i0;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/e6i0;->m0()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    const-string v1, "H5-Authorization"

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object p1, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 50
    .line 51
    const/4 v1, 0x2

    .line 52
    invoke-virtual {p1, v1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/g6i0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 56
    .line 57
    iget-object p0, p0, Ll/g6i0;->i:Ll/e6i0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/e6i0;->m0()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/g6i0;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->ga:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/g6i0;->b:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/g6i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->W1:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0}, Ll/g6i0;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {}, Ll/l9n;->e()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "%s (%s)"

    .line 37
    .line 38
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Ll/g6i0;->j()V

    .line 46
    .line 47
    .line 48
    return-void
.end method
