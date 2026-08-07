.class public Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;
.super Ll/iq2;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Landroid/widget/RelativeLayout;

.field public C:Lv/VText;

.field public D:Landroid/widget/RelativeLayout;

.field public E:Landroid/widget/RelativeLayout;

.field public F:Ll/w30;

.field public G:Z

.field public H:Ll/jxd0;

.field public I:Z

.field public c:Landroid/widget/RelativeLayout;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/core/ui/view/GradientBgButton;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Landroid/widget/LinearLayout;

.field public j:Landroid/widget/RelativeLayout;

.field public k:Landroid/widget/RelativeLayout;

.field public l:Landroid/widget/RelativeLayout;

.field public m:Landroid/widget/RelativeLayout;

.field public n:Landroid/widget/RelativeLayout;

.field public o:Lv/VSwitchButton;

.field public p:Landroid/widget/RelativeLayout;

.field public q:Landroid/view/View;

.field public r:Landroid/widget/ImageView;

.field public s:Lv/VText;

.field public t:Landroid/widget/RelativeLayout;

.field public u:Lv/VText;

.field public v:Landroid/widget/RelativeLayout;

.field public w:Lv/VText;

.field public x:Landroid/widget/RelativeLayout;

.field public y:Lv/VText;

.field public z:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/iq2;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->G:Z

    .line 6
    .line 7
    new-instance v0, Ll/jxd0;

    .line 8
    .line 9
    const-string v1, "click_special_enter"

    .line 10
    .line 11
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->H:Ll/jxd0;

    .line 17
    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->I:Z

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->K(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->P(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->O(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    iget-object p0, p0, Ll/iq2;->b:Ll/f400;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f400;->x0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/settings/SetTickleAct;->b2(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "e_search_chat_history"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 23
    .line 24
    iget-object p0, p0, Ll/iq2;->b:Ll/f400;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/f400;->x0()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->rj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic R()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iq2;->b:Ll/f400;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f400;->O0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 10
    .line 11
    iget-object v1, p0, Ll/iq2;->b:Ll/f400;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/f400;->x0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/r400;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/r400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    invoke-interface {p1, v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eo(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    iget-object p0, p0, Ll/iq2;->b:Ll/f400;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f400;->x0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "p_chat_view"

    .line 10
    .line 11
    invoke-static {p1, p0, v0}, Ll/xtj0;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic U(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 8
    .line 9
    iget-object v2, p0, Ll/iq2;->b:Ll/f400;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/f400;->x0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    new-instance v3, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel$1;

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-direct {v3, p0, v4}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel$1;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/os/Handler;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    invoke-interface {v0, v1, v2, p0, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toReportAct(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->s:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    instance-of p1, p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->s:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move p1, v0

    .line 26
    :goto_0
    const-string v1, "is_special_remind_on"

    .line 27
    .line 28
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    filled-new-array {p1}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v1, "e_special_remind_entrance"

    .line 41
    .line 42
    const-string v2, "p_chat_setting"

    .line 43
    .line 44
    invoke-static {v1, v2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 48
    .line 49
    iget-object v1, p0, Ll/iq2;->b:Ll/f400;

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/f400;->x0()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->h2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object v1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 60
    .line 61
    invoke-virtual {v1, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->H:Ll/jxd0;

    .line 65
    .line 66
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->q:Landroid/view/View;

    .line 72
    .line 73
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->U(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->R()V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->L(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/t400;->b(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final H(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->k:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->l:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->l()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/iq2;->b:Ll/f400;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/f400;->C0()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->k:Landroid/widget/RelativeLayout;

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->l:Landroid/widget/RelativeLayout;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->k:Landroid/widget/RelativeLayout;

    .line 52
    .line 53
    new-instance v1, Ll/s400;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/s400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->l:Landroid/widget/RelativeLayout;

    .line 62
    .line 63
    new-instance v1, Ll/h400;

    .line 64
    .line 65
    invoke-direct {v1, p0, p1}, Ll/h400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final I(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isSeeUpgradedConv()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->i:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v0, 0x0

    .line 20
    move v1, v0

    .line 21
    :goto_0
    if-ge v1, p1, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->i:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->k:Landroid/widget/RelativeLayout;

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->l:Landroid/widget/RelativeLayout;

    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->v:Landroid/widget/RelativeLayout;

    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->D:Landroid/widget/RelativeLayout;

    .line 52
    .line 53
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->F:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic K(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p2, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->K1:I

    .line 14
    .line 15
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iget-object p3, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    const-string p1, "e_choose_background_picture"

    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->pageId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/iq2;->n()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->F:Ll/w30;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p3}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->v:I

    .line 50
    .line 51
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->pageId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string p2, "e_cancel_background"

    .line 68
    .line 69
    invoke-static {p2, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/iq2;->b:Ll/f400;

    .line 73
    .line 74
    const/4 p2, 0x0

    .line 75
    invoke-virtual {p1, p2}, Ll/f400;->N0(Lcom/p1/mobile/putong/data/Picture;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 81
    .line 82
    .line 83
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->F:Ll/w30;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "e_edit_background"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    new-instance p1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->K1:I

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 54
    .line 55
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->v:I

    .line 60
    .line 61
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    new-instance p2, Ll/w30$b;

    .line 69
    .line 70
    iget-object v0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 71
    .line 72
    invoke-direct {p2, v0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p2, v0}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/i400;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/i400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0, p1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance v0, Ll/j400;

    .line 105
    .line 106
    invoke-direct {v0, p0}, Ll/j400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2}, Ll/w30$b;->F()Ll/w30;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->F:Ll/w30;

    .line 117
    .line 118
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_1
    invoke-virtual {p0}, Ll/iq2;->n()V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final synthetic M(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "e_edit_nickname"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 13
    .line 14
    iget-object p0, p0, Ll/iq2;->b:Ll/f400;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/f400;->x0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;->a2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_message_page_set_nickname"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/SetNicknameAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 43
    .line 44
    const-string p2, "p_chat_view,e_message_page_set_nickname,click"

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 47
    .line 48
    invoke-interface {p1, p0, p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->i6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/h39;->H()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_2

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    iget-boolean p2, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 19
    .line 20
    const-string p2, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 21
    .line 22
    invoke-static {p2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    :goto_0
    const-string p0, "\u5bf9\u65b9\u5df2\u6ce8\u9500"

    .line 39
    .line 40
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object p0, p0, Ll/iq2;->b:Ll/f400;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/f400;->x0()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string v1, "conversation_view"

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    invoke-interface {p2, v0, p0, v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final W(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->G:Z

    .line 14
    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    :cond_1
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->G:Z

    .line 19
    .line 20
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->e:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const/high16 v0, 0x42dc0000    # 110.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p1, p0, p2, v1, v0}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->e:Lv/VDraweeView;

    .line 45
    .line 46
    invoke-static {p2}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const/16 v0, 0x6e

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/nrb0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->g:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 14
    .line 15
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->C0()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->h:Lv/VImage;

    .line 22
    .line 23
    invoke-interface {v0, v1, p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->O()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v2, 0x0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    sget v0, Ll/ibc0;->E6:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    iget-object p1, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    sget v0, Ll/ibc0;->n6:I

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    goto :goto_0

    .line 86
    :cond_2
    move-object p1, v2

    .line 87
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    const/high16 v0, 0x41800000    # 16.0f

    .line 94
    .line 95
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {p1, v1, v1, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->g:Lv/VText;

    .line 107
    .line 108
    invoke-virtual {p0, v2, v2, p1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/User;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->k(Lcom/p1/mobile/putong/data/User;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/h39;->H()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 37
    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 41
    .line 42
    const-string v2, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 43
    .line 44
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    :cond_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->e:Lv/VDraweeView;

    .line 57
    .line 58
    sget v2, Ll/ibc0;->k1:I

    .line 59
    .line 60
    invoke-virtual {p2, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 61
    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isQuickChatClearAvatar(Lcom/p1/mobile/putong/data/User;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->W(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->c()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    const/16 v2, 0x6e

    .line 102
    .line 103
    if-eqz v1, :cond_3

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->e:Lv/VDraweeView;

    .line 120
    .line 121
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-interface {v1, v3, v2, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dc(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_3
    iget-object v1, p0, Ll/iq2;->b:Ll/f400;

    .line 134
    .line 135
    invoke-virtual {v1}, Ll/f400;->u0()Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_4

    .line 140
    .line 141
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->e:Lv/VDraweeView;

    .line 150
    .line 151
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-interface {v1, v3, v2, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dc(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 160
    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_5

    .line 176
    .line 177
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isLoveBuzz()Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_5

    .line 182
    .line 183
    sget-object v1, Ll/nfz;->INSTANCE:Ll/nfz;

    .line 184
    .line 185
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->e:Lv/VDraweeView;

    .line 186
    .line 187
    invoke-static {p1}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-virtual {v1, v3, v2, p2}, Ll/nfz;->a(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 196
    .line 197
    .line 198
    goto :goto_0

    .line 199
    :cond_5
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->W(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    .line 200
    .line 201
    .line 202
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 203
    .line 204
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->D()Z

    .line 209
    .line 210
    .line 211
    move-result p2

    .line 212
    const/4 v1, 0x1

    .line 213
    const/4 v2, 0x0

    .line 214
    if-eqz p2, :cond_6

    .line 215
    .line 216
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 217
    .line 218
    .line 219
    move-result p2

    .line 220
    if-nez p2, :cond_6

    .line 221
    .line 222
    iget-object p2, p0, Ll/iq2;->b:Ll/f400;

    .line 223
    .line 224
    invoke-virtual {p2}, Ll/f400;->C0()Z

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    if-nez p2, :cond_6

    .line 229
    .line 230
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->m:Landroid/widget/RelativeLayout;

    .line 231
    .line 232
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 233
    .line 234
    .line 235
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->m:Landroid/widget/RelativeLayout;

    .line 236
    .line 237
    new-instance v3, Ll/g400;

    .line 238
    .line 239
    invoke-direct {v3, p0}, Ll/g400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 240
    .line 241
    .line 242
    invoke-static {p2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 243
    .line 244
    .line 245
    goto :goto_1

    .line 246
    :cond_6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->m:Landroid/widget/RelativeLayout;

    .line 247
    .line 248
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 249
    .line 250
    .line 251
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 252
    .line 253
    .line 254
    move-result p2

    .line 255
    if-nez p2, :cond_7

    .line 256
    .line 257
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->t:Landroid/widget/RelativeLayout;

    .line 258
    .line 259
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 260
    .line 261
    .line 262
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->u:Lv/VText;

    .line 263
    .line 264
    iget-object v3, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 265
    .line 266
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->v6:I

    .line 267
    .line 268
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v4

    .line 272
    invoke-static {v3, v4}, Ll/f810;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 277
    .line 278
    .line 279
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->t:Landroid/widget/RelativeLayout;

    .line 280
    .line 281
    new-instance v3, Ll/k400;

    .line 282
    .line 283
    invoke-direct {v3, p0, p1}, Ll/k400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;)V

    .line 284
    .line 285
    .line 286
    invoke-static {p2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 287
    .line 288
    .line 289
    :cond_7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->c:Landroid/widget/RelativeLayout;

    .line 290
    .line 291
    new-instance v3, Ll/l400;

    .line 292
    .line 293
    invoke-direct {v3, p0, p1}, Ll/l400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->H(Lcom/p1/mobile/putong/data/User;)V

    .line 300
    .line 301
    .line 302
    invoke-static {}, Ll/h39;->U()Z

    .line 303
    .line 304
    .line 305
    move-result p2

    .line 306
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->j:Landroid/widget/RelativeLayout;

    .line 307
    .line 308
    if-eqz p2, :cond_8

    .line 309
    .line 310
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 311
    .line 312
    .line 313
    iget-object p2, p0, Ll/iq2;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;

    .line 314
    .line 315
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageProfileSettingAct;->pageId()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p2

    .line 319
    const-string v3, "e_search_chat_history"

    .line 320
    .line 321
    invoke-static {v3, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->j:Landroid/widget/RelativeLayout;

    .line 325
    .line 326
    new-instance v3, Ll/m400;

    .line 327
    .line 328
    invoke-direct {v3, p0}, Ll/m400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 329
    .line 330
    .line 331
    invoke-static {p2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 332
    .line 333
    .line 334
    goto :goto_2

    .line 335
    :cond_8
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 336
    .line 337
    .line 338
    :goto_2
    invoke-virtual {p0, p1, v0}, Ll/iq2;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 339
    .line 340
    .line 341
    move-result p2

    .line 342
    if-eqz p2, :cond_9

    .line 343
    .line 344
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->x:Landroid/widget/RelativeLayout;

    .line 345
    .line 346
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 347
    .line 348
    .line 349
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->z:Landroid/widget/RelativeLayout;

    .line 350
    .line 351
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 352
    .line 353
    .line 354
    goto :goto_4

    .line 355
    :cond_9
    invoke-virtual {p0, p1}, Ll/iq2;->f(Lcom/p1/mobile/putong/data/User;)Z

    .line 356
    .line 357
    .line 358
    move-result p2

    .line 359
    if-nez p2, :cond_b

    .line 360
    .line 361
    invoke-static {v0, p1}, Ll/br5;->o(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z

    .line 362
    .line 363
    .line 364
    move-result p2

    .line 365
    if-eqz p2, :cond_a

    .line 366
    .line 367
    goto :goto_3

    .line 368
    :cond_a
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->x:Landroid/widget/RelativeLayout;

    .line 369
    .line 370
    new-instance v3, Ll/n400;

    .line 371
    .line 372
    invoke-direct {v3, p0}, Ll/n400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {p2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 376
    .line 377
    .line 378
    goto :goto_4

    .line 379
    :cond_b
    :goto_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->x:Landroid/widget/RelativeLayout;

    .line 380
    .line 381
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 382
    .line 383
    .line 384
    :goto_4
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 385
    .line 386
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 387
    .line 388
    .line 389
    move-result-object v3

    .line 390
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v3

    .line 394
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 395
    .line 396
    .line 397
    move-result p2

    .line 398
    if-nez p2, :cond_c

    .line 399
    .line 400
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 401
    .line 402
    .line 403
    move-result p2

    .line 404
    if-nez p2, :cond_c

    .line 405
    .line 406
    goto :goto_5

    .line 407
    :cond_c
    move v1, v2

    .line 408
    :goto_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 409
    .line 410
    .line 411
    move-result-object p2

    .line 412
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMatchedByRelationship(Lcom/p1/mobile/putong/data/User;)Z

    .line 413
    .line 414
    .line 415
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 416
    .line 417
    .line 418
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 419
    .line 420
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    move-result p1

    .line 424
    if-eqz p1, :cond_d

    .line 425
    .line 426
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 427
    .line 428
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 429
    .line 430
    iget-object p2, p0, Ll/iq2;->b:Ll/f400;

    .line 431
    .line 432
    invoke-virtual {p2}, Ll/f400;->x0()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object p2

    .line 436
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 437
    .line 438
    .line 439
    :cond_d
    if-eqz v1, :cond_e

    .line 440
    .line 441
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->A:Lv/VText;

    .line 442
    .line 443
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 444
    .line 445
    .line 446
    move-result-object p2

    .line 447
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->w5:I

    .line 448
    .line 449
    invoke-virtual {p2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object p2

    .line 453
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 454
    .line 455
    .line 456
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->z:Landroid/widget/RelativeLayout;

    .line 457
    .line 458
    new-instance p2, Ll/o400;

    .line 459
    .line 460
    invoke-direct {p2, p0}, Ll/o400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 461
    .line 462
    .line 463
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 464
    .line 465
    .line 466
    goto :goto_6

    .line 467
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->z:Landroid/widget/RelativeLayout;

    .line 468
    .line 469
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 470
    .line 471
    .line 472
    :goto_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->B:Landroid/widget/RelativeLayout;

    .line 473
    .line 474
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 475
    .line 476
    .line 477
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->E:Landroid/widget/RelativeLayout;

    .line 478
    .line 479
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 480
    .line 481
    .line 482
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->D:Landroid/widget/RelativeLayout;

    .line 483
    .line 484
    if-nez v1, :cond_f

    .line 485
    .line 486
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 487
    .line 488
    .line 489
    goto :goto_7

    .line 490
    :cond_f
    new-instance p2, Ll/p400;

    .line 491
    .line 492
    invoke-direct {p2, p0}, Ll/p400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 496
    .line 497
    .line 498
    :goto_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->n:Landroid/widget/RelativeLayout;

    .line 499
    .line 500
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 501
    .line 502
    .line 503
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->I(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 504
    .line 505
    .line 506
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->p:Landroid/widget/RelativeLayout;

    .line 507
    .line 508
    new-instance p2, Ll/q400;

    .line 509
    .line 510
    invoke-direct {p2, p0}, Ll/q400;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;)V

    .line 511
    .line 512
    .line 513
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 514
    .line 515
    .line 516
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->g:Lv/VText;

    .line 517
    .line 518
    invoke-static {}, Ll/bnl0;->y0()I

    .line 519
    .line 520
    .line 521
    move-result p1

    .line 522
    const/high16 p2, 0x42700000    # 60.0f

    .line 523
    .line 524
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 525
    .line 526
    .line 527
    move-result p2

    .line 528
    mul-int/lit8 p2, p2, 0x2

    .line 529
    .line 530
    sub-int/2addr p1, p2

    .line 531
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 532
    .line 533
    .line 534
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public i(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->s:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string v1, "\u5df2\u5f00\u542f"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v1, "\u5df2\u5173\u95ed"

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->s:Lv/VText;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->q:Landroid/view/View;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->H:Ll/jxd0;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x1

    .line 37
    xor-int/2addr v1, v2

    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->I:Z

    .line 42
    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->I:Z

    .line 46
    .line 47
    const-string p0, "is_special_remind_on"

    .line 48
    .line 49
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {p0}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "e_special_remind_entrance"

    .line 62
    .line 63
    const-string v0, "p_chat_setting"

    .line 64
    .line 65
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->g:Lv/VText;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->g:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    invoke-static {}, Ll/h39;->H()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 60
    .line 61
    const-string v0, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 62
    .line 63
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->g:Lv/VText;

    .line 74
    .line 75
    const-string p1, "\u6635\u79f0\u5df2\u91cd\u7f6e"

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->g:Lv/VText;

    .line 82
    .line 83
    const-string p1, "\u5df2\u6ce8\u9500"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    return-void
.end method

.method public l(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->A:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/h39;->P()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const-string v1, "\u7184\u706d\u4fe1\u53f7"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->w5:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->x:Landroid/widget/RelativeLayout;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->m:Landroid/widget/RelativeLayout;

    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->p:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/MessageProfileSettingViewModel;->C:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->k2:I

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->H2:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
