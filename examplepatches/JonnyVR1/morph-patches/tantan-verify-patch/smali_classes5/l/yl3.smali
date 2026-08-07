.class public Ll/yl3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/sl3;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ll/sl3;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yl3;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/yl3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yl3;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/yl3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yl3;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/yl3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yl3;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/yl3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yl3;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/yl3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yl3;->n(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yl3;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yl3;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string p1, "\u8425\u4e1a\u6267\u7167"

    .line 4
    .line 5
    const-string v0, "http://m.tantanapp.com/middle-platform/bussiness_license?rid=1"

    .line 6
    .line 7
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yl3;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string p1, "\u589e\u503c\u7535\u4fe1\u4e1a\u52a1\u8bb8\u53ef\u8bc1"

    .line 4
    .line 5
    const-string v0, "http://m.tantanapp.com/middle-platform/bussiness_license?rid=2"

    .line 6
    .line 7
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yl3;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string p1, "\u5e7f\u64ad\u7535\u89c6\u8282\u76ee\u7ecf\u8425\u8bb8\u53ef\u8bc1"

    .line 4
    .line 5
    const-string v0, "http://m.tantanapp.com/middle-platform/bussiness_license?rid=3"

    .line 6
    .line 7
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yl3;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string p1, "\u7f51\u7edc\u6587\u5316\u7ecf\u8425\u8bb8\u53ef\u8bc1"

    .line 4
    .line 5
    const-string v0, "http://m.tantanapp.com/middle-platform/bussiness_license?rid=4"

    .line 6
    .line 7
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yl3;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yl3;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zl3;->b(Ll/yl3;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/sl3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yl3;->g:Ll/sl3;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/sl3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yl3;->i(Ll/sl3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yl3;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yl3;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u76f8\u5173\u8bb8\u53ef\u8bc1"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/yl3;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/tl3;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/tl3;-><init>(Ll/yl3;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/yl3;->b:Lv/VText;

    .line 19
    .line 20
    new-instance v1, Ll/ul3;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ul3;-><init>(Ll/yl3;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/yl3;->c:Lv/VText;

    .line 29
    .line 30
    new-instance v1, Ll/vl3;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/vl3;-><init>(Ll/yl3;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/yl3;->d:Lv/VText;

    .line 39
    .line 40
    new-instance v1, Ll/wl3;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/wl3;-><init>(Ll/yl3;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/yl3;->e:Lv/VText;

    .line 49
    .line 50
    new-instance v1, Ll/xl3;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/xl3;-><init>(Ll/yl3;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
