.class public Ll/ccq0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/p6;",
        ">;"
    }
.end annotation


# static fields
.field public static G:Z


# instance fields
.field public A:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/SignUpData;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ll/x20;

.field public C:Landroid/view/View$OnClickListener;

.field public D:Ll/jl80;

.field public E:Ll/x20;

.field public F:Landroid/view/View$OnClickListener;

.field public a:Z

.field public b:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/Runnable;

.field public e:Lcom/p1/mobile/putong/data/SignUpData;

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/account_core/reponse_data/OneClickStatus;

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Landroid/view/View$OnClickListener;

.field public m:Landroid/view/View$OnClickListener;

.field public n:Ll/b30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b30<",
            "Ljava/lang/Throwable;",
            "Lcom/p1/mobile/putong/account/data/ThirdPartyData;",
            "Ljava/lang/Runnable;",
            "Lcom/p1/mobile/putong/data/SignInGrantType;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ll/b94;

.field public p:Lcom/facebook/AccessToken;

.field public q:Ll/x20;

.field public r:Ll/x20;

.field public s:Z

.field public t:Z

.field public u:Ll/kcg0;

.field public v:Ll/x20;

.field public w:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

.field public x:Lcom/tencent/tauth/IUiListener;

.field public y:I

.field public z:Ll/x20;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/ccq0;->a:Z

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;->None:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 8
    .line 9
    iput-object v0, p0, Ll/ccq0;->b:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    iput-object v0, p0, Ll/ccq0;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/ccq0;->k:Lrx/subjects/a;

    .line 20
    .line 21
    new-instance v0, Ll/z7q0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/z7q0;-><init>(Ll/ccq0;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/ccq0;->l:Landroid/view/View$OnClickListener;

    .line 27
    .line 28
    new-instance v0, Ll/n8q0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/n8q0;-><init>(Ll/ccq0;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/ccq0;->m:Landroid/view/View$OnClickListener;

    .line 34
    .line 35
    new-instance v0, Ll/o8q0;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/o8q0;-><init>(Ll/ccq0;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/ccq0;->n:Ll/b30;

    .line 41
    .line 42
    new-instance v0, Ll/p8q0;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/p8q0;-><init>(Ll/ccq0;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/ccq0;->q:Ll/x20;

    .line 48
    .line 49
    new-instance v0, Ll/q8q0;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/q8q0;-><init>(Ll/ccq0;)V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Ll/ccq0;->r:Ll/x20;

    .line 55
    .line 56
    iput-boolean p1, p0, Ll/ccq0;->s:Z

    .line 57
    .line 58
    iput-boolean p1, p0, Ll/ccq0;->t:Z

    .line 59
    .line 60
    new-instance p1, Ll/s8q0;

    .line 61
    .line 62
    invoke-direct {p1, p0}, Ll/s8q0;-><init>(Ll/ccq0;)V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Ll/ccq0;->v:Ll/x20;

    .line 66
    .line 67
    new-instance p1, Ll/ccq0$a;

    .line 68
    .line 69
    invoke-direct {p1, p0}, Ll/ccq0$a;-><init>(Ll/ccq0;)V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Ll/ccq0;->x:Lcom/tencent/tauth/IUiListener;

    .line 73
    .line 74
    new-instance p1, Ll/t8q0;

    .line 75
    .line 76
    invoke-direct {p1, p0}, Ll/t8q0;-><init>(Ll/ccq0;)V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Ll/ccq0;->z:Ll/x20;

    .line 80
    .line 81
    new-instance p1, Ll/u8q0;

    .line 82
    .line 83
    invoke-direct {p1, p0}, Ll/u8q0;-><init>(Ll/ccq0;)V

    .line 84
    .line 85
    .line 86
    iput-object p1, p0, Ll/ccq0;->A:Ll/y20;

    .line 87
    .line 88
    new-instance p1, Ll/v8q0;

    .line 89
    .line 90
    invoke-direct {p1, p0}, Ll/v8q0;-><init>(Ll/ccq0;)V

    .line 91
    .line 92
    .line 93
    iput-object p1, p0, Ll/ccq0;->B:Ll/x20;

    .line 94
    .line 95
    new-instance p1, Ll/w8q0;

    .line 96
    .line 97
    invoke-direct {p1, p0}, Ll/w8q0;-><init>(Ll/ccq0;)V

    .line 98
    .line 99
    .line 100
    iput-object p1, p0, Ll/ccq0;->C:Landroid/view/View$OnClickListener;

    .line 101
    .line 102
    new-instance p1, Ll/k8q0;

    .line 103
    .line 104
    invoke-direct {p1, p0}, Ll/k8q0;-><init>(Ll/ccq0;)V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Ll/ccq0;->E:Ll/x20;

    .line 108
    .line 109
    new-instance p1, Ll/m8q0;

    .line 110
    .line 111
    invoke-direct {p1, p0}, Ll/m8q0;-><init>(Ll/ccq0;)V

    .line 112
    .line 113
    .line 114
    iput-object p1, p0, Ll/ccq0;->F:Landroid/view/View$OnClickListener;

    .line 115
    .line 116
    return-void
.end method

.method public static synthetic A0(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->t4()V

    return-void
.end method

.method public static synthetic A2(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Ljava/lang/Runnable;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/ccq0;->T4(Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Ljava/lang/Runnable;Ll/uxj0;)V

    return-void
.end method

.method private A3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ccq0;->w:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Lcom/tencent/mm/opensdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/ccq0;->w:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private synthetic A4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ccq0;->t:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/ccq0;->s:Z

    .line 5
    .line 6
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Ll/p6;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/p6;->p()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic B1(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B2(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private B3()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ccq0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/cp;->e(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private synthetic B4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p6;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/p6;->q(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private B5()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/ccq0;->C5(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic C0(Ll/ccq0;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->V3(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic C1(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->A4()V

    return-void
.end method

.method public static synthetic C2(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyToken:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, v0, p1, v1}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/nbq0;

    .line 25
    .line 26
    invoke-direct {p1, p2}, Ll/nbq0;-><init>(Ll/x20;)V

    .line 27
    .line 28
    .line 29
    new-instance p2, Ll/obq0;

    .line 30
    .line 31
    invoke-direct {p2, p3}, Ll/obq0;-><init>(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private C3(Landroid/content/Intent;)V
    .locals 2

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
    check-cast v1, Ll/p6;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/p6;->b(Z)V

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
    move-result-object p1

    .line 29
    invoke-virtual {p0, v1, p1}, Ll/ccq0;->J3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/google/android/gms/common/api/ApiException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p1

    .line 34
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/ApiException;->getStatusCode()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    const/16 v1, 0x30d5

    .line 39
    .line 40
    if-eq p1, v1, :cond_0

    .line 41
    .line 42
    sget p1, Lcom/p1/mobile/putong/account/R$string;->y3:I

    .line 43
    .line 44
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast p0, Ll/p6;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/p6;->b(Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private synthetic C4()V
    .locals 1

    .line 1
    new-instance v0, Ll/k9q0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k9q0;-><init>(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/z0w;->u()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private C5(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p6;->m()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->d:Ll/yyd0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v1, Ll/h6q0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/h6q0;-><init>(Ll/ccq0;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0, v0, p1, v1}, Ll/ccq0;->I5(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    .line 39
    .line 40
    invoke-direct {p1}, Lcom/p1/mobile/putong/account/data/AccountTestFactor;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v0, "appOpen"

    .line 44
    .line 45
    iput-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->step:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "googleplay"

    .line 48
    .line 49
    iput-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 50
    .line 51
    new-instance v0, Ll/x8q0;

    .line 52
    .line 53
    invoke-direct {v0, p0, p1}, Ll/x8q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/AccountTestFactor;)V

    .line 54
    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->H2()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance p1, Ll/y8q0;

    .line 63
    .line 64
    invoke-direct {p1, v0}, Ll/y8q0;-><init>(Ll/x20;)V

    .line 65
    .line 66
    .line 67
    new-instance v1, Ll/z8q0;

    .line 68
    .line 69
    invoke-direct {v1, v0}, Ll/z8q0;-><init>(Ll/x20;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static synthetic D0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D1(Ll/ccq0;Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ccq0;->j4(Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D2(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->v4()V

    return-void
.end method

.method private synthetic D4()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ccq0;->t:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/p6;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/p6;->u()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private D5()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p6;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/p6;->n(Z)V

    .line 7
    .line 8
    .line 9
    const-string p0, "\u6388\u6743\u5931\u8d25\uff0c\u8bf7\u518d\u6b21\u5c1d\u8bd5"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic E0(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->w4()V

    return-void
.end method

.method public static synthetic E1(Ll/ccq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->F4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E2(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->H4()V

    return-void
.end method

.method private E3(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/account/api/a;->q2(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    new-instance v1, Ll/d7q0;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Ll/d7q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/o7q0;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/o7q0;-><init>(Ll/ccq0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic E4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic F0(Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic F1(Ll/ccq0;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->J4(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic F2(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->B4()V

    return-void
.end method

.method private synthetic F4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic G0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic G4()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->V0()Ll/gxd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/AuthData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v0, ""

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v2, Ll/p6;

    .line 35
    .line 36
    invoke-interface {v2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v2, v0}, Ll/cp;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;->wechat_login:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;

    .line 58
    .line 59
    iget-object v3, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->h(Landroid/content/Context;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private G5(ZLcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v1, Ll/p6;

    .line 19
    .line 20
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    sget v2, Lcom/p1/mobile/putong/account/R$string;->V2:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget v2, Lcom/p1/mobile/putong/account/R$string;->T2:I

    .line 34
    .line 35
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    sget p1, Lcom/p1/mobile/putong/account/R$string;->W2:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    sget p1, Lcom/p1/mobile/putong/account/R$string;->U2:I

    .line 45
    .line 46
    :goto_1
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget v1, Lcom/p1/mobile/putong/account/R$string;->z:I

    .line 51
    .line 52
    new-instance v2, Ll/t6q0;

    .line 53
    .line 54
    invoke-direct {v2, p0, p2, p3}, Ll/t6q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget p2, Lcom/p1/mobile/putong/account/R$string;->b:I

    .line 62
    .line 63
    new-instance p3, Ll/u6q0;

    .line 64
    .line 65
    invoke-direct {p3}, Ll/u6q0;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance p2, Ll/ccq0$f;

    .line 73
    .line 74
    invoke-direct {p2, p0, v0}, Ll/ccq0$f;-><init>(Ll/ccq0;Ll/l4g0;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public static synthetic H0(Ll/ccq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->E4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H1(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/ccq0;->p4(Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic H2(Ll/ccq0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->c4(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic H4()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->z3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private H5(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    sget v2, Lcom/p1/mobile/putong/account/R$string;->V2:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget v2, Lcom/p1/mobile/putong/account/R$string;->T2:I

    .line 30
    .line 31
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    sget p1, Lcom/p1/mobile/putong/account/R$string;->W2:I

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    sget p1, Lcom/p1/mobile/putong/account/R$string;->U2:I

    .line 41
    .line 42
    :goto_1
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    sget v1, Lcom/p1/mobile/putong/account/R$string;->z:I

    .line 47
    .line 48
    new-instance v2, Ll/l6q0;

    .line 49
    .line 50
    invoke-direct {v2, p2, p3, p5, p4}, Ll/l6q0;-><init>(Ljava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    sget p2, Lcom/p1/mobile/putong/account/R$string;->b:I

    .line 58
    .line 59
    new-instance p3, Ll/m6q0;

    .line 60
    .line 61
    invoke-direct {p3, p4}, Ll/m6q0;-><init>(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance p2, Ll/ccq0$d;

    .line 69
    .line 70
    invoke-direct {p2, p0, v0}, Ll/ccq0$d;-><init>(Ll/ccq0;Ll/l4g0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    new-instance p1, Ll/n6q0;

    .line 82
    .line 83
    invoke-direct {p1, p4}, Ll/n6q0;-><init>(Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public static synthetic I0(Ll/y20;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic I1(Ll/ccq0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->i5(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic I2(Ll/ccq0;Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->r4(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/String;)V

    return-void
.end method

.method public static I3(Landroid/content/Context;)Lcom/tencent/tauth/Tencent;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Lcom/tencent/tauth/Tencent;->setIsPermissionGranted(Z)V

    .line 3
    .line 4
    .line 5
    sget-object v0, Ll/cy5;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/tencent/tauth/Tencent;->createInstance(Ljava/lang/String;Landroid/content/Context;)Lcom/tencent/tauth/Tencent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private synthetic I4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p6;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/p6;->b(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private I5(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p6;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/ccq0;->D:Ll/jl80;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/ccq0;->D:Ll/jl80;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    :goto_0
    return-void

    .line 29
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget v2, Ll/hec0;->k0:I

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Ll/wcc0;->G:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lv/VDraweeView;

    .line 51
    .line 52
    sget v3, Ll/wcc0;->h:I

    .line 53
    .line 54
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Lv/VImage;

    .line 59
    .line 60
    sget v4, Ll/wcc0;->E:I

    .line 61
    .line 62
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Lv/VButton;

    .line 67
    .line 68
    sget v5, Ll/wcc0;->f:I

    .line 69
    .line 70
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    check-cast v5, Lv/VText;

    .line 75
    .line 76
    sget v6, Ll/wcc0;->H:I

    .line 77
    .line 78
    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    check-cast v6, Lv/VText;

    .line 83
    .line 84
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 85
    .line 86
    iget-object v8, p1, Lcom/p1/mobile/putong/data/RememberUserInfo;->imgUrl:Ljava/lang/String;

    .line 87
    .line 88
    sget v9, Ll/qa00;->S:I

    .line 89
    .line 90
    invoke-virtual {v7, v2, v8, v9, v9}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 91
    .line 92
    .line 93
    iget-object v2, p1, Lcom/p1/mobile/putong/data/RememberUserInfo;->name:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    sget v2, Lcom/p1/mobile/putong/account/R$string;->b3:I

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/data/RememberUserInfo;->name:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Ll/ccq0;->Q5(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p2, v2, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    sget p1, Lcom/p1/mobile/putong/account/R$string;->c3:I

    .line 122
    .line 123
    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setText(I)V

    .line 124
    .line 125
    .line 126
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    const-string p2, "p_signin_with_saved_info"

    .line 133
    .line 134
    invoke-static {p2, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {v0, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    const/4 v0, 0x1

    .line 143
    invoke-virtual {p2, v0}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    new-instance v0, Ll/e9q0;

    .line 148
    .line 149
    invoke-direct {v0, p1}, Ll/e9q0;-><init>(Ll/l4g0;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p2, v0}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    new-instance v0, Ll/f9q0;

    .line 157
    .line 158
    invoke-direct {v0, p1}, Ll/f9q0;-><init>(Ll/l4g0;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2, v0}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    new-instance p2, Ll/g9q0;

    .line 166
    .line 167
    invoke-direct {p2}, Ll/g9q0;-><init>()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1, p2}, Ll/jl80$a;->l0(Landroid/content/DialogInterface$OnCancelListener;)Ll/jl80$a;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    iput-object p1, p0, Ll/ccq0;->D:Ll/jl80;

    .line 179
    .line 180
    new-instance p1, Ll/h9q0;

    .line 181
    .line 182
    invoke-direct {p1, p0}, Ll/h9q0;-><init>(Ll/ccq0;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    .line 187
    .line 188
    new-instance p1, Ll/i9q0;

    .line 189
    .line 190
    invoke-direct {p1, p0, p3}, Ll/i9q0;-><init>(Ll/ccq0;Ll/x20;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v4, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 194
    .line 195
    .line 196
    new-instance p1, Ll/j9q0;

    .line 197
    .line 198
    invoke-direct {p1, p0}, Ll/j9q0;-><init>(Ll/ccq0;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v5, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method public static synthetic J0(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->W3()V

    return-void
.end method

.method public static synthetic J1(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->N4()V

    return-void
.end method

.method public static synthetic J2(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic J4(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private J5(ZLcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/putong/account/data/WeChatToken;",
            "Ljava/lang/Runnable;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    sget v2, Lcom/p1/mobile/putong/account/R$string;->V2:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget v2, Lcom/p1/mobile/putong/account/R$string;->T2:I

    .line 30
    .line 31
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    sget p1, Lcom/p1/mobile/putong/account/R$string;->W2:I

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    sget p1, Lcom/p1/mobile/putong/account/R$string;->U2:I

    .line 41
    .line 42
    :goto_1
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    sget v1, Lcom/p1/mobile/putong/account/R$string;->z:I

    .line 47
    .line 48
    new-instance v2, Ll/p7q0;

    .line 49
    .line 50
    invoke-direct {v2, p2, p4, p3}, Ll/p7q0;-><init>(Lcom/p1/mobile/putong/account/data/WeChatToken;Ll/y20;Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    sget p2, Lcom/p1/mobile/putong/account/R$string;->b:I

    .line 58
    .line 59
    new-instance p4, Ll/q7q0;

    .line 60
    .line 61
    invoke-direct {p4, p3}, Ll/q7q0;-><init>(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p2, p4}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance p2, Ll/ccq0$c;

    .line 69
    .line 70
    invoke-direct {p2, p0, v0}, Ll/ccq0$c;-><init>(Ll/ccq0;Ll/l4g0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    new-instance p1, Ll/r7q0;

    .line 82
    .line 83
    invoke-direct {p1, p3}, Ll/r7q0;-><init>(Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public static synthetic K2(Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/tcn;->b()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private K3(Ljava/lang/Throwable;)Z
    .locals 1

    const/4 v0, 0x1

    return v0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 14
    .line 15
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 16
    .line 17
    const p1, 0x9c65

    .line 18
    .line 19
    .line 20
    if-ne p0, p1, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_1
    return v0
.end method

.method private synthetic K4(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-direct {p0, p3}, Ll/ccq0;->K3(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ccq0;->n:Ll/b30;

    .line 8
    .line 9
    const-string v0, "google"

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p0, p3, p1, p2, v0}, Ll/b30;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p3}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic L0(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "e_user_delete_account_withdraw_popup_cancel"

    .line 2
    .line 3
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic L1(Ll/ccq0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->a4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic L2(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->i4()V

    return-void
.end method

.method private synthetic L4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/p6;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/p6;->a()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/p6;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Ll/p6;->n(Z)V

    .line 21
    .line 22
    .line 23
    const-string p0, "QQ\u767b\u5f55\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic M2(Ll/ccq0;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->p5(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method private synthetic M4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p6;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/p6;->n(Z)V

    .line 7
    .line 8
    .line 9
    const-string p0, "\u767b\u5f55\u5931\u8d25\uff0c\u7ed1\u5b9a\u624b\u673a\u53f7\u540e\u518d\u8bd5"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic N0(Ll/ccq0;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->f5(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N1(Ll/ccq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->o5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic N4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/p6;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Ll/p6;->n(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic O0(Ll/ccq0;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->Q3(Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method

.method public static synthetic O1()V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic O3(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/bp;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/ot40;->h(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private synthetic O4(Lcom/p1/mobile/putong/account/data/ThirdPartVetify;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ccq0;->F3()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic P0(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->G4()V

    return-void
.end method

.method public static synthetic P1(Ll/ccq0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->O3(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic P2(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic P3(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/bp;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/ot40;->h(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private synthetic P4(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/ccq0;->x5(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic Q0(Ll/ccq0;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ccq0;->K4(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Q1(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->h5(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method

.method public static synthetic Q2(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ccq0;->W4(Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V

    return-void
.end method

.method private synthetic Q3(Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget p1, p0, Ll/ccq0;->y:I

    .line 7
    .line 8
    add-int/2addr p1, v1

    .line 9
    iput p1, p0, Ll/ccq0;->y:I

    .line 10
    .line 11
    const/4 v0, 0x5

    .line 12
    if-ge p1, v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Ll/ccq0;->z3()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->L()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, v1}, Lrx/c;->take(I)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/eaq0;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/eaq0;-><init>(Ll/ccq0;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;->landing_page:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;

    .line 45
    .line 46
    iget-object v2, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->h(Landroid/content/Context;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->mobileNumber:Ljava/lang/String;

    .line 53
    .line 54
    iput-object p1, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->L()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, v1}, Lrx/c;->take(I)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance v0, Ll/faq0;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/faq0;-><init>(Ll/ccq0;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget-object v1, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;->landing_page:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;

    .line 83
    .line 84
    iget-object v2, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->h(Landroid/content/Context;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :goto_0
    iget-object p0, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_2

    .line 96
    .line 97
    const-string p0, "yes"

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    const-string p0, "no"

    .line 101
    .line 102
    :goto_1
    const-string p1, "get_phone_or_not"

    .line 103
    .line 104
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    filled-new-array {p0}, [Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const-string p1, "e_login_phone_acquisition"

    .line 113
    .line 114
    const-string v0, "p_sign_in_type_selection_view"

    .line 115
    .line 116
    invoke-static {p1, v0, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method private synthetic Q4(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/ccq0;->x5(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic R0(Ll/ccq0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/ccq0;->U4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    return-void
.end method

.method public static synthetic R1(Ll/ccq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->g5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R2(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->D4()V

    return-void
.end method

.method private synthetic R3(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    const-string v0, "male"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const-string p1, "signup_male_fb"

    .line 13
    .line 14
    new-array p2, v0, [Ljava/lang/Object;

    .line 15
    .line 16
    invoke-static {p1, p2}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    const-string p2, "female"

    .line 23
    .line 24
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    const-string p1, "signup_female_fb"

    .line 31
    .line 32
    new-array p2, v0, [Ljava/lang/Object;

    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-interface {p1, p2, v1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->newMainActClearStack(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string p2, "from_sign_up"

    .line 51
    .line 52
    invoke-virtual {p1, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method private synthetic R4(Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v3, Ll/e7q0;

    .line 6
    .line 7
    invoke-direct {v3, p1}, Ll/e7q0;-><init>(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    new-instance v4, Ll/f7q0;

    .line 11
    .line 12
    invoke-direct {v4, p0, p2}, Ll/f7q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    .line 13
    .line 14
    .line 15
    new-instance v5, Ll/g7q0;

    .line 16
    .line 17
    invoke-direct {v5, p3}, Ll/g7q0;-><init>(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "qq"

    .line 21
    .line 22
    const-string v2, "verified"

    .line 23
    .line 24
    invoke-static/range {v0 .. v5}, Ll/zn;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic S0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S1(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S2()V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic S3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccq0;->r:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic S4(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/ccq0;->x5(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private S5()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/p6;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic T1(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T2(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->e4()V

    return-void
.end method

.method private synthetic T3(Lrx/AsyncEmitter;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/tencent/connect/UserInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v2}, Ll/ccq0;->I3(Landroid/content/Context;)Lcom/tencent/tauth/Tencent;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/tencent/tauth/Tencent;->getQQToken()Lcom/tencent/connect/auth/QQToken;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v0, v1, v2}, Lcom/tencent/connect/UserInfo;-><init>(Landroid/content/Context;Lcom/tencent/connect/auth/QQToken;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/ccq0$b;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/ccq0$b;-><init>(Ll/ccq0;Lrx/AsyncEmitter;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/tencent/connect/UserInfo;->getUserInfo(Lcom/tencent/tauth/IUiListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic T4(Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Ljava/lang/Runnable;Ll/uxj0;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/bp;->f()Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_1

    .line 21
    .line 22
    iget-object v4, v0, Ll/ccq0;->f:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-nez v4, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/ccq0;->D3()Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    iget-object v7, v0, Ll/ccq0;->f:Ljava/lang/String;

    .line 41
    .line 42
    new-instance v8, Ll/w6q0;

    .line 43
    .line 44
    invoke-direct {v8, v1}, Ll/w6q0;-><init>(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    new-instance v9, Ll/x6q0;

    .line 48
    .line 49
    invoke-direct {v9, v0, v2}, Ll/x6q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    .line 50
    .line 51
    .line 52
    new-instance v10, Ll/y6q0;

    .line 53
    .line 54
    invoke-direct {v10, v3}, Ll/y6q0;-><init>(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    new-instance v11, Ll/z6q0;

    .line 58
    .line 59
    invoke-direct {v11, v0, v3, v2, v1}, Ll/z6q0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    const-string v6, "qq"

    .line 63
    .line 64
    invoke-static/range {v5 .. v11}, Ll/zn;->Q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v12

    .line 72
    new-instance v15, Ll/a7q0;

    .line 73
    .line 74
    invoke-direct {v15, v3}, Ll/a7q0;-><init>(Ljava/lang/Runnable;)V

    .line 75
    .line 76
    .line 77
    new-instance v3, Ll/b7q0;

    .line 78
    .line 79
    invoke-direct {v3, v0, v2}, Ll/b7q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    .line 80
    .line 81
    .line 82
    new-instance v0, Ll/c7q0;

    .line 83
    .line 84
    invoke-direct {v0, v1}, Ll/c7q0;-><init>(Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    const-string v13, "qq"

    .line 88
    .line 89
    const-string v14, ""

    .line 90
    .line 91
    move-object/from16 v17, v0

    .line 92
    .line 93
    move-object/from16 v16, v3

    .line 94
    .line 95
    invoke-static/range {v12 .. v17}, Ll/zn;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    const/4 v1, 0x0

    .line 100
    invoke-virtual {v0, v2, v1}, Ll/ccq0;->x5(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Z)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public static synthetic U0(Ll/ccq0;Lcom/p1/mobile/putong/account/data/AccountTestFactor;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->c5(Lcom/p1/mobile/putong/account/data/AccountTestFactor;)V

    return-void
.end method

.method public static synthetic U1(Ll/ccq0;Ljava/lang/Throwable;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignInGrantType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/ccq0;->z4(Ljava/lang/Throwable;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignInGrantType;)V

    return-void
.end method

.method public static synthetic U2(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->Q4(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    return-void
.end method

.method private synthetic U3(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p6;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->p()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v0, Ll/p6;

    .line 20
    .line 21
    iget-object p0, p0, Ll/ccq0;->l:Landroid/view/View$OnClickListener;

    .line 22
    .line 23
    invoke-virtual {v0, p0, p1}, Ll/p6;->i(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Ll/ccq0;->l:Landroid/view/View$OnClickListener;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic U4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p5, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->nickname:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->qq:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 13
    .line 14
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p2, v0, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    const/4 p2, 0x1

    .line 25
    invoke-static {v0, p1, p2}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance p2, Ll/vbq0;

    .line 34
    .line 35
    invoke-direct {p2, p0, p3, p5, p4}, Ll/vbq0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/wbq0;

    .line 39
    .line 40
    invoke-direct {p0, p4}, Ll/wbq0;-><init>(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic V0(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    const-string p0, "switch_account"

    .line 2
    .line 3
    const-string v0, "close"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_switch_account_button"

    .line 14
    .line 15
    const-string v1, "p_signin_with_saved_info"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic V1(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V2(Ll/ccq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->y4(Landroid/view/View;)V

    return-void
.end method

.method private synthetic V3(ZLandroid/view/View;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_signin_phone_button"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    new-instance p1, Ll/paq0;

    .line 19
    .line 20
    invoke-direct {p1, p0, p2}, Ll/paq0;-><init>(Ll/ccq0;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ll/p9q0;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/p9q0;-><init>(Ll/ccq0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Ll/ccq0;->F5(Ll/x20;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic V4(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->V0()Ll/gxd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/AuthData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v0, ""

    .line 27
    .line 28
    :goto_0
    invoke-static {}, Ll/bp;->f()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast v1, Ll/p6;

    .line 63
    .line 64
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {v1, v0}, Ll/cp;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 73
    .line 74
    .line 75
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sget-object v1, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;->wechat_login:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;

    .line 86
    .line 87
    iget-object v2, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->h(Landroid/content/Context;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public static synthetic W0(Ljava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "e_user_delete_account_withdraw_popup_confirm"

    .line 2
    .line 3
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "qq"

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 20
    .line 21
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 26
    .line 27
    new-instance p1, Ll/b8q0;

    .line 28
    .line 29
    invoke-direct {p1}, Ll/b8q0;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ll/c8q0;

    .line 38
    .line 39
    invoke-direct {p1, p2}, Ll/c8q0;-><init>(Ll/y20;)V

    .line 40
    .line 41
    .line 42
    new-instance p2, Ll/d8q0;

    .line 43
    .line 44
    invoke-direct {p2, p3}, Ll/d8q0;-><init>(Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic W1()V
    .locals 2

    .line 1
    const-string v0, "e_user_delete_account_withdraw_popup_cancel"

    .line 2
    .line 3
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic W2(Ll/ccq0;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->j5(Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic W3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p6;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/p6;->b(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic W4(Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v3, Ll/x7q0;

    .line 6
    .line 7
    invoke-direct {v3, p1}, Ll/x7q0;-><init>(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    new-instance v4, Ll/y7q0;

    .line 11
    .line 12
    invoke-direct {v4, p2}, Ll/y7q0;-><init>(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    new-instance v5, Ll/a8q0;

    .line 16
    .line 17
    invoke-direct {v5, p3}, Ll/a8q0;-><init>(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "qq"

    .line 21
    .line 22
    const-string v2, "verified"

    .line 23
    .line 24
    invoke-static/range {v0 .. v5}, Ll/zn;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic X0(Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatToken;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p2, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p2, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p1, p2, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 30
    .line 31
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 35
    .line 36
    .line 37
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 38
    .line 39
    return-object p0
.end method

.method public static synthetic X1(Ll/ccq0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ccq0;->m5(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X2(Ll/ccq0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->V4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic X3(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/uxj0;)V
    .locals 2

    .line 1
    new-instance p2, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerLib;->getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->google:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 19
    .line 20
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 21
    .line 22
    invoke-direct {p0, p2, p1}, Ll/ccq0;->u5(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic X4(Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ll/uxj0;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/bp;->f()Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_2

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/account/api/a;->i1()Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/account/api/a;->Z1()V

    .line 29
    .line 30
    .line 31
    iget-object v4, v0, Ll/ccq0;->f:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-nez v4, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/ccq0;->D3()Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-eqz v4, :cond_0

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    iget-object v7, v0, Ll/ccq0;->f:Ljava/lang/String;

    .line 50
    .line 51
    new-instance v8, Ll/xbq0;

    .line 52
    .line 53
    invoke-direct {v8, v1}, Ll/xbq0;-><init>(Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    new-instance v9, Ll/ybq0;

    .line 57
    .line 58
    invoke-direct {v9, v2}, Ll/ybq0;-><init>(Ll/y20;)V

    .line 59
    .line 60
    .line 61
    new-instance v10, Ll/zbq0;

    .line 62
    .line 63
    invoke-direct {v10, v3}, Ll/zbq0;-><init>(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    new-instance v11, Ll/acq0;

    .line 67
    .line 68
    invoke-direct {v11, v0, v3, v2, v1}, Ll/acq0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    const-string v6, "qq"

    .line 72
    .line 73
    invoke-static/range {v5 .. v11}, Ll/zn;->Q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v12

    .line 81
    new-instance v15, Ll/i6q0;

    .line 82
    .line 83
    invoke-direct {v15, v3}, Ll/i6q0;-><init>(Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    new-instance v0, Ll/j6q0;

    .line 87
    .line 88
    invoke-direct {v0, v2}, Ll/j6q0;-><init>(Ll/y20;)V

    .line 89
    .line 90
    .line 91
    new-instance v2, Ll/k6q0;

    .line 92
    .line 93
    invoke-direct {v2, v1}, Ll/k6q0;-><init>(Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    const-string v13, "qq"

    .line 97
    .line 98
    const-string v14, ""

    .line 99
    .line 100
    move-object/from16 v16, v0

    .line 101
    .line 102
    move-object/from16 v17, v2

    .line 103
    .line 104
    invoke-static/range {v12 .. v17}, Ll/zn;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 109
    .line 110
    invoke-interface {v2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_2
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 115
    .line 116
    invoke-interface {v2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public static synthetic Y0(Ll/y20;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic Y1(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->d4()V

    return-void
.end method

.method public static synthetic Y2()V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic Y3(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-direct {p0, p3}, Ll/ccq0;->K3(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ccq0;->n:Ll/b30;

    .line 8
    .line 9
    const-string v0, "google"

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p0, p3, p1, p2, v0}, Ll/b30;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p3}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic Y4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 6

    .line 1
    instance-of v0, p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    check-cast p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 6
    .line 7
    iget p6, p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 8
    .line 9
    const v0, 0x9c54

    .line 10
    .line 11
    .line 12
    if-eq p6, v0, :cond_1

    .line 13
    .line 14
    const v1, 0x9c9b

    .line 15
    .line 16
    .line 17
    if-ne p6, v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-interface {p5}, Ljava/lang/Runnable;->run()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    :goto_0
    if-ne p6, v0, :cond_2

    .line 25
    .line 26
    const/4 p5, 0x1

    .line 27
    :goto_1
    move-object v0, p0

    .line 28
    move-object v2, p1

    .line 29
    move-object v3, p2

    .line 30
    move-object v4, p3

    .line 31
    move-object v5, p4

    .line 32
    move v1, p5

    .line 33
    goto :goto_2

    .line 34
    :cond_2
    const/4 p5, 0x0

    .line 35
    goto :goto_1

    .line 36
    :goto_2
    invoke-direct/range {v0 .. v5}, Ll/ccq0;->H5(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    invoke-interface {p5}, Ljava/lang/Runnable;->run()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic Z1(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ccq0;->R4(Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic Z2(Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Z3(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/c30;->m()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/p6;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/p6;->r()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic Z4(Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 9

    .line 1
    instance-of v0, p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    check-cast p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 10
    .line 11
    iget p6, p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 12
    .line 13
    const v0, 0x9c61

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-ne p6, v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/p6;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ll/p6;->n(Z)V

    .line 24
    .line 25
    .line 26
    const-string p0, "QQ\u6682\u4e0d\u652f\u6301\u6ce8\u518c"

    .line 27
    .line 28
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const v0, 0x9c65

    .line 33
    .line 34
    .line 35
    if-eq p6, v0, :cond_2

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    sget-object p6, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->qq:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 44
    .line 45
    invoke-virtual {p6, v0}, Lcom/p1/mobile/putong/account/api/a;->m2(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;)V

    .line 46
    .line 47
    .line 48
    new-instance v7, Ll/rbq0;

    .line 49
    .line 50
    invoke-direct {v7, p0}, Ll/rbq0;-><init>(Ll/ccq0;)V

    .line 51
    .line 52
    .line 53
    new-instance p6, Lcom/p1/mobile/putong/data/SignInData;

    .line 54
    .line 55
    invoke-direct {p6}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v0, "qq"

    .line 59
    .line 60
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p6, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 65
    .line 66
    iput-object p2, p6, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 67
    .line 68
    iput-object p3, p6, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p6, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 77
    .line 78
    new-instance v2, Ll/sbq0;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/sbq0;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, p6, v1, v2}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p6

    .line 87
    new-instance v0, Ll/tbq0;

    .line 88
    .line 89
    invoke-direct {v0, p0, p4, v7, p1}, Ll/tbq0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V

    .line 90
    .line 91
    .line 92
    new-instance v2, Ll/ubq0;

    .line 93
    .line 94
    move-object v3, p0

    .line 95
    move-object v8, p1

    .line 96
    move-object v4, p2

    .line 97
    move-object v5, p3

    .line 98
    move-object v6, p5

    .line 99
    invoke-direct/range {v2 .. v8}, Ll/ubq0;-><init>(Ll/ccq0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v0, v2, v1}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p6, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public static synthetic a1(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/data/MobileRespInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic a3(Ll/ccq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->u4(Landroid/view/View;)V

    return-void
.end method

.method private synthetic a4(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/bp;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/ike;->o(Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Ll/ccq0;->B3()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private synthetic a5(Lcom/p1/mobile/putong/account/data/AccountTestGroup;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->facebookEntry:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/p6;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/p6;->j()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ccq0;->B:Ll/x20;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/ccq0;->q:Ll/x20;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/x20;->call()V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-boolean p1, p1, Lcom/p1/mobile/putong/account/data/AccountTestGroup;->googleEntry:Z

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/bp;->d()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v0, "e_signin_google_button"

    .line 44
    .line 45
    invoke-static {v0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p0, Ll/p6;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/p6;->l()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public static synthetic b1(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b2(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/Exception;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "wechat signup no transition--> message:"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {p0, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic b3(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->C4()V

    return-void
.end method

.method private synthetic b4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    instance-of v0, p1, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/App$HandledGlobally;->getThrowable()Ljava/lang/Throwable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    instance-of p1, p1, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ll/ike;->g()V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Ll/ccq0;->B3()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    :goto_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/ike;->m()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private synthetic b5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccq0;->q:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c1(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c2(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->S4(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    return-void
.end method

.method public static synthetic c3(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c4(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/p6;

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/ccq0;->a:Z

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/p6;->c(Z)Ljava/lang/Runnable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/ccq0;->d:Ljava/lang/Runnable;

    .line 12
    .line 13
    iget-boolean p1, p0, Ll/ccq0;->h:Z

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/ccq0;->C5(Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->i()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    iget-object p1, p0, Ll/ccq0;->b:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;->Pause:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 27
    .line 28
    if-ne p1, v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget v1, Lcom/p1/mobile/putong/account/R$string;->i0:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sget v2, Lcom/p1/mobile/putong/account/R$string;->h0:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    sget v3, Lcom/p1/mobile/putong/account/R$string;->J2:I

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-static {p1, v0, v1, v2}, Ll/zn;->T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;->DeleteImmediately:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 69
    .line 70
    if-ne p1, v0, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget v1, Lcom/p1/mobile/putong/account/R$string;->g0:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-boolean v1, p0, Ll/ccq0;->i:Z

    .line 87
    .line 88
    if-eqz v1, :cond_1

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget v2, Lcom/p1/mobile/putong/account/R$string;->f0:I

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    sget v3, Lcom/p1/mobile/putong/account/R$string;->l0:I

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    const-string v2, "%s\n\n%s"

    .line 115
    .line 116
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    goto :goto_0

    .line 121
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    sget v2, Lcom/p1/mobile/putong/account/R$string;->f0:I

    .line 126
    .line 127
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    sget v3, Lcom/p1/mobile/putong/account/R$string;->J2:I

    .line 136
    .line 137
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-static {p1, v0, v1, v2}, Ll/zn;->T(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    :cond_2
    :goto_1
    iget-object p1, p0, Ll/ccq0;->b:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 145
    .line 146
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;->DeleteImmediately:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 147
    .line 148
    if-ne p1, v0, :cond_4

    .line 149
    .line 150
    iget-object p1, p0, Ll/ccq0;->c:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-nez p1, :cond_4

    .line 157
    .line 158
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    const-string v0, "setting_snail_diversion_config"

    .line 163
    .line 164
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iget-object v0, p0, Ll/ccq0;->c:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-eqz p1, :cond_4

    .line 175
    .line 176
    invoke-static {}, Ll/zwk;->e()Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_3

    .line 181
    .line 182
    const-string p1, "http://m.staging2.p1staff.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/love-snail/index.html?speed=true&_bid=1004028&hideNavigationBar=1&hideNotch=1"

    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_3
    const-string p1, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/love-snail/index.html?speed=true&_bid=1004028&hideNavigationBar=1&hideNotch=1"

    .line 186
    .line 187
    :goto_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    const-string v0, "tantan://webview?url="

    .line 192
    .line 193
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 202
    .line 203
    .line 204
    :cond_4
    return-void
.end method

.method private synthetic c5(Lcom/p1/mobile/putong/account/data/AccountTestFactor;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/api/a;->t2(Lcom/p1/mobile/putong/account/data/AccountTestFactor;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/naq0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/naq0;-><init>(Ll/ccq0;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/oaq0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/oaq0;-><init>(Ll/ccq0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic d1(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d2(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/ccq0;->n4(Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d3(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->M4()V

    return-void
.end method

.method private synthetic d4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/ccq0;->d:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic d5(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "e_user_delete_account_withdraw_popup_confirm"

    .line 2
    .line 3
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/ccq0;->K5(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/ccq0;->o4(Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e1(Ll/ccq0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->P3(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e2(Ll/ccq0;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->X3(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e3(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ccq0;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u672a\u5b89\u88c5QQ"

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/ccq0;->I3(Landroid/content/Context;)Lcom/tencent/tauth/Tencent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/tencent/tauth/Tencent;->isSessionValid()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v0, Ll/p6;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Ll/p6;->n(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ll/ccq0;->I3(Landroid/content/Context;)Lcom/tencent/tauth/Tencent;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "all"

    .line 48
    .line 49
    iget-object p0, p0, Ll/ccq0;->x:Lcom/tencent/tauth/IUiListener;

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2, p0}, Lcom/tencent/tauth/Tencent;->login(Landroid/app/Activity;Ljava/lang/String;Lcom/tencent/tauth/IUiListener;)I

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Ll/ccq0;->I3(Landroid/content/Context;)Lcom/tencent/tauth/Tencent;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Lcom/tencent/tauth/Tencent;->logout(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private synthetic e5(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "switch_account"

    .line 2
    .line 3
    const-string v0, "close"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_switch_account_button"

    .line 14
    .line 15
    const-string v1, "p_signin_with_saved_info"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ccq0;->D:Ll/jl80;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic f0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f1(Ll/y20;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f2(Ll/ccq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->n5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f3(Ll/ccq0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->l4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic f4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/p6;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Ll/p6;->n(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic f5(Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_signin_with_saved_info_button"

    .line 2
    .line 3
    const-string v0, "p_signin_with_saved_info"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/ccq0;->D:Ll/jl80;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic g0(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g1(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->S5()V

    return-void
.end method

.method public static synthetic g2(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->L4()V

    return-void
.end method

.method public static synthetic g3(Ll/y20;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic g4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p6;->a()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/p6;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/p6;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Ll/p6;->n(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget v0, Lcom/p1/mobile/putong/account/R$string;->o4:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic g5(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "switch_account"

    .line 2
    .line 3
    const-string v0, "signin_another_account"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_switch_account_button"

    .line 14
    .line 15
    const-string v1, "p_signin_with_saved_info"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ccq0;->D:Ll/jl80;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic h0(Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/tcn;->b()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic h1(Ll/ccq0;Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Ll/ccq0;->x4(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h2(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/ccq0;->X4(Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h3(Ll/ccq0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->S3(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic h4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/p6;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Ll/p6;->n(Z)V

    .line 18
    .line 19
    .line 20
    const-string p0, "\u767b\u5f55\u5931\u8d25\uff0c\u7ed1\u5b9a\u624b\u673a\u53f7\u540e\u518d\u8bd5"

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic h5(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 1

    .line 1
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p2, Ll/p6;

    .line 8
    .line 9
    invoke-interface {p2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/p6;

    .line 19
    .line 20
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget p2, Lcom/p1/mobile/putong/account/R$string;->G2:I

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p2, 0x0

    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-static {p0, p2, v0}, Ll/o1j0;->l(Ljava/lang/String;ZZ)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/account/data/WeChatToken;)Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, p0, v2}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->m(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic i1(Lcom/p1/mobile/putong/account/data/WeChatToken;Ll/y20;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    const-string v0, "e_user_delete_account_withdraw_popup_confirm"

    .line 2
    .line 3
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "wechat"

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 30
    .line 31
    new-instance v1, Ll/i8q0;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/i8q0;-><init>()V

    .line 34
    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v0, Ll/j8q0;

    .line 42
    .line 43
    invoke-direct {v0, p1}, Ll/j8q0;-><init>(Ll/y20;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Ll/l8q0;

    .line 47
    .line 48
    invoke-direct {p1, p2}, Ll/l8q0;-><init>(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static synthetic i2(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->k5(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method

.method public static synthetic i3(Ll/ccq0;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Ll/ccq0;->Z4(Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic i4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/p6;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Ll/p6;->n(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic i5(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ccq0;->R5()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bp;->j()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic j0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j1(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->g4()V

    return-void
.end method

.method public static synthetic j2(Ll/ccq0;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->s4(Lcom/p1/mobile/putong/data/SignUpData;)V

    return-void
.end method

.method public static synthetic j3(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const-string v0, "e_user_delete_account_withdraw_popup_cancel"

    .line 2
    .line 3
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic j4(Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p3, p3, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;->b:I

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    iput-boolean p2, p0, Ll/ccq0;->s:Z

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    return-object p0
.end method

.method private synthetic j5(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Ll/p6;

    .line 4
    .line 5
    invoke-interface {p2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/p6;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget p2, Lcom/p1/mobile/putong/account/R$string;->G2:I

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p2, 0x0

    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-static {p0, p2, v0}, Ll/o1j0;->l(Ljava/lang/String;ZZ)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public static synthetic k0(Ll/ccq0;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->R3(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k1(Ll/ccq0;Lcom/p1/mobile/putong/account/data/ThirdPartVetify;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->O4(Lcom/p1/mobile/putong/account/data/ThirdPartVetify;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k2(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k3(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic k4(Lcom/p1/mobile/putong/account/data/WeChatToken;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p2, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->sex:I

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne v1, v2, :cond_0

    .line 10
    .line 11
    const-string v1, "male"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v2, 0x2

    .line 21
    if-ne v1, v2, :cond_1

    .line 22
    .line 23
    const-string v1, "female"

    .line 24
    .line 25
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 30
    .line 31
    :cond_1
    :goto_0
    iget-object v1, p2, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->nickname:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->wechat:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 38
    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 44
    .line 45
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 46
    .line 47
    iget-object p1, p2, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->unionid:Ljava/lang/String;

    .line 48
    .line 49
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyUnionid:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ccq0;->U5()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Ll/bp;->j()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_2

    .line 88
    .line 89
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p0, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    return-void
.end method

.method private synthetic k5(Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 1

    .line 1
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p2, Ll/p6;

    .line 8
    .line 9
    invoke-interface {p2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/p6;

    .line 19
    .line 20
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget p2, Lcom/p1/mobile/putong/account/R$string;->G2:I

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p2, 0x0

    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-static {p0, p2, v0}, Ll/o1j0;->l(Ljava/lang/String;ZZ)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public static synthetic l0()Lrx/c;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x1388

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->i(I)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static synthetic l1(Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->g(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic l2(Ll/y20;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic l3()V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic l4(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->V0()Ll/gxd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/AuthData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v1, ""

    .line 27
    .line 28
    :goto_0
    invoke-static {}, Ll/bp;->f()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p1, Ll/p6;

    .line 52
    .line 53
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1, v1}, Ll/cp;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    :goto_1
    const-string v2, "verified"

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AuthData;->finishedStages:Ljava/util/List;

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ll/ike;->j(Ljava/util/List;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_2

    .line 80
    .line 81
    sget-object v0, Ll/v3q0;->J:Ll/jxd0;

    .line 82
    .line 83
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 93
    .line 94
    .line 95
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget-object v1, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;->wechat_login:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;

    .line 106
    .line 107
    iget-object v2, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->h(Landroid/content/Context;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ll/ccq0;->U5()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Ll/bp;->j()Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eqz p1, :cond_3

    .line 127
    .line 128
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iget-object p0, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_3
    return-void
.end method

.method private synthetic l5(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/api/a;->m2(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ccq0;->R5()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/bp;->j()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p0, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/MobileRespInfo;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->token:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->accessCode:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->openId:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 18
    .line 19
    new-instance v0, Ll/v6q0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/v6q0;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic m1(Ll/ccq0;Lcom/p1/mobile/putong/account/data/AccountTestGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->a5(Lcom/p1/mobile/putong/account/data/AccountTestGroup;)V

    return-void
.end method

.method public static synthetic m2(Ll/ccq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->e5(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic m3(Ll/ccq0;)Lcom/facebook/AccessToken;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccq0;->p:Lcom/facebook/AccessToken;

    return-object p0
.end method

.method private synthetic m4(Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v3, Ll/e8q0;

    .line 6
    .line 7
    invoke-direct {v3, p1}, Ll/e8q0;-><init>(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    new-instance v4, Ll/f8q0;

    .line 11
    .line 12
    invoke-direct {v4, p2}, Ll/f8q0;-><init>(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    new-instance v5, Ll/g8q0;

    .line 16
    .line 17
    invoke-direct {v5, p3}, Ll/g8q0;-><init>(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "wechat"

    .line 21
    .line 22
    const-string v2, "verified"

    .line 23
    .line 24
    invoke-static/range {v0 .. v5}, Ll/zn;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic m5(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    instance-of v0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    move-object v3, p3

    .line 19
    check-cast v3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 20
    .line 21
    iget v3, v3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 22
    .line 23
    const v4, 0x9c54

    .line 24
    .line 25
    .line 26
    if-eq v3, v4, :cond_0

    .line 27
    .line 28
    const v5, 0x9c9b

    .line 29
    .line 30
    .line 31
    if-ne v3, v5, :cond_2

    .line 32
    .line 33
    :cond_0
    if-ne v3, v4, :cond_1

    .line 34
    .line 35
    move v1, v2

    .line 36
    :cond_1
    invoke-direct {p0, v1, p1, p2}, Ll/ccq0;->G5(ZLcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    if-eqz v0, :cond_4

    .line 41
    .line 42
    check-cast p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 43
    .line 44
    iget p3, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 45
    .line 46
    const v0, 0x9c50

    .line 47
    .line 48
    .line 49
    if-ne p3, v0, :cond_4

    .line 50
    .line 51
    new-instance p2, Lcom/p1/mobile/putong/data/SignUpData;

    .line 52
    .line 53
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 57
    .line 58
    const-string p3, "cosmos"

    .line 59
    .line 60
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    sget-object p1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 67
    .line 68
    iput-object p1, p2, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 69
    .line 70
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/api/a;->i2(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 73
    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object p3, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 82
    .line 83
    iput-object p3, p1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 84
    .line 85
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 86
    .line 87
    check-cast p1, Ll/p6;

    .line 88
    .line 89
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 94
    .line 95
    check-cast p3, Ll/p6;

    .line 96
    .line 97
    invoke-interface {p3}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 109
    .line 110
    check-cast p1, Ll/p6;

    .line 111
    .line 112
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 120
    .line 121
    check-cast p1, Ll/p6;

    .line 122
    .line 123
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ll/bp;->j()Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_5

    .line 135
    .line 136
    invoke-static {}, Ll/ot40;->e()Ll/ot40;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iget-object p0, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {p1, p0}, Ll/ot40;->j(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 147
    .line 148
    check-cast p0, Ll/p6;

    .line 149
    .line 150
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    sget p1, Lcom/p1/mobile/putong/account/R$string;->G2:I

    .line 159
    .line 160
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-static {p0, v1, v2}, Ll/o1j0;->l(Ljava/lang/String;ZZ)V

    .line 165
    .line 166
    .line 167
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_5

    .line 172
    .line 173
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 174
    .line 175
    .line 176
    :cond_5
    return-void
.end method

.method public static synthetic n0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n1(Ll/ccq0;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/ccq0;->q4(Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic n2(Ll/ccq0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->b4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic n3(Ll/ccq0;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccq0;->r:Ll/x20;

    return-object p0
.end method

.method private synthetic n4(Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ll/uxj0;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/bp;->f()Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_2

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/account/api/a;->i1()Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/account/api/a;->Z1()V

    .line 29
    .line 30
    .line 31
    iget-object v4, v0, Ll/ccq0;->f:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-nez v4, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/ccq0;->D3()Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-eqz v4, :cond_0

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    iget-object v7, v0, Ll/ccq0;->f:Ljava/lang/String;

    .line 50
    .line 51
    new-instance v8, Ll/h7q0;

    .line 52
    .line 53
    invoke-direct {v8, v1}, Ll/h7q0;-><init>(Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    new-instance v9, Ll/i7q0;

    .line 57
    .line 58
    invoke-direct {v9, v2}, Ll/i7q0;-><init>(Ll/y20;)V

    .line 59
    .line 60
    .line 61
    new-instance v10, Ll/j7q0;

    .line 62
    .line 63
    invoke-direct {v10, v3}, Ll/j7q0;-><init>(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    new-instance v11, Ll/k7q0;

    .line 67
    .line 68
    invoke-direct {v11, v0, v3, v2, v1}, Ll/k7q0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    const-string v6, "wechat"

    .line 72
    .line 73
    invoke-static/range {v5 .. v11}, Ll/zn;->Q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v12

    .line 81
    new-instance v15, Ll/l7q0;

    .line 82
    .line 83
    invoke-direct {v15, v3}, Ll/l7q0;-><init>(Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    new-instance v0, Ll/m7q0;

    .line 87
    .line 88
    invoke-direct {v0, v2}, Ll/m7q0;-><init>(Ll/y20;)V

    .line 89
    .line 90
    .line 91
    new-instance v2, Ll/n7q0;

    .line 92
    .line 93
    invoke-direct {v2, v1}, Ll/n7q0;-><init>(Ljava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    const-string v13, "wechat"

    .line 97
    .line 98
    const-string v14, ""

    .line 99
    .line 100
    move-object/from16 v16, v0

    .line 101
    .line 102
    move-object/from16 v17, v2

    .line 103
    .line 104
    invoke-static/range {v12 .. v17}, Ll/zn;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 109
    .line 110
    invoke-interface {v2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    :cond_2
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 114
    .line 115
    invoke-interface {v2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method private synthetic n5(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "e_signin_fb_button"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/p6;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/p6;->e()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->p()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v0, Ll/p6;

    .line 35
    .line 36
    iget-object p0, p0, Ll/ccq0;->C:Landroid/view/View$OnClickListener;

    .line 37
    .line 38
    invoke-virtual {v0, p0, p1}, Ll/p6;->i(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object p0, p0, Ll/ccq0;->C:Landroid/view/View$OnClickListener;

    .line 43
    .line 44
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic o0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o1(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o2(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->h4()V

    return-void
.end method

.method public static bridge synthetic o3(Ll/ccq0;)Ll/b30;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccq0;->n:Ll/b30;

    return-object p0
.end method

.method private synthetic o4(Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    instance-of v0, p5, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    move-object v0, p5

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 9
    .line 10
    const v1, 0x9c54

    .line 11
    .line 12
    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    const v2, 0x9c9b

    .line 16
    .line 17
    .line 18
    if-ne v0, v2, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    invoke-static {p5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :goto_0
    if-ne v0, v1, :cond_2

    .line 29
    .line 30
    const/4 p4, 0x1

    .line 31
    goto :goto_1

    .line 32
    :cond_2
    const/4 p4, 0x0

    .line 33
    :goto_1
    invoke-direct {p0, p4, p1, p2, p3}, Ll/ccq0;->J5(ZLcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_3
    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    .line 38
    .line 39
    .line 40
    invoke-static {p5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private synthetic o5(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "e_signin_google_button"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ccq0;->F:Landroid/view/View$OnClickListener;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic p0(Ll/y20;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p1(Ll/ccq0;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ccq0;->Y3(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic p2(Ll/ccq0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->b5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic p3(Ll/ccq0;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccq0;->A:Ll/y20;

    return-object p0
.end method

.method private synthetic p4(Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    instance-of v0, p5, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    move-object v0, p5

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 9
    .line 10
    const v1, 0x9c65

    .line 11
    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->wechat:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/api/a;->m2(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p2, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p2, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    move-object v0, p3

    .line 43
    move-object p3, p4

    .line 44
    new-instance p4, Ll/o6q0;

    .line 45
    .line 46
    invoke-direct {p4, p0}, Ll/o6q0;-><init>(Ll/ccq0;)V

    .line 47
    .line 48
    .line 49
    new-instance p5, Lcom/p1/mobile/putong/data/SignInData;

    .line 50
    .line 51
    invoke-direct {p5}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v1, "wechat"

    .line 55
    .line 56
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, p5, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 61
    .line 62
    iget-object v1, p2, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, p5, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p2, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, p5, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, p5, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 75
    .line 76
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 77
    .line 78
    new-instance v2, Ll/p6q0;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/p6q0;-><init>()V

    .line 81
    .line 82
    .line 83
    const/4 v3, 0x0

    .line 84
    invoke-virtual {v1, p5, v3, v2}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    new-instance v2, Ll/q6q0;

    .line 89
    .line 90
    invoke-direct {v2, p0, v0, p4, p1}, Ll/q6q0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V

    .line 91
    .line 92
    .line 93
    move-object p5, p1

    .line 94
    move-object p1, p0

    .line 95
    new-instance p0, Ll/r6q0;

    .line 96
    .line 97
    invoke-direct/range {p0 .. p5}, Ll/r6q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v2, p0, v3}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    move-object p0, p1

    .line 109
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 110
    .line 111
    .line 112
    invoke-static {p5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_2
    move-object p0, p1

    .line 117
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 118
    .line 119
    .line 120
    invoke-static {p5}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method private synthetic p5(Ljava/lang/String;Ll/uxj0;)V
    .locals 3

    .line 1
    sget-object p2, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/api/api/AccountTempApi;->d:Ll/yyd0;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/eyd0;->i()Z

    .line 6
    .line 7
    .line 8
    const-string p2, "oppo_quick_login"

    .line 9
    .line 10
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 17
    .line 18
    const-string v0, "user.oppo.signin"

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/account/api/a;->b1(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    new-instance v0, Ll/daq0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/daq0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p1, "saved_sign-in_info"

    .line 38
    .line 39
    :goto_0
    const-string p2, "signin_type"

    .line 40
    .line 41
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {p1}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string p2, "e_signin_success"

    .line 50
    .line 51
    const-string v0, ""

    .line 52
    .line 53
    invoke-static {p2, v0, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    const-string p1, "signin"

    .line 57
    .line 58
    const/4 p2, 0x0

    .line 59
    new-array v0, p2, [Ljava/lang/Object;

    .line 60
    .line 61
    invoke-static {p1, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const/4 v2, 0x1

    .line 77
    invoke-interface {v0, v1, p2, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->newMainActClearStack(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/ccq0;->U5()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/data/MobileRespInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic q1(Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q2()V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic q3(Ll/ccq0;Lcom/facebook/AccessToken;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ccq0;->p:Lcom/facebook/AccessToken;

    return-void
.end method

.method private synthetic q4(Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ccq0;->w:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 2
    .line 3
    const-string v1, "wx67f59443a9c801bb"

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->registerApp(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/tencent/mm/opensdk/modelmsg/SendAuth$Req;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/tencent/mm/opensdk/modelmsg/SendAuth$Req;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "snsapi_userinfo"

    .line 14
    .line 15
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelmsg/SendAuth$Req;->scope:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelmsg/SendAuth$Req;->state:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p0, Ll/ccq0;->w:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 22
    .line 23
    invoke-interface {v1, v0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/opensdk/modelbase/BaseReq;)Z

    .line 24
    .line 25
    .line 26
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ccq0;->U5()V

    .line 30
    .line 31
    .line 32
    new-instance v5, Lcom/p1/mobile/putong/account/data/WeChatToken;

    .line 33
    .line 34
    invoke-direct {v5}, Lcom/p1/mobile/putong/account/data/WeChatToken;-><init>()V

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->i()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/waq0;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1, p2}, Ll/waq0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/xaq0;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/xaq0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v0, Ll/yaq0;

    .line 62
    .line 63
    invoke-direct {v0, v5, p2}, Ll/yaq0;-><init>(Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance v0, Ll/zaq0;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/zaq0;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance v0, Ll/abq0;

    .line 80
    .line 81
    invoke-direct {v0, p2}, Ll/abq0;-><init>(Ljava/lang/Runnable;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance v0, Ll/bbq0;

    .line 89
    .line 90
    invoke-direct {v0, v5}, Ll/bbq0;-><init>(Lcom/p1/mobile/putong/account/data/WeChatToken;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    new-instance v0, Ll/cbq0;

    .line 98
    .line 99
    invoke-direct {v0, p2}, Ll/cbq0;-><init>(Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Lrx/c;->first()Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    new-instance v0, Ll/dbq0;

    .line 111
    .line 112
    invoke-direct {v0, p0, v5}, Ll/dbq0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatToken;)V

    .line 113
    .line 114
    .line 115
    new-instance v2, Ll/ebq0;

    .line 116
    .line 117
    move-object v3, p0

    .line 118
    move-object v4, p2

    .line 119
    move-object v6, p3

    .line 120
    move-object v7, p4

    .line 121
    invoke-direct/range {v2 .. v7}, Ll/ebq0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/WeChatToken;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    const/4 p0, 0x0

    .line 125
    invoke-static {v0, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    iput-object p0, v3, Ll/ccq0;->u:Ll/kcg0;

    .line 134
    .line 135
    return-void
.end method

.method private synthetic q5(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/o560;->b()Ll/o560;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/o560;->a()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 13
    .line 14
    .line 15
    instance-of v0, p1, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    move-object v0, p1

    .line 20
    check-cast v0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/App$HandledGlobally;->getThrowable()Ljava/lang/Throwable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v0, p1

    .line 28
    :goto_0
    const-class v1, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    const-class v1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/dmk0;->c(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    :goto_1
    sget p1, Lcom/p1/mobile/putong/account/R$string;->P:I

    .line 50
    .line 51
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ccq0;->E5()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic r0(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r1(Lcom/p1/mobile/putong/account/data/WeChatToken;Lcom/p1/mobile/putong/account/data/ThirdPartVetify;)Lrx/c;
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyAccessToken:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/WeChatToken;->thirdpartyId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->l(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic r2(Ll/ccq0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Ll/ccq0;->Y4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic r3(Ll/ccq0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ccq0;->s:Z

    return-void
.end method

.method private synthetic r4(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->R0()Ll/wyd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/account/data/MatchCounterEnvelope;)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/MatchCounterEnvelope;->totalCounters:Lcom/p1/mobile/putong/account/data/MatchTotalCounter;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/p1/mobile/putong/account/data/MatchTotalCounter;->matches:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/a;->j:Ll/byd0;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic s1(Ll/y20;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic s2(Ll/ccq0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->Z3(Landroid/os/Bundle;)V

    return-void
.end method

.method public static bridge synthetic s3(Ll/ccq0;Ljava/lang/Throwable;)Z
    .locals 0

    const/4 p0, 0x1

    return p0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->K3(Ljava/lang/Throwable;)Z

    move-result p0

    return p0
.end method

.method private synthetic s4(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v2, Ll/z9q0;

    .line 6
    .line 7
    invoke-direct {v2, p0, p1}, Ll/z9q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/am2;->i(Ljava/lang/String;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic t0(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t1(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->I4()V

    return-void
.end method

.method public static synthetic t2(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/MobileRespInfo;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->token:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->accessCode:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->openId:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 18
    .line 19
    new-instance v0, Ll/h8q0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/h8q0;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static bridge synthetic t3(Ll/ccq0;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->w5(Lorg/json/JSONObject;)V

    return-void
.end method

.method private synthetic t4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p6;->k()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "e_signin_fb_button"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/b94$b;->a()Ll/b94;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/ccq0;->o:Ll/b94;

    .line 28
    .line 29
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Ll/ccq0;->o:Ll/b94;

    .line 34
    .line 35
    new-instance v2, Ll/ccq0$e;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/ccq0$e;-><init>(Ll/ccq0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ll/z0w;->y(Ll/b94;Ll/tvf;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast p0, Ll/p6;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/p6;->s()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic u0(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->P4(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    return-void
.end method

.method public static synthetic u1(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u2(Ll/ccq0;Lcom/p1/mobile/putong/account/data/WeChatToken;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->k4(Lcom/p1/mobile/putong/account/data/WeChatToken;Lcom/p1/mobile/putong/account/data/WeChatUserInfo;)V

    return-void
.end method

.method public static bridge synthetic u3(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->D5()V

    return-void
.end method

.method private synthetic u4(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/p6;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Ll/p6;->q(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/z0w;->u()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget-object v0, Lcom/p1/mobile/putong/api/api/FacebookApi;->d:Ljava/util/List;

    .line 25
    .line 26
    invoke-virtual {p1, p0, v0}, Ll/z0w;->t(Landroid/app/Activity;Ljava/util/Collection;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private u5(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V
    .locals 3

    .line 1
    new-instance v0, Ll/a9q0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/a9q0;-><init>(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p2, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p2, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyToken:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->thirdPartyToken:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->google:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 15
    .line 16
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-static {p1, v1, v2}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v2, Ll/b9q0;

    .line 29
    .line 30
    invoke-direct {v2, p0, p1}, Ll/b9q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ll/d9q0;

    .line 34
    .line 35
    invoke-direct {p1, p0, p2, v0}, Ll/d9q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic v1(Ll/y20;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic v2()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v3(Ll/ccq0;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic v4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p6;->v()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 18
    .line 19
    new-instance v1, Ll/caq0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/caq0;-><init>(Ll/ccq0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Ll/ccq0;->L5(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic w2(Ll/ccq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->f4()V

    return-void
.end method

.method public static synthetic w3(Ll/ccq0;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic w4()V
    .locals 2

    .line 1
    new-instance v0, Ll/o9q0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/o9q0;-><init>(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/p9q0;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/p9q0;-><init>(Ll/ccq0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ccq0;->F5(Ll/x20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private w5(Lorg/json/JSONObject;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/p6;->n(Z)V

    .line 7
    .line 8
    .line 9
    new-instance v4, Ll/gaq0;

    .line 10
    .line 11
    invoke-direct {v4, p0}, Ll/gaq0;-><init>(Ll/ccq0;)V

    .line 12
    .line 13
    .line 14
    new-instance v6, Ll/haq0;

    .line 15
    .line 16
    invoke-direct {v6, p0}, Ll/haq0;-><init>(Ll/ccq0;)V

    .line 17
    .line 18
    .line 19
    new-instance v8, Ll/iaq0;

    .line 20
    .line 21
    invoke-direct {v8, p0}, Ll/iaq0;-><init>(Ll/ccq0;)V

    .line 22
    .line 23
    .line 24
    const-string v2, ""

    .line 25
    .line 26
    :try_start_0
    const-string v0, "openid"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 32
    :try_start_1
    const-string v0, "access_token"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 38
    :try_start_2
    const-string v0, "expires_in"

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 44
    :goto_0
    move-object p1, v5

    .line 45
    move-object v5, v3

    .line 46
    goto :goto_2

    .line 47
    :catch_0
    move-exception v0

    .line 48
    move-object p1, v0

    .line 49
    goto :goto_1

    .line 50
    :catch_1
    move-exception v0

    .line 51
    move-object p1, v0

    .line 52
    move-object v5, v2

    .line 53
    goto :goto_1

    .line 54
    :catch_2
    move-exception v0

    .line 55
    move-object p1, v0

    .line 56
    move-object v3, v2

    .line 57
    move-object v5, v3

    .line 58
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :goto_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Ll/ccq0;->I3(Landroid/content/Context;)Lcom/tencent/tauth/Tencent;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0, p1, v2}, Lcom/tencent/tauth/Tencent;->setAccessToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {v0}, Ll/ccq0;->I3(Landroid/content/Context;)Lcom/tencent/tauth/Tencent;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0, v5}, Lcom/tencent/tauth/Tencent;->setOpenId(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 104
    .line 105
    invoke-virtual {v0, v5, p1, v1}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->m(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/kaq0;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/kaq0;-><init>(Ll/ccq0;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v2, Ll/laq0;

    .line 127
    .line 128
    move-object v3, p0

    .line 129
    move-object v7, v4

    .line 130
    move-object v4, v5

    .line 131
    move-object v5, p1

    .line 132
    invoke-direct/range {v2 .. v7}, Ll/laq0;-><init>(Ll/ccq0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 133
    .line 134
    .line 135
    move-object p1, v2

    .line 136
    move-object p0, v4

    .line 137
    move-object v4, v7

    .line 138
    new-instance v2, Ll/maq0;

    .line 139
    .line 140
    move-object v7, v6

    .line 141
    move-object v6, v5

    .line 142
    move-object v5, p0

    .line 143
    invoke-direct/range {v2 .. v8}, Ll/maq0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 144
    .line 145
    .line 146
    const/4 p0, 0x0

    .line 147
    invoke-static {p1, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_1
    :goto_3
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public static synthetic x0(Ljava/lang/Runnable;Lcom/p1/mobile/putong/account/data/ThirdPartVetify;)Ljava/lang/Boolean;
    .locals 1

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
    iget p1, p1, Lcom/p1/mobile/putong/account/data/ThirdPartVetify;->code:I

    .line 8
    .line 9
    const/16 v0, 0xc8

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic x1(Ll/ccq0;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ccq0;->m4(Ljava/lang/Runnable;Ll/y20;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic x2(Ll/ccq0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ccq0;->d5(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic x3(Ll/ccq0;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic x4(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    check-cast p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 6
    .line 7
    iget p5, p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 8
    .line 9
    const p6, 0x9c54

    .line 10
    .line 11
    .line 12
    if-eq p5, p6, :cond_1

    .line 13
    .line 14
    const v0, 0x9c9b

    .line 15
    .line 16
    .line 17
    if-ne p5, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void

    .line 21
    :cond_1
    :goto_0
    if-ne p5, p6, :cond_2

    .line 22
    .line 23
    const/4 p5, 0x1

    .line 24
    goto :goto_1

    .line 25
    :cond_2
    const/4 p5, 0x0

    .line 26
    :goto_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p5, :cond_3

    .line 35
    .line 36
    sget p6, Lcom/p1/mobile/putong/account/R$string;->V2:I

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_3
    sget p6, Lcom/p1/mobile/putong/account/R$string;->T2:I

    .line 40
    .line 41
    :goto_2
    invoke-virtual {p0, p6}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    if-eqz p5, :cond_4

    .line 46
    .line 47
    sget p5, Lcom/p1/mobile/putong/account/R$string;->W2:I

    .line 48
    .line 49
    goto :goto_3

    .line 50
    :cond_4
    sget p5, Lcom/p1/mobile/putong/account/R$string;->U2:I

    .line 51
    .line 52
    :goto_3
    invoke-virtual {p0, p5}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget p5, Lcom/p1/mobile/putong/account/R$string;->z:I

    .line 57
    .line 58
    new-instance p6, Ll/aaq0;

    .line 59
    .line 60
    invoke-direct {p6, p1, p2, p3, p4}, Ll/aaq0;-><init>(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p5, p6}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget p1, Lcom/p1/mobile/putong/account/R$string;->b:I

    .line 68
    .line 69
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance p1, Ll/baq0;

    .line 78
    .line 79
    invoke-direct {p1, p4}, Ll/baq0;-><init>(Ljava/lang/Runnable;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_5
    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    .line 87
    .line 88
    .line 89
    invoke-static {p5}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic y0(Ll/ccq0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->q5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic y2(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y3(Ll/ccq0;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic y4(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/p6;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Ll/p6;->b(Z)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    .line 10
    .line 11
    sget-object v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->DEFAULT_SIGN_IN:Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    .line 12
    .line 13
    invoke-direct {p1, v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;-><init>(Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->b()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "218526224262-usliqg20cepnb3ql98amgeum18v8uatv.apps.googleusercontent.com"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->d(Ljava/lang/String;)Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->a()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0, p1}, Lcom/google/android/gms/auth/api/signin/a;->a(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Ll/h7k;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/h7k;->d()Lcom/google/android/gms/tasks/Task;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1}, Ll/h7k;->b()Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const/16 v0, 0x2329

    .line 50
    .line 51
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic z0(Ll/ccq0;Lrx/AsyncEmitter;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->T3(Lrx/AsyncEmitter;)V

    return-void
.end method

.method public static synthetic z1(Ll/ccq0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->U3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z2(Ll/ccq0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ccq0;->l5(Ll/uxj0;)V

    return-void
.end method

.method private z3()V
    .locals 2

    .line 1
    new-instance v0, Ll/w9q0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w9q0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/x9q0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/x9q0;-><init>(Ll/ccq0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic z4(Ljava/lang/Throwable;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignInGrantType;)V
    .locals 9

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p4, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 7
    .line 8
    iget-object v1, p2, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p2, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyToken:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v6, Ll/t9q0;

    .line 17
    .line 18
    invoke-direct {v6, p0}, Ll/t9q0;-><init>(Ll/ccq0;)V

    .line 19
    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v1, v0, v2, v3}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/u9q0;

    .line 30
    .line 31
    invoke-direct {v1, v6}, Ll/u9q0;-><init>(Ll/x20;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/v9q0;

    .line 35
    .line 36
    move-object v3, p0

    .line 37
    move-object v8, p1

    .line 38
    move-object v5, p2

    .line 39
    move-object v7, p3

    .line 40
    move-object v4, p4

    .line 41
    invoke-direct/range {v2 .. v8}, Ll/v9q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public A5()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ccq0;->E:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D3()Z
    .locals 3

    const/4 v0, 0x1

    return v0

    .line 1
    iget-object v0, p0, Ll/ccq0;->g:Lcom/p1/mobile/account_core/reponse_data/OneClickStatus;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 8
    .line 9
    iget-object v0, v0, Ll/pw;->a:Ll/hp50;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/hp50;->c()Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    sget-object v2, Ll/ccq0$g;->a:[I

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    aget v0, v2, v0

    .line 25
    .line 26
    if-eq v0, v1, :cond_3

    .line 27
    .line 28
    const/4 v2, 0x2

    .line 29
    if-eq v0, v2, :cond_3

    .line 30
    .line 31
    const/4 v2, 0x3

    .line 32
    if-eq v0, v2, :cond_2

    .line 33
    .line 34
    return v1

    .line 35
    :cond_2
    iget-object p0, p0, Ll/ccq0;->g:Lcom/p1/mobile/account_core/reponse_data/OneClickStatus;

    .line 36
    .line 37
    iget-boolean p0, p0, Lcom/p1/mobile/account_core/reponse_data/OneClickStatus;->chinaUnicom:Z

    .line 38
    .line 39
    return p0

    .line 40
    :cond_3
    iget-object p0, p0, Ll/ccq0;->g:Lcom/p1/mobile/account_core/reponse_data/OneClickStatus;

    .line 41
    .line 42
    iget-boolean p0, p0, Lcom/p1/mobile/account_core/reponse_data/OneClickStatus;->chinaMobile:Z

    .line 43
    .line 44
    return p0
.end method

.method public E5()V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->d:Ll/yyd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/eyd0;->i()Z

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/ccq0;->B5()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public F3()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/WeChatUserInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pbq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pbq0;-><init>(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lrx/AsyncEmitter$BackpressureMode;->LATEST:Lrx/AsyncEmitter$BackpressureMode;

    .line 7
    .line 8
    invoke-static {v0, p0}, Lrx/c;->fromAsync(Ll/y20;Lrx/AsyncEmitter$BackpressureMode;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public F5(Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p2}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    :cond_1
    return-void
.end method

.method public H3(Z)Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/l9q0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/l9q0;-><init>(Ll/ccq0;Z)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public J3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/r8q0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r8q0;-><init>(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->new_()Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object p1, v1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p2, v1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyToken:Ljava/lang/String;

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/account/api/a;->D2(Lcom/p1/mobile/putong/account/data/ThirdPartyData;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/c9q0;

    .line 25
    .line 26
    invoke-direct {p2, p0, v1}, Ll/c9q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/n9q0;

    .line 30
    .line 31
    invoke-direct {v2, p0, v1, v0}, Ll/n9q0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    invoke-static {p2, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public K5(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/p6;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/16 v2, 0x1388

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->h(I)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/s7q0;

    .line 34
    .line 35
    invoke-direct {v2, p0, p2}, Ll/s7q0;-><init>(Ll/ccq0;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/t7q0;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/t7q0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ll/u7q0;

    .line 52
    .line 53
    invoke-direct {v2, p1}, Ll/u7q0;-><init>(Lcom/p1/mobile/putong/data/SignInData;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v0, Ll/v7q0;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/v7q0;-><init>(Ll/ccq0;)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Ll/w7q0;

    .line 71
    .line 72
    invoke-direct {v1, p0, p2}, Ll/w7q0;-><init>(Ll/ccq0;Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public L5(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p6;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/p6;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/16 v2, 0x1388

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->h(I)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/hbq0;

    .line 34
    .line 35
    invoke-direct {v2, p0, p2}, Ll/hbq0;-><init>(Ll/ccq0;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/ibq0;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/ibq0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ll/jbq0;

    .line 52
    .line 53
    invoke-direct {v2, p1}, Ll/jbq0;-><init>(Lcom/p1/mobile/putong/data/SignInData;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/kbq0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/kbq0;-><init>(Ll/ccq0;)V

    .line 68
    .line 69
    .line 70
    new-instance v3, Ll/lbq0;

    .line 71
    .line 72
    invoke-direct {v3, p0, p1, p2}, Ll/lbq0;-><init>(Ll/ccq0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v3, v2}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public M3()Z
    .locals 2

    const/4 v0, 0x1

    return v0

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v1, "com.tencent.mobileqq"

    .line 11
    .line 12
    invoke-virtual {p0, v1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :catch_0
    :cond_0
    return v0
.end method

.method public M5()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/m9q0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m9q0;-><init>(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public N3()Z
    .locals 0

    const/4 p0, 0x1

    return p0

    .line 1
    invoke-direct {p0}, Ll/ccq0;->A3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ccq0;->w:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->isWXAppInstalled()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public N5()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/gbq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gbq0;-><init>(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public O5()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0}, Ll/ccq0;->P5(Lcom/p1/mobile/putong/data/RememberUserInfo;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public P5(Lcom/p1/mobile/putong/data/RememberUserInfo;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "unknown_"

    .line 16
    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 24
    .line 25
    new-instance v2, Ll/q9q0;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/q9q0;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {v1, v0, p1, v3, v2}, Lcom/p1/mobile/putong/account/api/a;->n2(Lcom/p1/mobile/putong/data/SignInData;Lcom/p1/mobile/putong/data/RememberUserInfo;ZLjava/lang/Runnable;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/r9q0;

    .line 36
    .line 37
    invoke-direct {v0, p0, p2}, Ll/r9q0;-><init>(Ll/ccq0;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance p2, Ll/s9q0;

    .line 41
    .line 42
    invoke-direct {p2, p0}, Ll/s9q0;-><init>(Ll/ccq0;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public Q5(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    array-length v0, p1

    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    :goto_0
    if-ge v1, v0, :cond_4

    .line 19
    .line 20
    aget-char v3, p1, v1

    .line 21
    .line 22
    const/16 v4, 0x4e00

    .line 23
    .line 24
    const-string v5, "..."

    .line 25
    .line 26
    if-lt v3, v4, :cond_2

    .line 27
    .line 28
    const v4, 0x9fa5

    .line 29
    .line 30
    .line 31
    if-gt v3, v4, :cond_2

    .line 32
    .line 33
    const/16 v4, 0xb

    .line 34
    .line 35
    if-ne v2, v4, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_1
    add-int/lit8 v2, v2, 0x2

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    :goto_1
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const/16 v3, 0xc

    .line 50
    .line 51
    if-lt v2, v3, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_4
    :goto_2
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public R5()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->V0()Ll/gxd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/AuthData;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/AuthData;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 14
    .line 15
    const-string v1, "unknown_"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v1, v0}, Ll/cp;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x0

    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-interface {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :goto_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast v1, Ll/p6;

    .line 53
    .line 54
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 62
    .line 63
    check-cast v1, Ll/p6;

    .line 64
    .line 65
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast p0, Ll/p6;

    .line 75
    .line 76
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public T5()V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/yp50;->f()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x1

    .line 19
    if-ne v1, v2, :cond_2

    .line 20
    .line 21
    sget-boolean v1, Ll/ccq0;->G:Z

    .line 22
    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    sput-boolean v2, Ll/ccq0;->G:Z

    .line 26
    .line 27
    invoke-static {}, Ll/hxk;->g()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const-string v2, "meid"

    .line 32
    .line 33
    const-string v3, "oaid"

    .line 34
    .line 35
    const-string v4, "imei2"

    .line 36
    .line 37
    const-string v5, "imei"

    .line 38
    .line 39
    const-string v6, "device_model_raw"

    .line 40
    .line 41
    const-string v7, "user_agent"

    .line 42
    .line 43
    const-string v8, "is_first_open"

    .line 44
    .line 45
    const-string v9, ""

    .line 46
    .line 47
    const-string v10, "e_app_1st_open"

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ll/hxk;->h()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_0

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    new-instance v11, Ll/pf60;

    .line 70
    .line 71
    iget-boolean v0, v0, Ll/ccq0;->j:Z

    .line 72
    .line 73
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-direct {v11, v8, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    new-instance v12, Ll/pf60;

    .line 81
    .line 82
    const-string v0, "package_name"

    .line 83
    .line 84
    invoke-direct {v12, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    new-instance v13, Ll/pf60;

    .line 88
    .line 89
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ll/hxk;->d()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v1, "referrer"

    .line 98
    .line 99
    invoke-direct {v13, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    new-instance v14, Ll/pf60;

    .line 103
    .line 104
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ll/hxk;->a()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    const-string v1, "click_time"

    .line 113
    .line 114
    invoke-direct {v14, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    new-instance v15, Ll/pf60;

    .line 118
    .line 119
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ll/hxk;->b()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const-string v1, "install_time"

    .line 128
    .line 129
    invoke-direct {v15, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    new-instance v0, Ll/pf60;

    .line 133
    .line 134
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v1}, Ll/hxk;->e()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    const-string v8, "track"

    .line 143
    .line 144
    invoke-direct {v0, v8, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    new-instance v1, Ll/pf60;

    .line 148
    .line 149
    sget-object v8, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 150
    .line 151
    invoke-static {v8}, Ll/gsp0;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v8

    .line 155
    invoke-direct {v1, v7, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    new-instance v7, Ll/pf60;

    .line 159
    .line 160
    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 161
    .line 162
    invoke-direct {v7, v6, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    new-instance v6, Ll/pf60;

    .line 166
    .line 167
    invoke-static {}, Ll/qzd;->e()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v8

    .line 171
    invoke-direct {v6, v5, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    new-instance v5, Ll/pf60;

    .line 175
    .line 176
    invoke-static {}, Ll/qzd;->f()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v8

    .line 180
    invoke-direct {v5, v4, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    new-instance v4, Ll/pf60;

    .line 184
    .line 185
    invoke-static {}, Ll/hb00;->b()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v8

    .line 189
    invoke-direct {v4, v3, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    new-instance v3, Ll/pf60;

    .line 193
    .line 194
    invoke-static {}, Ll/qzd;->g()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v8

    .line 198
    invoke-direct {v3, v2, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    move-object/from16 v16, v0

    .line 202
    .line 203
    move-object/from16 v17, v1

    .line 204
    .line 205
    move-object/from16 v22, v3

    .line 206
    .line 207
    move-object/from16 v21, v4

    .line 208
    .line 209
    move-object/from16 v20, v5

    .line 210
    .line 211
    move-object/from16 v19, v6

    .line 212
    .line 213
    move-object/from16 v18, v7

    .line 214
    .line 215
    filled-new-array/range {v11 .. v22}, [Ll/pf60;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-static {v10, v9, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 220
    .line 221
    .line 222
    sget-boolean v0, Ll/kzv;->a:Z

    .line 223
    .line 224
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {v0}, Ll/hxk;->d()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v0}, Ll/hxk;->a()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {v0}, Ll/hxk;->b()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    invoke-static {}, Ll/hxk;->c()Ll/hxk;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {v0}, Ll/hxk;->e()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :cond_0
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 254
    .line 255
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-nez v1, :cond_1

    .line 260
    .line 261
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    const-string v11, "douyin"

    .line 268
    .line 269
    invoke-virtual {v1, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    if-eqz v1, :cond_1

    .line 274
    .line 275
    new-instance v11, Ll/pf60;

    .line 276
    .line 277
    iget-boolean v0, v0, Ll/ccq0;->j:Z

    .line 278
    .line 279
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-direct {v11, v8, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 284
    .line 285
    .line 286
    new-instance v12, Ll/pf60;

    .line 287
    .line 288
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 289
    .line 290
    invoke-static {v0}, Ll/gsp0;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-direct {v12, v7, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 295
    .line 296
    .line 297
    new-instance v13, Ll/pf60;

    .line 298
    .line 299
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 300
    .line 301
    invoke-direct {v13, v6, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 302
    .line 303
    .line 304
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 305
    .line 306
    invoke-static {v0}, Lcom/bytedance/hume/readapk/HumeSDK;->getChannel(Landroid/content/Context;)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    const-string v1, "toutiao_channel"

    .line 311
    .line 312
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 313
    .line 314
    .line 315
    move-result-object v14

    .line 316
    new-instance v15, Ll/pf60;

    .line 317
    .line 318
    invoke-static {}, Ll/qzd;->e()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-direct {v15, v5, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    new-instance v0, Ll/pf60;

    .line 326
    .line 327
    invoke-static {}, Ll/qzd;->f()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    invoke-direct {v0, v4, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 332
    .line 333
    .line 334
    new-instance v1, Ll/pf60;

    .line 335
    .line 336
    invoke-static {}, Ll/hb00;->b()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v4

    .line 340
    invoke-direct {v1, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 341
    .line 342
    .line 343
    new-instance v3, Ll/pf60;

    .line 344
    .line 345
    invoke-static {}, Ll/qzd;->g()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v4

    .line 349
    invoke-direct {v3, v2, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 350
    .line 351
    .line 352
    move-object/from16 v16, v0

    .line 353
    .line 354
    move-object/from16 v17, v1

    .line 355
    .line 356
    move-object/from16 v18, v3

    .line 357
    .line 358
    filled-new-array/range {v11 .. v18}, [Ll/pf60;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    invoke-static {v10, v9, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    :cond_1
    new-instance v1, Ll/pf60;

    .line 367
    .line 368
    iget-boolean v0, v0, Ll/ccq0;->j:Z

    .line 369
    .line 370
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-direct {v1, v8, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 375
    .line 376
    .line 377
    new-instance v0, Ll/pf60;

    .line 378
    .line 379
    sget-object v8, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 380
    .line 381
    invoke-static {v8}, Ll/gsp0;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v8

    .line 385
    invoke-direct {v0, v7, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 386
    .line 387
    .line 388
    new-instance v7, Ll/pf60;

    .line 389
    .line 390
    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 391
    .line 392
    invoke-direct {v7, v6, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 393
    .line 394
    .line 395
    new-instance v6, Ll/pf60;

    .line 396
    .line 397
    invoke-static {}, Ll/qzd;->e()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v8

    .line 401
    invoke-direct {v6, v5, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 402
    .line 403
    .line 404
    new-instance v5, Ll/pf60;

    .line 405
    .line 406
    invoke-static {}, Ll/qzd;->f()Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object v8

    .line 410
    invoke-direct {v5, v4, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 411
    .line 412
    .line 413
    move-object v4, v6

    .line 414
    new-instance v6, Ll/pf60;

    .line 415
    .line 416
    invoke-static {}, Ll/hb00;->b()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v8

    .line 420
    invoke-direct {v6, v3, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 421
    .line 422
    .line 423
    move-object v3, v7

    .line 424
    new-instance v7, Ll/pf60;

    .line 425
    .line 426
    invoke-static {}, Ll/qzd;->g()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object v8

    .line 430
    invoke-direct {v7, v2, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 431
    .line 432
    .line 433
    move-object v2, v0

    .line 434
    filled-new-array/range {v1 .. v7}, [Ll/pf60;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    invoke-static {v10, v9, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 439
    .line 440
    .line 441
    :cond_2
    return-void
.end method

.method public U5()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ccq0;->u:Ll/kcg0;

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
    iget-object v0, p0, Ll/ccq0;->u:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/ccq0;->u:Ll/kcg0;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/y9q0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/y9q0;-><init>(Ll/ccq0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Ll/ike;->a:Ll/wyd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/String;

    .line 23
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
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    const-string v1, "finished"

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_0

    .line 51
    .line 52
    const-string v1, "unknown_"

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_0

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/jaq0;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/jaq0;-><init>(Ll/ccq0;)V

    .line 73
    .line 74
    .line 75
    new-instance v2, Ll/uaq0;

    .line 76
    .line 77
    invoke-direct {v2, p0}, Ll/uaq0;-><init>(Ll/ccq0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    :cond_0
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 90
    .line 91
    .line 92
    new-instance v0, Ll/fbq0;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ll/fbq0;-><init>(Ll/ccq0;)V

    .line 95
    .line 96
    .line 97
    new-instance v1, Ll/qbq0;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/qbq0;-><init>(Ll/ccq0;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 103
    .line 104
    .line 105
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->f:Ll/wf;

    .line 106
    .line 107
    invoke-virtual {p0}, Ll/jf00;->k()Lrx/c;

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public r5()V
    .locals 2

    .line 1
    new-instance v0, Ll/mbq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mbq0;-><init>(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/p9q0;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/p9q0;-><init>(Ll/ccq0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ccq0;->F5(Ll/x20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public s5()V
    .locals 6

    .line 1
    new-instance v2, Ll/qaq0;

    .line 2
    .line 3
    invoke-direct {v2, p0}, Ll/qaq0;-><init>(Ll/ccq0;)V

    .line 4
    .line 5
    .line 6
    new-instance v3, Ll/raq0;

    .line 7
    .line 8
    invoke-direct {v3, p0}, Ll/raq0;-><init>(Ll/ccq0;)V

    .line 9
    .line 10
    .line 11
    new-instance v4, Ll/saq0;

    .line 12
    .line 13
    invoke-direct {v4, p0}, Ll/saq0;-><init>(Ll/ccq0;)V

    .line 14
    .line 15
    .line 16
    new-instance v5, Ll/taq0;

    .line 17
    .line 18
    invoke-direct {v5, p0}, Ll/taq0;-><init>(Ll/ccq0;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/ccq0;->s:Z

    .line 23
    .line 24
    invoke-direct {p0}, Ll/ccq0;->A3()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ccq0;->N3()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 34
    .line 35
    sget v0, Lcom/p1/mobile/putong/account/R$string;->j4:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    new-instance v0, Ll/vaq0;

    .line 46
    .line 47
    move-object v1, p0

    .line 48
    invoke-direct/range {v0 .. v5}, Ll/vaq0;-><init>(Ll/ccq0;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    new-instance p0, Ll/p9q0;

    .line 52
    .line 53
    invoke-direct {p0, v1}, Ll/p9q0;-><init>(Ll/ccq0;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v0, p0}, Ll/ccq0;->F5(Ll/x20;Ll/x20;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public t5(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/16 v0, 0x2329

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p3}, Ll/ccq0;->C3(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/ccq0;->o:Ll/b94;

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
    iget-object v0, p0, Ll/ccq0;->o:Ll/b94;

    .line 17
    .line 18
    invoke-interface {v0, p1, p2, p3}, Ll/b94;->a(IILandroid/content/Intent;)Z

    .line 19
    .line 20
    .line 21
    :cond_1
    const/16 v0, 0x312

    .line 22
    .line 23
    if-ne p1, v0, :cond_2

    .line 24
    .line 25
    if-nez p2, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Ll/ccq0;->r:Ll/x20;

    .line 28
    .line 29
    invoke-interface {v0}, Ll/x20;->call()V

    .line 30
    .line 31
    .line 32
    :cond_2
    const/16 v0, 0x2b5d

    .line 33
    .line 34
    if-ne p1, v0, :cond_3

    .line 35
    .line 36
    iget-object p0, p0, Ll/ccq0;->x:Lcom/tencent/tauth/IUiListener;

    .line 37
    .line 38
    invoke-static {p1, p2, p3, p0}, Lcom/tencent/tauth/Tencent;->onActivityResultData(IILandroid/content/Intent;Lcom/tencent/tauth/IUiListener;)Z

    .line 39
    .line 40
    .line 41
    :cond_3
    return-void
.end method

.method public v5(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ll/ccq0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 17
    .line 18
    const-string v2, "account"

    .line 19
    .line 20
    sget-object v3, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 21
    .line 22
    invoke-static {v1, v2, v3}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    new-instance v1, Ll/sim;

    .line 29
    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const/16 v0, 0x3c0

    .line 43
    .line 44
    invoke-direct {v1, p1, v0}, Ll/sim;-><init>(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    :try_start_0
    iget-object p1, p0, Ll/ccq0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/sim;->d()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 54
    .line 55
    iget-object p1, p0, Ll/ccq0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 56
    .line 57
    invoke-direct {p0, p1}, Ll/ccq0;->E3(Lcom/p1/mobile/putong/data/SignUpData;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catch_0
    move-exception p1

    .line 62
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/ccq0;->r:Ll/x20;

    .line 66
    .line 67
    invoke-interface {p0}, Ll/x20;->call()V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public x5(Lcom/p1/mobile/putong/account/data/WeChatUserInfo;Z)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;->wechat_login:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;

    .line 12
    .line 13
    iget-object v3, p0, Ll/ccq0;->f:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->h(Landroid/content/Context;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    sget-object p2, Ll/v3q0;->J:Ll/jxd0;

    .line 21
    .line 22
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/api/a;->I2()Ll/wyd0;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/WeChatUserInfo;->nickname:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p2, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast p1, Ll/p6;

    .line 41
    .line 42
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Ll/cp;->e(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public y5()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->d:Ll/yyd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/RememberUserInfo;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/h6q0;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/h6q0;-><init>(Ll/ccq0;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, v0, v1, v2}, Ll/ccq0;->I5(Lcom/p1/mobile/putong/data/RememberUserInfo;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public z5()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/ccq0;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/ccq0;->s:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Ll/p6;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/p6;->n(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iput-boolean v1, p0, Ll/ccq0;->s:Z

    .line 18
    .line 19
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->X0()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/bcq0;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/bcq0;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/s6q0;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/s6q0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p0, Ll/p6;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/p6;->f()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
