.class public Ll/qm20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tvf;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qm20;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/tvf<",
        "Ll/a1w;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/qm20;


# direct methods
.method public constructor <init>(Ll/qm20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ll/qm20$a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qm20$a;->f(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->B1:I

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->A1:I

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "Facebook"

    .line 23
    .line 24
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->t1:I

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v1, Ll/pm20;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/pm20;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p0, v1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-virtual {p0, v0}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic e(Ll/qm20$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qm20$a;->g(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/facebook/FacebookException;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 5
    .line 6
    invoke-static {p0}, Ll/qm20;->A0(Ll/qm20;)Ll/iam;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/ym20;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->pageId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "add_result"

    .line 21
    .line 22
    const-string v0, "fail"

    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p1}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "e_intl_account_add_facebook_result"

    .line 33
    .line 34
    invoke-static {v0, p0, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic f(Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 2
    .line 3
    invoke-static {p1}, Ll/qm20;->D0(Ll/qm20;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/ym20;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "add_result"

    .line 18
    .line 19
    const-string v1, "success"

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {v0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e_intl_account_add_facebook_result"

    .line 30
    .line 31
    invoke-static {v1, p1, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->q4:I

    .line 35
    .line 36
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/qm20;->e1()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic g(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 8
    .line 9
    const v0, 0x61b18

    .line 10
    .line 11
    .line 12
    if-eq p1, v0, :cond_0

    .line 13
    .line 14
    const v0, 0x61b19

    .line 15
    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/om20;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/om20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p0, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 34
    .line 35
    invoke-static {p0}, Ll/qm20;->C0(Ll/qm20;)Ll/iam;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ll/ym20;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->pageId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "add_result"

    .line 50
    .line 51
    const-string v0, "fail"

    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    filled-new-array {p1}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v0, "e_intl_account_add_facebook_result"

    .line 62
    .line 63
    invoke-static {v0, p0, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public h(Ll/a1w;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/a1w;->a()Lcom/facebook/AccessToken;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, Ll/qm20;->y0(Ll/qm20;Lcom/facebook/AccessToken;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 11
    .line 12
    invoke-static {p1}, Ll/qm20;->x0(Ll/qm20;)Lcom/facebook/AccessToken;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 29
    .line 30
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    iget-object v1, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 33
    .line 34
    invoke-static {v1}, Ll/qm20;->x0(Ll/qm20;)Lcom/facebook/AccessToken;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/facebook/AccessToken;->o()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v2, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 43
    .line 44
    invoke-static {v2}, Ll/qm20;->x0(Ll/qm20;)Lcom/facebook/AccessToken;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Lcom/facebook/AccessToken;->n()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const-string v3, ""

    .line 53
    .line 54
    const-string v4, "facebook"

    .line 55
    .line 56
    invoke-interface {v0, v4, v1, v2, v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->Jm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance v0, Ll/mm20;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/mm20;-><init>(Ll/qm20$a;)V

    .line 67
    .line 68
    .line 69
    new-instance v1, Ll/nm20;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/nm20;-><init>(Ll/qm20$a;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/qm20$a;->a:Ll/qm20;

    .line 2
    .line 3
    invoke-static {p0}, Ll/qm20;->z0(Ll/qm20;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ym20;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "add_result"

    .line 18
    .line 19
    const-string v1, "fail"

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    filled-new-array {v0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e_intl_account_add_facebook_result"

    .line 30
    .line 31
    invoke-static {v1, p0, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/a1w;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qm20$a;->h(Ll/a1w;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
