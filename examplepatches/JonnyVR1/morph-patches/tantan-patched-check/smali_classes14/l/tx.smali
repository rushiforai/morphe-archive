.class public Ll/tx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zw;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/zw;

.field public B:I

.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VText;

.field public d:Lv/VProgressBar;

.field public e:Lv/VScroll;

.field public f:Lv/VFrame;

.field public g:Lv/VLinear;

.field public h:Lv/VText;

.field public i:Landroid/widget/ImageView;

.field public j:Lv/VLinear;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VFrame;

.field public n:Lv/VLinear;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VLinear;

.field public r:Lv/VText;

.field public s:Lv/VFrame;

.field public t:Lv/VLinear;

.field public u:Lv/VFrame;

.field public v:Lv/VLinear;

.field public w:Lv/VLinear;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/tx;->B:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/tx;->z:Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 8
    .line 9
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

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

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tx;->A:Ll/zw;

    .line 2
    .line 3
    const-class p1, Lcom/p1/mobile/putong/core/ui/account/PasswordVerificationAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zw;->t0(Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tx;->A:Ll/zw;

    .line 2
    .line 3
    const-class p1, Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zw;->t0(Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_0

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string v1, "bind_mobile"

    .line 84
    .line 85
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_0
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string v1, "change-phone"

    .line 110
    .line 111
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_account_and_security_view_delete_account"

    .line 2
    .line 3
    const-string v0, "p_account_and_security_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/tx;->A:Ll/zw;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;->Z1(Lcom/p1/mobile/android/app/Act;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ll/zw;->s0(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_auto_renew_subscriptions_management"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/tx;->A:Ll/zw;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->getSubscriptionsActClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/zw;->t0(Ljava/lang/Class;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Ll/tx;->B:I

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/tx;->A:Ll/zw;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v1, "bind_mobile"

    .line 16
    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Ll/zw;->s0(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 v0, 0x1

    .line 30
    if-ne p1, v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Landroid/content/Intent;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-class v1, Lcom/p1/mobile/putong/core/ui/account/PasswordVerificationAct;

    .line 43
    .line 44
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public static synthetic a(Ll/tx;ZLcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tx;->O(ZLcom/p1/mobile/putong/data/Settings;)V

    return-void
.end method

.method public static synthetic b(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tx;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tx;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tx;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Settings;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic f(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tx;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tx;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Settings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tx;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tx;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tx;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tx;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tx;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ll/tx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tx;->H(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic s(Ll/tx;)Ll/zw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tx;->A:Ll/zw;

    return-object p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/data/User;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/tx;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->o3:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/tx;->b:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    new-instance v1, Ll/ix;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ix;-><init>(Ll/tx;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/tx;->o:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->u3:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/tx;->s:Lv/VFrame;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 48
    .line 49
    const-string v2, "facebook"

    .line 50
    .line 51
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const-string v3, "qq"

    .line 56
    .line 57
    const-string v4, "wechat"

    .line 58
    .line 59
    const-string v5, "google"

    .line 60
    .line 61
    const/4 v6, 0x1

    .line 62
    if-nez v0, :cond_1

    .line 63
    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 65
    .line 66
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 73
    .line 74
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_1

    .line 79
    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 81
    .line 82
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_1

    .line 87
    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 89
    .line 90
    const-string v7, "china-mobile"

    .line 91
    .line 92
    invoke-static {v0, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iget-object v7, p0, Ll/tx;->f:Lv/VFrame;

    .line 97
    .line 98
    if-eqz v0, :cond_0

    .line 99
    .line 100
    invoke-static {v7, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_0
    invoke-static {v7, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/tx;->g:Lv/VLinear;

    .line 108
    .line 109
    new-instance v7, Ll/jx;

    .line 110
    .line 111
    invoke-direct {v7, p0}, Ll/jx;-><init>(Ll/tx;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v7}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    :goto_0
    iget-object v0, p0, Ll/tx;->n:Lv/VLinear;

    .line 118
    .line 119
    new-instance v7, Ll/kx;

    .line 120
    .line 121
    invoke-direct {v7, p0}, Ll/kx;-><init>(Ll/tx;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v7}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 129
    .line 130
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_3

    .line 135
    .line 136
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 137
    .line 138
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_2

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_2
    iget-object v0, p0, Ll/tx;->f:Lv/VFrame;

    .line 146
    .line 147
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Ll/tx;->m:Lv/VFrame;

    .line 151
    .line 152
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 153
    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/tx;->f:Lv/VFrame;

    .line 157
    .line 158
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/tx;->i:Landroid/widget/ImageView;

    .line 162
    .line 163
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ll/tx;->m:Lv/VFrame;

    .line 167
    .line 168
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/tx;->h:Lv/VText;

    .line 172
    .line 173
    const-string v7, ""

    .line 174
    .line 175
    invoke-static {v0, v7}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Ll/tx;->g:Lv/VLinear;

    .line 179
    .line 180
    new-instance v7, Ll/lx;

    .line 181
    .line 182
    invoke-direct {v7, p0}, Ll/lx;-><init>(Ll/tx;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0, v7}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    .line 187
    .line 188
    :goto_2
    const-string v0, "e_account_and_security_view_delete_account"

    .line 189
    .line 190
    const-string v7, "p_account_and_security_view"

    .line 191
    .line 192
    invoke-static {v0, v7}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xi()Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_4

    .line 208
    .line 209
    iget-object v0, p0, Ll/tx;->q:Lv/VLinear;

    .line 210
    .line 211
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Ll/tx;->w:Lv/VLinear;

    .line 215
    .line 216
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Ll/tx;->x:Lv/VText;

    .line 220
    .line 221
    const-string v7, "\u6ce8\u9500\u5e76\u975e\u9000\u51fa\u767b\u5f55"

    .line 222
    .line 223
    filled-new-array {v7}, [Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v7

    .line 227
    invoke-static {v7}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 228
    .line 229
    .line 230
    move-result-object v7

    .line 231
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 232
    .line 233
    .line 234
    move-result-object v8

    .line 235
    invoke-virtual {v8}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 236
    .line 237
    .line 238
    move-result-object v8

    .line 239
    sget v9, Ll/j9c0;->f:I

    .line 240
    .line 241
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    .line 242
    .line 243
    .line 244
    move-result v8

    .line 245
    sget-object v9, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 246
    .line 247
    const-string v10, "\u6ce8\u9500\u540e\u60a8\u5728\u672c\u8d26\u53f7\u4e0a\u7684\u6240\u6709\u914d\u5bf9\u3001\u6d88\u606f\u3001\u7279\u6743\u5c06\u6c38\u4e45\u6d88\u5931\u3002\u6ce8\u9500\u5e76\u975e\u9000\u51fa\u767b\u5f55"

    .line 248
    .line 249
    invoke-static {v10, v7, v8, v9}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 250
    .line 251
    .line 252
    move-result-object v7

    .line 253
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 254
    .line 255
    .line 256
    iget-object v0, p0, Ll/tx;->y:Lv/VText;

    .line 257
    .line 258
    new-instance v7, Ll/mx;

    .line 259
    .line 260
    invoke-direct {v7, p0}, Ll/mx;-><init>(Ll/tx;)V

    .line 261
    .line 262
    .line 263
    invoke-static {v0, v7}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 264
    .line 265
    .line 266
    :cond_4
    iget-object v0, p0, Ll/tx;->q:Lv/VLinear;

    .line 267
    .line 268
    new-instance v7, Ll/tx$a;

    .line 269
    .line 270
    invoke-direct {v7, p0}, Ll/tx$a;-><init>(Ll/tx;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v0, v7}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;->pageId()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    const-string v7, "e_auto_renew_subscriptions_management"

    .line 285
    .line 286
    invoke-static {v7, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Ll/tx;->t:Lv/VLinear;

    .line 290
    .line 291
    new-instance v7, Ll/nx;

    .line 292
    .line 293
    invoke-direct {v7, p0}, Ll/nx;-><init>(Ll/tx;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v0, v7}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 297
    .line 298
    .line 299
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->i()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_5

    .line 304
    .line 305
    iget-object v0, p0, Ll/tx;->r:Lv/VText;

    .line 306
    .line 307
    sget v7, Lcom/p1/mobile/putong/core/profile/R$string;->M0:I

    .line 308
    .line 309
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(I)V

    .line 310
    .line 311
    .line 312
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 313
    .line 314
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    const-string v2, "indonesia"

    .line 319
    .line 320
    if-eqz v0, :cond_6

    .line 321
    .line 322
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 323
    .line 324
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    if-eqz v0, :cond_6

    .line 329
    .line 330
    invoke-virtual {p0, p1}, Ll/tx;->B(Lcom/p1/mobile/putong/data/User;)Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-eqz v0, :cond_6

    .line 335
    .line 336
    move v0, v6

    .line 337
    goto :goto_3

    .line 338
    :cond_6
    move v0, v1

    .line 339
    :goto_3
    iget-object v7, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 340
    .line 341
    invoke-static {v7, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 342
    .line 343
    .line 344
    move-result v5

    .line 345
    if-eqz v5, :cond_7

    .line 346
    .line 347
    sget-object v5, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 348
    .line 349
    invoke-static {v5, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 350
    .line 351
    .line 352
    move-result v2

    .line 353
    if-eqz v2, :cond_7

    .line 354
    .line 355
    invoke-virtual {p0, p1}, Ll/tx;->B(Lcom/p1/mobile/putong/data/User;)Z

    .line 356
    .line 357
    .line 358
    move-result v2

    .line 359
    if-eqz v2, :cond_7

    .line 360
    .line 361
    goto :goto_4

    .line 362
    :cond_7
    move v6, v1

    .line 363
    :goto_4
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 364
    .line 365
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 366
    .line 367
    .line 368
    move-result v2

    .line 369
    if-nez v2, :cond_9

    .line 370
    .line 371
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 372
    .line 373
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 374
    .line 375
    .line 376
    move-result p1

    .line 377
    if-nez p1, :cond_9

    .line 378
    .line 379
    if-nez v0, :cond_9

    .line 380
    .line 381
    if-eqz v6, :cond_8

    .line 382
    .line 383
    goto :goto_5

    .line 384
    :cond_8
    iget-object p0, p0, Ll/tx;->j:Lv/VLinear;

    .line 385
    .line 386
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 387
    .line 388
    .line 389
    return-void

    .line 390
    :cond_9
    :goto_5
    iget-object p1, p0, Ll/tx;->g:Lv/VLinear;

    .line 391
    .line 392
    new-instance v1, Ll/bx;

    .line 393
    .line 394
    invoke-direct {v1, p0}, Ll/bx;-><init>(Ll/tx;)V

    .line 395
    .line 396
    .line 397
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 398
    .line 399
    .line 400
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 401
    .line 402
    .line 403
    move-result-object p1

    .line 404
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 405
    .line 406
    .line 407
    move-result-object v1

    .line 408
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me()Lrx/c;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    new-instance v2, Ll/cx;

    .line 413
    .line 414
    invoke-direct {v2}, Ll/cx;-><init>()V

    .line 415
    .line 416
    .line 417
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 418
    .line 419
    .line 420
    move-result-object v1

    .line 421
    new-instance v2, Ll/dx;

    .line 422
    .line 423
    invoke-direct {v2}, Ll/dx;-><init>()V

    .line 424
    .line 425
    .line 426
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 427
    .line 428
    .line 429
    move-result-object v1

    .line 430
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 431
    .line 432
    .line 433
    move-result-object p1

    .line 434
    new-instance v1, Ll/ex;

    .line 435
    .line 436
    invoke-direct {v1, p0, v0}, Ll/ex;-><init>(Ll/tx;Z)V

    .line 437
    .line 438
    .line 439
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 440
    .line 441
    .line 442
    move-result-object p0

    .line 443
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 444
    .line 445
    .line 446
    return-void
.end method

.method public final B(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_2

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return v0

    .line 31
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public final synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tx;->A:Ll/zw;

    .line 2
    .line 3
    const-class p1, Lcom/p1/mobile/putong/core/ui/account/PasswordChangeAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zw;->t0(Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tx;->z:Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/tx;->A:Ll/zw;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "change-phone"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Ll/zw;->s0(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic F(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/tx;->A:Ll/zw;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "bind_mobile"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Ll/zw;->s0(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/tx;->A:Ll/zw;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "change-phone"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Ll/zw;->s0(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic O(ZLcom/p1/mobile/putong/data/Settings;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/tx;->f:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/tx;->f:Lv/VFrame;

    .line 8
    .line 9
    const/high16 v2, 0x41000000    # 8.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/tx;->g:Lv/VLinear;

    .line 19
    .line 20
    const/high16 v2, 0x42700000    # 60.0f

    .line 21
    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/tx;->j:Lv/VLinear;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/tx;->k:Lv/VText;

    .line 35
    .line 36
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->w3:I

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/tx;->h:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    sget v3, Ll/j9c0;->k:I

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const-string v2, " "

    .line 65
    .line 66
    const-string v3, "+"

    .line 67
    .line 68
    const/4 v4, 0x0

    .line 69
    if-nez v0, :cond_0

    .line 70
    .line 71
    iput v1, p0, Ll/tx;->B:I

    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p2, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 79
    .line 80
    iget v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 89
    .line 90
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p2}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    iget-object v0, p0, Ll/tx;->h:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget-object p2, p0, Ll/tx;->l:Lv/VText;

    .line 109
    .line 110
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->x3:I

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Ll/tx;->l:Lv/VText;

    .line 116
    .line 117
    sget v0, Ll/kbc0;->v:I

    .line 118
    .line 119
    invoke-virtual {p2, v0, v4, v4, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 120
    .line 121
    .line 122
    iget-object p2, p0, Ll/tx;->l:Lv/VText;

    .line 123
    .line 124
    const-string v0, "#54c6fc"

    .line 125
    .line 126
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Ll/tx;->l:Lv/VText;

    .line 134
    .line 135
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    sget v1, Ll/kbc0;->o0:I

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 146
    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 150
    .line 151
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_1

    .line 158
    .line 159
    const/4 v0, 0x2

    .line 160
    iput v0, p0, Ll/tx;->B:I

    .line 161
    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-object v1, p2, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 168
    .line 169
    iget v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 178
    .line 179
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 180
    .line 181
    invoke-static {p2}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    iget-object v0, p0, Ll/tx;->h:Lv/VText;

    .line 193
    .line 194
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 195
    .line 196
    .line 197
    iget-object p2, p0, Ll/tx;->l:Lv/VText;

    .line 198
    .line 199
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->y3:I

    .line 200
    .line 201
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 202
    .line 203
    .line 204
    iget-object p2, p0, Ll/tx;->l:Lv/VText;

    .line 205
    .line 206
    sget v0, Ll/kbc0;->u:I

    .line 207
    .line 208
    invoke-virtual {p2, v0, v4, v4, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 209
    .line 210
    .line 211
    iget-object p2, p0, Ll/tx;->l:Lv/VText;

    .line 212
    .line 213
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    sget v1, Ll/j9c0;->g:I

    .line 222
    .line 223
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 228
    .line 229
    .line 230
    iget-object p2, p0, Ll/tx;->l:Lv/VText;

    .line 231
    .line 232
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    sget v1, Ll/kbc0;->n0:I

    .line 237
    .line 238
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 243
    .line 244
    .line 245
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 246
    .line 247
    iget-object p1, p0, Ll/tx;->g:Lv/VLinear;

    .line 248
    .line 249
    invoke-static {p1, v4}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 250
    .line 251
    .line 252
    iget-object p0, p0, Ll/tx;->i:Landroid/widget/ImageView;

    .line 253
    .line 254
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 255
    .line 256
    .line 257
    :cond_2
    return-void
.end method

.method public final P(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tx;->g:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/tx;->i:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/tx;->f:Lv/VFrame;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/tx;->x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/tx;->h:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

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
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tx;->w(Ll/zw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tx;->u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ux;->b(Ll/tx;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tx;->z:Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ll/zw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tx;->A:Ll/zw;

    .line 2
    .line 3
    return-void
.end method

.method public final x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    const-string v2, " "

    .line 18
    .line 19
    const-string v3, "+"

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    new-instance p0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 29
    .line 30
    iget v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p1}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_1
    iget-object p0, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_2

    .line 65
    .line 66
    new-instance p0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 74
    .line 75
    iget v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p1}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0

    .line 101
    :cond_2
    return-object v0
.end method

.method public y(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tx;->e:Lv/VScroll;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x4

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/tx;->e:Lv/VScroll;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/tx;->d:Lv/VProgressBar;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 22
    .line 23
    const-string v2, "wechat"

    .line 24
    .line 25
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v2, 0x1

    .line 30
    if-nez v0, :cond_5

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 33
    .line 34
    const-string v3, "qq"

    .line 35
    .line 36
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0, p1}, Ll/tx;->x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/tx;->x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v1, p0, Ll/tx;->h:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object v0, p0, Ll/tx;->h:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    sget v3, Ll/j9c0;->m:I

    .line 69
    .line 70
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/tx;->f:Lv/VFrame;

    .line 78
    .line 79
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 83
    .line 84
    const-string v1, "facebook"

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_3

    .line 91
    .line 92
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 93
    .line 94
    const-string v1, "google"

    .line 95
    .line 96
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    :cond_3
    invoke-virtual {p0, p1}, Ll/tx;->B(Lcom/p1/mobile/putong/data/User;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 109
    .line 110
    const-string v1, "indonesia"

    .line 111
    .line 112
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_4

    .line 117
    .line 118
    invoke-virtual {p0, p1}, Ll/tx;->P(Lcom/p1/mobile/putong/data/User;)V

    .line 119
    .line 120
    .line 121
    :cond_4
    return-void

    .line 122
    :cond_5
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 123
    .line 124
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_6

    .line 129
    .line 130
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 133
    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_6

    .line 141
    .line 142
    iget-object v0, p0, Ll/tx;->m:Lv/VFrame;

    .line 143
    .line 144
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/tx;->n:Lv/VLinear;

    .line 148
    .line 149
    new-instance v1, Ll/ax;

    .line 150
    .line 151
    invoke-direct {v1, p0}, Ll/ax;-><init>(Ll/tx;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_6
    iget-object v0, p0, Ll/tx;->m:Lv/VFrame;

    .line 159
    .line 160
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    :goto_1
    iget-object v0, p0, Ll/tx;->f:Lv/VFrame;

    .line 164
    .line 165
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 169
    .line 170
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 171
    .line 172
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    iget-object v1, p0, Ll/tx;->h:Lv/VText;

    .line 179
    .line 180
    if-eqz v0, :cond_8

    .line 181
    .line 182
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->s4:I

    .line 187
    .line 188
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Ll/tx;->h:Lv/VText;

    .line 196
    .line 197
    const-string v1, "#d75842"

    .line 198
    .line 199
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 204
    .line 205
    .line 206
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 207
    .line 208
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 209
    .line 210
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 211
    .line 212
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    iget-object v0, p0, Ll/tx;->g:Lv/VLinear;

    .line 217
    .line 218
    if-nez p1, :cond_7

    .line 219
    .line 220
    new-instance p1, Ll/fx;

    .line 221
    .line 222
    invoke-direct {p1, p0}, Ll/fx;-><init>(Ll/tx;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v0, p1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_7
    new-instance p1, Ll/gx;

    .line 230
    .line 231
    invoke-direct {p1, p0}, Ll/gx;-><init>(Ll/tx;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0, p1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    :cond_8
    invoke-virtual {p0}, Ll/tx;->v()Lcom/p1/mobile/putong/core/ui/account/AccountSecureAct;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    sget v2, Ll/j9c0;->m:I

    .line 243
    .line 244
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Ll/tx;->g:Lv/VLinear;

    .line 252
    .line 253
    new-instance v1, Ll/hx;

    .line 254
    .line 255
    invoke-direct {v1, p0}, Ll/hx;-><init>(Ll/tx;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 259
    .line 260
    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    const-string v1, "+"

    .line 264
    .line 265
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 269
    .line 270
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 271
    .line 272
    iget v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 273
    .line 274
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string v1, " "

    .line 278
    .line 279
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 283
    .line 284
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 285
    .line 286
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 287
    .line 288
    invoke-static {p1}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    iget-object p0, p0, Ll/tx;->h:Lv/VText;

    .line 300
    .line 301
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 302
    .line 303
    .line 304
    return-void
.end method
