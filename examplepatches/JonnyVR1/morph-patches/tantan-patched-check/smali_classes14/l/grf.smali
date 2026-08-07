.class public Ll/grf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/frf;


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
.method public P3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mbs;->y()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q2()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public W2()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mbs;->z()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Z3(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mbs;->C(Landroid/app/Activity;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public a()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/mqr;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/mqr;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/mqr;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public d2(Lcom/p1/mobile/android/app/Act;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;)Ll/lb2;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/widget/EditText;",
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ll/x20;",
            ")",
            "Ll/lb2;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface/range {p0 .. p6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->d2(Lcom/p1/mobile/android/app/Act;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;)Ll/lb2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/mbs;->H(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/mbs;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface/range {p0 .. p7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->jc(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ll/y20;Ll/y20;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g4()Z
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->g4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getCurrencyProductCategory()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->n()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Ll/x3m;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mbs;->n0(Ll/x3m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move v5, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/grf;->l(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public isHttpDnsOpen()Z
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isHttpDnsOpen()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isPurchaseDialogShowing()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->F()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public j(Ljava/lang/String;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/mbs;->Q(Ljava/lang/String;Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p0}, Ll/mbs;->e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public l(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ll/fk3;->d(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, p3, p4, p5, p6}, Ll/mbs;->l0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mbs;->q0(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public me_()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->J()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onCoinPay(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/mbs;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public patchSettings(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SettingGroups;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/mbs;->O(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public pollConversation()V
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->P()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public refreshUser(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mbs;->R(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public registerPurchaseDialogListener(Ll/x3m;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mbs;->S(Ll/x3m;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s2(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->s2(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public shouldShowAutoPay()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/mbs;->Z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public showAutoPayHelp(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mbs;->b0(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public showBindPhoneDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/mbs;->c0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/mbs;->f0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public showVipPurchaseDialog(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/mbs;->g0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public startMessagesAct(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/mbs;->j0(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
