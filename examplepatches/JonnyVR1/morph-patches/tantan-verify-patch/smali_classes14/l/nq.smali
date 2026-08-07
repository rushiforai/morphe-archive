.class public Ll/nq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zp;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

.field public g:Ll/zp;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nq;->f:Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 5
    .line 6
    return-void
.end method

.method private synthetic A(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "moment"

    .line 14
    .line 15
    invoke-interface {p2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->pageId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->a2(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "delete_account_reason_block_page"

    .line 35
    .line 36
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    filled-new-array {p0}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "e_delete_account_block_jump"

    .line 45
    .line 46
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private synthetic B(Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->p3:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "feedback-mobile/form?from=suggest"

    .line 20
    .line 21
    invoke-static {v2}, Lcom/p1/mobile/putong/core/api/a;->M(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->pageId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->a2(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "delete_account_reason_block_page"

    .line 56
    .line 57
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    filled-new-array {p0}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "e_delete_account_block_jump"

    .line 66
    .line 67
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public static synthetic a(Ll/nq;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nq;->I()V

    return-void
.end method

.method public static synthetic b(Ll/nq;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nq;->y(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/nq;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nq;->z(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/nq;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nq;->x(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/nq;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nq;->G(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/nq;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nq;->H(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Ll/nq;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/nq;->A(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/nq;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nq;->F(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/nq;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/nq;->B(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/nq;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nq;->C(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/nq;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nq;->E(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/nq;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nq;->w(Landroid/view/View;)V

    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

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


# virtual methods
.method public final synthetic C(Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->p3:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "feedback-mobile/form?from=vip_complaint"

    .line 20
    .line 21
    invoke-static {v2}, Lcom/p1/mobile/putong/core/api/a;->M(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->pageId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->a2(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "delete_account_reason_block_page"

    .line 56
    .line 57
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    filled-new-array {p0}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "e_delete_account_block_jump"

    .line 66
    .line 67
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nq;->f:Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E(Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 24
    .line 25
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 40
    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 42
    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_0

    .line 50
    .line 51
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 62
    .line 63
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_0

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const-string v2, "bind_mobile"

    .line 84
    .line 85
    invoke-static {v2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    const-string v2, "change-phone"

    .line 110
    .line 111
    invoke-static {v2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    .line 121
    .line 122
    :goto_0
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->pageId()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->a2(Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    const-string p1, "delete_account_reason_block_page"

    .line 146
    .line 147
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    filled-new-array {p0}, [Ll/pf60;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    const-string p1, "e_delete_account_block_jump"

    .line 156
    .line 157
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public final synthetic F(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "cards"

    .line 14
    .line 15
    invoke-interface {p2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->pageId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->a2(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "delete_account_reason_block_page"

    .line 35
    .line 36
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    filled-new-array {p0}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "e_delete_account_block_jump"

    .line 45
    .line 46
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic G(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->a2(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "delete_account_reason_block_page"

    .line 18
    .line 19
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {p1}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "e_delete_account_block_delete"

    .line 28
    .line 29
    invoke-static {v0, p3, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ll/nq;->J(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic H(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "e_delete_account_delete_click"

    .line 2
    .line 3
    const-string v1, "p_delete_account_tips_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Ll/nq;->g:Ll/zp;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/zp;->f0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Ll/nq;->g:Ll/zp;

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/zp;->g0()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-static {v1, p1, v2, v3}, Lcom/p1/mobile/putong/core/ui/account/DeleteAccountInactiveAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic I()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public J(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_delete_account_tips_popup"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "tooltips_trigger_mode"

    .line 16
    .line 17
    const-string v2, "active"

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    filled-new-array {v1}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const/4 v2, 0x3

    .line 43
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->w(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "\u8bf7\u6ce8\u610f"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v2, "1. \u6ce8\u9500\u8d26\u6237\u540e\uff0c\u60a8\u5c06\u6c38\u4e45\u5931\u53bb\u8be5\u8d26\u6237\u7684\u6240\u6709\u804a\u5929\u8bb0\u5f55\u3001\u914d\u5bf9\u3001\u4e2a\u4eba\u8d44\u6599\u3001\u52a8\u6001\u7b49\uff0c\u4e14\u65e0\u6cd5\u6062\u590d\uff0c\u8bf7\u8c28\u614e\u64cd\u4f5c\u3002\n2. \u60a8\u7684 VIP \u7279\u6743\u3001SVIP \u7279\u6743\u53ca\u670d\u52a1\u6709\u6548\u671f\u5c06\u4f5c\u5e9f\uff1b\u60a8\u94b1\u5305\u5185\u7684\u5269\u4f59\u4f59\u989d\u5c06\u4f5c\u5e9f\uff08\u5305\u62ec\u63a2\u63a2\u5e01\u4f59\u989d\u3001\u76f4\u64ad\u6536\u5165\u7b49\uff0c\u5176\u4e2d\u63a2\u63a2\u5e01\u4e0d\u53ef\u63d0\u73b0\uff0c\u60a8\u53ef\u4ee5\u8fdb\u884c\u6d88\u8d39\u540e\u518d\u6ce8\u9500\uff0c\u6216\u8005\u76f4\u63a5\u820d\u5f03\uff09\uff1b\u8d2d\u4e70\u7684\u589e\u503c\u670d\u52a1\uff08\u5305\u62ec\u8d85\u7ea7\u559c\u6b22\u3001\u8d85\u7ea7\u66dd\u5149\u3001\u95ea\u804a\u6b21\u6570\u7b49\uff09\u5c06\u4f5c\u5e9f\u3002\n3. App Store\u81ea\u52a8\u7eed\u8d39\u7528\u6237\u8bf7\u5728iTunes\u5546\u5e97\u5185\u624b\u52a8\u53d6\u6d88\u7eed\u8d39\u670d\u52a1\uff0c\u5176\u4ed6\u81ea\u52a8\u7eed\u8d39\u7528\u6237\u5c06\u5728\u6ce8\u9500\u540e\u81ea\u52a8\u5173\u95ed\u7eed\u8d39\u670d\u52a1\u3002"

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/4 v2, 0x1

    .line 60
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/bq;

    .line 65
    .line 66
    invoke-direct {v2, v0}, Ll/bq;-><init>(Ll/l4g0;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    new-instance v2, Ll/cq;

    .line 74
    .line 75
    invoke-direct {v2, p0, p1}, Ll/cq;-><init>(Ll/nq;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    const-string p1, "\u786e\u5b9a"

    .line 79
    .line 80
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v1, Ll/dq;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/dq;-><init>(Ll/nq;)V

    .line 87
    .line 88
    .line 89
    const-string p0, "\u53d6\u6d88"

    .line 90
    .line 91
    invoke-virtual {p1, p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 100
    .line 101
    .line 102
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

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
    check-cast p1, Ll/zp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nq;->u(Ll/zp;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nq;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oq;->b(Ll/nq;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nq;->f:Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Ll/zp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nq;->g:Ll/zp;

    .line 2
    .line 3
    return-void
.end method

.method public v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/nq;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->m0:I

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
    iget-object v0, p0, Ll/nq;->a:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    new-instance v1, Ll/aq;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/aq;-><init>(Ll/nq;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/nq;->b:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    const/4 v0, 0x1

    .line 39
    const/4 v1, -0x1

    .line 40
    sparse-switch p2, :sswitch_data_0

    .line 41
    .line 42
    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :sswitch_0
    const-string p2, "reason_no_people_can_talk_to"

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-nez p2, :cond_0

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :cond_0
    const/16 v1, 0x17

    .line 56
    .line 57
    goto/16 :goto_0

    .line 58
    .line 59
    :sswitch_1
    const-string p2, "reason_got_harass"

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p2, :cond_1

    .line 66
    .line 67
    goto/16 :goto_0

    .line 68
    .line 69
    :cond_1
    const/16 v1, 0x16

    .line 70
    .line 71
    goto/16 :goto_0

    .line 72
    .line 73
    :sswitch_2
    const-string p2, "reason_crash_frequently"

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-nez p2, :cond_2

    .line 80
    .line 81
    goto/16 :goto_0

    .line 82
    .line 83
    :cond_2
    const/16 v1, 0x15

    .line 84
    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :sswitch_3
    const-string p2, "reason_hang_seriously"

    .line 88
    .line 89
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-nez p2, :cond_3

    .line 94
    .line 95
    goto/16 :goto_0

    .line 96
    .line 97
    :cond_3
    const/16 v1, 0x14

    .line 98
    .line 99
    goto/16 :goto_0

    .line 100
    .line 101
    :sswitch_4
    const-string p2, "reason_suggested_same_person"

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    if-nez p2, :cond_4

    .line 108
    .line 109
    goto/16 :goto_0

    .line 110
    .line 111
    :cond_4
    const/16 v1, 0x13

    .line 112
    .line 113
    goto/16 :goto_0

    .line 114
    .line 115
    :sswitch_5
    const-string p2, "reason_picture_embezzled"

    .line 116
    .line 117
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    if-nez p2, :cond_5

    .line 122
    .line 123
    goto/16 :goto_0

    .line 124
    .line 125
    :cond_5
    const/16 v1, 0x12

    .line 126
    .line 127
    goto/16 :goto_0

    .line 128
    .line 129
    :sswitch_6
    const-string p2, "reason_not_want_seen_by_acquaintance"

    .line 130
    .line 131
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    if-nez p2, :cond_6

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :cond_6
    const/16 v1, 0x11

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :sswitch_7
    const-string p2, "reason_use_too_much_memory"

    .line 144
    .line 145
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    if-nez p2, :cond_7

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_7
    const/16 v1, 0x10

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_8
    const-string p2, "reason_got_no_match"

    .line 158
    .line 159
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    if-nez p2, :cond_8

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :cond_8
    const/16 v1, 0xf

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :sswitch_9
    const-string p2, "reason_no_person_i_like_nearby"

    .line 172
    .line 173
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result p2

    .line 177
    if-nez p2, :cond_9

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :cond_9
    const/16 v1, 0xe

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :sswitch_a
    const-string p2, "reason_want_back_to_true_life"

    .line 186
    .line 187
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result p2

    .line 191
    if-nez p2, :cond_a

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :cond_a
    const/16 v1, 0xd

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :sswitch_b
    const-string p2, "reason_got_person_abuse"

    .line 200
    .line 201
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result p2

    .line 205
    if-nez p2, :cond_b

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :cond_b
    const/16 v1, 0xc

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_c
    const-string p2, "reason_no_suggested_person_nearby"

    .line 214
    .line 215
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p2

    .line 219
    if-nez p2, :cond_c

    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :cond_c
    const/16 v1, 0xb

    .line 224
    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :sswitch_d
    const-string p2, "reason_reregister_or_change_phone"

    .line 228
    .line 229
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result p2

    .line 233
    if-nez p2, :cond_d

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :cond_d
    const/16 v1, 0xa

    .line 238
    .line 239
    goto/16 :goto_0

    .line 240
    .line 241
    :sswitch_e
    const-string p2, "reason_match_fraud"

    .line 242
    .line 243
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result p2

    .line 247
    if-nez p2, :cond_e

    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :cond_e
    const/16 v1, 0x9

    .line 252
    .line 253
    goto/16 :goto_0

    .line 254
    .line 255
    :sswitch_f
    const-string p2, "reason_matches_disapear"

    .line 256
    .line 257
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    if-nez p2, :cond_f

    .line 262
    .line 263
    goto/16 :goto_0

    .line 264
    .line 265
    :cond_f
    const/16 v1, 0x8

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :sswitch_10
    const-string p2, "reason_finded_partner_in_tantan"

    .line 270
    .line 271
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result p2

    .line 275
    if-nez p2, :cond_10

    .line 276
    .line 277
    goto :goto_0

    .line 278
    :cond_10
    const/4 v1, 0x7

    .line 279
    goto :goto_0

    .line 280
    :sswitch_11
    const-string p2, "reason_custom"

    .line 281
    .line 282
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result p2

    .line 286
    if-nez p2, :cond_11

    .line 287
    .line 288
    goto :goto_0

    .line 289
    :cond_11
    const/4 v1, 0x6

    .line 290
    goto :goto_0

    .line 291
    :sswitch_12
    const-string p2, "reason_too_much_bug"

    .line 292
    .line 293
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result p2

    .line 297
    if-nez p2, :cond_12

    .line 298
    .line 299
    goto :goto_0

    .line 300
    :cond_12
    const/4 v1, 0x5

    .line 301
    goto :goto_0

    .line 302
    :sswitch_13
    const-string p2, "reason_finded_partner_in_other_platform"

    .line 303
    .line 304
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result p2

    .line 308
    if-nez p2, :cond_13

    .line 309
    .line 310
    goto :goto_0

    .line 311
    :cond_13
    const/4 v1, 0x4

    .line 312
    goto :goto_0

    .line 313
    :sswitch_14
    const-string p2, "reason_account_banned"

    .line 314
    .line 315
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    move-result p2

    .line 319
    if-nez p2, :cond_14

    .line 320
    .line 321
    goto :goto_0

    .line 322
    :cond_14
    const/4 v1, 0x3

    .line 323
    goto :goto_0

    .line 324
    :sswitch_15
    const-string p2, "reason_no_network_frequently"

    .line 325
    .line 326
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result p2

    .line 330
    if-nez p2, :cond_15

    .line 331
    .line 332
    goto :goto_0

    .line 333
    :cond_15
    const/4 v1, 0x2

    .line 334
    goto :goto_0

    .line 335
    :sswitch_16
    const-string p2, "reason_got_no_message"

    .line 336
    .line 337
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result p2

    .line 341
    if-nez p2, :cond_16

    .line 342
    .line 343
    goto :goto_0

    .line 344
    :cond_16
    move v1, v0

    .line 345
    goto :goto_0

    .line 346
    :sswitch_17
    const-string p2, "reason_finded_partner_in_true_life"

    .line 347
    .line 348
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    move-result p2

    .line 352
    if-nez p2, :cond_17

    .line 353
    .line 354
    goto :goto_0

    .line 355
    :cond_17
    const/4 v1, 0x0

    .line 356
    :goto_0
    const-string p2, "\u70b9\u6b64\u544a\u77e5\u5ba2\u670d"

    .line 357
    .line 358
    packed-switch v1, :pswitch_data_0

    .line 359
    .line 360
    .line 361
    goto/16 :goto_1

    .line 362
    .line 363
    :pswitch_0
    iget-object p2, p0, Ll/nq;->c:Lv/VText;

    .line 364
    .line 365
    const-string v0, "\u82e5\u60a8\u5141\u8bb8\u63a2\u63a2\u8bfb\u53d6\u4e86\u60a8\u7684\u901a\u8baf\u5f55\uff0c\u6211\u4eec\u5c06\u628a\u60a8\u7684\u8054\u7cfb\u4eba\u81ea\u52a8\u5c4f\u853d\u6389\uff0c\u4f60\u4eec\u4e0d\u4f1a\u5728APP\u5185\u4e92\u76f8\u770b\u5230\u5bf9\u65b9\uff0c\u60a8\u53ef\u4ee5\u968f\u65f6\u6253\u5f00\u901a\u8baf\u5f55\u6743\u9650"

    .line 366
    .line 367
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 368
    .line 369
    .line 370
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 371
    .line 372
    const-string v0, "\u524d\u5f80\u901a\u8baf\u5f55\u8bbe\u7f6e"

    .line 373
    .line 374
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 375
    .line 376
    .line 377
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 378
    .line 379
    new-instance v0, Ll/fq;

    .line 380
    .line 381
    invoke-direct {v0, p0, p1}, Ll/fq;-><init>(Ll/nq;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 385
    .line 386
    .line 387
    goto/16 :goto_1

    .line 388
    .line 389
    :pswitch_1
    iget-object p2, p0, Ll/nq;->c:Lv/VText;

    .line 390
    .line 391
    const-string v0, "\u60a8\u53ef\u4ee5\u5728APP\u5185\u76f4\u63a5\u66f4\u6362\u624b\u673a\u53f7\uff0c\u65e0\u9700\u91cd\u65b0\u6ce8\u518c"

    .line 392
    .line 393
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 394
    .line 395
    .line 396
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 397
    .line 398
    const-string v0, "\u66f4\u6362\u624b\u673a\u53f7"

    .line 399
    .line 400
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 401
    .line 402
    .line 403
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 404
    .line 405
    new-instance v0, Ll/kq;

    .line 406
    .line 407
    invoke-direct {v0, p0, p1}, Ll/kq;-><init>(Ll/nq;Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 411
    .line 412
    .line 413
    goto/16 :goto_1

    .line 414
    .line 415
    :pswitch_2
    iget-object v0, p0, Ll/nq;->c:Lv/VText;

    .line 416
    .line 417
    const-string v1, "\u82e5\u60a8\u5728\u4f7f\u7528\u4ea7\u54c1\u7684\u8fc7\u7a0b\u4e2d\u9047\u5230\u8bc8\u9a97\u3001\u9a9a\u6270\u3001\u76d7\u7528\u3001\u4eba\u8eab\u653b\u51fb\u7b49\uff0c\u8bf7\u70b9\u51fb\u7528\u6237\u8d44\u6599\u9875\u53f3\u4e0a\u89d2\u6216\u8005\u544a\u77e5\u5ba2\u670d\u8fdb\u884c\u4e3e\u62a5\uff0c\u4e3e\u62a5\u6210\u529f\u540e\u60a8\u53ef\u83b7\u5f97\u7279\u6743\u5956\u52b1"

    .line 418
    .line 419
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 420
    .line 421
    .line 422
    iget-object v0, p0, Ll/nq;->d:Lv/VText;

    .line 423
    .line 424
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 425
    .line 426
    .line 427
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 428
    .line 429
    new-instance v0, Ll/eq;

    .line 430
    .line 431
    invoke-direct {v0, p0, p1}, Ll/eq;-><init>(Ll/nq;Ljava/lang/String;)V

    .line 432
    .line 433
    .line 434
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 435
    .line 436
    .line 437
    goto/16 :goto_1

    .line 438
    .line 439
    :pswitch_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 440
    .line 441
    .line 442
    move-result-wide v1

    .line 443
    long-to-double v1, v1

    .line 444
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 445
    .line 446
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 447
    .line 448
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 449
    .line 450
    .line 451
    move-result-object p2

    .line 452
    iget-wide v3, p2, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 453
    .line 454
    sub-double/2addr v1, v3

    .line 455
    double-to-long v1, v1

    .line 456
    const-wide/32 v3, 0x5265c00

    .line 457
    .line 458
    .line 459
    div-long/2addr v1, v3

    .line 460
    long-to-int p2, v1

    .line 461
    iget-object v1, p0, Ll/nq;->b:Lv/VText;

    .line 462
    .line 463
    const-string v2, "\u66f4\u591a\u539f\u56e0"

    .line 464
    .line 465
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 466
    .line 467
    .line 468
    iget-object v1, p0, Ll/nq;->c:Lv/VText;

    .line 469
    .line 470
    new-instance v2, Ljava/lang/StringBuilder;

    .line 471
    .line 472
    const-string v3, "\u60a8\u5df2\u6ce8\u518c\u63a2\u63a2"

    .line 473
    .line 474
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    add-int/2addr p2, v0

    .line 478
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 479
    .line 480
    .line 481
    const-string p2, "\u5929\uff0c\u518d\u575a\u6301\u4e00\u4e0b\u5c31\u80fd\u627e\u5230\u5fd7\u540c\u9053\u5408\u7684\u597d\u53cb\u4e86\u3002\u60a8\u4e5f\u53ef\u4ee5\u901a\u8fc7\u5e7f\u573a\u3001\u76f4\u64ad\u7b49\u627e\u5230\u81ea\u5df1\u611f\u5174\u8da3\u7684\u4eba\u3002"

    .line 482
    .line 483
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    .line 485
    .line 486
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object p2

    .line 490
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 491
    .line 492
    .line 493
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 494
    .line 495
    const-string v0, "\u8ba4\u8bc6\u66f4\u591a\u597d\u53cb"

    .line 496
    .line 497
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 498
    .line 499
    .line 500
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 501
    .line 502
    new-instance v0, Ll/lq;

    .line 503
    .line 504
    invoke-direct {v0, p0, p1}, Ll/lq;-><init>(Ll/nq;Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 508
    .line 509
    .line 510
    goto :goto_1

    .line 511
    :pswitch_4
    iget-object v0, p0, Ll/nq;->c:Lv/VText;

    .line 512
    .line 513
    const-string v1, "\u60a8\u53ef\u4ee5\u5c06\u60a8\u7684\u95ee\u9898\u76f4\u63a5\u6c47\u62a5\u7ed9\u5ba2\u670d\uff0c\u6211\u4eec\u4f1a\u4ee5\u6700\u5feb\u7684\u901f\u5ea6\u7cbe\u51c6\u5b9a\u4f4d\u5e76\u4fee\u590d\uff0c\u65e0\u9700\u6ce8\u9500"

    .line 514
    .line 515
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 516
    .line 517
    .line 518
    iget-object v0, p0, Ll/nq;->d:Lv/VText;

    .line 519
    .line 520
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 521
    .line 522
    .line 523
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 524
    .line 525
    new-instance v0, Ll/jq;

    .line 526
    .line 527
    invoke-direct {v0, p0, p1}, Ll/jq;-><init>(Ll/nq;Ljava/lang/String;)V

    .line 528
    .line 529
    .line 530
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 531
    .line 532
    .line 533
    goto :goto_1

    .line 534
    :pswitch_5
    iget-object v0, p0, Ll/nq;->c:Lv/VText;

    .line 535
    .line 536
    const-string v1, "\u82e5\u9047\u5230\u95ea\u9000\u3001\u5361\u987f\u3001bug\u7b49\u95ee\u9898\uff0c\u60a8\u53ef\u4ee5\u5c1d\u8bd5\u5378\u8f7d\u5e76\u91cd\u65b0\u5b89\u88c5APP\uff0c\u4e5f\u53ef\u4ee5\u544a\u77e5\u5ba2\u670d\uff0c\u8bf4\u660e\u60a8\u7684\u60c5\u51b5\u5e76\u622a\u56fe\uff0c\u5ba2\u670d\u4f1a\u9a6c\u4e0a\u5904\u7406"

    .line 537
    .line 538
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 539
    .line 540
    .line 541
    iget-object v0, p0, Ll/nq;->d:Lv/VText;

    .line 542
    .line 543
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 544
    .line 545
    .line 546
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 547
    .line 548
    new-instance v0, Ll/gq;

    .line 549
    .line 550
    invoke-direct {v0, p0, p1}, Ll/gq;-><init>(Ll/nq;Ljava/lang/String;)V

    .line 551
    .line 552
    .line 553
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 554
    .line 555
    .line 556
    goto :goto_1

    .line 557
    :pswitch_6
    iget-object p2, p0, Ll/nq;->c:Lv/VText;

    .line 558
    .line 559
    const-string v0, "\u9664\u4e86\u5212\u5361\u4e4b\u5916\uff0c\u53d1\u8868\u548c\u8bc4\u8bba\u52a8\u6001\u4e5f\u80fd\u6781\u5927\u7684\u589e\u52a0\u4f60\u627e\u5230\u5fd7\u540c\u9053\u5408\u7684\u4eba\u7684\u6982\u7387\u54e6\u3002\u9a6c\u4e0a\u53bb\u53d1\u8868\u52a8\u6001\u5427"

    .line 560
    .line 561
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 562
    .line 563
    .line 564
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 565
    .line 566
    const-string v0, "\u53bb\u5e7f\u573a\u7ed3\u8bc6\u66f4\u591a\u597d\u53cb"

    .line 567
    .line 568
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 569
    .line 570
    .line 571
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 572
    .line 573
    new-instance v0, Ll/hq;

    .line 574
    .line 575
    invoke-direct {v0, p0, p1}, Ll/hq;-><init>(Ll/nq;Ljava/lang/String;)V

    .line 576
    .line 577
    .line 578
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 579
    .line 580
    .line 581
    goto :goto_1

    .line 582
    :pswitch_7
    iget-object p2, p0, Ll/nq;->c:Lv/VText;

    .line 583
    .line 584
    const-string v0, "\u5728\u63a2\u63a2\uff0c\u9664\u4e86\u5fc3\u52a8\u5bf9\u8c61\uff0c\u60a8\u4e5f\u53ef\u4ee5\u4ece\u5174\u8da3\u7231\u597d\u3001\u5de5\u4f5c\u884c\u4e1a\u3001\u5b66\u672f\u7814\u7a76\u7b49\u65b9\u5411\u51fa\u53d1\uff0c\u627e\u5230\u5fd7\u540c\u9053\u5408\u7684\u597d\u53cb\uff1b\u82e5\u60a8\u5bf9\u6211\u4eec\u7684APP\u6709\u95ee\u9898\uff0c\u4e5f\u53ef\u4ee5\u5411\u6211\u4eec\u63d0\u51fa\u5b9d\u8d35\u7684\u5efa\u8bae"

    .line 585
    .line 586
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 587
    .line 588
    .line 589
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 590
    .line 591
    const-string v0, "\u544a\u8bc9\u6211\u4eec\u8be5\u5982\u4f55\u6539\u8fdb"

    .line 592
    .line 593
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 594
    .line 595
    .line 596
    iget-object p2, p0, Ll/nq;->d:Lv/VText;

    .line 597
    .line 598
    new-instance v0, Ll/iq;

    .line 599
    .line 600
    invoke-direct {v0, p0, p1}, Ll/iq;-><init>(Ll/nq;Ljava/lang/String;)V

    .line 601
    .line 602
    .line 603
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 604
    .line 605
    .line 606
    :goto_1
    iget-object p2, p0, Ll/nq;->e:Lv/VText;

    .line 607
    .line 608
    new-instance v0, Ll/mq;

    .line 609
    .line 610
    invoke-direct {v0, p0, p1, p3}, Ll/mq;-><init>(Ll/nq;Ljava/lang/String;Ljava/lang/String;)V

    .line 611
    .line 612
    .line 613
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 614
    .line 615
    .line 616
    return-void

    .line 617
    :sswitch_data_0
    .sparse-switch
        -0x7a28732a -> :sswitch_17
        -0x7811db89 -> :sswitch_16
        -0x731d68f1 -> :sswitch_15
        -0x7168df35 -> :sswitch_14
        -0x65e08f67 -> :sswitch_13
        -0x5dca7c18 -> :sswitch_12
        -0x5b775e34 -> :sswitch_11
        -0x2ed904c9 -> :sswitch_10
        -0x1f8710e0 -> :sswitch_f
        -0x12099611 -> :sswitch_e
        -0xc72ec93 -> :sswitch_d
        0x3750ea -> :sswitch_c
        0x2a2e1ca -> :sswitch_b
        0x1612928d -> :sswitch_a
        0x1d5f78aa -> :sswitch_9
        0x278f5a35 -> :sswitch_8
        0x346cf5d5 -> :sswitch_7
        0x4634a6cf -> :sswitch_6
        0x496dfb84 -> :sswitch_5
        0x54162e77 -> :sswitch_4
        0x56c3caff -> :sswitch_3
        0x5bc4790e -> :sswitch_2
        0x64ae9d36 -> :sswitch_1
        0x65563752 -> :sswitch_0
    .end sparse-switch

    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_7
        :pswitch_5
        :pswitch_3
        :pswitch_7
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_2
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_2
        :pswitch_6
    .end packed-switch
.end method

.method public final synthetic x(Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->p3:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "feedback-mobile/form?from=logout_stay"

    .line 20
    .line 21
    invoke-static {v2}, Lcom/p1/mobile/putong/core/api/a;->M(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->pageId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->a2(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "delete_account_reason_block_page"

    .line 56
    .line 57
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    filled-new-array {p0}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "e_delete_account_block_jump"

    .line 66
    .line 67
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic y(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "android.permission.READ_CONTACTS"

    .line 6
    .line 7
    invoke-static {p2, v0}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p2}, Ll/hve0;->x(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception p2

    .line 22
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 27
    .line 28
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Bo(Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    sget-object p2, Ll/zp;->c:Lrx/subjects/b;

    .line 40
    .line 41
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->pageId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->a2(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string p1, "delete_account_reason_block_page"

    .line 70
    .line 71
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    filled-new-array {p0}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-string p1, "e_delete_account_block_jump"

    .line 80
    .line 81
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic z(Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->p3:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "feedback-mobile/form?from=vip_complaint"

    .line 20
    .line 21
    invoke-static {v2}, Lcom/p1/mobile/putong/core/api/a;->M(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->pageId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p0}, Ll/nq;->s()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->a2(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "delete_account_reason_block_page"

    .line 56
    .line 57
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    filled-new-array {p0}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "e_delete_account_block_jump"

    .line 66
    .line 67
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 68
    .line 69
    .line 70
    new-instance p0, Ljava/util/Date;

    .line 71
    .line 72
    invoke-direct {p0}, Ljava/util/Date;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-wide/16 p1, 0x0

    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    const-string v1, "feedback"

    .line 83
    .line 84
    invoke-static {p0, v1, p1, p2, v0}, Ll/qu2;->E(Ljava/util/List;Ljava/lang/String;JLl/b3k0;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
