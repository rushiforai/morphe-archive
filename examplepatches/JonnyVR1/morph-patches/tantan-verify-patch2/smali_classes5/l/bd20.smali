.class public Ll/bd20;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/r0m;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/bd20;->c:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/bd20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bd20;->k0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f0(Ll/bd20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bd20;->j0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic g0(Ll/bd20;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bd20;->l0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic l0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/r0m;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bd20;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/r0m;->A3(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "new_process"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput-boolean v0, p0, Ll/bd20;->c:Z

    .line 17
    .line 18
    new-instance v0, Ll/yc20;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/yc20;-><init>(Ll/bd20;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/r0m;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/r0m;->l3()Landroid/util/Pair;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Ll/xc20;->u(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v0, Ll/r0m;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget v1, Lcom/p1/mobile/putong/core/R$string;->m8:I

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {v0, p0}, Ll/r0m;->J2(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-static {v0}, Ll/xc20;->p(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_1

    .line 46
    .line 47
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast v1, Ll/r0m;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sget v2, Lcom/p1/mobile/putong/core/R$string;->pr:I

    .line 56
    .line 57
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {v1, p0}, Ll/r0m;->J2(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 65
    .line 66
    invoke-interface {p0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string v1, "idverifivation_teenager_user_id"

    .line 71
    .line 72
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string v1, "idverifivation_teenager_user_birthday"

    .line 77
    .line 78
    invoke-static {v0}, Ll/xc20;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    filled-new-array {p0, v0}, [Ll/sfj0$a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string v0, "e_id_verification_info_teenager_input"

    .line 91
    .line 92
    const-string v1, "p_id_verification_info_input_view"

    .line 93
    .line 94
    invoke-static {v0, v1, p0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/data/IdCard;->new_()Lcom/p1/mobile/putong/data/IdCard;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iput-object v1, v2, Lcom/p1/mobile/putong/data/IdCard;->name:Ljava/lang/String;

    .line 103
    .line 104
    iput-object v0, v2, Lcom/p1/mobile/putong/data/IdCard;->number:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0, v2}, Ll/yc2;->j(Lcom/p1/mobile/putong/data/IdCard;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v1, p0, Ll/bd20;->b:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p0, v0, v1}, Ll/bd20;->i0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public i0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/zc20;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/zc20;-><init>(Ll/bd20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/l7y;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/r0m;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/r0m;->l3()Landroid/util/Pair;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 10
    .line 11
    move-object v5, v1

    .line 12
    check-cast v5, Ljava/lang/String;

    .line 13
    .line 14
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 15
    .line 16
    move-object v6, v0

    .line 17
    check-cast v6, Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "appeal"

    .line 20
    .line 21
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const-string v0, "fromPicVerificationDlg"

    .line 28
    .line 29
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    const-string v0, "fromNameVerificationDlg"

    .line 36
    .line 37
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string p2, "verification_center"

    .line 45
    .line 46
    :cond_1
    :goto_0
    move-object v3, p2

    .line 47
    iget-boolean v4, p0, Ll/bd20;->a:Z

    .line 48
    .line 49
    const/4 v9, 0x0

    .line 50
    iget-boolean v10, p0, Ll/bd20;->c:Z

    .line 51
    .line 52
    const/4 v7, 0x2

    .line 53
    const/4 v8, 0x1

    .line 54
    move-object v2, p1

    .line 55
    invoke-static/range {v2 .. v10}, Ll/hxf;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZLjava/lang/String;Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "android.permission.CAMERA"

    .line 18
    .line 19
    filled-new-array {v1}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/ad20;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1, p2}, Ll/ad20;-><init>(Ll/bd20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public m0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bd20;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public n0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bd20;->a:Z

    .line 2
    .line 3
    return-void
.end method
