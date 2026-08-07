.class public Ll/qm20;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ym20;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/CommonData;

.field public final b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/b94;

.field public d:Lcom/facebook/AccessToken;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/qm20;->b:Lrx/subjects/a;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic A0(Ll/qm20;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C0(Ll/qm20;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic D0(Ll/qm20;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static J0()Ljava/lang/String;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return-object v2

    .line 16
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "+"

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 36
    .line 37
    iget v2, v2, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v2, " "

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    return-object v0

    .line 65
    :cond_1
    return-object v2
.end method

.method private O0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method private synthetic X0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qm20;->e1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Y0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

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

.method public static synthetic e0(Lcom/p1/mobile/android/app/Act;)V
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
    const-string v2, "Google"

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
    new-instance v1, Ll/xl20;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/xl20;-><init>()V

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

.method public static synthetic f0(Ll/qm20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qm20;->Y0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/qm20;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qm20;->X0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic h0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i0(Ll/qm20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qm20;->b1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l0(Ll/qm20;Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qm20;->W0(Lcom/p1/mobile/putong/data/CommonData;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/data/User;Ll/uxj0;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic n0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic p0(Ll/qm20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qm20;->V0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic q0(Ll/qm20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qm20;->R0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/sw6;->r3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic s0(Ll/qm20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qm20;->U0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic t0(Ll/qm20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/qm20;->a1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u0(Ll/qm20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qm20;->S0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic x0(Ll/qm20;)Lcom/facebook/AccessToken;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qm20;->d:Lcom/facebook/AccessToken;

    return-object p0
.end method

.method public static bridge synthetic y0(Ll/qm20;Lcom/facebook/AccessToken;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qm20;->d:Lcom/facebook/AccessToken;

    return-void
.end method

.method public static synthetic z0(Ll/qm20;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public E0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/z0w;->u()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/api/api/FacebookApi;->d:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {v0, p0, v1}, Ll/z0w;->t(Landroid/app/Activity;Ljava/util/Collection;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public F0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ym20;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/ym20;->i(Z)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    .line 10
    .line 11
    sget-object v1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->DEFAULT_SIGN_IN:Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;-><init>(Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->b()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "218526224262-usliqg20cepnb3ql98amgeum18v8uatv.apps.googleusercontent.com"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->d(Ljava/lang/String;)Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->a()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1, v0}, Lcom/google/android/gms/auth/api/signin/a;->a(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Ll/h7k;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/h7k;->d()Lcom/google/android/gms/tasks/Task;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0}, Ll/h7k;->b()Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/16 v1, 0x232a

    .line 50
    .line 51
    invoke-virtual {p0, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final G0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 6
    .line 7
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    const-string v2, "google"

    .line 10
    .line 11
    invoke-interface {v1, v2, p1, p2, p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->Jm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance p2, Ll/km20;

    .line 20
    .line 21
    invoke-direct {p2, p0}, Ll/km20;-><init>(Ll/qm20;)V

    .line 22
    .line 23
    .line 24
    new-instance p3, Ll/lm20;

    .line 25
    .line 26
    invoke-direct {p3, p0}, Ll/lm20;-><init>(Ll/qm20;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final H0(Landroid/content/Intent;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/auth/api/signin/a;->b(Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    const-class v1, Lcom/google/android/gms/common/api/ApiException;

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Lcom/google/android/gms/tasks/Task;->m(Ljava/lang/Class;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 13
    .line 14
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v1, Ll/ym20;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/ym20;->i(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->h0()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->i0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->H()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, v1, v2, p1}, Ll/qm20;->G0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/google/android/gms/common/api/ApiException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p1

    .line 38
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/ApiException;->getStatusCode()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/16 v1, 0x30d5

    .line 43
    .line 44
    if-eq p1, v1, :cond_0

    .line 45
    .line 46
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->H0:I

    .line 47
    .line 48
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p0, Ll/ym20;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/ym20;->i(Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public I0()Lcom/p1/mobile/putong/data/CommonData;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/CommonData;->new_()Lcom/p1/mobile/putong/data/CommonData;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/Mobile;->new_()Lcom/p1/mobile/putong/data/Mobile;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 24
    .line 25
    iget-object v1, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 32
    .line 33
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Mobile;->mobileNumber:Ljava/lang/String;

    .line 36
    .line 37
    iget v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 38
    .line 39
    iput v0, v1, Lcom/p1/mobile/putong/data/Mobile;->countryCode:I

    .line 40
    .line 41
    :cond_0
    iget-object p0, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 42
    .line 43
    return-object p0
.end method

.method public L0()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/tz2;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/qm20;->c1()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Ll/pz2;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/pz2;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/tor;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/tor;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {p0}, Ll/qm20;->Q0()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    new-instance v2, Ll/pz2;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/pz2;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    new-instance v2, Ll/pz2;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/pz2;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :goto_0
    invoke-direct {p0}, Ll/qm20;->O0()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    new-instance v2, Ll/hy2;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/hy2;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    new-instance v2, Ll/hy2;

    .line 73
    .line 74
    invoke-direct {v2}, Ll/hy2;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    :goto_1
    invoke-virtual {p0}, Ll/qm20;->P0()Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_3

    .line 85
    .line 86
    new-instance v2, Ll/ny2;

    .line 87
    .line 88
    invoke-direct {v2}, Ll/ny2;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_3
    new-instance v2, Ll/ny2;

    .line 96
    .line 97
    invoke-direct {v2}, Ll/ny2;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    :goto_2
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    const/4 v3, 0x0

    .line 108
    if-nez v2, :cond_4

    .line 109
    .line 110
    new-instance v2, Ll/syb;

    .line 111
    .line 112
    invoke-direct {v2}, Ll/syb;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-interface {v0, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    :cond_4
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_5

    .line 123
    .line 124
    new-instance v2, Ll/d760;

    .line 125
    .line 126
    invoke-direct {v2}, Ll/d760;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-interface {v1, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    new-instance v2, Ll/h0f;

    .line 133
    .line 134
    invoke-direct {v2}, Ll/h0f;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-interface {v1, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 141
    .line 142
    .line 143
    :cond_5
    invoke-virtual {p0}, Ll/qm20;->Q0()Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-eqz p0, :cond_6

    .line 148
    .line 149
    new-instance p0, Ll/h0f;

    .line 150
    .line 151
    invoke-direct {p0}, Ll/h0f;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    new-instance p0, Ll/ph60;

    .line 158
    .line 159
    invoke-direct {p0}, Ll/ph60;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    new-instance p0, Ll/h1k0;

    .line 166
    .line 167
    invoke-direct {p0}, Ll/h1k0;-><init>()V

    .line 168
    .line 169
    .line 170
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    :cond_6
    return-object v0
.end method

.method public N0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/sw6;->s3(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/bm20;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/bm20;-><init>(Ll/qm20;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/cm20;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/cm20;-><init>(Ll/qm20;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final P0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 24
    .line 25
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/ThirdParty;->google:Z

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final Q0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Mobile;->mobileNumber:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

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

.method public final synthetic R0(Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/ym20;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "add_result"

    .line 14
    .line 15
    const-string v1, "success"

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "e_intl_account_add_google_result"

    .line 26
    .line 27
    invoke-static {v1, p1, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->q4:I

    .line 31
    .line 32
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/qm20;->e1()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic S0(Ljava/lang/Throwable;)V
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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/wl20;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ll/wl20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p0, Ll/ym20;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;->pageId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "add_result"

    .line 44
    .line 45
    const-string v0, "fail"

    .line 46
    .line 47
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    filled-new-array {p1}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string v0, "e_intl_account_add_google_result"

    .line 56
    .line 57
    invoke-static {v0, p0, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic U0(Ll/uxj0;)V
    .locals 2

    .line 1
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 2
    .line 3
    const-string v0, "Delete account"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v0, v1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 7
    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->c2:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p1, v0}, Ll/o1j0;->x(IZ)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 30
    .line 31
    const-string v0, "google"

    .line 32
    .line 33
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    new-instance p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    .line 40
    .line 41
    sget-object v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->DEFAULT_SIGN_IN:Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    .line 42
    .line 43
    invoke-direct {p1, v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;-><init>(Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->b()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "218526224262-usliqg20cepnb3ql98amgeum18v8uatv.apps.googleusercontent.com"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->d(Ljava/lang/String;)Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->a()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0, p1}, Lcom/google/android/gms/auth/api/signin/a;->a(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Ll/h7k;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/h7k;->c()Lcom/google/android/gms/tasks/Task;

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final synthetic V0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

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

.method public final synthetic W0(Lcom/p1/mobile/putong/data/CommonData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qm20;->a:Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/ym20;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ym20;->j()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/qm20;->b:Lrx/subjects/a;

    .line 14
    .line 15
    new-instance v2, Ll/vl20;

    .line 16
    .line 17
    invoke-direct {v2}, Ll/vl20;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/dm20;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/dm20;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/em20;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/em20;-><init>(Ll/qm20;)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ll/fm20;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/fm20;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/gm20;

    .line 59
    .line 60
    invoke-direct {v1}, Ll/gm20;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/hm20;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/hm20;-><init>(Ll/qm20;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    sget-object v0, Ll/zp;->c:Lrx/subjects/b;

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/im20;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/im20;-><init>(Ll/qm20;)V

    .line 88
    .line 89
    .line 90
    new-instance v2, Ll/jm20;

    .line 91
    .line 92
    invoke-direct {v2}, Ll/jm20;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    invoke-static {}, Ll/b94$b;->a()Ll/b94;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Ll/qm20;->c:Ll/b94;

    .line 107
    .line 108
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v1, p0, Ll/qm20;->c:Ll/b94;

    .line 113
    .line 114
    new-instance v2, Ll/qm20$a;

    .line 115
    .line 116
    invoke-direct {v2, p0}, Ll/qm20$a;-><init>(Ll/qm20;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1, v2}, Ll/z0w;->y(Ll/b94;Ll/tvf;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public final synthetic a1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p3, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p3, p3, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {p3, p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->mp(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/am20;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/am20;-><init>(Ll/qm20;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/fjf0;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/fjf0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic b1(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qm20;->e1()V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->r4:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final c1()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/qm20;->J0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public d1(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/16 v0, 0x232a

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p3}, Ll/qm20;->H0(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/qm20;->c:Ll/b94;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/qm20;->c:Ll/b94;

    .line 17
    .line 18
    invoke-interface {p0, p1, p2, p3}, Ll/b94;->a(IILandroid/content/Intent;)Z

    .line 19
    .line 20
    .line 21
    :cond_1
    const/16 p0, 0x312

    .line 22
    .line 23
    if-ne p1, p0, :cond_2

    .line 24
    .line 25
    if-nez p2, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/z0w;->u()V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qm20;->b:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f1(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ym20;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    new-instance p0, Ll/jl80$a;

    .line 13
    .line 14
    invoke-direct {p0, v0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->v1:I

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->u1:I

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->t1:I

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance p2, Ll/yl20;

    .line 44
    .line 45
    invoke-direct {p2}, Ll/yl20;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1, p2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

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

    .line 60
    :cond_0
    new-instance p1, Ll/th0$a;

    .line 61
    .line 62
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast v2, Ll/ym20;

    .line 65
    .line 66
    invoke-virtual {v2}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-direct {p1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->F1:I

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-static {v2, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p1, p2}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->E1:I

    .line 92
    .line 93
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p1, p2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->D1:I

    .line 102
    .line 103
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p1, p2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->C1:I

    .line 112
    .line 113
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p1, p2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    const/4 p2, 0x1

    .line 122
    invoke-virtual {p1, p2}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1, v1}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    new-instance p2, Ll/zl20;

    .line 131
    .line 132
    invoke-direct {p2, p0, v0, p3}, Ll/zl20;-><init>(Ll/qm20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 144
    .line 145
    .line 146
    return-void
.end method
