.class public Ll/arn;
.super Ll/an2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/an2<",
        "Ll/grn;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/an2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic X0(Ll/arn;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/arn;->a1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    const/4 p1, 0x4

    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic a1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/grn;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/grn;->init()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private c1()V
    .locals 1

    .line 1
    new-instance v0, Ll/xqn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xqn;-><init>(Ll/arn;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public J0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/grn;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/grn;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L0(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/grn;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/grn;->l(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O0(Lcom/p1/mobile/putong/core/data/LikeUser;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->P4()Ll/vqn;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/vqn;->Q(Lcom/p1/mobile/putong/core/data/LikeUser;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public P0(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/grn;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/grn;->l(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/arn;->v()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/fwl;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public R0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/arn;->v()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "i_like"

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/fwl;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public S0(Lcom/p1/mobile/putong/core/data/LikeUser;Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LikeUser;->userId:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v1, Ll/yqn;

    .line 14
    .line 15
    invoke-direct {v1, p2}, Ll/yqn;-><init>(Lcom/p1/mobile/putong/core/ui/intllikedusers/IntlILikeUserItemView;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xc(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Landroid/view/View;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/an2;->N0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/arn;->c1()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/an2;->V0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/an2;->U0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b1(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/grn;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/grn;->n()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public d1(Ljava/lang/String;Z)V
    .locals 6

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/z99;->k3()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p0, p0, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    const/4 v5, 0x0

    .line 31
    move-object v2, p1

    .line 32
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->r6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    move-object v2, p1

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-interface {p1, p0, v2, p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public q0()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->P4()Ll/vqn;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/vqn;->S()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public s0()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_meet_view,e_intl_meet_avatar_like_i_sent_click,click"

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/arn;->v()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "i_like"

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/fwl;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/zqn;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/zqn;-><init>(Ll/arn;)V

    .line 27
    .line 28
    .line 29
    const-string p0, "p_intl_meet_view,e_intl_meet_like_i_sent_instant_match_click,click"

    .line 30
    .line 31
    invoke-interface {v0, v1, p1, p0, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Me(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public t0()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_meet_view,e_intl_meet_like_i_sent_superlike_click,click"

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/arn;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
