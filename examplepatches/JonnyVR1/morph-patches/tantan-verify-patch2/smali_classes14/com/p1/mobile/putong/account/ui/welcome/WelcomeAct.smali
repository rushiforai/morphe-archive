.class public Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;
.super Lcom/p1/mobile/putong/account/ui/welcome/WelcomeBaseAct;
.source "SourceFile"


# static fields
.field public static f:Ljava/lang/String;

.field public static g:Ljava/lang/String;

.field public static h:Ljava/lang/String;


# instance fields
.field public c:Z

.field public d:Ll/v3q0;

.field public e:Ll/o6;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->c:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic A2(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Ll/tg50;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic B2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->K2()V

    return-void
.end method

.method public static synthetic C2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->R2(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic D2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->lambda$debugItems$21()V

    return-void
.end method

.method public static E2(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "enable_back"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static F2(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const p0, 0x10008000

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    const-string p0, "show_update_dialog"

    .line 15
    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const-string p0, "is_clear_task"

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method private synthetic H2()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->e:Ll/o6;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "\u8f93\u5165\u865a\u62dfip"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/w1e$b;->r(Ljava/lang/String;)Ll/w1e$b;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Ll/ak20;->a:Ll/wyd0;

    .line 18
    .line 19
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/jxp0;

    .line 23
    .line 24
    invoke-direct {v1, v0}, Ll/jxp0;-><init>(Ll/wyd0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic I2()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Wencharm"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    const-wide v3, 0x9272d84000L

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    sub-long/2addr v1, v3

    .line 20
    long-to-double v1, v1

    .line 21
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 26
    .line 27
    const-string v1, "male"

    .line 28
    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 34
    .line 35
    const-string v1, "000000"

    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 38
    .line 39
    const/16 v1, 0x56

    .line 40
    .line 41
    iput v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 42
    .line 43
    const-string v1, "123456"

    .line 44
    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpProfileImageAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private synthetic K2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "android id"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {}, Ll/qzd;->b()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic M2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "device id \u70b9\u51fb\u53ef\u590d\u5236"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/hec0;->p:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/wcc0;->p:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    new-instance v2, Ll/ixp0;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Ll/ixp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private synthetic N2()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/b7f0;->a(Landroid/content/Context;I)Z

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic Q2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "Change ip"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/w1e$b;->I(Ljava/lang/String;)Ll/w1e$b;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 v0, 0x64

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/w1e$b;->D(I)Ll/w1e$b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p0, v0}, Ll/w1e$b;->E(I)Ll/w1e$b;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, ""

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/w1e$b;->H(Ljava/lang/String;)Ll/w1e$b;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ll/nxp0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/nxp0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private synthetic S2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "Change MCC"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/w1e$b;->I(Ljava/lang/String;)Ll/w1e$b;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x3

    .line 16
    invoke-virtual {p0, v0}, Ll/w1e$b;->D(I)Ll/w1e$b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p0, v0}, Ll/w1e$b;->E(I)Ll/w1e$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p0, v0}, Ll/w1e$b;->q(I)Ll/w1e$b;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v1, ""

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget v1, Ll/uqb0;->f0:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/w1e$b;->H(Ljava/lang/String;)Ll/w1e$b;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    new-instance v0, Ll/hxp0;

    .line 51
    .line 52
    invoke-direct {v0}, Ll/hxp0;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private synthetic T2()V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/remote_config/b;->a(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic U2()V
    .locals 1

    .line 1
    sget-object v0, Ll/olj;->INSTANCE:Ll/olj;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/olj;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic W2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "one id \u70b9\u51fb\u53ef\u590d\u5236"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/hec0;->p:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/wcc0;->p:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/gxp0;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/gxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->I2()V

    return-void
.end method

.method private synthetic X2()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "one id \u70b9\u51fb\u53ef\u590d\u5236"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/hec0;->p:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/wcc0;->p:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroid/widget/TextView;

    .line 32
    .line 33
    sget-object v2, Ll/x95;->INSTANCE:Ll/x95;

    .line 34
    .line 35
    new-instance v3, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;

    .line 36
    .line 37
    invoke-direct {v3, p0, v1}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct$a;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;Landroid/widget/TextView;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ll/x95;->g(Lkotlin/jvm/functions/Function1;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic Y1(Ll/wyd0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/g9r;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->S2()V

    return-void
.end method

.method private synthetic a3()V
    .locals 8

    .line 1
    sget-object v0, Ll/qv5;->a:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "tantanapp"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/lhl;->d()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    const-string v0, "tantantribe"

    .line 26
    .line 27
    :cond_0
    new-instance v1, Landroid/widget/EditText;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    const-string v0, "name.dev.p1staff"

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 53
    .line 54
    .line 55
    const/high16 v0, 0x41b80000    # 23.0f

    .line 56
    .line 57
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-static {v1, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v2, "Connect to developer\'s machine"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-string v6, "staging2.p1staff"

    .line 75
    .line 76
    const-string v7, "growth.dev.p1staff"

    .line 77
    .line 78
    const-string v2, "tantanapp"

    .line 79
    .line 80
    const-string v3, "tantantribe"

    .line 81
    .line 82
    const-string v4, "staging.tantantribe"

    .line 83
    .line 84
    const-string v5, "staging1.p1staff"

    .line 85
    .line 86
    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v2, Ll/lxp0;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Ll/lxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const/4 v2, 0x1

    .line 104
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sget v2, Lcom/p1/mobile/putong/account/R$string;->y:I

    .line 109
    .line 110
    new-instance v3, Ll/mxp0;

    .line 111
    .line 112
    invoke-direct {v3, p0, v1}, Ll/mxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;Landroid/widget/EditText;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->N2()V

    return-void
.end method

.method private synthetic b3()V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ","

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-string v0, ""

    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string v1, "Change location"

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Ll/w1e$b;->I(Ljava/lang/String;)Ll/w1e$b;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/16 v1, 0x64

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Ll/w1e$b;->D(I)Ll/w1e$b;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const/4 v1, 0x1

    .line 61
    invoke-virtual {p0, v1}, Ll/w1e$b;->E(I)Ll/w1e$b;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string v1, "39.9385466,116.1172739"

    .line 66
    .line 67
    invoke-virtual {p0, v1}, Ll/w1e$b;->r(Ljava/lang/String;)Ll/w1e$b;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0, v0}, Ll/w1e$b;->H(Ljava/lang/String;)Ll/w1e$b;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    new-instance v0, Ll/fxp0;

    .line 76
    .line 77
    invoke-direct {v0}, Ll/fxp0;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->a3()V

    return-void
.end method

.method private synthetic c3()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-interface {v0, p0, v1, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toIntlMaps(Landroid/content/Context;IZ)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/16 v1, 0x444

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic d2(Ll/wyd0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->X2()V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;Landroid/widget/EditText;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->Z2(Landroid/widget/EditText;)V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->L2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i2(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ","

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    aget-object v0, p0, v0

    .line 15
    .line 16
    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    const/4 v2, 0x1

    .line 21
    aget-object p0, p0, v2

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/location/a;->b:Ll/mxd0;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/location/a;->c:Ll/mxd0;

    .line 41
    .line 42
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/mxd0;->put(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/location/a;->a:Ll/jxd0;

    .line 52
    .line 53
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/location/a;->a:Ll/jxd0;

    .line 67
    .line 68
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->c3()V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->b3()V

    return-void
.end method

.method private synthetic lambda$debugItems$19()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "female"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;->X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic lambda$debugItems$21()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->b:Ll/uv;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uv;->a:Ll/wyd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/w1e;->d(Landroid/content/Context;)Ll/w1e$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "Change Account Sdk Client Id"

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ll/w1e$b;->I(Ljava/lang/String;)Ll/w1e$b;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/16 v1, 0x64

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ll/w1e$b;->D(I)Ll/w1e$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {p0, v1}, Ll/w1e$b;->E(I)Ll/w1e$b;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v1, "100003"

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/w1e$b;->r(Ljava/lang/String;)Ll/w1e$b;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Ll/w1e$b;->H(Ljava/lang/String;)Ll/w1e$b;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v1, Ll/kxp0;

    .line 47
    .line 48
    invoke-direct {v1, v0}, Ll/kxp0;-><init>(Ll/wyd0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v1}, Ll/w1e$b;->F(Ll/y20;)Ll/w1e$b;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/w1e$b;->n()Lcom/p1/mobile/android/app/Dialog;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->U2()V

    return-void
.end method

.method public static synthetic n2()V
    .locals 1

    .line 1
    const-string v0, "407465776312149"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/facebook/c;->N(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->Q2()V

    return-void
.end method

.method public static synthetic p2()V
    .locals 1

    .line 1
    invoke-static {}, Ll/tg50;->g()Ll/tg50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tg50;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->T2()V

    return-void
.end method

.method public static synthetic r2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->W2()V

    return-void
.end method

.method public static synthetic s2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->lambda$debugItems$1()V

    return-void
.end method

.method public static synthetic u2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->lambda$debugItems$19()V

    return-void
.end method

.method public static synthetic v2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->M2()V

    return-void
.end method

.method public static synthetic w2(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sput p0, Ll/uqb0;->f0:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic y2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->H2()V

    return-void
.end method

.method public static synthetic z2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->V2(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic L2(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "clipboard"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/ClipboardManager;

    .line 8
    .line 9
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "\u5df2\u590d\u5236"

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic R2(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    const-string p1, "tantantribe"

    .line 2
    .line 3
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const-string p2, "tantanapp"

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 12
    .line 13
    const/4 p3, 0x1

    .line 14
    invoke-virtual {p1, p3}, Ll/lhl;->r(Z)V

    .line 15
    .line 16
    .line 17
    move-object p4, p2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget-object p1, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 20
    .line 21
    const/4 p3, 0x0

    .line 22
    invoke-virtual {p1, p3}, Ll/lhl;->r(Z)V

    .line 23
    .line 24
    .line 25
    :goto_0
    invoke-virtual {p4, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-static {p1}, Ll/qv5;->e(Z)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Ll/qv5;->a:Ll/wyd0;

    .line 33
    .line 34
    invoke-interface {p4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->b0()Ll/jni0;

    .line 46
    .line 47
    .line 48
    const-class p1, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;

    .line 49
    .line 50
    invoke-static {p0, p1}, Ll/l51;->L(Landroid/content/Context;Ljava/lang/Class;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic V2(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "clipboard"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/ClipboardManager;

    .line 8
    .line 9
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "\u5df2\u590d\u5236"

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic Z2(Landroid/widget/EditText;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "tantanapp"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ll/qv5;->e(Z)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Ll/qv5;->a:Ll/wyd0;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->b0()Ll/jni0;

    .line 36
    .line 37
    .line 38
    const-class p1, Lcom/p1/mobile/putong/account/ui/welcome/SplashAct;

    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/l51;->L(Landroid/content/Context;Ljava/lang/Class;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public debugItems()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->debugItems()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/dxp0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/dxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 8
    .line 9
    .line 10
    const-string v2, "smart save"

    .line 11
    .line 12
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/vwp0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/vwp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 22
    .line 23
    .line 24
    const-string v2, "Connect to developer\'s machine"

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/wwp0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/wwp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 36
    .line 37
    .line 38
    const-string v2, "Change location"

    .line 39
    .line 40
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    new-instance v1, Ll/xwp0;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/xwp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 60
    .line 61
    .line 62
    const-string v2, "Pick city"

    .line 63
    .line 64
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_0
    new-instance v1, Ll/ywp0;

    .line 72
    .line 73
    invoke-direct {v1}, Ll/ywp0;-><init>()V

    .line 74
    .line 75
    .line 76
    const-string v2, "Toggle facebookAppId"

    .line 77
    .line 78
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    new-instance v1, Ll/zwp0;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/zwp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 88
    .line 89
    .line 90
    const-string v2, "\u8bbe\u7f6e\u865a\u62dfip"

    .line 91
    .line 92
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    new-instance v1, Ll/axp0;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/axp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 102
    .line 103
    .line 104
    const-string v2, "Start SignUpProfileImageAct"

    .line 105
    .line 106
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    new-instance v1, Ll/bxp0;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/bxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 116
    .line 117
    .line 118
    const-string v2, "show android id"

    .line 119
    .line 120
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    new-instance v1, Ll/cxp0;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/cxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 130
    .line 131
    .line 132
    const-string v2, "show device id"

    .line 133
    .line 134
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    new-instance v1, Ll/exp0;

    .line 142
    .line 143
    invoke-direct {v1, p0}, Ll/exp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 144
    .line 145
    .line 146
    const-string v2, "shortcut badger show"

    .line 147
    .line 148
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    new-instance v1, Ll/oxp0;

    .line 156
    .line 157
    invoke-direct {v1}, Ll/oxp0;-><init>()V

    .line 158
    .line 159
    .line 160
    const-string v2, "pull alive test "

    .line 161
    .line 162
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    new-instance v1, Ll/pxp0;

    .line 170
    .line 171
    invoke-direct {v1, p0}, Ll/pxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 172
    .line 173
    .line 174
    const-string v2, "Change ip for httpdns"

    .line 175
    .line 176
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    new-instance v1, Ll/qxp0;

    .line 184
    .line 185
    invoke-direct {v1}, Ll/qxp0;-><init>()V

    .line 186
    .line 187
    .line 188
    const-string v2, "pull httpdns data"

    .line 189
    .line 190
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    new-instance v1, Ll/rxp0;

    .line 198
    .line 199
    invoke-direct {v1, p0}, Ll/rxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 200
    .line 201
    .line 202
    const-string v2, "Facebook profile image page"

    .line 203
    .line 204
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    new-instance v1, Ll/sxp0;

    .line 212
    .line 213
    invoke-direct {v1, p0}, Ll/sxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 214
    .line 215
    .line 216
    const-string v2, "Change Account Sdk Client Id"

    .line 217
    .line 218
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    new-instance v1, Ll/txp0;

    .line 226
    .line 227
    invoke-direct {v1, p0}, Ll/txp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 228
    .line 229
    .line 230
    const-string v2, "Intl change MCC"

    .line 231
    .line 232
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    new-instance v1, Ll/uxp0;

    .line 240
    .line 241
    invoke-direct {v1, p0}, Ll/uxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 242
    .line 243
    .line 244
    const-string v2, "show RemoteConfig"

    .line 245
    .line 246
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    new-instance v1, Ll/vxp0;

    .line 254
    .line 255
    invoke-direct {v1, p0}, Ll/vxp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 256
    .line 257
    .line 258
    const-string v2, "\u56fe\u5f62\u6ed1\u5757"

    .line 259
    .line 260
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    new-instance v1, Ll/twp0;

    .line 268
    .line 269
    invoke-direct {v1, p0}, Ll/twp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 270
    .line 271
    .line 272
    const-string v2, "show one id"

    .line 273
    .line 274
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    new-instance v1, Ll/uwp0;

    .line 282
    .line 283
    invoke-direct {v1, p0}, Ll/uwp0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 284
    .line 285
    .line 286
    const-string p0, "show clevertap id"

    .line 287
    .line 288
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    return-object v0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->e:Ll/o6;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/v3q0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/v3q0;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 10
    .line 11
    new-instance v0, Ll/f5q0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/f5q0;-><init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->e:Ll/o6;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public initPageHelper()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initPageHelper()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "enable_back"

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "add_account"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "delete_account_popup"

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    move-object v0, v1

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "isFromSignOut"

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    const-string v0, "sign_out"

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "from_splash"

    .line 64
    .line 65
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    const-string v0, "onboard"

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    const-string v0, "other"

    .line 75
    .line 76
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_4

    .line 87
    .line 88
    const-string v1, "after_sign"

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_4
    const-string v1, "before_sign"

    .line 92
    .line 93
    :goto_1
    const-string v2, "show_status"

    .line 94
    .line 95
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const-string v2, "landingpage_source"

    .line 100
    .line 101
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    filled-new-array {v1, v0}, [Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/v3q0;->a0()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/swp0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/swp0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic lambda$debugItems$1()V
    .locals 3

    .line 1
    invoke-static {}, Ll/qsf0;->d()Ll/qsf0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "phone"

    .line 6
    .line 7
    const-string v2, "password"

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1, v2}, Ll/qsf0;->h(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/v3q0;->A5(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v3q0;->c6()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onPauseLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onPauseLifecycle()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onPickImagesResult(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v3q0;->C5(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onRestart()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/v3q0;->F5()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/v3q0;->G5()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_sign_in_type_selection_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x400

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "show_update_dialog"

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput-boolean v0, p1, Ll/v3q0;->a:Z

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "is_clear_task"

    .line 29
    .line 30
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->c:Z

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "from_splash"

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput-boolean v0, p1, Ll/v3q0;->h:Z

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "inactive_type"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 63
    .line 64
    iput-object v0, p1, Ll/v3q0;->b:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "inactive_category"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p1, Ll/v3q0;->c:Ljava/lang/String;

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "hasContract"

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput-boolean v0, p1, Ll/v3q0;->i:Z

    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->d:Ll/v3q0;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v1, "first_welcome"

    .line 101
    .line 102
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput-boolean v0, p1, Ll/v3q0;->j:Z

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    const-string v0, "enable_back"

    .line 113
    .line 114
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 119
    .line 120
    .line 121
    iget-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->c:Z

    .line 122
    .line 123
    if-eqz p1, :cond_0

    .line 124
    .line 125
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 126
    .line 127
    .line 128
    :cond_0
    return-void
.end method

.method public setTheme()V
    .locals 0

    return-void
.end method

.method public shouldRemarginContent()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldWrapContentViewWithTransparentHeader()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public trackedArgs()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Ll/uqb0;->F0:Ll/og3;

    .line 8
    .line 9
    const-string v1, "app session"

    .line 10
    .line 11
    filled-new-array {v1, p0, v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
