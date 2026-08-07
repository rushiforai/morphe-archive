.class public Ll/cdf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/live/livingroom/common/signin/a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

.field public g:Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;

.field public h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

.field public j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/cdf0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdf0;->l(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/cdf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdf0;->m(Landroid/view/View;)V

    return-void
.end method

.method public static d(Ll/cdf0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/cdf0;->a:Landroid/view/View;

    .line 3
    .line 4
    iput-object v0, p0, Ll/cdf0;->b:Lv/VDraweeView;

    .line 5
    .line 6
    iput-object v0, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    iput-object v0, p0, Ll/cdf0;->d:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 9
    .line 10
    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/cdf0;->d(Ll/cdf0;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/cdf0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 11
    .line 12
    iput-object v0, p0, Ll/cdf0;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 13
    .line 14
    iput-object v0, p0, Ll/cdf0;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;

    .line 15
    .line 16
    iget-object v1, p0, Ll/cdf0;->g:Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->e()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/cdf0;->g:Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;

    .line 24
    .line 25
    :cond_0
    iput-object v0, p0, Ll/cdf0;->i:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cdf0;->g:Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/yec0;->J5:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;

    .line 26
    .line 27
    iput-object v0, p0, Ll/cdf0;->g:Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    iget-object v1, p0, Ll/cdf0;->g:Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/cdf0;->g:Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;

    .line 37
    .line 38
    iget-object p0, p0, Ll/cdf0;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->c(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cdf0;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ldf0;->b(Ll/cdf0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cdf0;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cdf0;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    new-instance v0, Ll/c0s;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cdf0;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {p0, v2, v3}, Ll/cdf0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v0, v1, v2}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/cdf0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 22
    .line 23
    new-instance v1, Ll/adf0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/adf0;-><init>(Ll/cdf0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/cdf0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->SIGN_IN:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/cdf0;->a:Landroid/view/View;

    .line 39
    .line 40
    new-instance v1, Ll/bdf0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/bdf0;-><init>(Ll/cdf0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/cdf0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget v1, Ll/mdc0;->I:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VDraweeView;

    .line 61
    .line 62
    const-string v1, "context_livingAct"

    .line 63
    .line 64
    sget-object v2, Ll/zft;->q:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1, v0, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/cdf0;->d:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 70
    .line 71
    iget-object p0, p0, Ll/cdf0;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->i(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdf0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cdf0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cdf0;->e(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdf0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdf0;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final synthetic l(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cdf0;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cdf0;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdf0;->i:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->n(Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdf0;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->g(Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s(Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdf0;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->h(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/cdf0;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/cdf0;->d:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->p(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public v()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdf0;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->i()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public w()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdf0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cdf0;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/cdf0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public x()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cdf0;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/yec0;->E5:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 26
    .line 27
    iput-object v0, p0, Ll/cdf0;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    iget-object v1, p0, Ll/cdf0;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/cdf0;->f:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;

    .line 37
    .line 38
    iget-object p0, p0, Ll/cdf0;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInMainFrame;->d(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cdf0;->i:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/yec0;->G5:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 26
    .line 27
    iput-object v0, p0, Ll/cdf0;->i:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    iget-object v1, p0, Ll/cdf0;->i:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/cdf0;->i:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 37
    .line 38
    iget-object p0, p0, Ll/cdf0;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->i(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public z(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cdf0;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/yec0;->I5:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;

    .line 26
    .line 27
    iput-object v0, p0, Ll/cdf0;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/cdf0;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;

    .line 30
    .line 31
    iget-object v1, p0, Ll/cdf0;->e:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->c(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/cdf0;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;->setData(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/cdf0;->c:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    iget-object p0, p0, Ll/cdf0;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeListView;

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
