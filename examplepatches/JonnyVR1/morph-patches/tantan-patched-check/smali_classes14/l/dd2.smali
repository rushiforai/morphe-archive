.class public Ll/dd2;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/fd2;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/dd2;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dd2;->k0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->C0:Lrx/subjects/a;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic h0(Ll/dd2;ZLcom/p1/mobile/putong/core/data/AppealInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dd2;->j0(ZLcom/p1/mobile/putong/core/data/AppealInfo;)V

    return-void
.end method

.method private synthetic k0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/fd2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fd2;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/zc2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zc2;-><init>(Ll/dd2;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i0(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->Z9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v2, Ll/ad2;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/ad2;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/bd2;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/bd2;-><init>(Ll/dd2;Z)V

    .line 30
    .line 31
    .line 32
    new-instance p0, Ll/cd2;

    .line 33
    .line 34
    invoke-direct {p0}, Ll/cd2;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic j0(ZLcom/p1/mobile/putong/core/data/AppealInfo;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Bm(Lcom/p1/mobile/putong/core/data/AppealInfo;)V

    .line 18
    .line 19
    .line 20
    if-eqz p2, :cond_5

    .line 21
    .line 22
    iget-boolean v1, p2, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/fd2;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/fd2;->f()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-boolean p1, p2, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 38
    .line 39
    if-eqz p1, :cond_4

    .line 40
    .line 41
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, "before"

    .line 44
    .line 45
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 62
    .line 63
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 p1, 0x0

    .line 75
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->buildBanReleaseVerifyIntent(Landroid/content/Context;Lcom/p1/mobile/putong/data/PhoneNumber;)Landroid/content/Intent;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 96
    .line 97
    const-string p2, "inProgress"

    .line 98
    .line 99
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_6

    .line 104
    .line 105
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Wb(Lcom/p1/mobile/android/app/Act;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->v:I

    .line 122
    .line 123
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_5
    :goto_1
    if-nez p1, :cond_6

    .line 128
    .line 129
    const-string p0, "\u5df2\u7533\u8bc9\u6210\u529f\uff0c\u65e0\u9700\u518d\u6b21\u7533\u8bc9"

    .line 130
    .line 131
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_6
    return-void
.end method
