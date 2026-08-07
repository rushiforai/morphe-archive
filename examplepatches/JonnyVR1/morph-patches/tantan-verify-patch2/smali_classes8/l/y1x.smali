.class public Ll/y1x;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/b2x;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Z

.field public d:Z

.field public e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;


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

.method public static synthetic e0(Ll/y1x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y1x;->C0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic g0(Ll/y1x;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y1x;->E0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ll/y1x;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y1x;->z0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Ll/y1x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y1x;->D0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Ll/y1x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y1x;->A0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Ll/y1x;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y1x;->G0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ll/y1x;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y1x;->F0(Ll/uxj0;)V

    return-void
.end method

.method private o0()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "loop_edit_user"

    .line 7
    .line 8
    iget-object v2, p0, Ll/y1x;->b:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, -0x1

    .line 25
    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private u0()V
    .locals 2

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
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v1, "from"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, p0, Ll/y1x;->f:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "args_edit_user"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    iput-object v1, p0, Ll/y1x;->b:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    const-string v1, "args_patch_user_at_once"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput-boolean v1, p0, Ll/y1x;->c:Z

    .line 48
    .line 49
    const-string v1, "args_secondary_page"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iput-boolean v1, p0, Ll/y1x;->d:Z

    .line 56
    .line 57
    const-string v1, "args_type_list"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Ljava/util/ArrayList;

    .line 64
    .line 65
    iput-object v1, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 66
    .line 67
    const-string v1, "args_loop"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    iget-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    const/4 v0, 0x0

    .line 84
    goto :goto_0

    .line 85
    :cond_1
    iget-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 93
    .line 94
    :goto_0
    iget-object v1, p0, Ll/y1x;->b:Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    invoke-static {v0, v1}, Ll/l5x;->u(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 101
    .line 102
    :cond_2
    iget-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_3

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 115
    .line 116
    .line 117
    :cond_3
    return-void
.end method

.method private synthetic z0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/b2x;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/b2x;->f()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Ll/y1x;->N0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic A0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y1x;->L0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b2x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y1x;->m0(Ll/b2x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/y1x;->L0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic D0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/y1x;->o0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
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
    iget-object p0, p0, Ll/y1x;->b:Lcom/p1/mobile/putong/data/User;

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
    new-instance p0, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 28
    .line 29
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;-><init>(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)V

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

.method public final synthetic F0(Ll/uxj0;)V
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
    invoke-direct {p0}, Ll/y1x;->o0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic G0(Ljava/lang/Throwable;)V
    .locals 1

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
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;->getEditInfo()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p1, v0}, Ll/wx6;->d(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->s:I

    .line 33
    .line 34
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->Y0:I

    .line 39
    .line 40
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string p1, "\u4e0a\u4f20\u5931\u8d25"

    .line 45
    .line 46
    invoke-static {p1}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p1, Ll/b2x;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/b2x;->d()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->d2()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-direct {p0}, Ll/y1x;->o0()V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public final H0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    iget-object v1, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/lit8 v1, v1, -0x1

    .line 18
    .line 19
    if-le v0, v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/y1x;->L0()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, v0}, Ll/y1x;->N0(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public I0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Ll/y1x;->o0()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/b2x;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/b2x;->d()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->d2()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const-string v2, "\u7ee7\u7eed\u586b\u5199"

    .line 27
    .line 28
    const-string v3, "\u786e\u8ba4\u9000\u51fa"

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    new-instance v0, Ll/th0$a;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-direct {v0, v4}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    const-string v4, "\u8fd8\u5dee\u4e00\u70b9\u5c31\u5b8c\u6210\u5566"

    .line 42
    .line 43
    invoke-virtual {v0, v4}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, v1}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "\u5b8c\u5584\u8d44\u6599\u5c55\u793a\u771f\u5b9e\u3001\u751f\u52a8\u7684\u4f60\uff0c\u5373\u53ef\u89e3\u9501\u7cbe\u9009\uff0c\u8ba4\u8bc6\u66f4\u591a\u4f18\u8d28\u670b\u53cb\u3002"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0, v3}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/r1x;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/r1x;-><init>(Ll/y1x;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    invoke-virtual {p0}, Ll/y1x;->x0()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    new-instance v0, Ll/th0$a;

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-direct {v0, v4}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v3}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0, v1}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->f0:I

    .line 118
    .line 119
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0, v3}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v1, Ll/s1x;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Ll/s1x;-><init>(Ll/y1x;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_2
    new-instance v0, Ll/th0$a;

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-direct {v0, v4}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 159
    .line 160
    .line 161
    const-string v4, "\u8fd8\u5dee\u4e00\u70b9\u5c31\u5b8c\u6210\u5566\uff01"

    .line 162
    .line 163
    invoke-virtual {v0, v4}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0, v1}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    const-string v1, "\u5e0c\u671b\u6bcf\u4e2a\u52a0\u5165\u7684\u4eba\u8d44\u6599\u771f\u5b9e\u3001\u6001\u5ea6\u771f\u8bda\uff0c\u8ba4\u771f\u5b8c\u5584\u8d44\u6599\uff0c\u8fc8\u51fa\u5bfb\u627e\u7406\u60f3\u4f34\u4fa3\u7684\u7b2c\u4e00\u6b65\uff5e"

    .line 176
    .line 177
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v0, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {v0, v3}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    new-instance v1, Ll/t1x;

    .line 190
    .line 191
    invoke-direct {v1, p0}, Ll/t1x;-><init>(Ll/y1x;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method public J0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/y1x;->n0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/y1x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->A:Ll/hzw;

    .line 11
    .line 12
    iget-object v1, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 13
    .line 14
    iget-object v2, p0, Ll/y1x;->b:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ll/hzw;->e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/y1x;->H0()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final L0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/y1x;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->PROLOGUE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/y1x;->b:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    invoke-direct {p0}, Ll/y1x;->o0()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object v0, p0, Ll/y1x;->b:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->new_()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 82
    .line 83
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/d0;->t4(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v2, Ll/u1x;

    .line 88
    .line 89
    invoke-direct {v2}, Ll/u1x;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v2, Ll/v1x;

    .line 97
    .line 98
    invoke-direct {v2, p0, v1}, Ll/v1x;-><init>(Ll/y1x;Lcom/p1/mobile/putong/data/User;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/w1x;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/w1x;-><init>(Ll/y1x;)V

    .line 112
    .line 113
    .line 114
    new-instance v2, Ll/x1x;

    .line 115
    .line 116
    invoke-direct {v2, p0}, Ll/x1x;-><init>(Ll/y1x;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_1
    invoke-direct {p0}, Ll/y1x;->o0()V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_2
    invoke-direct {p0}, Ll/y1x;->o0()V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final N0(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_5

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/y1x;->r0()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    add-int/2addr v0, v1

    .line 15
    iget-object v2, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-lt v0, v2, :cond_0

    .line 22
    .line 23
    goto/16 :goto_2

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/y1x;->r0()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    add-int/2addr v2, v1

    .line 32
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 37
    .line 38
    iput-object v0, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v3, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 53
    .line 54
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getFragClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    if-nez v3, :cond_1

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_1
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->r0()Landroidx/fragment/app/e;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v0, v4, v3}, Landroidx/fragment/app/e;->instantiate(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 78
    .line 79
    iput-object v0, p0, Ll/y1x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 80
    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->R4()V

    .line 84
    .line 85
    .line 86
    :cond_2
    invoke-virtual {p0}, Ll/y1x;->r0()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-lez p1, :cond_3

    .line 91
    .line 92
    sget p1, Ll/z7c0;->e:I

    .line 93
    .line 94
    sget v0, Ll/z7c0;->f:I

    .line 95
    .line 96
    invoke-virtual {v2, p1, v0}, Landroidx/fragment/app/k;->u(II)Landroidx/fragment/app/k;

    .line 97
    .line 98
    .line 99
    sget p1, Ll/gdc0;->r:I

    .line 100
    .line 101
    iget-object v0, p0, Ll/y1x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 102
    .line 103
    invoke-virtual {v2, p1, v0}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    sget p1, Ll/gdc0;->r:I

    .line 108
    .line 109
    iget-object v0, p0, Ll/y1x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 110
    .line 111
    invoke-virtual {v2, p1, v0}, Landroidx/fragment/app/k;->b(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 112
    .line 113
    .line 114
    :goto_0
    invoke-virtual {v2}, Landroidx/fragment/app/k;->j()I

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 118
    .line 119
    check-cast p1, Ll/b2x;

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/y1x;->r0()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    iget-object v2, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    sub-int/2addr v2, v1

    .line 132
    invoke-virtual {p1, v0, v2}, Ll/b2x;->l(II)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 136
    .line 137
    check-cast p1, Ll/b2x;

    .line 138
    .line 139
    invoke-virtual {p0}, Ll/y1x;->r0()I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iget-object p0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    sub-int/2addr p0, v1

    .line 150
    if-ne v0, p0, :cond_4

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_4
    const/4 v1, 0x0

    .line 154
    :goto_1
    invoke-virtual {p1, v1}, Ll/b2x;->k(Z)V

    .line 155
    .line 156
    .line 157
    :cond_5
    :goto_2
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/y1x;->u0()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/q1x;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/q1x;-><init>(Ll/y1x;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 13
    .line 14
    .line 15
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

    .line 1
    return-void
.end method

.method public m0(Ll/b2x;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y1x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->A:Ll/hzw;

    .line 4
    .line 5
    iget-object v1, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 6
    .line 7
    iget-object v2, p0, Ll/y1x;->b:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/hzw;->b(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget-object v0, p0, Ll/y1x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->A:Ll/hzw;

    .line 20
    .line 21
    iget-object v2, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ll/hzw;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p0, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->isRequired()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    iget-object p0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    iget-object p0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p0, Ljava/lang/CharSequence;

    .line 48
    .line 49
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_1

    .line 54
    .line 55
    const-string p0, "\u8bf7\u586b\u5199\u5185\u5bb9/\u9009\u62e9\u9009\u9879\uff0c\u5b8c\u5584\u8d44\u6599\u53ef\u4ee5\u4e3a\u4f60\u63a8\u8350\u66f4\u5408\u9002\u7684\u4eba"

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object p0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast p0, Ljava/lang/String;

    .line 61
    .line 62
    :goto_0
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return v1

    .line 66
    :cond_2
    const/4 p0, 0x1

    .line 67
    return p0
.end method

.method public p0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y1x;->g:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public q0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 2
    .line 3
    return-object p0
.end method

.method public r0()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/y1x;->e:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 22
    return p0
.end method

.method public s0()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y1x;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public t0()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y1x;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public x0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/y1x;->f:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "from_ideal_type_swipe_guide"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public y0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/y1x;->d:Z

    .line 2
    .line 3
    return p0
.end method
