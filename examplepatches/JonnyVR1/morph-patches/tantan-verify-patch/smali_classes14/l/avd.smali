.class public Ll/avd;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/bvd;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/avd;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/avd;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, p0, Ll/avd;->c:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Ll/avd;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/avd;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0()Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/user/status?user_id="

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    return-object v0
.end method

.method public static synthetic h0(Ll/avd;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/avd;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Ll/avd;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/avd;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Ll/avd;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/avd;->q0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Ll/avd;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/avd;->s0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic l0(Ll/avd;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/avd;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic m0(Ll/avd;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/avd;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic n0(Ll/avd;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/avd;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic o0(Ll/avd;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/avd;->a:Ljava/lang/String;

    return-void
.end method

.method private synthetic p0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "inactivateCategoryKey"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/avd;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "inactivateReasonKey"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/avd;->b:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "deleteContent"

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Ll/avd;->c:Ljava/lang/String;

    .line 48
    .line 49
    return-void
.end method

.method private synthetic q0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bvd;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bvd;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/uud;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/uud;-><init>(Ll/avd;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/tud;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tud;-><init>(Ll/avd;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic r0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "back_cancel"

    .line 10
    .line 11
    const-string v1, "withdraw"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_apply_delete_account_withdraw"

    .line 22
    .line 23
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bvd;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bvd;->c(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_apply_delete_account_confirm"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll/xud;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/xud;-><init>()V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/data/BlockedUserStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/avd$a;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/avd$a;-><init>(Ll/avd;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/yud;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/yud;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v1, Ll/zud;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/zud;-><init>(Ll/avd;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public u0()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/wud;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wud;-><init>(Ll/avd;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public x0()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/vud;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vud;-><init>(Ll/avd;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
