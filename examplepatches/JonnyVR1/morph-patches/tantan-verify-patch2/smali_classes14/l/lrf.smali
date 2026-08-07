.class public Ll/lrf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/krf;


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


# virtual methods
.method public A(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/qon;->Companion:Ll/qon$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qon$a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public B(Ll/y20;)V
    .locals 0
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->requestLiveVerification(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/mqr;->p()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    sget-object p0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 8
    .line 9
    const-string v0, "indonesia"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public M2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->M2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->getCanUseMaskMode()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/mqr;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public c()Ll/nam;
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/live/external/intl/feedback/upload/IntlFeedbackCategoryAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "liveType"

    .line 9
    .line 10
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->w()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p0}, Ll/h3g0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public g(IZ)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/hyn0;->d(IZ)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Landroid/content/Context;)V
    .locals 0

    .line 1
    const-string p0, "intl_music_playlist_page_frag"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i()Z
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 2
    .line 3
    const-string v0, "taiwan"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 12
    .line 13
    const-string v0, "indonesia"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x2

    .line 22
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public i5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Lrx/c;
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/mbs;->d0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/n4u;->n(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k()Z
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->d:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bk3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/bk3;->d:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public k2()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mbs;->t()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(ILjava/lang/String;Z)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/hyn0;->c(ILjava/lang/String;Z)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m()Ll/vwt;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o(I)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/ppi0;->u(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, p1, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Gr(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public q(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/t4u;->k(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mbs;->L(Landroid/app/Activity;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public s()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->noVerificationInfo()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p7}, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/live/external/intl/feedback/IntlFeedbackActivity;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public v(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mbs;->W(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ppi0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public x(Landroid/content/Context;)Z
    .locals 1

    .line 1
    sget-object p0, Ll/itd0;->d:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/bk3;

    .line 8
    .line 9
    iget-object v0, v0, Ll/bk3;->d:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/bk3;

    .line 28
    .line 29
    iget-object p0, p0, Ll/bk3;->c:Ll/jxd0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_0
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, p1}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0
.end method

.method public y(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListAct;->Y1(Landroid/content/Context;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->d:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bk3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/bk3;->b()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
