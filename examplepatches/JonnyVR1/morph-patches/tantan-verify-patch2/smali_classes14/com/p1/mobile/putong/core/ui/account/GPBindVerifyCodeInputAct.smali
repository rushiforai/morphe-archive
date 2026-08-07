.class public Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static p:Ljava/lang/String;

.field public static q:I


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VButton_FakeShadow;

.field public i:I

.field public j:Ljava/lang/String;

.field public k:Lcom/p1/mobile/putong/data/VerifyData;

.field public l:Z

.field public m:Ljava/lang/Runnable;

.field public n:Ll/x20;

.field public o:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->k:Lcom/p1/mobile/putong/data/VerifyData;

    .line 10
    .line 11
    new-instance v0, Ll/agj;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/agj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->m:Ljava/lang/Runnable;

    .line 17
    .line 18
    new-instance v0, Ll/bgj;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/bgj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->n:Ll/x20;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->o:Z

    .line 27
    .line 28
    return-void
.end method

.method private synthetic B2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->e:Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic C2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->h:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x4

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic F2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->N2(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic H2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->e:Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->o:Z

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->k:Lcom/p1/mobile/putong/data/VerifyData;

    .line 16
    .line 17
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->send(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ll/dgj;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/dgj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 28
    .line 29
    .line 30
    new-instance v3, Ll/egj;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/egj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v2, v3, v0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private synthetic I2()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "afterSignup"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string v0, "accountSecurityPage"

    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->pageId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "bindType"

    .line 15
    .line 16
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v2, "e_intl_bind_phone_enter_verification_code_next_butto"

    .line 25
    .line 26
    invoke-static {v2, v1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    sget v0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->q:I

    .line 30
    .line 31
    add-int/lit8 v1, v0, 0x1

    .line 32
    .line 33
    sput v1, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->q:I

    .line 34
    .line 35
    const/4 v1, 0x5

    .line 36
    if-ge v0, v1, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->k:Lcom/p1/mobile/putong/data/VerifyData;

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->v2()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->R2()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->e:Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;

    .line 51
    .line 52
    const-string v0, ""

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->H3:I

    .line 58
    .line 59
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private Q2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    sput v0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->q:I

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->u2()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->g:Lv/VText;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private R2()V
    .locals 3

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->k:Lcom/p1/mobile/putong/data/VerifyData;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->verify(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/fgj;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/fgj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/ggj;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/ggj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    invoke-static {v1, v2, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic X1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->y2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->lambda$initSubscription$6(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->D2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->C2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->B2()V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->H2()V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->M2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->w2(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->K2()V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->F2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->I2()V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->L2(Ll/uxj0;)V

    return-void
.end method

.method private synthetic lambda$initSubscription$6(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    new-instance v0, Ll/hgj;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hgj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->d:Lv/VText;

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->i:I

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->j:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/e170;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    sput v0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->q:I

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->l:Z

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    const-string p1, "afterSignup"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string p1, "accountSecurityPage"

    .line 35
    .line 36
    :goto_0
    new-instance v0, Lorg/json/JSONObject;

    .line 37
    .line 38
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 39
    .line 40
    .line 41
    :try_start_0
    const-string v1, "bindType"

    .line 42
    .line 43
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catch_0
    move-exception p1

    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    const-string v0, "count_down_complete"

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->o:Z

    .line 64
    .line 65
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->s2()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p1}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_2

    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->p:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->j:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->m:Ljava/lang/Runnable;

    .line 93
    .line 94
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->u2()V

    .line 99
    .line 100
    .line 101
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->j:Ljava/lang/String;

    .line 102
    .line 103
    sput-object p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->p:Ljava/lang/String;

    .line 104
    .line 105
    return-void
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->z2()V

    return-void
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->E2(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->A2()V

    return-void
.end method

.method public static q2(Landroid/widget/TextView;Ljava/lang/String;Ll/x20;)V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    new-instance v2, Landroid/text/SpannableString;

    .line 30
    .line 31
    invoke-direct {v2, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct$a;

    .line 35
    .line 36
    invoke-direct {v0, p2}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct$a;-><init>(Ll/x20;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    add-int/2addr p1, v1

    .line 44
    const/16 p2, 0x21

    .line 45
    .line 46
    invoke-virtual {v2, v0, v1, p1, p2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 57
    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    sget p2, Ll/j9c0;->n:I

    .line 66
    .line 67
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->c:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->p4:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->e:Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->n:Ll/x20;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;->setOnCompleteAction(Ll/x20;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->e:Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;

    .line 16
    .line 17
    new-instance v1, Ll/sfj;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/sfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;->setListener(Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView$a;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->h:Lv/VButton_FakeShadow;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->e:Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;->getText()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x4

    .line 38
    if-ne v1, v2, :cond_0

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 v1, 0x0

    .line 43
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->h:Lv/VButton_FakeShadow;

    .line 47
    .line 48
    new-instance v1, Ll/zfj;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/zfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static r2(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "ccode"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "phone_number"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "is_from_sign_up"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method private u2()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->o:Z

    .line 2
    .line 3
    const/16 v1, 0x3c

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->g:Lv/VText;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->d3:I

    .line 10
    .line 11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->g:Lv/VText;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 39
    .line 40
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->I3:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 46
    .line 47
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->J3:I

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/tfj;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/tfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->q2(Landroid/widget/TextView;Ljava/lang/String;Ll/x20;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->s2()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0, v1}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/ufj;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/ufj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Ll/vfj;

    .line 80
    .line 81
    invoke-direct {v2}, Ll/vfj;-><init>()V

    .line 82
    .line 83
    .line 84
    new-instance v3, Ll/wfj;

    .line 85
    .line 86
    invoke-direct {v3, p0}, Ll/wfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, v2, v3}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private v2()I
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->e:Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;->getText()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return p0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0
.end method


# virtual methods
.method public final synthetic A2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->m:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic D2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->n:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic E2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->Q2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic K2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->m:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic L2(Ll/uxj0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->l:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "afterSignup"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p1, "accountSecurityPage"

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->pageId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "bindType"

    .line 21
    .line 22
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->i:I

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    sget-object v2, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->p:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "phone_num"

    .line 46
    .line 47
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    filled-new-array {p1, v1}, [Ll/sfj0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string v1, "e_intl_bind_phone_success"

    .line 56
    .line 57
    invoke-static {v1, v0, p1}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 58
    .line 59
    .line 60
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->U0:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->dismissGpBindPhoneRedDot()V

    .line 74
    .line 75
    .line 76
    const/4 p1, -0x1

    .line 77
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setResult(I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic M2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->e:Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;

    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/account/view/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final N2(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->s2()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    xor-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 20
    .line 21
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->I3:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->J3:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/xfj;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/xfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->q2(Landroid/widget/TextView;Ljava/lang/String;Ll/x20;)V

    .line 40
    .line 41
    .line 42
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    move-object v0, p1

    .line 47
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 48
    .line 49
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 50
    .line 51
    const v1, 0x9c7c

    .line 52
    .line 53
    .line 54
    if-ne v0, v1, :cond_0

    .line 55
    .line 56
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->S0:I

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->p2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "ccode"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->i:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "phone_number"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->j:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "is_from_sign_up"

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->l:Z

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->k:Lcom/p1/mobile/putong/data/VerifyData;

    .line 42
    .line 43
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->k:Lcom/p1/mobile/putong/data/VerifyData;

    .line 50
    .line 51
    const-string v1, "bind_mobile"

    .line 52
    .line 53
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->k:Lcom/p1/mobile/putong/data/VerifyData;

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->i:I

    .line 62
    .line 63
    iput v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->j:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 68
    .line 69
    const/4 v2, 0x4

    .line 70
    iput v2, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->p:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_0

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->s2()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/cgj;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/cgj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "count_down_complete"

    .line 5
    .line 6
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->o:Z

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/igj;->b(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_bind_phone_enter_verification_code_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public final s2()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "bind_mobile"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic w2(Ljava/lang/Long;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->g:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->d3:I

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide/16 v4, 0x3b

    .line 10
    .line 11
    sub-long/2addr v4, v2

    .line 12
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic y2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->m:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic z2()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->o:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->g:Lv/VText;

    .line 5
    .line 6
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->d3:I

    .line 7
    .line 8
    const/16 v3, 0x3c

    .line 9
    .line 10
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->g:Lv/VText;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 37
    .line 38
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->I3:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->f:Lv/VText;

    .line 44
    .line 45
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->J3:I

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ll/yfj;

    .line 52
    .line 53
    invoke-direct {v2, p0}, Ll/yfj;-><init>(Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/account/GPBindVerifyCodeInputAct;->q2(Landroid/widget/TextView;Ljava/lang/String;Ll/x20;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
