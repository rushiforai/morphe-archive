.class public Ll/mna0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/rna0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


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

.method public static synthetic e0(Ll/mna0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mna0;->l0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/mna0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mna0;->n0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/mna0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mna0;->k0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/mna0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mna0;->m0()V

    return-void
.end method

.method private synthetic k0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/rna0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/rna0;->m()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "loop_input_type"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 16
    .line 17
    iput-object p1, p0, Ll/mna0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/rna0;

    .line 22
    .line 23
    iget-object p0, p0, Ll/mna0;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p1, p0}, Ll/rna0;->z(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic l0(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 36
    .line 37
    .line 38
    const-string p1, "tantanx_pet_photo_final_saveresult"

    .line 39
    .line 40
    const-string v0, "yes"

    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    filled-new-array {p1}, [Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "e_pet_photo_save_result"

    .line 51
    .line 52
    const-string v1, "p_tantanx_pet_photo_normalguide"

    .line 53
    .line 54
    invoke-static {v0, v1, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/dkb;->H7()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 69
    .line 70
    .line 71
    const-string p0, "\u4e0a\u4f20\u6210\u529f"

    .line 72
    .line 73
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    return-void
.end method

.method private synthetic m0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic n0(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    const-string v0, "tantanx_pet_photo_final_saveresult"

    .line 2
    .line 3
    const-string v1, "no"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_pet_photo_save_result"

    .line 14
    .line 15
    const-string v2, "p_tantanx_pet_photo_normalguide"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 55
    .line 56
    .line 57
    invoke-static {p1}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->c3:I

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->i:I

    .line 79
    .line 80
    new-instance v1, Ll/lna0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/lna0;-><init>(Ll/mna0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 96
    .line 97
    .line 98
    :cond_1
    :goto_0
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
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "explore_ext_data"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Ll/mna0;->c:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "loop_edit_from"

    .line 25
    .line 26
    const-string v2, ""

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/mna0;->b:Ljava/lang/String;

    .line 33
    .line 34
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ina0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ina0;-><init>(Ll/mna0;)V

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

.method public i0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mna0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j0(Z)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/rna0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/rna0;->k()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Ll/rna0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/rna0;->q()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public o0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 18
    .line 19
    .line 20
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {p2, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance p2, Ll/jna0;

    .line 33
    .line 34
    invoke-direct {p2, p0}, Ll/jna0;-><init>(Ll/mna0;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/kna0;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/kna0;-><init>(Ll/mna0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 55
    .line 56
    .line 57
    return-void
.end method
