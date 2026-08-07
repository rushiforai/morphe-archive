.class public Ll/o91;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/t91;",
        ">;"
    }
.end annotation


# instance fields
.field public i:I

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

.field public k:Ljava/lang/String;

.field public l:I

.field public m:Ljava/lang/String;

.field public n:Ll/zed0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/zed0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Ll/o91;->i:I

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Ll/o91;->k:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p2, p0, Ll/o91;->n:Ll/zed0;

    .line 12
    .line 13
    new-instance p1, Ll/t91;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/t91;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/u54;->k(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic L3(Ll/o91;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o91;->i4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic M3(Ll/o91;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o91;->l4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N3(Ll/o91;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o91;->b4()V

    return-void
.end method

.method public static synthetic O3(Ll/o91;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o91;->n4(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic P3(Ll/o91;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o91;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method

.method public static synthetic R3(Ll/o91;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o91;->m4()V

    return-void
.end method

.method public static synthetic S3(Ll/o91;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o91;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method

.method public static synthetic T3(Ll/o91;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o91;->p4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V

    return-void
.end method

.method public static synthetic U3(Ll/o91;Ll/vxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o91;->h4(Ll/vxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V3(Ll/o91;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o91;->j4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W3(Ll/o91;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o91;->Y3(I)V

    return-void
.end method

.method public static synthetic X3(Ll/o91;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o91;->o4(Ll/vxj0;)V

    return-void
.end method

.method private Z3()V
    .locals 4

    .line 1
    sget-object v0, Ll/iit;->Companion:Ll/iit$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/iit$a;->P()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ll/wgt;->u(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Ll/o91;->k:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v2, p0, Ll/o91;->m:Ljava/lang/String;

    .line 50
    .line 51
    iget v3, p0, Ll/o91;->l:I

    .line 52
    .line 53
    invoke-static {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->F3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/n91;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/n91;-><init>(Ll/o91;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/b91;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/b91;-><init>(Ll/o91;)V

    .line 73
    .line 74
    .line 75
    new-instance v2, Ll/c91;

    .line 76
    .line 77
    invoke-direct {v2, p0}, Ll/c91;-><init>(Ll/o91;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    :cond_2
    :goto_0
    return-void
.end method

.method private b4()V
    .locals 1

    .line 1
    const-string v0, "checkAndBindPhone"

    .line 2
    .line 3
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/o91;->g4()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {p0, v0}, Ll/o91;->r4(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-direct {p0}, Ll/o91;->Z3()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private e4(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const-string p0, "DEFAULT"

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 p0, 0x2

    .line 8
    if-ne p1, p0, :cond_1

    .line 9
    .line 10
    const-string p0, "APPLY_HAS_SEND"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const/4 p0, 0x3

    .line 14
    if-ne p1, p0, :cond_2

    .line 15
    .line 16
    const-string p0, "CALL_CONNECTING"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const/4 p0, 0x4

    .line 20
    if-ne p1, p0, :cond_3

    .line 21
    .line 22
    const-string p0, "APPLY_FAIL"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_3
    const/4 p0, 0x5

    .line 26
    if-ne p1, p0, :cond_4

    .line 27
    .line 28
    const-string p0, "DOWNLOADING"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_4
    const/4 p0, 0x6

    .line 32
    if-ne p1, p0, :cond_5

    .line 33
    .line 34
    const-string p0, "SUCCESS"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_5
    const-string p0, "NULL"

    .line 38
    .line 39
    return-object p0
.end method

.method private g4()Z
    .locals 3

    .line 1
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p0, :cond_3

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 40
    .line 41
    const-string v2, "wechat"

    .line 42
    .line 43
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 50
    .line 51
    const-string v2, "qq"

    .line 52
    .line 53
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_1

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 60
    .line 61
    const-string v1, "network-security"

    .line 62
    .line 63
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_2

    .line 68
    .line 69
    :cond_1
    return v0

    .line 70
    :cond_2
    const/4 p0, 0x0

    .line 71
    return p0

    .line 72
    :cond_3
    :goto_0
    return v0
.end method

.method private synthetic o4(Ll/vxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/o91;->Y3(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private p4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getInviteId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/o91;->k:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method private r4(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/d91;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/d91;-><init>(Ll/o91;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H0:I

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Vc:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final Y3(I)V
    .locals 3

    .line 1
    iget v0, p0, Ll/o91;->i:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Ll/t91;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/t91;->u()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget v0, p0, Ll/o91;->i:I

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-ne v0, v2, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Ll/o91;->k:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    check-cast v1, Ll/t91;

    .line 29
    .line 30
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->p2:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v1, v0}, Ll/t91;->p(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const-string v0, "apply"

    .line 42
    .line 43
    iput-object v0, p0, Ll/o91;->m:Ljava/lang/String;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    check-cast v1, Ll/t91;

    .line 47
    .line 48
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->S0:I

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v1, v0}, Ll/t91;->p(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string v0, "invite"

    .line 60
    .line 61
    iput-object v0, p0, Ll/o91;->m:Ljava/lang/String;

    .line 62
    .line 63
    :goto_0
    iput p1, p0, Ll/o91;->l:I

    .line 64
    .line 65
    sget-object p1, Ll/iit;->Companion:Ll/iit$a;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/iit$a;->P()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-static {v0}, Ll/wgt;->u(I)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/iit$a;->P()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    const/4 v0, 0x0

    .line 82
    new-array v0, v0, [Ljava/lang/Object;

    .line 83
    .line 84
    const/4 v1, 0x0

    .line 85
    invoke-static {p1, v1, v0}, Ll/wgt;->p(ILcom/p1/mobile/android/app/Act;[Ljava/lang/Object;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    new-instance v0, Ll/k91;

    .line 94
    .line 95
    invoke-direct {v0, p0}, Ll/k91;-><init>(Ll/o91;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    new-instance v0, Ll/l91;

    .line 103
    .line 104
    invoke-direct {v0, p0}, Ll/l91;-><init>(Ll/o91;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_2
    if-ne v0, v1, :cond_3

    .line 116
    .line 117
    iget-object p1, p0, Ll/o91;->n:Ll/zed0;

    .line 118
    .line 119
    invoke-virtual {p1}, Ll/n54;->Z3()Ll/qvd;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {p1, v0}, Ll/qvd;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object v0, p0, Ll/o91;->j:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 134
    .line 135
    invoke-static {v0}, Ll/u54;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_3

    .line 140
    .line 141
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->personalManager()Ll/v3f$d;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    new-instance v1, Ll/u24;

    .line 152
    .line 153
    invoke-direct {v1}, Ll/u24;-><init>()V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Ll/o91;->n:Ll/zed0;

    .line 157
    .line 158
    invoke-virtual {p0}, Ll/n54;->Z3()Ll/qvd;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p0}, Ll/qvd;->m()Ll/j2s;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {p0, v2}, Ll/j2s;->k(Ljava/lang/String;)Ll/h64;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {v1, p0}, Ll/u24;->a(Ll/h64;)Ll/u24;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0, p1}, Ll/u24;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ll/u24;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    :cond_3
    return-void
.end method

.method public a4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o91;->n:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zed0;->K4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c4()V
    .locals 3

    .line 1
    const-string v0, "checkAndRequestPermission"

    .line 2
    .line 3
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 11
    .line 12
    filled-new-array {v1}, [Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/m91;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/m91;-><init>(Ll/o91;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    iget v0, p0, Ll/o91;->i:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/o91;->u4()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v1, 0x2

    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/o91;->j:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/o91;->a4(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public final f4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/o91;->j:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    invoke-static {p1}, Ll/u54;->e(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x6

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {p1}, Ll/u54;->f(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const-string p1, ""

    .line 18
    .line 19
    iput-object p1, p0, Ll/o91;->k:Ljava/lang/String;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-static {p1}, Ll/u54;->p(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x2

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    invoke-static {p1}, Ll/u54;->q(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    const/4 p1, 0x3

    .line 38
    goto :goto_0

    .line 39
    :cond_3
    const/4 p1, 0x0

    .line 40
    :goto_0
    iget v0, p0, Ll/o91;->i:I

    .line 41
    .line 42
    if-eq v0, p1, :cond_4

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/o91;->q4(I)V

    .line 45
    .line 46
    .line 47
    :cond_4
    return-void
.end method

.method public final synthetic h4(Ll/vxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Ll/o91;->i:I

    .line 2
    .line 3
    const/4 p1, 0x5

    .line 4
    if-ne p0, p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic i4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o91;->c4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/o91;->q4(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/o91;->k:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/o91;->l:I

    .line 7
    .line 8
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->d0:I

    .line 9
    .line 10
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/o91;->n:Ll/zed0;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic l4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o91;->n:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m4()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o91;->Z3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n4(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    new-instance v1, Ll/e91;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/e91;-><init>(Ll/o91;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showBindPhoneDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public q4(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setStatus: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/o91;->e4(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput p1, p0, Ll/o91;->i:I

    .line 23
    .line 24
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p0, Ll/t91;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/t91;->s(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public s4()V
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->T3()Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->callAnnouncementUrl:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/16 v1, 0x1130

    .line 22
    .line 23
    invoke-static {v1}, Ll/px50;->c(I)Ll/px50$a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v1, 0x11

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/px50$a;->q()Ll/px50;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->audienceCallAnchor()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/a91;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/a91;-><init>(Ll/o91;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorCallAudience()Ll/v3f$c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/f91;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/f91;-><init>(Ll/o91;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/o91;->n:Ll/zed0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/zed0;->O4()Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/g91;

    .line 79
    .line 80
    invoke-direct {v1}, Ll/g91;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/h91;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/h91;-><init>(Ll/o91;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Ll/aj1;->f()Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/i91;

    .line 116
    .line 117
    invoke-direct {v1}, Ll/i91;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/j91;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/j91;-><init>(Ll/o91;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public t4()V
    .locals 5

    .line 1
    sget-object v0, Ll/efv;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/16 v1, 0x1130

    .line 14
    .line 15
    invoke-static {v1}, Ll/px50;->c(I)Ll/px50$a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 24
    .line 25
    const-wide v3, 0x3fd999999999999aL    # 0.4

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/16 v1, 0x50

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->DEFAULT_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/px50$a;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)Ll/px50$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/px50$a;->q()Ll/px50;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public u4()V
    .locals 2

    .line 1
    const-string v0, "start apply"

    .line 2
    .line 3
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/iit;->Companion:Ll/iit$a;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/iit$a;->P()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v1}, Ll/wgt;->u(I)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x5

    .line 19
    invoke-virtual {p0, v1}, Ll/o91;->q4(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ll/iit$a;->P()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const/4 v0, 0x0

    .line 27
    new-array v0, v0, [Ljava/lang/Object;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {p0, v1, v0}, Ll/wgt;->p(ILcom/p1/mobile/android/app/Act;[Ljava/lang/Object;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/o91;->c4()V

    .line 43
    .line 44
    .line 45
    return-void
.end method
