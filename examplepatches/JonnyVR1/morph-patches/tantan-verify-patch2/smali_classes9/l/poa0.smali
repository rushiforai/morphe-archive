.class public Ll/poa0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/soa0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public b:Ljava/lang/String;

.field public c:Ll/l4g0;


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
    iput-object p1, p0, Ll/poa0;->c:Ll/l4g0;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/poa0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/poa0;->k0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/poa0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/poa0;->l0()V

    return-void
.end method

.method public static synthetic g0(Ll/poa0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/poa0;->j0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/poa0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/poa0;->m0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic j0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/soa0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/soa0;->j()Landroid/os/Bundle;

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
    iput-object p1, p0, Ll/poa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/soa0;

    .line 22
    .line 23
    iget-object p0, p0, Ll/poa0;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p1, p0}, Ll/soa0;->q(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic l0()V
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

.method private synthetic m0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->c3:I

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->i:I

    .line 40
    .line 41
    new-instance v1, Ll/ooa0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/ooa0;-><init>(Ll/poa0;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 57
    .line 58
    .line 59
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
    const-string v1, "loop_edit_from"

    .line 17
    .line 18
    const-string v2, ""

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/poa0;->b:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/loa0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/loa0;-><init>(Ll/poa0;)V

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

.method public i0(Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/soa0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/soa0;->l()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p4}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p4, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    sub-int/2addr p4, v0

    .line 21
    if-lez p4, :cond_0

    .line 22
    .line 23
    const-string p4, "upload_page_name"

    .line 24
    .line 25
    const-string v0, "upload_photos_page"

    .line 26
    .line 27
    invoke-static {p4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    sub-int/2addr p1, p2

    .line 44
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string p2, "upload_photos_count"

    .line 49
    .line 50
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    filled-new-array {p4, p1}, [Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string p2, "e_upload_photos_success"

    .line 59
    .line 60
    invoke-static {p2, p3, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/dkb;->H7()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public n0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 18
    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/moa0;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1, p2, p3}, Ll/moa0;-><init>(Ll/poa0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Ll/noa0;

    .line 38
    .line 39
    invoke-direct {p1, p0}, Ll/noa0;-><init>(Ll/poa0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

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
