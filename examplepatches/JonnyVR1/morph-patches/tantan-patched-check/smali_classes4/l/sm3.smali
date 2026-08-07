.class public Ll/sm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/om3;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/k7f0;

.field public B:Ll/x20;

.field public C:I

.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/TextView;

.field public e:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

.field public f:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public g:Landroid/widget/ProgressBar;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroid/widget/FrameLayout;

.field public j:Landroid/widget/ImageView;

.field public k:Ll/om3;

.field public final l:Lcom/p1/mobile/putong/app/PutongAct;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:J

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Ljava/lang/String;

.field public x:Ljava/lang/String;

.field public y:Ll/zpq;

.field public z:Ll/rx3;


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
    iput-object v0, p0, Ll/sm3;->B:Ll/x20;

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Ll/sm3;->C:I

    .line 9
    .line 10
    iput-object p1, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->onHomePressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/sm3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sm3;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/sm3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sm3;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/sm3;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sm3;->B(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic d(Ll/sm3;)Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    return-object p0
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sm3;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic B(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/sm3;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    const-string v0, "kanjianxinli"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "wzhxl"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    :cond_0
    const-string v0, "tantanapp.com/kanjianxinli/Login"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Ll/sm3;->k:Ll/om3;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/om3;->r0(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    const-string v0, "tantanapp.com/kanjianxinli/Home"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Ll/sm3;->k:Ll/om3;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/om3;->l0()V

    .line 50
    .line 51
    .line 52
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_2
    const-string v0, "tantanapp.com/kanjianxinli/Purchase"

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Ll/sm3;->k:Ll/om3;

    .line 64
    .line 65
    iget-wide v1, p0, Ll/sm3;->o:J

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2, p1}, Ll/om3;->q0(JLjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_3
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_4
    invoke-virtual {p0}, Ll/sm3;->z()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_5
    const-string v0, "tantan"

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_6

    .line 92
    .line 93
    iget-object p0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 102
    .line 103
    return-object p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public F(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sm3;->m:Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/sm3;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/sm3;->m:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/sm3;->b:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    iget-object p0, p0, Ll/sm3;->m:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/sm3;->f()Lcom/p1/mobile/putong/app/PutongAct;

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
    iget-object v0, p0, Ll/sm3;->y:Ll/zpq;

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
    iget-object v0, p0, Ll/sm3;->y:Ll/zpq;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/zpq;->k()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/sm3;->m()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tm3;->b(Ll/sm3;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object p0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/om3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sm3;->k:Ll/om3;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/om3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sm3;->i(Ll/om3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sm3;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sm3;->y:Ll/zpq;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/sm3;->y:Ll/zpq;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/zpq;->d()Ll/gqq;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p2}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p0, p1, p2}, Ll/gqq;->b(Ljava/lang/String;[Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sm3;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

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
    iget-object p0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

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

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

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
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/sm3;->c:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    iget-object v1, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/webkit/WebView;->clearHistory()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 33
    .line 34
    invoke-virtual {v0}, Lv/VWebView;->destroy()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public n()Ll/zpq;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sm3;->y:Ll/zpq;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sm3;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Ll/qcj;
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
    new-instance v0, Ll/rm3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rm3;-><init>(Ll/sm3;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public s()Ll/rx3$a;
    .locals 1

    .line 1
    new-instance v0, Ll/sm3$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sm3$a;-><init>(Ll/sm3;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "title"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/sm3;->m:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "id"

    .line 22
    .line 23
    const-wide/16 v2, 0x1

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p0, Ll/sm3;->o:J

    .line 30
    .line 31
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "url"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ll/sm3;->n:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "hideNavigationBar"

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput-boolean v0, p0, Ll/sm3;->p:Z

    .line 59
    .line 60
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "hardwareAccelerated"

    .line 67
    .line 68
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput-boolean v0, p0, Ll/sm3;->q:Z

    .line 73
    .line 74
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v1, "playbackRequiresUserGesture"

    .line 81
    .line 82
    const/4 v3, 0x1

    .line 83
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iput-boolean v0, p0, Ll/sm3;->r:Z

    .line 88
    .line 89
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v1, "advanceInitJsBridge"

    .line 96
    .line 97
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iput-boolean v0, p0, Ll/sm3;->s:Z

    .line 102
    .line 103
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 104
    .line 105
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const-string v1, "transparent_status_bar"

    .line 110
    .line 111
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput-boolean v0, p0, Ll/sm3;->t:Z

    .line 116
    .line 117
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 118
    .line 119
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const-string v1, "enableWebOfflineCache"

    .line 124
    .line 125
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    iput-boolean v0, p0, Ll/sm3;->u:Z

    .line 130
    .line 131
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const-string v1, "skipLoading"

    .line 138
    .line 139
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iput-boolean v0, p0, Ll/sm3;->v:Z

    .line 144
    .line 145
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 146
    .line 147
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-string v1, "webviewColor"

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Ll/sm3;->w:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 160
    .line 161
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const-string v1, "webview_load_type"

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_0

    .line 176
    .line 177
    const-string v0, "webview_load_type_tantan_default"

    .line 178
    .line 179
    :cond_0
    iput-object v0, p0, Ll/sm3;->x:Ljava/lang/String;

    .line 180
    .line 181
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/sm3;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/sm3;->b:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/gbc0;->r1:I

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/sm3;->b:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    new-instance v1, Ll/pm3;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/pm3;-><init>(Ll/sm3;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget v0, Ll/abc0;->n:I

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/sm3;->b:Lv/navigationbar/VNavigationBar;

    .line 31
    .line 32
    new-instance v1, Ll/qm3;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/qm3;-><init>(Ll/sm3;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0}, Ll/sm3;->k()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Ll/sm3;->b:Lv/navigationbar/VNavigationBar;

    .line 47
    .line 48
    const/16 v0, 0x8

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public x(Ljava/util/Map;)V
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
    invoke-virtual {p0}, Ll/sm3;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_8

    .line 10
    .line 11
    iget-boolean v0, p0, Ll/sm3;->s:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/sm3;->y:Ll/zpq;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/zpq;

    .line 20
    .line 21
    iget-object v1, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    const-string v2, ""

    .line 24
    .line 25
    iget-object v3, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 26
    .line 27
    invoke-direct {v0, v1, v2, v3}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/sm3;->y:Ll/zpq;

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/sm3;->n()Ll/zpq;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/sm3;->z()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 49
    .line 50
    const-string v2, "tantan"

    .line 51
    .line 52
    invoke-virtual {v1, v0, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    invoke-virtual {p0}, Ll/sm3;->z()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 60
    .line 61
    const/16 v2, 0x64

    .line 62
    .line 63
    const/4 v3, 0x0

    .line 64
    const/4 v4, 0x1

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/4 v1, 0x0

    .line 72
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget-object v1, Landroid/webkit/WebSettings$LayoutAlgorithm;->NORMAL:Landroid/webkit/WebSettings$LayoutAlgorithm;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-boolean v1, p0, Ll/sm3;->r:Z

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 125
    .line 126
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setMinimumFontSize(I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 134
    .line 135
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setMinimumLogicalFontSize(I)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 143
    .line 144
    invoke-virtual {v0, v3}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 148
    .line 149
    invoke-virtual {v0, v3}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 153
    .line 154
    const/4 v1, 0x2

    .line 155
    invoke-virtual {v0, v1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_2
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iget-boolean v1, p0, Ll/sm3;->r:Z

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 169
    .line 170
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 178
    .line 179
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 184
    .line 185
    .line 186
    :goto_0
    iget-boolean v0, p0, Ll/sm3;->p:Z

    .line 187
    .line 188
    if-eqz v0, :cond_3

    .line 189
    .line 190
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 191
    .line 192
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    if-eqz v0, :cond_3

    .line 197
    .line 198
    iget-object v0, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 199
    .line 200
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 205
    .line 206
    .line 207
    :cond_3
    iget-boolean v0, p0, Ll/sm3;->v:Z

    .line 208
    .line 209
    iget-object v1, p0, Ll/sm3;->g:Landroid/widget/ProgressBar;

    .line 210
    .line 211
    if-eqz v0, :cond_4

    .line 212
    .line 213
    const/16 v0, 0x8

    .line 214
    .line 215
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 216
    .line 217
    .line 218
    goto :goto_1

    .line 219
    :cond_4
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 220
    .line 221
    .line 222
    :goto_1
    invoke-virtual {p0}, Ll/sm3;->y()V

    .line 223
    .line 224
    .line 225
    new-instance v0, Ll/rx3;

    .line 226
    .line 227
    iget-object v1, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 228
    .line 229
    invoke-virtual {p0}, Ll/sm3;->q()Ll/qcj;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    iget-boolean v3, p0, Ll/sm3;->q:Z

    .line 234
    .line 235
    invoke-direct {v0, v1, v2, v3}, Ll/rx3;-><init>(Landroid/content/Context;Ll/qcj;Z)V

    .line 236
    .line 237
    .line 238
    iput-object v0, p0, Ll/sm3;->z:Ll/rx3;

    .line 239
    .line 240
    invoke-virtual {p0}, Ll/sm3;->s()Ll/rx3$a;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-virtual {v0, v1}, Ll/rx3;->setListener(Ll/rx3$a;)V

    .line 245
    .line 246
    .line 247
    new-instance v0, Ll/k7f0;

    .line 248
    .line 249
    iget-object v1, p0, Ll/sm3;->l:Lcom/p1/mobile/putong/app/PutongAct;

    .line 250
    .line 251
    invoke-direct {v0, v1}, Ll/k7f0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 252
    .line 253
    .line 254
    iput-object v0, p0, Ll/sm3;->A:Ll/k7f0;

    .line 255
    .line 256
    invoke-virtual {p0}, Ll/sm3;->z()Z

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    if-eqz v0, :cond_5

    .line 261
    .line 262
    iget-object v0, p0, Ll/sm3;->A:Ll/k7f0;

    .line 263
    .line 264
    invoke-virtual {v0}, Ll/k7f0;->setADWebViewSet()V

    .line 265
    .line 266
    .line 267
    :cond_5
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 268
    .line 269
    iget-object v1, p0, Ll/sm3;->z:Ll/rx3;

    .line 270
    .line 271
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebViewClientX(Lcom/p1/mobile/putong/app/web/WebViewClientX;)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 275
    .line 276
    iget-object v1, p0, Ll/sm3;->A:Ll/k7f0;

    .line 277
    .line 278
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebChromeClientX(Ll/wqp0;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {p0}, Ll/sm3;->z()Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-eqz v0, :cond_6

    .line 286
    .line 287
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    iget-object v1, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 292
    .line 293
    invoke-virtual {v0, v1, v4}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    .line 294
    .line 295
    .line 296
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {v0, v4}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v0}, Landroid/webkit/CookieManager;->flush()V

    .line 304
    .line 305
    .line 306
    :cond_6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    iget-object v1, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 311
    .line 312
    if-eqz v0, :cond_7

    .line 313
    .line 314
    invoke-virtual {p0}, Ll/sm3;->p()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-virtual {v1, v0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 319
    .line 320
    .line 321
    goto :goto_2

    .line 322
    :cond_7
    invoke-virtual {p0}, Ll/sm3;->p()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    invoke-virtual {v1, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    :cond_8
    :goto_2
    invoke-virtual {p0}, Ll/sm3;->z()Z

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    if-eqz p1, :cond_9

    .line 334
    .line 335
    iget-object p1, p0, Ll/sm3;->e:Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;

    .line 336
    .line 337
    iget-object p0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 338
    .line 339
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/profile/understandme/PullFrameLayout;->set_webview(Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 340
    .line 341
    .line 342
    :cond_9
    return-void
.end method

.method public final y()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/sm3;->w:Ljava/lang/String;

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
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

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
    iget-object p0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Ll/sm3;->w:Ljava/lang/String;

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
    iget-object v0, p0, Ll/sm3;->w:Ljava/lang/String;

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
    iget-object v4, p0, Ll/sm3;->w:Ljava/lang/String;

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
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

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
    iget-object p0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

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
    iget-object v0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

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
    iget-object p0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public z()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sm3;->x:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "webview_load_type_knowme"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
