.class public Ll/sve;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Ll/mwe;",
        ">;"
    }
.end annotation


# static fields
.field public static final m:Ljava/util/regex/Pattern;


# instance fields
.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/account/data/CaptchaData;

.field public g:Lcom/p1/mobile/putong/data/VerifyReason;

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Z

.field public k:Ll/b30;
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

.field public l:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "^[\\w!#$%&\'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&\'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,}$"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/sve;->m:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibf0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/sve;->i:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/sve;->j:Z

    .line 8
    .line 9
    new-instance p1, Ll/rve;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ll/rve;-><init>(Ll/sve;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/sve;->k:Ll/b30;

    .line 15
    .line 16
    new-instance p1, Ll/jue;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/jue;-><init>(Ll/sve;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/sve;->l:Landroid/view/View$OnClickListener;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic B1(Ll/sve;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/sve;->i2(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic C1(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;)V
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
    new-instance p1, Ll/bve;

    .line 25
    .line 26
    invoke-direct {p1, p2}, Ll/bve;-><init>(Ll/x20;)V

    .line 27
    .line 28
    .line 29
    new-instance p2, Ll/cve;

    .line 30
    .line 31
    invoke-direct {p2, p3}, Ll/cve;-><init>(Ljava/lang/Runnable;)V

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

.method public static synthetic D1(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
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

.method public static synthetic E1(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q0(Ll/sve;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sve;->Z1()V

    return-void
.end method

.method public static synthetic R0(Ll/sve;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->r2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic S0(Ll/x20;Ll/uxj0;)V
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

.method public static synthetic U0(Ll/sve;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->f2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V0(Ll/sve;Ljava/lang/Throwable;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignInGrantType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/sve;->e2(Ljava/lang/Throwable;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignInGrantType;)V

    return-void
.end method

.method public static synthetic W0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X0(Ll/sve;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->j2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y0(Ll/sve;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sve;->h2(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic a1(Ll/sve;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sve;->U1()V

    return-void
.end method

.method private synthetic a2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    new-instance p1, Ll/kue;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/kue;-><init>(Ll/sve;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic b1(Ll/sve;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->k2(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c1(Ll/sve;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sve;->a2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic d1(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/account/R$string;->X0:I

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
    sget v1, Lcom/p1/mobile/putong/account/R$string;->W0:I

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
    sget v1, Lcom/p1/mobile/putong/account/R$string;->T0:I

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v1, Ll/xue;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/xue;-><init>()V

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

.method public static synthetic e1(Ll/sve;Lcom/p1/mobile/putong/account/data/CaptchaData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->l2(Lcom/p1/mobile/putong/account/data/CaptchaData;)V

    return-void
.end method

.method public static synthetic f1(Ll/sve;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->p2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g1(Ll/sve;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->V1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h1()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i1(Ll/sve;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sve;->X1(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic j1(Ll/sve;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sve;->g2()V

    return-void
.end method

.method public static synthetic k1(Ll/sve;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sve;->c2()V

    return-void
.end method

.method public static synthetic l1(Ll/sve;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->S1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m1(Ll/sve;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/sve;->Y1(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic n1(Ll/sve;Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/sve;->d2(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic o1(Ll/sve;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->T1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic p1(Ll/x20;Ll/uxj0;)V
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

.method public static synthetic q1(Lcom/p1/mobile/putong/data/Captcha;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Captcha;->localExpired:Z

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

.method public static synthetic r1(Ll/sve;Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->b2(Lcom/p1/mobile/putong/data/Captcha;)V

    return-void
.end method

.method public static synthetic s1(Ll/sve;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sve;->q2()V

    return-void
.end method

.method public static synthetic t1(Ll/sve;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->W1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic u1(Ll/sve;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/sve;->n2(IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic v1(Ll/sve;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve;->m2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x1(Ll/sve;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sve;->o2()V

    return-void
.end method

.method public static synthetic z1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A2()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v1, Ll/mwe;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/mwe;->M()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v1, Ll/mwe;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/mwe;->N()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "email"

    .line 27
    .line 28
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 33
    .line 34
    new-instance v1, Lcom/p1/mobile/putong/data/Device;

    .line 35
    .line 36
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 40
    .line 41
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 46
    .line 47
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast v1, Ll/mwe;

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/mwe;->B0()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget v2, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 61
    .line 62
    .line 63
    new-instance v1, Ll/hve;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/hve;-><init>(Ll/sve;)V

    .line 66
    .line 67
    .line 68
    new-instance v2, Ll/ive;

    .line 69
    .line 70
    invoke-direct {v2, p0}, Ll/ive;-><init>(Ll/sve;)V

    .line 71
    .line 72
    .line 73
    const/4 v3, 0x1

    .line 74
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/ibf0;->L0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;Z)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final F1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mwe;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "cerfificated_result"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "login_channel"

    .line 16
    .line 17
    const-string v1, "email"

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "e_intl_email_verification_risk_graph_result"

    .line 28
    .line 29
    invoke-static {v0, p0, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public H1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/mwe;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mwe;->V()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/sve;->f:Lcom/p1/mobile/putong/account/data/CaptchaData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 20
    .line 21
    iget-object v1, p0, Ll/sve;->f:Lcom/p1/mobile/putong/account/data/CaptchaData;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/account/data/CaptchaData;->token:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v2, Ll/mwe;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/mwe;->L()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/account/api/a;->H0(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/jve;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/jve;-><init>(Ll/sve;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/kve;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/kve;-><init>(Ll/sve;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    const/4 v0, 0x0

    .line 60
    invoke-virtual {p0, v0}, Ll/sve;->u2(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public I1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    sget-object p0, Ll/sve;->m:Ljava/util/regex/Pattern;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final J1(Landroid/content/Intent;)V
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
    check-cast v1, Ll/mwe;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/mwe;->P(Z)V

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
    invoke-virtual {p0, v1, v2, p1}, Ll/sve;->L1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
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
    sget p1, Lcom/p1/mobile/putong/account/R$string;->y3:I

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
    check-cast p0, Ll/mwe;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/mwe;->P(Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public L1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/mve;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mve;-><init>(Ll/sve;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/sve;->P1()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/sve;->Q1()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->new_()Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object p1, v1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyId:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p2, v1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->thirdPartyToken:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p3, v1, Lcom/p1/mobile/putong/account/data/ThirdPartyData;->email:Ljava/lang/String;

    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/account/api/a;->D2(Lcom/p1/mobile/putong/account/data/ThirdPartyData;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance p2, Ll/pve;

    .line 40
    .line 41
    invoke-direct {p2, p0, v1}, Ll/pve;-><init>(Ll/sve;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V

    .line 42
    .line 43
    .line 44
    new-instance p3, Ll/qve;

    .line 45
    .line 46
    invoke-direct {p3, p0, v1, v0}, Ll/qve;-><init>(Ll/sve;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    invoke-static {p2, p3, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 59
    .line 60
    const-string v1, "google"

    .line 61
    .line 62
    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/p1/mobile/putong/account/api/a;->u2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance p2, Ll/nve;

    .line 71
    .line 72
    invoke-direct {p2, p0}, Ll/nve;-><init>(Ll/sve;)V

    .line 73
    .line 74
    .line 75
    new-instance p3, Ll/ove;

    .line 76
    .line 77
    invoke-direct {p3, p0}, Ll/ove;-><init>(Ll/sve;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public N1(Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sve;->g:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sve;->h:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/sve;->i:Z

    .line 6
    .line 7
    iput-boolean p4, p0, Ll/sve;->j:Z

    .line 8
    .line 9
    return-void
.end method

.method public final O1(Ljava/lang/Throwable;)Z
    .locals 1

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

.method public P1()Z
    .locals 1

    .line 1
    const-string v0, "bind-email"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/sve;->g:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public Q1()Z
    .locals 1

    .line 1
    const-string v0, "change-email"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/sve;->g:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public R1()Z
    .locals 2

    .line 1
    const-string v0, "bind-email"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/sve;->g:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/sve;->h:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "google_login_verify_email"

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final synthetic S1(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p1, "success"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sve;->F1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Ll/sve;->u2(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic T1(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, "fail"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/sve;->F1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sve;->v2()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic U1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mwe;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/mwe;->P(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic V1(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/sve;->i:Z

    .line 3
    .line 4
    sget p1, Lcom/p1/mobile/putong/account/R$string;->n4:I

    .line 5
    .line 6
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/mwe;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/mwe;->E0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic W1(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    if-eqz v0, :cond_1

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
    move-result-object p0

    .line 23
    new-instance p1, Ll/lue;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ll/lue;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public final synthetic X1(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/uxj0;)V
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
    invoke-virtual {p0, p2, p1}, Ll/sve;->t2(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic Y1(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p3}, Ll/sve;->O1(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/sve;->k:Ll/b30;

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

.method public final synthetic Z1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mwe;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mwe;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/iue;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/iue;-><init>(Ll/sve;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v1, v1, Ll/esf0;->b:Lrx/subjects/b;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/tue;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/tue;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/eve;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/eve;-><init>(Ll/sve;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/lve;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/lve;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic b2(Lcom/p1/mobile/putong/data/Captcha;)V
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
    invoke-virtual {p0, p1}, Ll/sve;->u2(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic c2()V
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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v2, Ll/mwe;

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic d2(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;Ljava/lang/Throwable;)V
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
    new-instance p6, Ll/yue;

    .line 59
    .line 60
    invoke-direct {p6, p1, p2, p3, p4}, Ll/yue;-><init>(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;)V

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
    new-instance p1, Ll/zue;

    .line 78
    .line 79
    invoke-direct {p1, p4}, Ll/zue;-><init>(Ljava/lang/Runnable;)V

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

.method public final synthetic e2(Ljava/lang/Throwable;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Lcom/p1/mobile/putong/data/SignInGrantType;)V
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
    new-instance v6, Ll/oue;

    .line 17
    .line 18
    invoke-direct {v6, p0}, Ll/oue;-><init>(Ll/sve;)V

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
    new-instance v1, Ll/pue;

    .line 30
    .line 31
    invoke-direct {v1, v6}, Ll/pue;-><init>(Ll/x20;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/que;

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
    invoke-direct/range {v2 .. v8}, Ll/que;-><init>(Ll/sve;Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

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

.method public final synthetic f2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/mwe;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Ll/mwe;->P(Z)V

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

.method public final synthetic g2()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mwe;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/mwe;->P(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic h2(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
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

.method public final synthetic i2(Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p3}, Ll/sve;->O1(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/sve;->k:Ll/b30;

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

.method public final synthetic j2(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/mwe;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mwe;->Q()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 14
    .line 15
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 16
    .line 17
    const v2, 0x61b16

    .line 18
    .line 19
    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    sget p1, Lcom/p1/mobile/putong/account/R$string;->e0:I

    .line 23
    .line 24
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 25
    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :cond_0
    if-eqz v0, :cond_1

    .line 30
    .line 31
    move-object v1, p1

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 33
    .line 34
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 35
    .line 36
    const v2, 0x62639

    .line 37
    .line 38
    .line 39
    if-ne v1, v2, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/sve;->v2()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    if-eqz v0, :cond_2

    .line 46
    .line 47
    move-object v1, p1

    .line 48
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 49
    .line 50
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 51
    .line 52
    const v2, 0x6263b

    .line 53
    .line 54
    .line 55
    if-ne v1, v2, :cond_2

    .line 56
    .line 57
    sget-object p1, Ll/olj;->INSTANCE:Ll/olj;

    .line 58
    .line 59
    const-string v0, "email"

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p1, v0, v1}, Ll/olj;->d(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    if-eqz v0, :cond_3

    .line 70
    .line 71
    move-object v1, p1

    .line 72
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 73
    .line 74
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 75
    .line 76
    const v2, 0x61b15

    .line 77
    .line 78
    .line 79
    if-ne v1, v2, :cond_3

    .line 80
    .line 81
    sget p1, Lcom/p1/mobile/putong/account/R$string;->b1:I

    .line 82
    .line 83
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    if-eqz v0, :cond_4

    .line 88
    .line 89
    move-object v0, p1

    .line 90
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 91
    .line 92
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 93
    .line 94
    const v1, 0x61afe

    .line 95
    .line 96
    .line 97
    if-ne v0, v1, :cond_4

    .line 98
    .line 99
    sget p1, Lcom/p1/mobile/putong/account/R$string;->X0:I

    .line 100
    .line 101
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 106
    .line 107
    check-cast v0, Ll/mwe;

    .line 108
    .line 109
    const-string v1, "send_code"

    .line 110
    .line 111
    invoke-virtual {v0, p1, v1}, Ll/mwe;->z0(Ljava/lang/Throwable;Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_5

    .line 116
    .line 117
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    new-instance p1, Ljava/util/HashMap;

    .line 121
    .line 122
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 123
    .line 124
    .line 125
    const-string v0, "Sign up status"

    .line 126
    .line 127
    const-string v1, "Email register fail"

    .line 128
    .line 129
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 133
    .line 134
    const-string v1, "Sign Up"

    .line 135
    .line 136
    invoke-virtual {v0, v1, p1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 137
    .line 138
    .line 139
    :cond_5
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 140
    .line 141
    check-cast p0, Ll/mwe;

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/mwe;->D0()V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final synthetic k2(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/mwe;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/mwe;->D0()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/mwe;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/mwe;->s0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic l2(Lcom/p1/mobile/putong/account/data/CaptchaData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sve;->f:Lcom/p1/mobile/putong/account/data/CaptchaData;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/mwe;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/mwe;->y0(Lcom/p1/mobile/putong/account/data/CaptchaData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic m2(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "verified"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignupStage;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "google-email-saved"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StepSignupStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {v1}, [Lcom/p1/mobile/putong/data/StepSignupStage;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1, v0, v1}, Ll/ike;->f(Lcom/p1/mobile/putong/data/SignupStage;[Lcom/p1/mobile/putong/data/StepSignupStage;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Ll/awi0;->d:Ll/jxd0;

    .line 25
    .line 26
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p1}, Ll/cp;->e(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/high16 v0, 0x4000000

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic n2(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_3

    .line 3
    .line 4
    const-string p1, "back_reason"

    .line 5
    .line 6
    invoke-virtual {p3, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_3

    .line 11
    .line 12
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/sve;->e:Ljava/lang/String;

    .line 17
    .line 18
    const-string p2, "show_captcha"

    .line 19
    .line 20
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/sve;->v2()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p1, "change_number"

    .line 31
    .line 32
    iget-object p2, p0, Ll/sve;->e:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const-string p1, "password_login"

    .line 42
    .line 43
    iget-object p2, p0, Ll/sve;->e:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p0, Ll/mwe;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/mwe;->A0()V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 59
    return p0

    .line 60
    :cond_3
    const/4 p0, 0x0

    .line 61
    return p0
.end method

.method public final synthetic o2()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/mwe;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mwe;->w0()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v2, Ll/mwe;

    .line 19
    .line 20
    invoke-virtual {v2}, Ll/mwe;->M()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object v3, p0, Ll/sve;->g:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 25
    .line 26
    iget-object v4, p0, Ll/sve;->h:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v5, 0x1

    .line 29
    invoke-static {v1, v2, v5, v3, v4}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailVerifyCodeAct;->Z1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/fve;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/fve;-><init>(Ll/sve;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic p2(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Ll/mwe;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "e_signin_google_button"

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/sve;->l:Landroid/view/View$OnClickListener;

    .line 32
    .line 33
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic q2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/mwe;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mwe;->D0()V

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
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/mwe;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/mwe;->O()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/bp;->j()Z

    .line 27
    .line 28
    .line 29
    new-instance p0, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v0, "Method used"

    .line 35
    .line 36
    const-string v1, "email"

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    const-string v0, "Status"

    .line 42
    .line 43
    const-string v1, "Success"

    .line 44
    .line 45
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 49
    .line 50
    invoke-static {v0}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "Version"

    .line 55
    .line 56
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 60
    .line 61
    const-string v1, "Login"

    .line 62
    .line 63
    invoke-virtual {v0, v1, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic r2(Ljava/lang/String;)V
    .locals 2

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
    const-string v0, "newDevice"

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/mwe;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_password_verifypage_wrong_tips"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    const-string v0, "suspicious"

    .line 30
    .line 31
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/sve;->v2()V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/mwe;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/mwe;->G0()V

    .line 45
    .line 46
    .line 47
    const-string p0, "inActivated"

    .line 48
    .line 49
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_2

    .line 54
    .line 55
    new-instance p0, Ljava/util/HashMap;

    .line 56
    .line 57
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 58
    .line 59
    .line 60
    const-string p1, "Sign up status"

    .line 61
    .line 62
    const-string v0, "Email register fail"

    .line 63
    .line 64
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 68
    .line 69
    const-string v0, "Sign Up"

    .line 70
    .line 71
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
.end method

.method public s2(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    const/16 p2, 0x2329

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p3}, Ll/sve;->J1(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final t2(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V
    .locals 3

    .line 1
    new-instance v0, Ll/rue;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rue;-><init>(Ll/sve;)V

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
    new-instance v2, Ll/sue;

    .line 29
    .line 30
    invoke-direct {v2, p0, p1}, Ll/sue;-><init>(Ll/sve;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ll/uue;

    .line 34
    .line 35
    invoke-direct {p1, p0, p2, v0}, Ll/uue;-><init>(Ll/sve;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ljava/lang/Runnable;)V

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

.method public u2(Lcom/p1/mobile/putong/data/Captcha;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/VerifyData;->new_()Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, p0, Ll/sve;->g:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 12
    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 14
    .line 15
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v1, Ll/mwe;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/mwe;->M()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 27
    .line 28
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast v1, Ll/mwe;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/mwe;->V()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Ll/sve;->f:Lcom/p1/mobile/putong/account/data/CaptchaData;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    move-object v2, v1

    .line 49
    check-cast v2, Ll/mwe;

    .line 50
    .line 51
    iget-boolean v2, v2, Ll/mwe;->C:Z

    .line 52
    .line 53
    if-eqz v2, :cond_0

    .line 54
    .line 55
    iget-object v2, p0, Ll/sve;->f:Lcom/p1/mobile/putong/account/data/CaptchaData;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/account/data/CaptchaData;->token:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v2, v0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 60
    .line 61
    check-cast v1, Ll/mwe;

    .line 62
    .line 63
    invoke-virtual {v1}, Ll/mwe;->L()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 68
    .line 69
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_1

    .line 74
    .line 75
    iput-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 76
    .line 77
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 78
    .line 79
    check-cast p1, Ll/mwe;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/mwe;->B0()V

    .line 82
    .line 83
    .line 84
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ll/pw;->I(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    new-instance v0, Ll/mue;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/mue;-><init>(Ll/sve;)V

    .line 101
    .line 102
    .line 103
    new-instance v1, Ll/nue;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/nue;-><init>(Ll/sve;)V

    .line 106
    .line 107
    .line 108
    const/4 p0, 0x0

    .line 109
    invoke-static {v0, v1, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public v2()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->W0()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/vue;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/vue;-><init>(Ll/sve;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/wue;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/wue;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public w2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mwe;

    .line 4
    .line 5
    const-string v0, "send_code"

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/mwe;->z0(Ljava/lang/Throwable;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public x2()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/gve;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gve;-><init>(Ll/sve;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public y2()V
    .locals 1

    .line 1
    new-instance v0, Ll/ave;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ave;-><init>(Ll/sve;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z2()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/dve;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dve;-><init>(Ll/sve;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
