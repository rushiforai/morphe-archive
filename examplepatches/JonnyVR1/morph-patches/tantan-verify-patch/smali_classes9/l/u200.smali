.class public Ll/u200;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/w200;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;


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

.method public static synthetic e0(Ll/u200;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u200;->h0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/u200;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u200;->i0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/u200;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u200;->j0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic h0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "USER_ID"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/u200;->b:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/u200;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->l()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    iget-object v0, p0, Ll/u200;->b:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {}, Ll/h39;->H()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Ll/u200;->a:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_0

    .line 70
    .line 71
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 72
    .line 73
    if-nez v0, :cond_0

    .line 74
    .line 75
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 76
    .line 77
    const-string v1, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 78
    .line 79
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    :cond_0
    const-string p1, "ta"

    .line 90
    .line 91
    iput-object p1, p0, Ll/u200;->a:Ljava/lang/String;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    iget-object v0, p0, Ll/u200;->a:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_2

    .line 107
    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 109
    .line 110
    iput-object p1, p0, Ll/u200;->a:Ljava/lang/String;

    .line 111
    .line 112
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 113
    .line 114
    check-cast p1, Ll/w200;

    .line 115
    .line 116
    iget-object p0, p0, Ll/u200;->a:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {p1, p0}, Ll/w200;->A3(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_3
    return-void
.end method

.method private synthetic i0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic j0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 8
    .line 9
    const v0, 0x9dcf

    .line 10
    .line 11
    .line 12
    if-eq p1, v0, :cond_0

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->Y5:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/r200;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r200;-><init>(Ll/u200;)V

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

.method public k0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object v1, p0, Ll/u200;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Ll/dkb;->Ga(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v0, Ll/s200;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/s200;-><init>(Ll/u200;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/t200;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/t200;-><init>(Ll/u200;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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
