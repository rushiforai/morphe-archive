.class public Ll/eaf0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/kaf0;",
        ">;"
    }
.end annotation


# static fields
.field public static b:Ll/jxd0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "NEW_UI_1_FEEDBACK_CLICKED"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/eaf0;->b:Ll/jxd0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 5
    .line 6
    return-void
.end method

.method private I0(Ljava/lang/Class;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-class v2, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    const-string v1, "fragmentName"

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic e0(Ll/eaf0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eaf0;->j0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/eaf0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eaf0;->l0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "fake_risk_audit_default_"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic h0(Ll/eaf0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eaf0;->k0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic j0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/kaf0;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Ll/kaf0;->E(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/kaf0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/kaf0;->r()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic k0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public A0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v2, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 12
    .line 13
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public C0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "wechat-moments"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "menu"

    .line 20
    .line 21
    invoke-static {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->D1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/util/ArrayList;)Lrx/c;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public D0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "e_surprisebox_navigation"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/gra;->M2()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Landroid/content/Intent;

    .line 19
    .line 20
    iget-object v1, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 21
    .line 22
    const-class v2, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 25
    .line 26
    .line 27
    const-string v1, "extra_show_surprise_box_dialog"

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public E0()V
    .locals 2

    .line 1
    const-string v0, "e_task_entrance"

    .line 2
    .line 3
    const-string v1, "p_my_page"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public F0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "e_avatarVerification_main_entrance_click"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public G0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, p0, v1}, Ll/ftn0;->r(Landroid/content/Context;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public H0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v1, v1, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v2, "e_wallet"

    .line 11
    .line 12
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinAct;->Y1(Landroid/content/Context;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public J0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/xxv;->u()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/xxv;->t()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/aw90;->N()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final L0()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/settings/b;->m2:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 20
    .line 21
    if-ne p0, v0, :cond_0

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

.method public N0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/eaf0;->J0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->D2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/eaf0;->L0()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public O0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U1:Ll/fg7;

    .line 4
    .line 5
    iget-object v0, v0, Ll/fg7;->R:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/kaf0;

    .line 15
    .line 16
    const/16 v1, 0xc

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/kaf0;->B(IZ)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ll/eu4;->d(Lcom/p1/mobile/android/app/Act;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "e_my_chat_assist_entrance"

    .line 32
    .line 33
    const-string v0, "p_my_page"

    .line 34
    .line 35
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/aaf0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/aaf0;-><init>(Ll/eaf0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/baf0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/baf0;-><init>(Ll/eaf0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/gra;->z()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/caf0;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/caf0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/daf0;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/daf0;-><init>(Ll/eaf0;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    :cond_0
    invoke-virtual {p0}, Ll/eaf0;->i0()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i0()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/kaf0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/kaf0;->z(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 2
    .line 3
    new-instance v1, Landroid/content/Intent;

    .line 4
    .line 5
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 6
    .line 7
    const-class v2, Lcom/p1/mobile/putong/core/ui/settings/AboutTantanAct;

    .line 8
    .line 9
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public n0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o1:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    const-string v0, "e_mypage_checkin"

    .line 13
    .line 14
    const-string v1, "p_my_page"

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/kaf0;

    .line 22
    .line 23
    const/16 v0, 0xa

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p0, v0, v1}, Ll/kaf0;->B(IZ)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public o0()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v1, "e_presentwall"

    .line 11
    .line 12
    invoke-static {v1, p0, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public p0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v1, v1, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v2, "e_my_group_chat"

    .line 11
    .line 12
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v1, ""

    .line 24
    .line 25
    invoke-static {}, Ll/jek;->p()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {p0, v1, v2}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public q0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_my_chat_assist_entrance"

    .line 5
    .line 6
    const-string v2, "p_my_page"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/ebm;->a()Ll/ebm;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Ll/ebm;->h:Ll/jxd0;

    .line 16
    .line 17
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v1, ""

    .line 29
    .line 30
    invoke-static {}, Ll/ebm;->b()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {p0, v1, v2}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public r0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->n1:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/kaf0;

    .line 15
    .line 16
    const/16 v0, 0x8

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p0, v0, v1}, Ll/kaf0;->B(IZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public s0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Z8(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "oms_trace"

    .line 8
    .line 9
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    filled-new-array {p2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v1, "e_oms_slot"

    .line 18
    .line 19
    invoke-static {v1, v0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p0, p1}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public u0()V
    .locals 10

    .line 1
    const-string v0, "e_opening_entrance"

    .line 2
    .line 3
    const-string v1, "p_my_page"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->G1:Ll/jxd0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    xor-int/lit8 p0, p0, 0x1

    .line 27
    .line 28
    invoke-static {p0}, Ll/hcm;->p(Z)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    const/4 v8, 0x1

    .line 33
    const/4 v9, 0x0

    .line 34
    const-string v3, ""

    .line 35
    .line 36
    const/4 v5, 0x1

    .line 37
    const/4 v6, 0x1

    .line 38
    const/4 v7, 0x1

    .line 39
    invoke-static/range {v2 .. v9}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->g2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->G1:Ll/jxd0;

    .line 51
    .line 52
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public x0()V
    .locals 2

    .line 1
    new-instance v0, Ll/dtf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/dtf0;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ll/dtf0;->a()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/eaf0;->y0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final y0()V
    .locals 3

    .line 1
    sget-object v0, Ll/eaf0;->b:Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/kaf0;

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Ll/kaf0;->B(IZ)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->finish()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public z0(Z)V
    .locals 6

    .line 1
    const-string v0, "e_red_dot_me_settings"

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/eaf0;->J0()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const-string v1, "navigation_view_page"

    .line 10
    .line 11
    const-string v2, "setting_tab"

    .line 12
    .line 13
    const-string v3, "red_dot_normal"

    .line 14
    .line 15
    const-string v4, "red_dot"

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string p1, "no_location_permission_tips"

    .line 20
    .line 21
    invoke-static {v4, v3, v2, v1, p1}, Ll/i6e;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v1, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p1, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v5, "sub_page_unread"

    .line 42
    .line 43
    invoke-static {v4, v3, v2, v1, v5}, Ll/i6e;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v0, p1, v1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object p1, p0, Ll/eaf0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipActivity;->pageId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {}, Ll/i6e;->d()Ljava/util/Map;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v0, p1, v1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    invoke-virtual {p0}, Ll/eaf0;->J0()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const/4 v0, 0x1

    .line 75
    invoke-virtual {p1, v0}, Ll/aw90;->p0(Z)V

    .line 76
    .line 77
    .line 78
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 79
    .line 80
    check-cast p1, Ll/kaf0;

    .line 81
    .line 82
    const/4 v0, 0x0

    .line 83
    invoke-virtual {p0}, Ll/eaf0;->N0()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    invoke-virtual {p1, v0, v1}, Ll/kaf0;->B(IZ)V

    .line 88
    .line 89
    .line 90
    const-class p1, Lcom/p1/mobile/putong/core/ui/settings/SettingsFragOld;

    .line 91
    .line 92
    invoke-direct {p0, p1}, Ll/eaf0;->I0(Ljava/lang/Class;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
