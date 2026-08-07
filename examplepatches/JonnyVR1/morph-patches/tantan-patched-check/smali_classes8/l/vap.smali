.class public Ll/vap;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/android/app/Dialog;

.field public b:Lcom/p1/mobile/putong/core/ui/intlrenew/IntlRenewContractView;

.field public c:Ll/l4g0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-class v0, Ll/vap;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "p_intl_membership_callback_popup"

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/vap;->c:Ll/l4g0;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/vap;->d(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/Dialog;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/vap;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/ui/intlrenew/IntlRenewContractView;

    .line 29
    .line 30
    iput-object v0, p0, Ll/vap;->b:Lcom/p1/mobile/putong/core/ui/intlrenew/IntlRenewContractView;

    .line 31
    .line 32
    new-instance v1, Ll/sap;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/sap;-><init>(Ll/vap;Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/intlrenew/IntlRenewContractView;->e(Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/intlrenew/IntlRenewContractView;

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/vap;->b:Lcom/p1/mobile/putong/core/ui/intlrenew/IntlRenewContractView;

    .line 41
    .line 42
    new-instance v0, Ll/tap;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/tap;-><init>(Ll/vap;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/intlrenew/IntlRenewContractView;->d(Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/intlrenew/IntlRenewContractView;

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/vap;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 51
    .line 52
    new-instance v0, Ll/uap;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/uap;-><init>(Ll/vap;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic a(Ll/vap;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vap;->f()V

    return-void
.end method

.method public static synthetic b(Ll/vap;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vap;->e(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic c(Ll/vap;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vap;->g(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public final d(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/Dialog;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/dgc0;->j:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p1, Ll/rec0;->Y:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget p1, Ll/qa00;->q:I

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, v0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->C(IIII)Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final synthetic e(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/yap;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "e_intl_membership_callback_popup_btn"

    .line 5
    .line 6
    const-string v0, "p_intl_membership_callback_popup"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/vap;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vap;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic g(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vap;->c:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vap;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/vap;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/vap;->c:Ll/l4g0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/yap;->p()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
