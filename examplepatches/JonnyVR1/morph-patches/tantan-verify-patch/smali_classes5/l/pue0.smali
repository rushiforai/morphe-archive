.class public Ll/pue0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/uue0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:Z

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/core/data/TicklesStatus;

.field public g:Lcom/p1/mobile/putong/core/data/TicklesStatus;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/pue0;->d:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/pue0;->e:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Ll/pue0;->f:Lcom/p1/mobile/putong/core/data/TicklesStatus;

    .line 12
    .line 13
    iput-object p1, p0, Ll/pue0;->g:Lcom/p1/mobile/putong/core/data/TicklesStatus;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic e0(Ll/pue0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pue0;->s0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/pue0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pue0;->n0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic g0(Ll/pue0;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pue0;->r0(Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic h0(Ll/pue0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pue0;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Ll/pue0;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pue0;->o0(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic k0(Ll/pue0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pue0;->q0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private synthetic o0(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/pue0;->b:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/uue0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/uue0;->w()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/uue0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/uue0;->v()V

    .line 16
    .line 17
    .line 18
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const-string v1, ""

    .line 33
    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    move-object v0, v1

    .line 41
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_3

    .line 46
    .line 47
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;

    .line 52
    .line 53
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->receiver:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->receiverSuffix:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-nez v3, :cond_1

    .line 76
    .line 77
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->receiverSuffix:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->status:Lcom/p1/mobile/putong/core/data/TicklesStatus;

    .line 80
    .line 81
    iput-object v2, p0, Ll/pue0;->f:Lcom/p1/mobile/putong/core/data/TicklesStatus;

    .line 82
    .line 83
    iput-object v1, p0, Ll/pue0;->d:Ljava/lang/String;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->receiverSuffix:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    if-nez v3, :cond_0

    .line 93
    .line 94
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->receiverSuffix:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->status:Lcom/p1/mobile/putong/core/data/TicklesStatus;

    .line 97
    .line 98
    iput-object v2, p0, Ll/pue0;->g:Lcom/p1/mobile/putong/core/data/TicklesStatus;

    .line 99
    .line 100
    iput-object v0, p0, Ll/pue0;->e:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    move-object v0, v1

    .line 104
    :cond_3
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 105
    .line 106
    check-cast p1, Ll/uue0;

    .line 107
    .line 108
    iget-object v2, p0, Ll/pue0;->f:Lcom/p1/mobile/putong/core/data/TicklesStatus;

    .line 109
    .line 110
    iget-object p0, p0, Ll/pue0;->g:Lcom/p1/mobile/putong/core/data/TicklesStatus;

    .line 111
    .line 112
    invoke-virtual {p1, v1, v2, v0, p0}, Ll/uue0;->x(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/TicklesStatus;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/TicklesStatus;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private synthetic p0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/uue0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uue0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "clap_user_id"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/pue0;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    iget-object v2, p0, Ll/pue0;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const/4 v2, 0x1

    .line 48
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/iue0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/iue0;-><init>(Ll/pue0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 75
    .line 76
    iget-object v2, p0, Ll/pue0;->a:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/g;->xg(Ljava/lang/String;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/jue0;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/jue0;-><init>(Ll/pue0;)V

    .line 89
    .line 90
    .line 91
    new-instance p0, Ll/kue0;

    .line 92
    .line 93
    invoke-direct {p0}, Ll/kue0;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lue0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/lue0;-><init>(Ll/pue0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pue0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public m0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pue0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pue0;->x0(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)Lrx/c;
    .locals 6

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/pue0;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v4, p0, Ll/pue0;->d:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v5, p0, Ll/pue0;->e:Ljava/lang/String;

    .line 10
    .line 11
    move-object v2, p1

    .line 12
    move-object v3, p2

    .line 13
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->Fp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic r0(Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/pue0;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    iget-object p3, p0, Ll/pue0;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    const-string p1, "both"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p2, p0, Ll/pue0;->d:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    const-string p1, "general_tickle"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const-string p1, "special_tickle"

    .line 32
    .line 33
    :goto_0
    const-string p2, "finish_tickle"

    .line 34
    .line 35
    invoke-static {p2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string p2, "e_finish_tickle"

    .line 44
    .line 45
    const-string p3, "p_my_tickle"

    .line 46
    .line 47
    invoke-static {p2, p3, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 48
    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->b1:Ll/xab;

    .line 53
    .line 54
    iget-object p1, p1, Ll/xab;->R:Ll/jxd0;

    .line 55
    .line 56
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 64
    .line 65
    iget-object p1, p1, Ll/dkb;->d1:Ll/jxd0;

    .line 66
    .line 67
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 13
    .line 14
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 15
    .line 16
    const v0, 0x9d85

    .line 17
    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 22
    .line 23
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->U5:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const v0, 0x9dcf

    .line 34
    .line 35
    .line 36
    if-ne p1, v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    instance-of p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 47
    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public t0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pue0;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/pue0;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 32
    .line 33
    .line 34
    const-wide/16 v0, 0x1f4

    .line 35
    .line 36
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 37
    .line 38
    invoke-static {v0, v1, v2}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/mue0;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1, p2}, Ll/mue0;-><init>(Ll/pue0;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/nue0;

    .line 56
    .line 57
    invoke-direct {v1, p0, p1, p2}, Ll/nue0;-><init>(Ll/pue0;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance p1, Ll/oue0;

    .line 61
    .line 62
    invoke-direct {p1, p0}, Ll/oue0;-><init>(Ll/pue0;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public u0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/pue0;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public final x0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Ll/uue0;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/uue0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 38
    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 42
    .line 43
    const-string v1, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 44
    .line 45
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast p0, Ll/uue0;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Ll/uue0;->y(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 67
    .line 68
    check-cast p0, Ll/uue0;

    .line 69
    .line 70
    const-string p1, "ta"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/uue0;->y(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 77
    .line 78
    check-cast p0, Ll/uue0;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ll/uue0;->y(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
