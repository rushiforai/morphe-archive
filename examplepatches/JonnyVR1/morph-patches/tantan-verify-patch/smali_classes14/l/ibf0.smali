.class public Ll/ibf0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/jbf0;",
        ">",
        "Ll/ar2<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public c:J

.field public d:J


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0x93a80

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Ll/ibf0;->c:J

    .line 8
    .line 9
    const-wide/32 v0, 0xd2f00

    .line 10
    .line 11
    .line 12
    iput-wide v0, p0, Ll/ibf0;->d:J

    .line 13
    .line 14
    return-void
.end method

.method private synthetic A0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ibf0;->s0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/ibf0;Lcom/p1/mobile/putong/data/SignInData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ibf0;->y0(Lcom/p1/mobile/putong/data/SignInData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/ibf0;Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/ibf0;->G0(Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/ibf0;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ibf0;->D0(Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/ibf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ibf0;->E0()V

    return-void
.end method

.method public static synthetic i0(Ll/ibf0;Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibf0;->z0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Ll/ibf0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibf0;->C0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k0(Ll/ibf0;Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ibf0;->F0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic l0(Ll/ibf0;Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ibf0;->u0(Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/data/SignInData;)V
    .locals 3

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
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 14
    .line 15
    const-string v1, "email"

    .line 16
    .line 17
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const-string v2, "Method used"

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string p0, "Phone"

    .line 30
    .line 31
    invoke-virtual {v0, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    :goto_0
    const-string p0, "Status"

    .line 35
    .line 36
    const-string v1, "Failure"

    .line 37
    .line 38
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 42
    .line 43
    invoke-static {p0}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v1, "Version"

    .line 48
    .line 49
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 53
    .line 54
    const-string v1, "Login"

    .line 55
    .line 56
    invoke-virtual {p0, v1, v0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/ike;->p(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic o0(Ll/ibf0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibf0;->A0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic p0(Ll/ibf0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ibf0;->x0(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final synthetic C0(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/jbf0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p1, Ll/jbf0;

    .line 26
    .line 27
    iget-object p1, p1, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 28
    .line 29
    invoke-static {p1}, Ll/cp;->e(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic D0(Ll/y20;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    instance-of v0, p2, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    instance-of v0, p2, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    instance-of v0, p2, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    move-object v0, p2

    .line 25
    check-cast v0, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/App$HandledGlobally;->getThrowable()Ljava/lang/Throwable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    instance-of v0, v0, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {p2}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void

    .line 49
    :cond_2
    :goto_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ll/ike;->m()V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast p1, Ll/jbf0;

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast p0, Ll/jbf0;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic E0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

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
.end method

.method public final synthetic F0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p3, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 2
    .line 3
    const-string v0, "password"

    .line 4
    .line 5
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    iget-object p3, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-nez p3, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p3}, Ll/qsf0;->e()Lrx/subjects/a;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    new-instance v0, Landroid/util/Pair;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 32
    .line 33
    invoke-direct {v0, v1, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    invoke-interface {p2}, Ll/x20;->call()V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-virtual {p0}, Ll/ibf0;->r0()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic G0(Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;ZLjava/lang/Throwable;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    instance-of v0, p5, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    move-object v2, p5

    .line 18
    check-cast v2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 19
    .line 20
    iget v3, v2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 21
    .line 22
    const v4, 0x9c54

    .line 23
    .line 24
    .line 25
    if-eq v3, v4, :cond_0

    .line 26
    .line 27
    const v5, 0x9c9b

    .line 28
    .line 29
    .line 30
    if-ne v3, v5, :cond_3

    .line 31
    .line 32
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p4

    .line 36
    if-eqz p4, :cond_1

    .line 37
    .line 38
    const-string p4, "inActivated"

    .line 39
    .line 40
    invoke-interface {p1, p4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget p4, v2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 44
    .line 45
    if-ne p4, v4, :cond_2

    .line 46
    .line 47
    :goto_0
    move-object p4, p1

    .line 48
    move p1, v1

    .line 49
    goto :goto_1

    .line 50
    :cond_2
    const/4 v1, 0x0

    .line 51
    goto :goto_0

    .line 52
    :goto_1
    invoke-virtual/range {p0 .. p5}, Ll/ibf0;->q0(ZLcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    goto/16 :goto_3

    .line 56
    .line 57
    :cond_3
    if-eqz v0, :cond_7

    .line 58
    .line 59
    move-object p3, p5

    .line 60
    check-cast p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 61
    .line 62
    iget p3, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 63
    .line 64
    const v2, 0x9c56

    .line 65
    .line 66
    .line 67
    if-ne p3, v2, :cond_7

    .line 68
    .line 69
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-eqz p3, :cond_4

    .line 74
    .line 75
    const-string p3, "newDevice"

    .line 76
    .line 77
    invoke-interface {p1, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    :cond_4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 81
    .line 82
    check-cast p1, Ll/jbf0;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 89
    .line 90
    .line 91
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 92
    .line 93
    const-string p3, "password"

    .line 94
    .line 95
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_5

    .line 100
    .line 101
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-nez p1, :cond_5

    .line 108
    .line 109
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p1}, Ll/qsf0;->e()Lrx/subjects/a;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    new-instance p3, Landroid/util/Pair;

    .line 118
    .line 119
    iget-object p4, p2, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v1, p2, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 122
    .line 123
    invoke-direct {p3, p4, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, p3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    :cond_5
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 130
    .line 131
    const-string p3, "email"

    .line 132
    .line 133
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_6

    .line 138
    .line 139
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-nez p1, :cond_6

    .line 146
    .line 147
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 148
    .line 149
    move-object p3, p1

    .line 150
    check-cast p3, Ll/jbf0;

    .line 151
    .line 152
    check-cast p1, Ll/jbf0;

    .line 153
    .line 154
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;->X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignInData;)Landroid/content/Intent;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p3, p1}, Ll/jbf0;->f(Landroid/content/Intent;)V

    .line 163
    .line 164
    .line 165
    goto :goto_2

    .line 166
    :cond_6
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 167
    .line 168
    move-object p3, p1

    .line 169
    check-cast p3, Ll/jbf0;

    .line 170
    .line 171
    check-cast p1, Ll/jbf0;

    .line 172
    .line 173
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/account/ui/account/VerifyDeviceIntroAct;->X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignInData;)Landroid/content/Intent;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p3, p1}, Ll/jbf0;->f(Landroid/content/Intent;)V

    .line 182
    .line 183
    .line 184
    :goto_2
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 185
    .line 186
    check-cast p0, Ll/jbf0;

    .line 187
    .line 188
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 193
    .line 194
    .line 195
    goto/16 :goto_3

    .line 196
    .line 197
    :cond_7
    if-eqz v0, :cond_8

    .line 198
    .line 199
    move-object p3, p5

    .line 200
    check-cast p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 201
    .line 202
    iget p3, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 203
    .line 204
    const v2, 0x62639

    .line 205
    .line 206
    .line 207
    if-ne p3, v2, :cond_8

    .line 208
    .line 209
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    if-eqz p0, :cond_11

    .line 214
    .line 215
    const-string p0, "suspicious"

    .line 216
    .line 217
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    goto/16 :goto_3

    .line 221
    .line 222
    :cond_8
    invoke-static {}, Ll/ive0;->f()Z

    .line 223
    .line 224
    .line 225
    move-result p3

    .line 226
    const/16 v2, 0x56

    .line 227
    .line 228
    if-eqz p3, :cond_b

    .line 229
    .line 230
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 231
    .line 232
    const/16 v3, 0x1b

    .line 233
    .line 234
    if-lt p3, v3, :cond_b

    .line 235
    .line 236
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result p3

    .line 240
    if-eqz p3, :cond_9

    .line 241
    .line 242
    const-string p3, ""

    .line 243
    .line 244
    invoke-interface {p1, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    :cond_9
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 248
    .line 249
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    if-eqz p1, :cond_a

    .line 254
    .line 255
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 256
    .line 257
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    if-ne p1, v2, :cond_a

    .line 262
    .line 263
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 264
    .line 265
    check-cast p1, Ll/jbf0;

    .line 266
    .line 267
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    sget p2, Lcom/p1/mobile/putong/account/R$string;->n0:I

    .line 272
    .line 273
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    invoke-virtual {p1, p0}, Ll/jbf0;->i(Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    goto :goto_3

    .line 281
    :cond_a
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 282
    .line 283
    check-cast p0, Ll/jbf0;

    .line 284
    .line 285
    invoke-static {p5}, Ll/gsj0;->d(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-virtual {p0, p1}, Ll/jbf0;->i(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    goto :goto_3

    .line 293
    :cond_b
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result p3

    .line 297
    if-eqz p3, :cond_c

    .line 298
    .line 299
    invoke-virtual {p5}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p3

    .line 303
    invoke-interface {p1, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 304
    .line 305
    .line 306
    :cond_c
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 307
    .line 308
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    move-result p1

    .line 312
    if-eqz p1, :cond_e

    .line 313
    .line 314
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 315
    .line 316
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 317
    .line 318
    .line 319
    move-result p1

    .line 320
    if-ne p1, v2, :cond_e

    .line 321
    .line 322
    if-eqz v0, :cond_e

    .line 323
    .line 324
    move-object p1, p5

    .line 325
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 326
    .line 327
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 328
    .line 329
    const p2, 0x9c40

    .line 330
    .line 331
    .line 332
    if-eq p1, p2, :cond_d

    .line 333
    .line 334
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    sget p1, Lcom/p1/mobile/putong/account/R$string;->n0:I

    .line 339
    .line 340
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    invoke-static {p0, v1}, Ll/o1j0;->k(Ljava/lang/String;Z)V

    .line 345
    .line 346
    .line 347
    goto :goto_3

    .line 348
    :cond_d
    invoke-static {p5}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 349
    .line 350
    .line 351
    goto :goto_3

    .line 352
    :cond_e
    instance-of p1, p0, Ll/sve;

    .line 353
    .line 354
    if-eqz p1, :cond_f

    .line 355
    .line 356
    check-cast p0, Ll/sve;

    .line 357
    .line 358
    invoke-virtual {p0, p5}, Ll/sve;->w2(Ljava/lang/Throwable;)V

    .line 359
    .line 360
    .line 361
    goto :goto_3

    .line 362
    :cond_f
    if-eqz p4, :cond_10

    .line 363
    .line 364
    invoke-static {p5}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 365
    .line 366
    .line 367
    goto :goto_3

    .line 368
    :cond_10
    if-eqz v0, :cond_11

    .line 369
    .line 370
    move-object p1, p5

    .line 371
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 372
    .line 373
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 374
    .line 375
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 376
    .line 377
    check-cast p0, Ll/jbf0;

    .line 378
    .line 379
    invoke-static {p1}, Ll/bsj0;->l(I)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object p2

    .line 383
    invoke-virtual {p0, p2, p1}, Ll/jbf0;->c(Ljava/lang/String;I)V

    .line 384
    .line 385
    .line 386
    :cond_11
    :goto_3
    if-eqz v0, :cond_12

    .line 387
    .line 388
    check-cast p5, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 389
    .line 390
    iget p0, p5, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 391
    .line 392
    const p1, 0x9c4c

    .line 393
    .line 394
    .line 395
    if-ne p0, p1, :cond_12

    .line 396
    .line 397
    const-string p0, "e_password_verifypage_wrong_tips"

    .line 398
    .line 399
    const-string p1, "p_sign_in_password_view"

    .line 400
    .line 401
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    :cond_12
    return-void
.end method

.method public H0(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Ll/x20;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget v0, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 13
    .line 14
    .line 15
    sget-object p2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/account/api/a;->L0(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance p2, Ll/ebf0;

    .line 26
    .line 27
    invoke-direct {p2, p0}, Ll/ebf0;-><init>(Ll/ibf0;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/fbf0;

    .line 31
    .line 32
    invoke-direct {v0, p0, p3}, Ll/fbf0;-><init>(Ll/ibf0;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public I0(Lcom/p1/mobile/putong/data/SignInData;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, v0}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignInData;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/ibf0;->L0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public L0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignInData;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const/4 v5, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/ibf0;->N0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;ZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public N0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;ZZ)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SignInData;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;ZZ)V"
        }
    .end annotation

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    iget-object p4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p4, Ll/jbf0;

    .line 6
    .line 7
    invoke-virtual {p4}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    sget v0, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p4, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 15
    .line 16
    .line 17
    :cond_0
    new-instance v6, Ll/bbf0;

    .line 18
    .line 19
    invoke-direct {v6, p0}, Ll/bbf0;-><init>(Ll/ibf0;)V

    .line 20
    .line 21
    .line 22
    sget-object p4, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p4, p1, v0, v6}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    new-instance v1, Ll/cbf0;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1, p2}, Ll/cbf0;-><init>(Ll/ibf0;Lcom/p1/mobile/putong/data/SignInData;Ll/x20;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/dbf0;

    .line 35
    .line 36
    move-object v3, p0

    .line 37
    move-object v5, p1

    .line 38
    move-object v4, p3

    .line 39
    move v7, p5

    .line 40
    invoke-direct/range {v2 .. v7}, Ll/dbf0;-><init>(Ll/ibf0;Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Z)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2, v0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p4, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public O0()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->f1()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/abf0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/abf0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public P0(Lcom/p1/mobile/putong/data/DetectRequest;Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Ll/x20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/DetectRequest;",
            "Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;",
            "Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p3, p4, p5}, Ll/ibf0;->H0(Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Ll/x20;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-static {}, Ll/hve0;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/waf0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/waf0;-><init>(Ll/ibf0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/zaf0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/zaf0;-><init>(Ll/ibf0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final q0(ZLcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Throwable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/putong/data/SignInData;",
            "Ljava/lang/Runnable;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Throwable;",
            ")V"
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
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v1, Ll/jbf0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

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
    new-instance v2, Ll/gbf0;

    .line 53
    .line 54
    move-object v3, p0

    .line 55
    move-object v4, p2

    .line 56
    move-object v5, p3

    .line 57
    move-object v6, p4

    .line 58
    move-object v7, p5

    .line 59
    invoke-direct/range {v2 .. v7}, Ll/gbf0;-><init>(Ll/ibf0;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sget p1, Lcom/p1/mobile/putong/account/R$string;->b:I

    .line 67
    .line 68
    new-instance p2, Ll/hbf0;

    .line 69
    .line 70
    invoke-direct {p2, v4}, Ll/hbf0;-><init>(Lcom/p1/mobile/putong/data/SignInData;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance p1, Ll/ibf0$a;

    .line 78
    .line 79
    invoke-direct {p1, v3, v0}, Ll/ibf0$a;-><init>(Ll/ibf0;Ll/l4g0;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public r0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hve0;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/ibf0;->b:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/ibf0;->s0()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public s0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/jbf0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/cp;->e(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v1, Ll/jbf0;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ll/jbf0;->f(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast v0, Ll/jbf0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p0, Ll/jbf0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public t0(Landroid/content/Intent;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    return-void
.end method

.method public final synthetic u0(Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    instance-of v0, p4, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    move-object v0, p4

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 18
    .line 19
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 20
    .line 21
    const v1, 0x9c56

    .line 22
    .line 23
    .line 24
    if-ne v0, v1, :cond_2

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-eqz p3, :cond_0

    .line 31
    .line 32
    const-string p3, "newDevice"

    .line 33
    .line 34
    invoke-interface {p1, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 38
    .line 39
    const-string p3, "email"

    .line 40
    .line 41
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    move-object p3, p1

    .line 58
    check-cast p3, Ll/jbf0;

    .line 59
    .line 60
    check-cast p1, Ll/jbf0;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/account/ui/account/EmailVerifyDeviceIntroAct;->X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignInData;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p3, p1}, Ll/jbf0;->f(Landroid/content/Intent;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 75
    .line 76
    move-object p3, p1

    .line 77
    check-cast p3, Ll/jbf0;

    .line 78
    .line 79
    check-cast p1, Ll/jbf0;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/account/ui/account/VerifyDeviceIntroAct;->X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignInData;)Landroid/content/Intent;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p3, p1}, Ll/jbf0;->f(Landroid/content/Intent;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-eqz p0, :cond_3

    .line 105
    .line 106
    invoke-virtual {p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    invoke-static {p4}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Ll/y20;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jbf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

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
    const-string v0, "e_user_delete_account_withdraw_popup_confirm"

    .line 15
    .line 16
    const-string v1, "p_user_delete_account_withdraw_popup"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, p1, v1, p2}, Lcom/p1/mobile/putong/account/api/a;->o2(Lcom/p1/mobile/putong/data/SignInData;ZLjava/lang/Runnable;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    new-instance v0, Ll/xaf0;

    .line 29
    .line 30
    invoke-direct {v0, p0, p1}, Ll/xaf0;-><init>(Ll/ibf0;Lcom/p1/mobile/putong/data/SignInData;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/yaf0;

    .line 34
    .line 35
    invoke-direct {v1, p0, p3, p1, p4}, Ll/yaf0;-><init>(Ll/ibf0;Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    invoke-static {v0, v1, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/data/SignInData;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/tcn;->c()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ibf0;->r0()V

    .line 5
    .line 6
    .line 7
    new-instance p0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 13
    .line 14
    const-string p2, "email"

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const-string v0, "Method used"

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string p1, "Phone"

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    :goto_0
    const-string p1, "Status"

    .line 34
    .line 35
    const-string p2, "Success"

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 41
    .line 42
    invoke-static {p1}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string p2, "Version"

    .line 47
    .line 48
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 52
    .line 53
    const-string p2, "Login"

    .line 54
    .line 55
    invoke-virtual {p1, p2, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ibf0;->b:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
