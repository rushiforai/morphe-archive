.class public Ll/q80;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/r80;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z


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
    iput-boolean p1, p0, Ll/q80;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/q80;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q80;->k0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/q80;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q80;->j0(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public static synthetic g0(Ll/q80;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q80;->i0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/q80;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q80;->l0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic i0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/r80;

    .line 4
    .line 5
    sget-object p1, Ll/uqb0;->X:Ll/hj5;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/hj5;->m()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/r80;->c(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic j0(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/r80;

    .line 4
    .line 5
    iget-object p1, p1, Ll/r80;->d:Ll/cye;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Ll/r80;

    .line 16
    .line 17
    iget-object p1, p1, Ll/r80;->d:Ll/cye;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/cye;->J()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Ll/q80;->n0(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/m80;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m80;-><init>(Ll/q80;)V

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

.method public final synthetic k0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/q80;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/core/R$string;->a9:I

    .line 6
    .line 7
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 15
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
.end method

.method public final synthetic l0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    move-object p0, p1

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isCannotModify()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    :goto_0
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public m0(Landroid/view/Menu;)Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Ll/eu9;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/lfc0;->a:I

    .line 21
    .line 22
    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 23
    .line 24
    .line 25
    sget v0, Ll/adc0;->l8:I

    .line 26
    .line 27
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ll/n80;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/n80;-><init>(Ll/q80;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public final n0(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-ltz p1, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v1, Lcom/p1/mobile/putong/data/Profile;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    new-instance v2, Lcom/p1/mobile/putong/data/Extensions;

    .line 28
    .line 29
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 37
    .line 38
    new-instance v2, Lcom/p1/mobile/putong/data/Interest;

    .line 39
    .line 40
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Interest;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 50
    .line 51
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const/4 v2, 0x1

    .line 68
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 69
    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance v0, Ll/o80;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ll/o80;-><init>(Ll/q80;)V

    .line 82
    .line 83
    .line 84
    new-instance v1, Ll/p80;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/p80;-><init>(Ll/q80;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public o0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/q80;->a:Z

    .line 2
    .line 3
    return-void
.end method
