.class public Ll/p1n0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/q2n0;",
        ">;"
    }
.end annotation


# static fields
.field public static final b:[Ljava/lang/String;


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, "android.permission.RECORD_AUDIO"

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [Ljava/lang/String;

    .line 13
    .line 14
    aput-object v2, v0, v3

    .line 15
    .line 16
    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    .line 17
    .line 18
    aput-object v2, v0, v1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-array v0, v1, [Ljava/lang/String;

    .line 22
    .line 23
    aput-object v2, v0, v3

    .line 24
    .line 25
    :goto_0
    sput-object v0, Ll/p1n0;->b:[Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method

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
    iput-object p1, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method private synthetic A0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/xzm0;->g()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Ll/p1n0;->b:[Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/g1n0;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/g1n0;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/h1n0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/h1n0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast v0, Ll/q2n0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/q2n0;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast p1, Ll/q2n0;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/q2n0;->r()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast p1, Ll/q2n0;

    .line 63
    .line 64
    invoke-static {}, Ll/w1n0;->c()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p1, v0}, Ll/q2n0;->F(Z)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast p1, Ll/q2n0;

    .line 74
    .line 75
    invoke-static {}, Ll/w1n0;->f()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-virtual {p1, v0}, Ll/q2n0;->G(Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/p1n0;->J0()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/p1n0;->y0()V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object p1, p1, Ll/uqx;->l:Lrx/subjects/a;

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    new-instance v0, Ll/i1n0;

    .line 99
    .line 100
    invoke-direct {v0}, Ll/i1n0;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    new-instance v0, Ll/j1n0;

    .line 108
    .line 109
    invoke-direct {v0, p0}, Ll/j1n0;-><init>(Ll/p1n0;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public static synthetic e0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Ll/p1n0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p1n0;->E0()V

    return-void
.end method

.method public static synthetic g0(Ll/p1n0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p1n0;->F0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic h0()V
    .locals 0

    .line 1
    invoke-static {}, Ll/jpd0;->e()Lrx/c;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Ll/p1n0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p1n0;->z0(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic j0(Ll/x20;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic k0(Ll/p1n0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p1n0;->D0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic l0(Ll/p1n0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p1n0;->C0()V

    return-void
.end method

.method public static synthetic m0(Ll/p1n0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p1n0;->A0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

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
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method private t0(I)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final synthetic C0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/q2n0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/q2n0;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic D0(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p1, v0, :cond_3

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p1, v0, :cond_2

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    if-eq p1, v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p1, Ll/q2n0;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/q2n0;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/o1n0;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/o1n0;-><init>(Ll/p1n0;)V

    .line 29
    .line 30
    .line 31
    const-wide/16 v1, 0x3e8

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/q2n0;

    .line 40
    .line 41
    invoke-static {}, Ll/w1n0;->f()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p1, v0}, Ll/q2n0;->G(Z)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p1, Ll/q2n0;

    .line 51
    .line 52
    invoke-static {}, Ll/w1n0;->c()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p1, v0}, Ll/q2n0;->F(Z)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/p1n0;->L0(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const-string p1, "p_voice_talking"

    .line 65
    .line 66
    iput-object p1, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/p1n0;->N0(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast p0, Ll/q2n0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/q2n0;->B()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 80
    .line 81
    check-cast p1, Ll/q2n0;

    .line 82
    .line 83
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->e7:I

    .line 84
    .line 85
    invoke-direct {p0, v0}, Ll/p1n0;->t0(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p1, p0}, Ll/q2n0;->E(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Ll/xzm0;->r()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iget-object v0, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz p1, :cond_4

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ll/p1n0;->L0(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const-string p1, "p_voice_call"

    .line 109
    .line 110
    iput-object p1, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Ll/p1n0;->N0(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 116
    .line 117
    check-cast p0, Ll/q2n0;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/q2n0;->A()V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_4
    invoke-virtual {p0, v0}, Ll/p1n0;->L0(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    const-string p1, "p_voice_callme"

    .line 127
    .line 128
    iput-object p1, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Ll/p1n0;->N0(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 134
    .line 135
    check-cast p0, Ll/q2n0;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/q2n0;->z()V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final synthetic E0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/p1n0;->L0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/q2n0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/q2n0;->C(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public G0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/w1n0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v1, v0, 0x1

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "off"

    .line 13
    .line 14
    :goto_0
    const-string v2, "mute_handsfree"

    .line 15
    .line 16
    invoke-static {v2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v2, "e_voice_talking_mute"

    .line 25
    .line 26
    const-string v3, "p_voice_talking"

    .line 27
    .line 28
    invoke-static {v2, v3, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/w1n0;->h(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Ll/q2n0;

    .line 37
    .line 38
    invoke-static {}, Ll/w1n0;->f()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0, v0}, Ll/q2n0;->G(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public H0(Ll/x20;)Z
    .locals 3

    .line 1
    sget-object v0, Ll/p1n0;->b:[Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v2, Ll/f1n0;

    .line 23
    .line 24
    invoke-direct {v2, p1}, Ll/f1n0;-><init>(Ll/x20;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->l(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p0, Ll/q2n0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/q2n0;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 40
    .line 41
    .line 42
    return v1

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public I0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    new-array v0, v0, [Ll/sfj0$a;

    .line 13
    .line 14
    const-string v1, "e_voice_small"

    .line 15
    .line 16
    invoke-static {v1, p0, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public J0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzm0;->m()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/n1n0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/n1n0;-><init>(Ll/p1n0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public L0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ll/l4g0;

    .line 9
    .line 10
    const-class v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallAct;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0, p1, v0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public N0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ll/l4g0;

    .line 9
    .line 10
    const-class v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallAct;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0, p1, v0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public O0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/p1n0;->a:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    new-array v1, v1, [Ll/sfj0$a;

    .line 13
    .line 14
    const-string v2, "e_voice_small"

    .line 15
    .line 16
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/q2n0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/q2n0;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/e1n0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/e1n0;-><init>(Ll/p1n0;)V

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

.method public p0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzm0;->n()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/q2n0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/q2n0;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public q0()V
    .locals 0

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xzm0;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzm0;->n()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/q2n0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/q2n0;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public s0()Landroid/util/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xzm0;->m()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0, p0}, Ll/r97;->z(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->F4:I

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, p0}, Ll/o3z;->e(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->G4:I

    .line 49
    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public u0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/w1n0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v1, v0, 0x1

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "on"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "off"

    .line 13
    .line 14
    :goto_0
    const-string v2, "mute_handsfree"

    .line 15
    .line 16
    invoke-static {v2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v2, "e_voice_talking_open"

    .line 25
    .line 26
    const-string v3, "p_voice_talking"

    .line 27
    .line 28
    invoke-static {v2, v3, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/w1n0;->g(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast v0, Ll/q2n0;

    .line 37
    .line 38
    invoke-static {}, Ll/w1n0;->c()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Ll/q2n0;->F(Z)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/w1n0;->c()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->g7:I

    .line 52
    .line 53
    invoke-direct {p0, v0}, Ll/p1n0;->t0(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->f7:I

    .line 59
    .line 60
    invoke-direct {p0, v0}, Ll/p1n0;->t0(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    :goto_1
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public x0()V
    .locals 0

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xzm0;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public y0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzm0;->i()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/k1n0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/k1n0;-><init>(Ll/p1n0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/l1n0;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/l1n0;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/m1n0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/m1n0;-><init>(Ll/p1n0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic z0(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/q2n0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {v0, v1}, Ll/w1n0;->b(J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/q2n0;->E(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
