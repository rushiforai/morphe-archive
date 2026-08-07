.class public Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter$ProfileEditInfoException;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/rt60;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/l4g0;

.field public b:Z

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/data/User;

.field public e:Lcom/p1/mobile/putong/data/User;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->a:Ll/l4g0;

    .line 6
    .line 7
    return-void
.end method

.method private D0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->d:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Lcom/p1/mobile/putong/data/Settings;

    .line 15
    .line 16
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Settings;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 24
    .line 25
    iput-object v3, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 26
    .line 27
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v3, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 34
    .line 35
    iput-object v3, v1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 36
    .line 37
    iget-object v1, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_0

    .line 50
    .line 51
    new-instance v1, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 61
    .line 62
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 63
    .line 64
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/p1/mobile/putong/data/BloodType;

    .line 72
    .line 73
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    new-instance v2, Lcom/p1/mobile/putong/data/Profile;

    .line 77
    .line 78
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 82
    .line 83
    new-instance v3, Lcom/p1/mobile/putong/data/Extensions;

    .line 84
    .line 85
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 89
    .line 90
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 93
    .line 94
    new-instance v3, Lcom/p1/mobile/putong/data/Physical;

    .line 95
    .line 96
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/Physical;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 100
    .line 101
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 102
    .line 103
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 104
    .line 105
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 106
    .line 107
    iput-object v1, v2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 108
    .line 109
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->d:Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_1

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    sget v3, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 130
    .line 131
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    const/4 v3, 0x1

    .line 136
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 137
    .line 138
    .line 139
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 140
    .line 141
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 142
    .line 143
    invoke-virtual {v1, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    new-instance v1, Ll/ys60;

    .line 152
    .line 153
    invoke-direct {v1, p0}, Ll/ys60;-><init>(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;)V

    .line 154
    .line 155
    .line 156
    new-instance v2, Ll/zs60;

    .line 157
    .line 158
    invoke-direct {v2, p0}, Ll/zs60;-><init>(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 166
    .line 167
    .line 168
    :cond_1
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->x0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic f0(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->z0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->t0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->u0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->y0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k0()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/xs60;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/xs60;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    return-object v0
.end method

.method public static synthetic l0()Ljava/lang/Double;
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
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 12
    .line 13
    return-object v0
.end method

.method public static synthetic m0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;Ljava/lang/Double;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->s0(Ljava/lang/Double;)V

    return-void
.end method

.method private q0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->b:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->c:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, "alert"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 23
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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/dkb;->k8()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    check-cast v1, Ll/rt60;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/rt60;->N()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    check-cast v1, Ll/rt60;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/rt60;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/us60;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/us60;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v2, Ll/vs60;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Ll/vs60;-><init>(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ll/ws60;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/ws60;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->I1(Lcom/p1/mobile/android/app/Act;Ll/pcj;Ll/y20;Ll/y20;)V

    .line 70
    .line 71
    .line 72
    const-string p0, "e_edit_basic_info_calendar"

    .line 73
    .line 74
    const-string v0, "p_edit_basic_info_view"

    .line 75
    .line 76
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method private synthetic t0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rt60;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rt60;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic u0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->a:Ll/l4g0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->a:Ll/l4g0;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/l4g0;->l()V

    .line 18
    .line 19
    .line 20
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->b:Z

    .line 21
    .line 22
    if-nez p1, :cond_3

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->q0()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 29
    .line 30
    if-ne p1, v0, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->a:Ll/l4g0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 39
    .line 40
    if-ne p1, v0, :cond_3

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->a:Ll/l4g0;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 45
    .line 46
    .line 47
    :cond_3
    return-void
.end method


# virtual methods
.method public A0(D)V
    .locals 2

    .line 1
    const-string v0, "e_edit_basic_info_save_button"

    .line 2
    .line 3
    const-string v1, "p_edit_basic_info_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 11
    .line 12
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->D0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public C0(Lcom/p1/mobile/putong/data/BloodType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->D0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public E0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "e_edit_basic_info_save_button"

    .line 2
    .line 3
    const-string v1, "p_edit_basic_info_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->D0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/qs60;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qs60;-><init>(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/rs60;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/rs60;-><init>(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;)V

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
    new-instance v0, Ll/ss60;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/ss60;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/ts60;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/ts60;-><init>(Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public o0()D
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public p0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public r0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->c:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Ll/l4g0;

    .line 4
    .line 5
    const-class v1, Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "p_edit_basic_info_view"

    .line 12
    .line 13
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->a:Ll/l4g0;

    .line 17
    .line 18
    new-instance v0, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 21
    .line 22
    .line 23
    :try_start_0
    const-string v1, "came_from"

    .line 24
    .line 25
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->a:Ll/l4g0;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Double;)V
    .locals 2

    .line 1
    const-string v0, "e_edit_basic_info_save_button"

    .line 2
    .line 3
    const-string v1, "p_edit_basic_info_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 29
    .line 30
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->D0()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rt60;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/rt60;->L()V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->d:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Ll/rt60;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/rt60;->O(Lcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->d:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->d:Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 55
    .line 56
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 59
    .line 60
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public final synthetic y0(Ll/uxj0;)V
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
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/rt60;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter;->e:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ll/rt60;->O(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic z0(Ljava/lang/Throwable;)V
    .locals 2

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
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    move-object v0, p1

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isCannotModify()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 33
    :goto_1
    instance-of v1, p1, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter$ProfileEditInfoException;

    .line 34
    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter$ProfileEditInfoException;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/personaldetails/PersonalDetailsPresenter$ProfileEditInfoException;->getEditInfo()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p1, p0}, Ll/wx6;->d(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    sget p0, Lcom/p1/mobile/putong/core/R$string;->c0:I

    .line 58
    .line 59
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/R$string;->M7:I

    .line 64
    .line 65
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    if-eqz v0, :cond_4

    .line 70
    .line 71
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    return-void
.end method
