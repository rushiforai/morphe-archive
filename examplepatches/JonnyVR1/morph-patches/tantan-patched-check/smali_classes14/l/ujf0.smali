.class public Ll/ujf0;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Ll/rkf0;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Lcom/p1/mobile/putong/data/SignUpData;

.field public f:Z

.field public g:Z

.field public h:Ljava/lang/String;

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibf0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/ujf0;->g:Z

    .line 13
    .line 14
    const-string p1, ""

    .line 15
    .line 16
    iput-object p1, p0, Ll/ujf0;->h:Ljava/lang/String;

    .line 17
    .line 18
    new-instance p1, Ll/ljf0;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/ljf0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/ujf0;->i:Ll/y20;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic Q0(Ll/ujf0;Lcom/p1/mobile/putong/data/BloodType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->z1(Lcom/p1/mobile/putong/data/BloodType;)V

    return-void
.end method

.method public static synthetic R0(Ll/ujf0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->p1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S0(Ll/ujf0;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ujf0;->t1(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic U0(Ll/ujf0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->u1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V0(Ll/ujf0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->s1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W0(Ll/ujf0;)Ljava/lang/Double;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ujf0;->m1()Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X0(Ll/ujf0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->v1(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic Y0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a1(Ll/ujf0;Lcom/p1/mobile/putong/data/QualificationType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->B1(Lcom/p1/mobile/putong/data/QualificationType;)V

    return-void
.end method

.method public static synthetic b1(Ll/ujf0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ujf0;->x1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic c1(Ll/ujf0;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ujf0;->r1(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d1(Ll/ujf0;Ljava/lang/Double;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->o1(Ljava/lang/Double;)V

    return-void
.end method

.method public static synthetic e1(Ll/ujf0;ZLjava/lang/Double;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ujf0;->q1(ZLjava/lang/Double;)V

    return-void
.end method

.method public static synthetic f1(Ll/ujf0;Ljava/lang/Double;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->n1(Ljava/lang/Double;)V

    return-void
.end method

.method private synthetic x1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/rkf0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ujf0;->h:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/rkf0;->A3(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic B1(Lcom/p1/mobile/putong/data/QualificationType;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->qualificationType:Lcom/p1/mobile/putong/data/QualificationType;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/rkf0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/rkf0;->r0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public C1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rkf0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 6
    .line 7
    iget-boolean v2, p0, Ll/ujf0;->f:Z

    .line 8
    .line 9
    iget-boolean v3, p0, Ll/ujf0;->g:Z

    .line 10
    .line 11
    iget-object p0, p0, Ll/ujf0;->h:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/rkf0;->n0(Lcom/p1/mobile/putong/data/SignUpData;ZZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public D1(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    const-string v1, "account"

    .line 4
    .line 5
    sget-object v2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "signup_data"

    .line 14
    .line 15
    iget-object p0, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 16
    .line 17
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public E1(Ll/l4g0;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "signup_source"

    .line 7
    .line 8
    iget-object v2, p0, Ll/ujf0;->h:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "phone_num"

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catch_0
    move-exception p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public F1()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/SignUpData;->getNonNullPhoneNumber()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public H1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rkf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/jjf0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/jjf0;-><init>(Ll/ujf0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/sm;->g0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public I1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rkf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ojf0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ojf0;-><init>(Ll/ujf0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/sm;->h0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final J1(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->d1()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "wechat"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, ""

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 25
    .line 26
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->d1()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "signup_source"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/rfj0$a;->f(Ljava/lang/String;Ljava/lang/String;)Ll/rfj0$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "phone_num"

    .line 39
    .line 40
    invoke-static {v1, p0}, Ll/rfj0$a;->f(Ljava/lang/String;Ljava/lang/String;)Ll/rfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v1, "error_type"

    .line 45
    .line 46
    invoke-static {v1, p1}, Ll/rfj0$a;->f(Ljava/lang/String;Ljava/lang/String;)Ll/rfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    filled-new-array {v0, p0, p1}, [Ll/rfj0$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "e_signup_age_tips"

    .line 55
    .line 56
    const-string v0, "p_profile_signup_view"

    .line 57
    .line 58
    invoke-static {p1, v0, p0}, Ll/rfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/rfj0$a;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gjf0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/gjf0;-><init>(Ll/ujf0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final g1(Ljava/lang/Double;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 4
    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p1, Ll/rkf0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/rkf0;->v0()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/rkf0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/rkf0;->r0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public h1()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x0

    .line 10
    :goto_0
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v2, Ll/rkf0;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string v3, "signup_source"

    .line 23
    .line 24
    iget-object v4, p0, Ll/ujf0;->h:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const-string v4, "phone_num"

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    filled-new-array {v3, v4}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v4, "e_profilepage_birthday_alert"

    .line 45
    .line 46
    invoke-static {v4, v2, v3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast v2, Ll/rkf0;

    .line 52
    .line 53
    invoke-virtual {v2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    new-instance v4, Ll/pjf0;

    .line 58
    .line 59
    invoke-direct {v4, p0}, Ll/pjf0;-><init>(Ll/ujf0;)V

    .line 60
    .line 61
    .line 62
    new-instance v5, Ll/qjf0;

    .line 63
    .line 64
    invoke-direct {v5, p0}, Ll/qjf0;-><init>(Ll/ujf0;)V

    .line 65
    .line 66
    .line 67
    new-instance v6, Ll/rjf0;

    .line 68
    .line 69
    invoke-direct {v6, p0}, Ll/rjf0;-><init>(Ll/ujf0;)V

    .line 70
    .line 71
    .line 72
    new-instance v7, Ll/sjf0;

    .line 73
    .line 74
    invoke-direct {v7, p0}, Ll/sjf0;-><init>(Ll/ujf0;)V

    .line 75
    .line 76
    .line 77
    new-instance v8, Ll/tjf0;

    .line 78
    .line 79
    invoke-direct {v8, p0, v1, v0}, Ll/tjf0;-><init>(Ll/ujf0;ZLjava/lang/Double;)V

    .line 80
    .line 81
    .line 82
    invoke-static/range {v3 .. v8}, Ll/sm;->f0(Lcom/p1/mobile/android/app/Act;Ll/pcj;Ll/y20;Ll/y20;Ll/y20;Ll/x20;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 86
    .line 87
    check-cast p0, Ll/rkf0;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public i1(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rkf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/mjf0;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Ll/mjf0;-><init>(Ll/ujf0;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Ll/njf0;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/njf0;-><init>(Ll/ujf0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public j1(Ljava/lang/Runnable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rkf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "signup_source"

    .line 14
    .line 15
    iget-object v2, p0, Ll/ujf0;->h:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "phone_num"

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "e_profilepage_gender_alert"

    .line 36
    .line 37
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast v0, Ll/rkf0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget v1, Lcom/p1/mobile/putong/account/R$string;->t3:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget v1, Lcom/p1/mobile/putong/account/R$string;->B2:I

    .line 59
    .line 60
    new-instance v2, Ll/kjf0;

    .line 61
    .line 62
    invoke-direct {v2, p0, p1}, Ll/kjf0;-><init>(Ll/ujf0;Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public k1()Lcom/p1/mobile/putong/data/SignUpData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    return-object p0
.end method

.method public l1(Lcom/p1/mobile/putong/data/SignUpData;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/ujf0;->f:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/ujf0;->g:Z

    .line 6
    .line 7
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 8
    .line 9
    sget-object p3, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->cosmos:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 10
    .line 11
    if-eq p2, p3, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->setSignUpData(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpType()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/ujf0;->h:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public final synthetic m1()Ljava/lang/Double;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/bsj0;->V()Ljava/util/Date;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    long-to-double v0, v0

    .line 16
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p0, v2}, Ll/ujf0;->g1(Ljava/lang/Double;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    return-object v0
.end method

.method public final synthetic n1(Ljava/lang/Double;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->g1(Ljava/lang/Double;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->O0()Ll/mxd0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p1, Ll/rkf0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "signup_source"

    .line 30
    .line 31
    iget-object v1, p0, Ll/ujf0;->h:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "phone_num"

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "e_profilepage_birthday_alert"

    .line 52
    .line 53
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic o1(Ljava/lang/Double;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ujf0;->g1(Ljava/lang/Double;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p1(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "tooYoung"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ujf0;->J1(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p1, "tooOld"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/ujf0;->J1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic q1(ZLjava/lang/Double;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    iput-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/rkf0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/rkf0;->p0()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0, p2}, Ll/ujf0;->g1(Ljava/lang/Double;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic r1(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Ll/rkf0;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p2, Ll/rkf0;

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v0, Ll/rkf0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0, p1}, Ll/cp;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic s1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rkf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic t1(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const-string v1, "verified"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    const-string p1, "finished"

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-nez p2, :cond_0

    .line 25
    .line 26
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ll/ike;->m()V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p1, Ll/rkf0;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Ll/rkf0;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iget-object p2, p2, Ll/ike;->a:Ll/wyd0;

    .line 62
    .line 63
    invoke-virtual {p2, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 67
    .line 68
    check-cast p0, Ll/rkf0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/rkf0;->w0()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 79
    .line 80
    invoke-virtual {v0, p2}, Ll/ike;->j(Ljava/util/List;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-nez p2, :cond_2

    .line 85
    .line 86
    new-instance p2, Lcom/p1/mobile/putong/data/SignUpData;

    .line 87
    .line 88
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 89
    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->basic:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 92
    .line 93
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 100
    .line 101
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 102
    .line 103
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 104
    .line 105
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 108
    .line 109
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 110
    .line 111
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 112
    .line 113
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 114
    .line 115
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 116
    .line 117
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 118
    .line 119
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 120
    .line 121
    iput-boolean v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 122
    .line 123
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->bloodType:Lcom/p1/mobile/putong/data/BloodType;

    .line 124
    .line 125
    iput-object v0, p2, Lcom/p1/mobile/putong/data/SignUpData;->bloodType:Lcom/p1/mobile/putong/data/BloodType;

    .line 126
    .line 127
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 128
    .line 129
    check-cast v0, Ll/rkf0;

    .line 130
    .line 131
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    const/4 v1, 0x0

    .line 136
    invoke-static {p2, v1}, Ll/ike;->q(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    new-instance v0, Ll/hjf0;

    .line 145
    .line 146
    invoke-direct {v0, p0, p1}, Ll/hjf0;-><init>(Ll/ujf0;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 147
    .line 148
    .line 149
    new-instance p1, Ll/ijf0;

    .line 150
    .line 151
    invoke-direct {p1, p0}, Ll/ijf0;-><init>(Ll/ujf0;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_2
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 163
    .line 164
    check-cast p2, Ll/rkf0;

    .line 165
    .line 166
    invoke-virtual {p2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 171
    .line 172
    .line 173
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 174
    .line 175
    check-cast p2, Ll/rkf0;

    .line 176
    .line 177
    invoke-virtual {p2}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 182
    .line 183
    check-cast v0, Ll/rkf0;

    .line 184
    .line 185
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-static {v0, p1}, Ll/cp;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 208
    .line 209
    .line 210
    return-void
.end method

.method public final synthetic u1(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rkf0;

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
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    instance-of v0, p1, Lcom/p1/mobile/android/app/App$HandledGlobally;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    move-object v0, p1

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
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    :goto_0
    invoke-static {}, Ll/ike;->h()Ll/ike;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/ike;->m()V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast p1, Ll/rkf0;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/rkf0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic v1(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rkf0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "signup_source"

    .line 14
    .line 15
    iget-object v2, p0, Ll/ujf0;->h:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "phone_num"

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    filled-new-array {v1, p0}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v1, "e_profilepage_gender_alert"

    .line 36
    .line 37
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic z1(Lcom/p1/mobile/putong/data/BloodType;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ujf0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->bloodType:Lcom/p1/mobile/putong/data/BloodType;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/rkf0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/rkf0;->r0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
