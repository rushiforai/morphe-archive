.class public Ll/gnq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bnq0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public b:Lv/VText;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/core/newui/main/risk/YoungRiskCheckAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/main/risk/YoungRiskCheckAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gnq0;->e:Lcom/p1/mobile/putong/core/newui/main/risk/YoungRiskCheckAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/gnq0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gnq0;->k(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/gnq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gnq0;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/gnq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gnq0;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private i()V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/zki0;->E(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gnq0;->e:Lcom/p1/mobile/putong/core/newui/main/risk/YoungRiskCheckAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hnq0;->b(Ll/gnq0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/bnq0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bnq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gnq0;->f(Ll/bnq0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gnq0;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j()V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->R1:Ll/qs8;

    .line 8
    .line 9
    const-string v2, "index"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ll/qs8;->d3(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/enq0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/enq0;-><init>(Ll/gnq0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/fnq0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/fnq0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic k(Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v8, 0x1

    .line 17
    const/4 v9, 0x0

    .line 18
    const-string v2, "\u6211\u7684\u5ba2\u670d"

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    const/4 v5, 0x0

    .line 22
    const/4 v6, 0x0

    .line 23
    const/4 v7, 0x1

    .line 24
    move-object v3, p1

    .line 25
    invoke-static/range {v1 .. v9}, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;->u2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gnq0;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gnq0;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/gnq0;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 4
    .line 5
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVDNUhCV042RkNSVkpOV1VRSk1UNjJGSjJKQ0IySjE0IiwidyI6OTMzLCJoIjo2MjQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTMyNTkzNjQ5OTY0MjkwfQ.png"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/gnq0;->d:Lv/VText;

    .line 11
    .line 12
    new-instance v1, Ll/dnq0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/dnq0;-><init>(Ll/gnq0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1"

    .line 21
    .line 22
    filled-new-array {v0}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "\u7ecf\u5e73\u53f0\u68c0\u6d4b\uff0c\u60a8\u7684\u8d26\u53f7\u4f7f\u7528\u8005\u7591\u4f3c\u4e3a\u672a\u6210\u5e74\u4eba\uff0c\u5f53\u524d\u5df2\u6682\u505c\u529f\u80fd\u4f7f\u7528\u3002\u901a\u8fc7\u771f\u4eba\u5b9e\u540d\u8ba4\u8bc1\u540e\u53ef\u6062\u590d\u6b63\u5e38\u4f7f\u7528\u3002"

    .line 36
    .line 37
    const/high16 v3, -0x67000000

    .line 38
    .line 39
    invoke-static {v2, v0, v3, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object p0, p0, Ll/gnq0;->b:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public p(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gnq0;->c:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget v1, Ll/dbc0;->t:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget v1, Ll/dbc0;->s:I

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/gnq0;->c:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const-string v1, "\u7acb\u5373\u8ba4\u8bc1"

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    const-string v1, "\u5ba1\u6838\u4e2d"

    .line 21
    .line 22
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/gnq0;->c:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 26
    .line 27
    new-instance v1, Ll/cnq0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/cnq0;-><init>(Ll/gnq0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/gnq0;->c:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
