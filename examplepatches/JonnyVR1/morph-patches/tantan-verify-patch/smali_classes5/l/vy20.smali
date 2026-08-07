.class public Ll/vy20;
.super Ll/ij2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ij2<",
        "Ll/gz20;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

.field public e:Lcom/p1/mobile/putong/data/User;

.field public f:Lcom/p1/mobile/putong/data/Settings;

.field public g:Ll/fmj;

.field public h:Z

.field public i:Ll/hn20;

.field public j:Ll/pn20;

.field public k:Ll/if40;

.field public l:Ll/mf40;

.field public m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

.field public n:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

.field public o:Ljava/lang/String;

.field public p:Ll/x20;

.field public q:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/s1e;)V
    .locals 1

    .line 1
    invoke-direct {p0, p2}, Ll/ij2;-><init>(Ll/s1e;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/vy20;->h:Z

    .line 6
    .line 7
    const-string v0, "user_click"

    .line 8
    .line 9
    iput-object v0, p0, Ll/vy20;->o:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    check-cast p2, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 14
    .line 15
    iput-object p2, p0, Ll/vy20;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/location/Location;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic B(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic D(Ll/vy20;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vy20;->Z(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    return-void
.end method

.method public static synthetic E(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z5(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic F(Ll/vy20;Lcom/p1/mobile/putong/data/DoublePair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vy20;->U(Lcom/p1/mobile/putong/data/DoublePair;)V

    return-void
.end method

.method public static synthetic G(Ll/vy20;Lcom/p1/mobile/putong/core/data/AdvancedSettings;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vy20;->c0(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic I(Ll/vy20;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vy20;->a0(Ljava/lang/Integer;)V

    return-void
.end method

.method private R()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/vx20;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/vx20;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/wx20;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/wx20;-><init>(Ll/vy20;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/xx20;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/xx20;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/yx20;

    .line 56
    .line 57
    invoke-direct {v1}, Ll/yx20;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/zx20;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/zx20;-><init>(Ll/vy20;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method private synthetic Y(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/vy20;->e:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->clone()Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/gz20;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/gz20;->A(Lcom/p1/mobile/putong/data/Settings;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xj()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    iget-object p1, p0, Ll/vy20;->l:Ll/mf40;

    .line 37
    .line 38
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/mf40;->u(Lcom/p1/mobile/putong/data/Settings;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-direct {p0}, Ll/vy20;->R()V

    .line 44
    .line 45
    .line 46
    goto/16 :goto_0

    .line 47
    .line 48
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 49
    .line 50
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 51
    .line 52
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 63
    .line 64
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideContacts()Ljava/lang/Boolean;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 71
    .line 72
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 79
    .line 80
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 81
    .line 82
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts()Ljava/lang/Boolean;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 87
    .line 88
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 95
    .line 96
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 103
    .line 104
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 111
    .line 112
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->showMomentLikes()Ljava/lang/Boolean;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 119
    .line 120
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 127
    .line 128
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolNameNoDefaults()Ljava/lang/Boolean;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 135
    .line 136
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 143
    .line 144
    new-instance v1, Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .line 148
    .line 149
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 150
    .line 151
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 154
    .line 155
    const/4 v1, 0x0

    .line 156
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 161
    .line 162
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 163
    .line 164
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 165
    .line 166
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 167
    .line 168
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 173
    .line 174
    .line 175
    :goto_0
    iget-object p1, p0, Ll/vy20;->i:Ll/hn20;

    .line 176
    .line 177
    iget-object p0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 178
    .line 179
    invoke-virtual {p1, p0}, Ll/hn20;->C0(Lcom/p1/mobile/putong/data/Settings;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method private synthetic Z(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->clone()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/vy20;->n:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 14
    .line 15
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/gz20;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/gz20;->z(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/vy20;->i:Ll/hn20;

    .line 23
    .line 24
    iget-object p0, p0, Ll/vy20;->n:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ll/hn20;->r0(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/vy20;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vy20;->X(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z5(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Ll/vy20;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vy20;->W(Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/my20;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/my20;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic h(Ll/vy20;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vy20;->Y(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic k(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dx6;->q3()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic l(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p0, "settings"

    .line 2
    .line 3
    invoke-static {p0}, Ll/rbl;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic m(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z5(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic n(Ll/uxj0;)Lrx/c;
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

.method public static synthetic o(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p0, "settings"

    .line 2
    .line 3
    invoke-static {p0}, Ll/rbl;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic r(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p0, "settings"

    .line 2
    .line 3
    invoke-static {p0}, Ll/rbl;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic s(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dx6;->h3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic t(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic u(Ll/vy20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vy20;->b0()V

    return-void
.end method

.method public static synthetic v(Ll/vy20;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vy20;->T(Ll/z80;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic x(Ll/vy20;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vy20;->V(Ll/z80;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/DoublePair;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public final J(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vy20;->e0(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/vy20;->f0(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/vy20;->N(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public K()Lcom/p1/mobile/putong/core/data/AdvancedSettings;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vy20;->n:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p0, Ll/ij2;->a:Ll/iam;

    .line 11
    .line 12
    check-cast v1, Ll/gz20;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ll/gz20;->N(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/vy20;->j:Ll/pn20;

    .line 18
    .line 19
    iget-object v1, p0, Ll/vy20;->n:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/pn20;->z(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/vy20;->n:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 25
    .line 26
    iget-object p0, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->subtract(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method public L()Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vy20;->e:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 33
    .line 34
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserSearchSettings;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 38
    .line 39
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 46
    .line 47
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 48
    .line 49
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 56
    .line 57
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 58
    .line 59
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 66
    .line 67
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 68
    .line 69
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 70
    .line 71
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 76
    .line 77
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 78
    .line 79
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 80
    .line 81
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 86
    .line 87
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 88
    .line 89
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 96
    .line 97
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 98
    .line 99
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 100
    .line 101
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 106
    .line 107
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 108
    .line 109
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 110
    .line 111
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 116
    .line 117
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 118
    .line 119
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 120
    .line 121
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 126
    .line 127
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 128
    .line 129
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 130
    .line 131
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius()Ljava/lang/Boolean;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sk()Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_0

    .line 150
    .line 151
    new-instance v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 152
    .line 153
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserPrivacySettings;-><init>()V

    .line 154
    .line 155
    .line 156
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 157
    .line 158
    iget-object v2, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 159
    .line 160
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->hideContacts()Ljava/lang/Boolean;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 165
    .line 166
    :cond_0
    iget-object p0, p0, Ll/vy20;->e:Lcom/p1/mobile/putong/data/User;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/SettingGroups;->subtract(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    return-object p0

    .line 179
    :cond_1
    const/4 p0, 0x0

    .line 180
    return-object p0
.end method

.method public M()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vy20;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final N(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 20
    .line 21
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->popular:Ljava/lang/Boolean;

    .line 22
    .line 23
    move v1, v2

    .line 24
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 35
    .line 36
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->online:Ljava/lang/Boolean;

    .line 37
    .line 38
    move v1, v2

    .line 39
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 50
    .line 51
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->newUser:Ljava/lang/Boolean;

    .line 52
    .line 53
    move v1, v2

    .line 54
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iget-object p0, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 65
    .line 66
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 67
    .line 68
    return v2

    .line 69
    :cond_3
    return v1
.end method

.method public final O(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 30
    .line 31
    iget-object p0, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final P(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 14
    .line 15
    const-string v1, "verified"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 32
    .line 33
    iget-object p0, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public Q()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/fmj;->c(Ll/ner;Z)Ll/fmj;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/vy20;->g:Ll/fmj;

    .line 9
    .line 10
    new-instance v0, Ll/if40;

    .line 11
    .line 12
    iget-object v1, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/if40;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/vy20;->k:Ll/if40;

    .line 18
    .line 19
    new-instance v1, Ll/mf40;

    .line 20
    .line 21
    iget-object v2, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ll/mf40;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/vy20;->l:Ll/mf40;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/vy20;->l:Ll/mf40;

    .line 32
    .line 33
    iget-object v1, p0, Ll/vy20;->k:Ll/if40;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/mf40;->f(Ll/if40;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/vy20;->l:Ll/mf40;

    .line 39
    .line 40
    iget-object v1, p0, Ll/ij2;->a:Ll/iam;

    .line 41
    .line 42
    check-cast v1, Ll/gz20;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/gz20;->x()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Ll/mf40;->v(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/vy20;->l:Ll/mf40;

    .line 52
    .line 53
    const-string v1, "p_advanced_filter_page"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/mf40;->E(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Ll/hn20;

    .line 59
    .line 60
    iget-object v2, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    invoke-direct {v0, v2}, Ll/hn20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Ll/vy20;->i:Ll/hn20;

    .line 66
    .line 67
    new-instance v2, Ll/pn20;

    .line 68
    .line 69
    iget-object v3, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    invoke-direct {v2, v3}, Ll/pn20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 72
    .line 73
    .line 74
    iput-object v2, p0, Ll/vy20;->j:Ll/pn20;

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Ll/ar2;->C(Ll/iam;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/vy20;->j:Ll/pn20;

    .line 80
    .line 81
    iget-object v2, p0, Ll/vy20;->i:Ll/hn20;

    .line 82
    .line 83
    invoke-virtual {v0, v2}, Ll/pn20;->l(Ll/hn20;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/vy20;->j:Ll/pn20;

    .line 87
    .line 88
    iget-object v2, p0, Ll/ij2;->a:Ll/iam;

    .line 89
    .line 90
    check-cast v2, Ll/gz20;

    .line 91
    .line 92
    invoke-virtual {v2}, Ll/gz20;->w()Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v0, v2}, Ll/pn20;->s(Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/vy20;->j:Ll/pn20;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ll/pn20;->F(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 105
    .line 106
    check-cast v0, Ll/gz20;

    .line 107
    .line 108
    iget-object p0, p0, Ll/vy20;->l:Ll/mf40;

    .line 109
    .line 110
    iget-object p0, p0, Ll/mf40;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;

    .line 111
    .line 112
    invoke-virtual {v0, p0}, Ll/gz20;->O(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    .line 113
    .line 114
    .line 115
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/dx6;->q3()Lrx/c;

    .line 120
    .line 121
    .line 122
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public S()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vy20;->Q()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j9()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/tx20;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/tx20;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/ey20;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/ey20;-><init>(Ll/vy20;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/dx6;->s3()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/ny20;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/ny20;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/oy20;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/oy20;-><init>(Ll/vy20;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const/4 v1, 0x1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/py20;

    .line 88
    .line 89
    invoke-direct {v1}, Ll/py20;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/qy20;

    .line 97
    .line 98
    invoke-direct {v1}, Ll/qy20;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v1, Ll/ry20;

    .line 117
    .line 118
    invoke-direct {v1}, Ll/ry20;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    new-instance v1, Ll/sy20;

    .line 134
    .line 135
    invoke-direct {v1, p0}, Ll/sy20;-><init>(Ll/vy20;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 143
    .line 144
    .line 145
    invoke-static {}, Ll/xra;->f()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_0

    .line 150
    .line 151
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 154
    .line 155
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p0, v0}, Ll/ij2;->duringCreated(Lrx/c;)Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-instance v1, Ll/ty20;

    .line 164
    .line 165
    invoke-direct {v1}, Ll/ty20;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    new-instance v1, Ll/uy20;

    .line 177
    .line 178
    invoke-direct {v1, p0}, Ll/uy20;-><init>(Ll/vy20;)V

    .line 179
    .line 180
    .line 181
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 186
    .line 187
    .line 188
    :cond_0
    return-void
.end method

.method public final synthetic T(Ll/z80;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/z90;->d(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/gz20;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->l3:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :goto_0
    invoke-virtual {v0, p0}, Ll/gz20;->S(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/data/DoublePair;)V
    .locals 11

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/ij2;->a:Ll/iam;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    check-cast v1, Ll/gz20;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->m3:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/z90;->b()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->l3:I

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/z90;->b()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    :goto_0
    invoke-virtual {v1, p1, p0}, Ll/gz20;->s(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    check-cast v1, Ll/gz20;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->n3:I

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2}, Ll/z90;->b()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_2

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->l3:I

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    goto :goto_1

    .line 99
    :cond_2
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Ll/z90;->b()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    :goto_1
    invoke-virtual {v1, v0, v2}, Ll/gz20;->s(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object v3, p0, Ll/vy20;->g:Ll/fmj;

    .line 111
    .line 112
    iget-object v4, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 113
    .line 114
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 115
    .line 116
    iget-wide v7, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 117
    .line 118
    new-instance v9, Ll/ky20;

    .line 119
    .line 120
    invoke-direct {v9, p0}, Ll/ky20;-><init>(Ll/vy20;)V

    .line 121
    .line 122
    .line 123
    new-instance v10, Ll/ly20;

    .line 124
    .line 125
    invoke-direct {v10}, Ll/ly20;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual/range {v3 .. v10}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public final synthetic V(Ll/z80;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/z90;->a()Ll/z90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/z90;->d(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/gz20;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->l3:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :goto_0
    invoke-virtual {v0, p0}, Ll/gz20;->S(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/location/Location;)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Ll/vy20;->g:Ll/fmj;

    .line 40
    .line 41
    iget-object v2, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 44
    .line 45
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 46
    .line 47
    new-instance v7, Ll/iy20;

    .line 48
    .line 49
    invoke-direct {v7, p0}, Ll/iy20;-><init>(Ll/vy20;)V

    .line 50
    .line 51
    .line 52
    new-instance v8, Ll/jy20;

    .line 53
    .line 54
    invoke-direct {v8}, Ll/jy20;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual/range {v1 .. v8}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public final synthetic X(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ij2;->a:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gz20;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Ll/gz20;->L(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic a0(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/vy20;->h:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Ll/gz20;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/gz20;->B(Lcom/p1/mobile/putong/data/Settings;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Ll/vy20;->h:Z

    .line 19
    .line 20
    return-void
.end method

.method public final synthetic b0()V
    .locals 9

    .line 1
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/yti0;->d()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/yti0;->c()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/yti0;->a()Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ij2;->b()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v8

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v2, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    const/4 v6, 0x0

    .line 49
    const/4 v7, 0x0

    .line 50
    const/4 v3, 0x0

    .line 51
    const/4 v5, 0x1

    .line 52
    invoke-interface/range {v1 .. v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->md(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v8, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    iget-boolean p0, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 60
    .line 61
    if-eqz p0, :cond_0

    .line 62
    .line 63
    const-string p0, "yes"

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const-string p0, "no"

    .line 67
    .line 68
    :goto_0
    const-string v0, "answer_complete_ornot"

    .line 69
    .line 70
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    filled-new-array {p0}, [Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string v0, "e_switch_h5"

    .line 79
    .line 80
    const-string v1, "p_suggest_users_home_view"

    .line 81
    .line 82
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method public final synthetic c0(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const/4 v0, 0x1

    .line 20
    if-nez p2, :cond_2

    .line 21
    .line 22
    invoke-static {}, Ll/joa;->z3()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0, p1}, Ll/vy20;->P(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/vy20;->O(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_3

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p0, p1}, Ll/vy20;->J(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 47
    .line 48
    invoke-virtual {p0, p1, v0}, Ll/dx6;->o3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Z)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_2
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 56
    .line 57
    invoke-virtual {p0, p1, v0}, Ll/dx6;->o3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Z)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0

    .line 62
    :cond_3
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 63
    .line 64
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public d0()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final e0(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 28
    .line 29
    iget-object v2, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 42
    .line 43
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    return v0
.end method

.method public final f0(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 12
    .line 13
    const-string v2, "verified"

    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 30
    .line 31
    iget-object v2, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Ll/vy20;->m:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 44
    .line 45
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->student:Ljava/lang/Boolean;

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_1
    return v0
.end method

.method public g0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vy20;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/vy20;->h0()V

    .line 7
    .line 8
    .line 9
    const-string v0, "e_advanced_filter_save"

    .line 10
    .line 11
    const-string v1, "p_advanced_filter_page"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Rq(Lcom/p1/mobile/android/app/Act;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-boolean v0, p0, Ll/vy20;->q:Z

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/vy20;->c:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    new-instance v1, Ll/ux20;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/ux20;-><init>(Ll/vy20;)V

    .line 39
    .line 40
    .line 41
    const-wide/16 v2, 0x1f4

    .line 42
    .line 43
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p0, p0, Ll/vy20;->p:Ll/x20;

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    invoke-interface {p0}, Ll/x20;->call()V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public h0()V
    .locals 5

    .line 1
    invoke-static {}, Ll/xra;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/gz20;

    .line 12
    .line 13
    iget-object v0, v0, Ll/gz20;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->getOriginIdealTag()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/tr90;->s(Lcom/p1/mobile/putong/data/User;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->e8()V

    .line 44
    .line 45
    .line 46
    :cond_0
    :goto_0
    move v0, v1

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Ll/tr90;->s(Lcom/p1/mobile/putong/data/User;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 63
    .line 64
    check-cast v0, Ll/gz20;

    .line 65
    .line 66
    iget-object v0, v0, Ll/gz20;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->getOriginIdealTag()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    .line 76
    invoke-virtual {v3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 81
    .line 82
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 83
    .line 84
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 85
    .line 86
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 87
    .line 88
    new-instance v4, Ll/uv20;

    .line 89
    .line 90
    invoke-direct {v4}, Ll/uv20;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, v3, v4}, Ll/jyb;->l(Ljava/util/Collection;Ljava/util/Collection;Ll/rcj;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_2

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    move v0, v2

    .line 101
    :goto_1
    iget-object v3, p0, Ll/vy20;->e:Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_d

    .line 108
    .line 109
    iget-object v3, p0, Ll/vy20;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 110
    .line 111
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-eqz v3, :cond_d

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-eqz v3, :cond_d

    .line 126
    .line 127
    invoke-virtual {p0}, Ll/vy20;->L()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    if-nez v4, :cond_8

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/vy20;->k0()Z

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    if-eqz v4, :cond_3

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_3
    invoke-virtual {p0}, Ll/vy20;->K()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    if-eqz v3, :cond_7

    .line 153
    .line 154
    invoke-static {}, Ll/joa;->f4()Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_6

    .line 159
    .line 160
    invoke-static {}, Ll/joa;->z3()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_4

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_4
    invoke-virtual {p0, v1}, Ll/vy20;->P(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-nez v0, :cond_5

    .line 172
    .line 173
    invoke-virtual {p0, v1}, Ll/vy20;->O(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_d

    .line 178
    .line 179
    :cond_5
    invoke-virtual {p0, v1}, Ll/vy20;->J(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 180
    .line 181
    .line 182
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 183
    .line 184
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 185
    .line 186
    invoke-virtual {p0, v1, v2}, Ll/dx6;->o3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Z)Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    new-instance v0, Ll/gy20;

    .line 191
    .line 192
    invoke-direct {v0}, Ll/gy20;-><init>()V

    .line 193
    .line 194
    .line 195
    new-instance v1, Ll/hy20;

    .line 196
    .line 197
    invoke-direct {v1}, Ll/hy20;-><init>()V

    .line 198
    .line 199
    .line 200
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_6
    :goto_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 211
    .line 212
    invoke-virtual {p0, v1, v2}, Ll/dx6;->o3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Z)Lrx/c;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    new-instance v0, Ll/dy20;

    .line 217
    .line 218
    invoke-direct {v0}, Ll/dy20;-><init>()V

    .line 219
    .line 220
    .line 221
    new-instance v1, Ll/fy20;

    .line 222
    .line 223
    invoke-direct {v1}, Ll/fy20;-><init>()V

    .line 224
    .line 225
    .line 226
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 231
    .line 232
    .line 233
    return-void

    .line 234
    :cond_7
    if-eqz v0, :cond_d

    .line 235
    .line 236
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 237
    .line 238
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 239
    .line 240
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L5()V

    .line 241
    .line 242
    .line 243
    return-void

    .line 244
    :cond_8
    :goto_3
    invoke-virtual {p0}, Ll/vy20;->K()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 249
    .line 250
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 251
    .line 252
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 257
    .line 258
    .line 259
    move-result v4

    .line 260
    if-eqz v4, :cond_9

    .line 261
    .line 262
    if-nez v0, :cond_c

    .line 263
    .line 264
    :cond_9
    invoke-static {}, Ll/joa;->z3()Z

    .line 265
    .line 266
    .line 267
    move-result v4

    .line 268
    if-eqz v4, :cond_a

    .line 269
    .line 270
    if-nez v0, :cond_c

    .line 271
    .line 272
    :cond_a
    invoke-virtual {p0, v0}, Ll/vy20;->P(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z

    .line 273
    .line 274
    .line 275
    move-result v4

    .line 276
    if-nez v4, :cond_c

    .line 277
    .line 278
    invoke-virtual {p0, v0}, Ll/vy20;->O(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Z

    .line 279
    .line 280
    .line 281
    move-result v4

    .line 282
    if-eqz v4, :cond_b

    .line 283
    .line 284
    goto :goto_4

    .line 285
    :cond_b
    move v1, v2

    .line 286
    :cond_c
    :goto_4
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 287
    .line 288
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 289
    .line 290
    invoke-virtual {v2, v3, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->l8(Lcom/p1/mobile/putong/data/SettingGroups;Z)Lrx/c;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    new-instance v2, Ll/ay20;

    .line 295
    .line 296
    invoke-direct {v2, p0, v0}, Ll/ay20;-><init>(Ll/vy20;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v1, v2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    new-instance v0, Ll/by20;

    .line 304
    .line 305
    invoke-direct {v0}, Ll/by20;-><init>()V

    .line 306
    .line 307
    .line 308
    new-instance v1, Ll/cy20;

    .line 309
    .line 310
    invoke-direct {v1}, Ll/cy20;-><init>()V

    .line 311
    .line 312
    .line 313
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 318
    .line 319
    .line 320
    :cond_d
    return-void
.end method

.method public i0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vy20;->p:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public j0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vy20;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final k0()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/yti0;->a()Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Ll/ij2;->a:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/gz20;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/gz20;->y()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 27
    .line 28
    iget-object v2, v2, Ll/uab;->V:Ll/jxd0;

    .line 29
    .line 30
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-ne v0, v2, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/yti0;->a()Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v2, p0, Ll/ij2;->a:Ll/iam;

    .line 52
    .line 53
    check-cast v2, Ll/gz20;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/gz20;->y()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 60
    .line 61
    const/4 v3, 0x1

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 67
    .line 68
    iget-object p0, p0, Ll/uab;->V:Ll/jxd0;

    .line 69
    .line 70
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0, v2}, Ll/yti0;->l(Z)V

    .line 82
    .line 83
    .line 84
    return v3

    .line 85
    :cond_1
    if-eqz v2, :cond_2

    .line 86
    .line 87
    iput-boolean v3, p0, Ll/vy20;->q:Z

    .line 88
    .line 89
    :cond_2
    :goto_0
    return v1
.end method
