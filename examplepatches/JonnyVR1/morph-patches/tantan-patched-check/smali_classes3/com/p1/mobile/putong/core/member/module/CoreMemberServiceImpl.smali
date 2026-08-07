.class public Lcom/p1/mobile/putong/core/member/module/CoreMemberServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreMemberInnerService"
    path = "/member_service/service"
.end annotation


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
.method public Do(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/diamond/match/ODiamondFakeMatchAct;->b2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Fb()V
    .locals 0

    .line 1
    sget-object p0, Ll/f760;->Companion:Ll/f760$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f760$a;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Fj()I
    .locals 0

    .line 1
    sget-object p0, Ll/p920;->Companion:Ll/p920$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p920$a;->h()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Fq()V
    .locals 0

    .line 1
    invoke-static {}, Ll/ric0;->i()Ll/ric0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ric0;->o()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Hn()Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/newui/youthvip/YouthVipTabFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/youthvip/YouthVipTabFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public Hs()I
    .locals 0

    .line 1
    sget-object p0, Ll/p920;->Companion:Ll/p920$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p920$a;->i()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Kh(Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Ll/p920;->Companion:Ll/p920$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p920$a;->n(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Pp()Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/newui/customized/PrivateCustomTabFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/customized/PrivateCustomTabFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public Qo()V
    .locals 0

    .line 1
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qap$a;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Se()I
    .locals 0

    .line 1
    sget-object p0, Ll/p920;->Companion:Ll/p920$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p920$a;->g()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Vh()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rs9;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public W6(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/customized/PrivateCustomTabFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/customized/PrivateCustomTabFrag;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/customized/PrivateCustomTabFrag;->R4(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Xm()I
    .locals 0

    .line 1
    sget-object p0, Ll/p920;->Companion:Ll/p920$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p920$a;->j()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Xp(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public br()V
    .locals 0

    .line 1
    invoke-static {}, Ll/z5h0;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public cc()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->g()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public dt(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public fn(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/p920;->Companion:Ll/p920$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p920$a;->k(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public j7(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p5}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public jn()I
    .locals 0

    .line 1
    sget p0, Ll/gbc0;->q6:I

    .line 2
    .line 3
    return p0
.end method

.method public lg()Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/newui/supreme/hometab/SupremePartnerTabFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/supreme/hometab/SupremePartnerTabFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public li(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Z1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o7(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->l(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public ro(Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->n(Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public ul()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->f()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public vr(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;Ljava/lang/String;)V
    .locals 0
    .param p4    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/p920;->Companion:Ll/p920$a;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/p920$a;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public wq()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ric0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public x6()I
    .locals 0

    .line 1
    sget-object p0, Ll/y9;->Companion:Ll/y9$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/y9$a;->j()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public yb(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
