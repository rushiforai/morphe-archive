.class public Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Ll/nyl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter$ProfileEditInfoException;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/u4x;",
        ">;",
        "Ll/nyl;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:I


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
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->b:I

    .line 6
    .line 7
    return-void
.end method

.method private A0()V
    .locals 0

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
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->x0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->s0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->r0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->u0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->t0()V

    return-void
.end method

.method private synthetic x0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/u4x;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/u4x;->m(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/u4x;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/u4x;->d(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const-string v0, "saveInstanceKey"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->p0()V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public C0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bzw;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p1, Ll/u4x;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ll/u4x;->d(Lcom/p1/mobile/putong/data/User;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public D0()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->Ia()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public M(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->C0(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->k0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/PhoneNumber;Lcom/p1/mobile/putong/data/PhoneNumber;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x0

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PhoneNumber;->clone()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move-object p1, v2

    .line 36
    :goto_0
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 41
    .line 42
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/PhoneNumber;->clone()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    :cond_1
    iput-object v2, p1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->C0(Lcom/p1/mobile/putong/data/User;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->q0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "editTab"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "preview"

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->b:I

    .line 28
    .line 29
    new-instance v0, Ll/k4x;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/k4x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public f()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public k0(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->l0(Z)Z

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/u4x;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Ll/u4x;->j:Z

    .line 10
    .line 11
    return-void
.end method

.method public final l0(Z)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/u4x;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Ll/u4x;->I0(Lcom/p1/mobile/putong/data/User;Z)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x0

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_4

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_4

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_4

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 68
    .line 69
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_1

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Ljava/lang/CharSequence;

    .line 90
    .line 91
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-nez p1, :cond_1

    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 100
    .line 101
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 102
    .line 103
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Ljava/lang/String;

    .line 112
    .line 113
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 117
    .line 118
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 119
    .line 120
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 121
    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 123
    .line 124
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 125
    .line 126
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_2

    .line 131
    .line 132
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 135
    .line 136
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 137
    .line 138
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 139
    .line 140
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    check-cast v1, Ljava/lang/String;

    .line 147
    .line 148
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 149
    .line 150
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 153
    .line 154
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 155
    .line 156
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 157
    .line 158
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_3

    .line 163
    .line 164
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 165
    .line 166
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 167
    .line 168
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 169
    .line 170
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 171
    .line 172
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateDescription:Ljava/util/List;

    .line 173
    .line 174
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-nez p1, :cond_3

    .line 179
    .line 180
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 181
    .line 182
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 183
    .line 184
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 185
    .line 186
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 187
    .line 188
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateDescription:Ljava/util/List;

    .line 189
    .line 190
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    check-cast p1, Ljava/lang/CharSequence;

    .line 195
    .line 196
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 197
    .line 198
    .line 199
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 200
    .line 201
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->n0(Lcom/p1/mobile/putong/data/User;)V

    .line 202
    .line 203
    .line 204
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 205
    .line 206
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 207
    .line 208
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 213
    .line 214
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-eqz v1, :cond_5

    .line 223
    .line 224
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->new_()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 229
    .line 230
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 235
    .line 236
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 241
    .line 242
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 243
    .line 244
    .line 245
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 246
    .line 247
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 248
    .line 249
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/d0;->t4(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    new-instance v2, Ll/l4x;

    .line 254
    .line 255
    invoke-direct {v2}, Ll/l4x;-><init>()V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v1, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    new-instance v2, Ll/m4x;

    .line 263
    .line 264
    invoke-direct {v2, p0, v0}, Ll/m4x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;Lcom/p1/mobile/putong/data/User;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    new-instance v2, Ll/n4x;

    .line 276
    .line 277
    invoke-direct {v2, p0}, Ll/n4x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;)V

    .line 278
    .line 279
    .line 280
    new-instance v3, Ll/o4x;

    .line 281
    .line 282
    invoke-direct {v3, p0, p1, v0}, Ll/o4x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 283
    .line 284
    .line 285
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 290
    .line 291
    .line 292
    goto :goto_1

    .line 293
    :cond_5
    invoke-static {}, Ll/bzw;->h()V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 301
    .line 302
    .line 303
    :goto_1
    const/4 p0, 0x1

    .line 304
    return p0
.end method

.method public m0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/u4x;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/u4x;->r0(Z)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final n0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    if-eqz p0, :cond_6

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 8
    .line 9
    if-eqz p0, :cond_6

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateStatus:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const-string v0, "unlimited"

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 32
    .line 33
    filled-new-array {v0}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateStatus:Ljava/util/List;

    .line 42
    .line 43
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 62
    .line 63
    const-string v1, "18"

    .line 64
    .line 65
    filled-new-array {v1, v0}, [Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAge:Ljava/util/List;

    .line 74
    .line 75
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 82
    .line 83
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_3

    .line 88
    .line 89
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 94
    .line 95
    filled-new-array {v0}, [Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 104
    .line 105
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateHeight:Ljava/util/List;

    .line 112
    .line 113
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_4

    .line 118
    .line 119
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 124
    .line 125
    filled-new-array {v0, v0}, [Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iput-object v1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateHeight:Ljava/util/List;

    .line 134
    .line 135
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateIncome:Ljava/util/List;

    .line 142
    .line 143
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-eqz p0, :cond_5

    .line 148
    .line 149
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 150
    .line 151
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 154
    .line 155
    filled-new-array {v0}, [Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateIncome:Ljava/util/List;

    .line 164
    .line 165
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 166
    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 170
    .line 171
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 172
    .line 173
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_6

    .line 178
    .line 179
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 180
    .line 181
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 184
    .line 185
    const-string p1, "different_city"

    .line 186
    .line 187
    filled-new-array {p1}, [Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 196
    .line 197
    :cond_6
    :goto_0
    return-void
.end method

.method public o0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final p0()V
    .locals 6

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
    const-string v1, "marry_jump_marry"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "jump_loop_type_default"

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/16 v2, 0x1389

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v1, :cond_4

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v4, 0x0

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 51
    .line 52
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->status:Ljava/util/List;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    move-object v1, v4

    .line 70
    :goto_0
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 73
    .line 74
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 75
    .line 76
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    if-eqz v5, :cond_1

    .line 81
    .line 82
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 85
    .line 86
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 87
    .line 88
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 89
    .line 90
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-eqz v5, :cond_1

    .line 95
    .line 96
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 99
    .line 100
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 101
    .line 102
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 103
    .line 104
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->expectedTime:Ljava/util/List;

    .line 105
    .line 106
    :cond_1
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_2

    .line 111
    .line 112
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->STATUS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    :cond_2
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_3

    .line 122
    .line 123
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->EXPECTED_TIME:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    :cond_3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-nez v1, :cond_5

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 139
    .line 140
    invoke-static {v1, v4, v0, v3}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/util/ArrayList;Z)Landroid/content/Intent;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p0, v0, v2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_4
    const-string v1, "marry_series_type_mate"

    .line 153
    .line 154
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_5

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 165
    .line 166
    sget-object v4, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 167
    .line 168
    filled-new-array {v4}, [Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    invoke-static {v0, v1, v4, v3}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/util/ArrayList;Z)Landroid/content/Intent;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p0, v0, v2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 185
    .line 186
    .line 187
    :cond_5
    return-void
.end method

.method public final q0()V
    .locals 1

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
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->nullCheck()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    invoke-static {p0}, Ll/bzw;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->isHit:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p2, p0}, Ll/bzw;->i(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter$ProfileEditInfoException;

    .line 28
    .line 29
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter$ProfileEditInfoException;-><init>(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final synthetic s0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/bzw;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
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
    return-void
.end method

.method public final synthetic t0()V
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

.method public final synthetic u0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p3}, Ll/bsj0;->H(Ljava/lang/Throwable;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->A0()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    instance-of v0, p3, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter$ProfileEditInfoException;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->A0()V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->a:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->C0(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    check-cast p3, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter$ProfileEditInfoException;

    .line 31
    .line 32
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter$ProfileEditInfoException;->getEditInfo()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p1, p0}, Ll/wx6;->d(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->s:I

    .line 51
    .line 52
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->Y0:I

    .line 57
    .line 58
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_a

    .line 71
    .line 72
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;->A0()V

    .line 73
    .line 74
    .line 75
    instance-of v0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 76
    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    check-cast p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 80
    .line 81
    invoke-virtual {p3}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isCannotModify()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    iget-object p3, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    if-eqz p3, :cond_3

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    return-void

    .line 97
    :cond_4
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->A2:I

    .line 102
    .line 103
    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_5

    .line 114
    .line 115
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 118
    .line 119
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_5

    .line 124
    .line 125
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 126
    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 130
    .line 131
    .line 132
    move-result-wide v0

    .line 133
    goto :goto_1

    .line 134
    :cond_5
    const-wide/16 v0, 0x0

    .line 135
    .line 136
    :goto_1
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 137
    .line 138
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-eqz v2, :cond_6

    .line 143
    .line 144
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 145
    .line 146
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 147
    .line 148
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-eqz v2, :cond_6

    .line 153
    .line 154
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 155
    .line 156
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 159
    .line 160
    .line 161
    move-result-wide v0

    .line 162
    :cond_6
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    double-to-long v0, v0

    .line 167
    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 168
    .line 169
    .line 170
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 175
    .line 176
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 177
    .line 178
    .line 179
    move-result-wide v3

    .line 180
    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 181
    .line 182
    .line 183
    invoke-static {v2, v0}, Ll/yab;->T(Ljava/util/Calendar;Ljava/util/Calendar;)I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    const/16 v2, 0x78

    .line 194
    .line 195
    if-eqz v1, :cond_7

    .line 196
    .line 197
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-eqz v1, :cond_7

    .line 204
    .line 205
    if-le v0, v2, :cond_7

    .line 206
    .line 207
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->h0:I

    .line 212
    .line 213
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p3

    .line 217
    goto :goto_2

    .line 218
    :cond_7
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 219
    .line 220
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result p2

    .line 224
    if-eqz p2, :cond_8

    .line 225
    .line 226
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 227
    .line 228
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-eqz p1, :cond_8

    .line 233
    .line 234
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->i0:I

    .line 239
    .line 240
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p3

    .line 244
    goto :goto_2

    .line 245
    :cond_8
    if-le v0, v2, :cond_9

    .line 246
    .line 247
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->j0:I

    .line 252
    .line 253
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p3

    .line 257
    :cond_9
    :goto_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    sget p2, Lcom/p1/mobile/putong/core/profile/R$string;->i:I

    .line 270
    .line 271
    new-instance p3, Ll/p4x;

    .line 272
    .line 273
    invoke-direct {p3, p0}, Ll/p4x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditPresenter;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 281
    .line 282
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 287
    .line 288
    .line 289
    :cond_a
    return-void
.end method

.method public y0(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/u4x;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/u4x;->l()Lcom/p1/mobile/android/app/Frag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Ll/ezw;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Ll/ezw;

    .line 14
    .line 15
    invoke-interface {p0, p1, p2, p3}, Ll/ezw;->l0(IILandroid/content/Intent;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public z0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/u4x;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/u4x;->l()Lcom/p1/mobile/android/app/Frag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Ll/ezw;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Ll/ezw;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/ezw;->S3(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
