.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/vxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public final b:Ll/vxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public final c:Ll/wyd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public final d:Ll/vxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public e:Ll/vxd0;

.field public f:Ll/byd0;

.field public final g:Ll/zq90;

.field public h:Ll/w30;


# direct methods
.method public constructor <init>(Ll/zq90;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "show_share_tip_count_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->a:Ll/vxd0;

    .line 33
    .line 34
    new-instance v0, Ll/vxd0;

    .line 35
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v3, "show_share_today_tip_count"

    .line 39
    .line 40
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->b:Ll/vxd0;

    .line 62
    .line 63
    new-instance v0, Ll/wyd0;

    .line 64
    .line 65
    new-instance v1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v3, "show_share_tip_data_"

    .line 68
    .line 69
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v3, ""

    .line 88
    .line 89
    invoke-direct {v0, v1, v3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->c:Ll/wyd0;

    .line 93
    .line 94
    new-instance v0, Ll/vxd0;

    .line 95
    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v3, "show_share_tip_user_count_"

    .line 99
    .line 100
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->d:Ll/vxd0;

    .line 122
    .line 123
    new-instance v0, Ll/vxd0;

    .line 124
    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v3, "game_cp_profile_share_tip_show_count"

    .line 128
    .line 129
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 148
    .line 149
    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->e:Ll/vxd0;

    .line 151
    .line 152
    new-instance v0, Ll/byd0;

    .line 153
    .line 154
    new-instance v1, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v2, "game_cp_profile_share_tip_latest_show_time"

    .line 157
    .line 158
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    const-wide/16 v2, 0x0

    .line 177
    .line 178
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 183
    .line 184
    .line 185
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->f:Ll/byd0;

    .line 186
    .line 187
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 188
    .line 189
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->G()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;ZLv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->E(ZLv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->C()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->L()V

    return-void
.end method

.method public static synthetic e(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "share_tip"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->D(Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->F()V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->z(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->B()V

    return-void
.end method

.method public static synthetic k()V
    .locals 3

    .line 1
    const-string v0, "blacklist_management"

    .line 2
    .line 3
    const-string v1, "add"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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
    const-string v1, "e_blacklist"

    .line 14
    .line 15
    const-string v2, "p_user_profile_more_popup"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->J()V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n()V
    .locals 3

    .line 1
    const-string v0, "blacklist_management"

    .line 2
    .line 3
    const-string v1, "remove"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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
    const-string v1, "e_blacklist"

    .line 14
    .line 15
    const-string v2, "p_user_profile_more_popup"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->H(Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->I(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->K(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->M()V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)Ll/zq90;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    return-object p0
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_user_profile_more_popup_cancel"

    .line 2
    .line 3
    const-string v0, "p_user_profile_more_popup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->h:Ll/w30;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic B()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 6
    .line 7
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 24
    .line 25
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 54
    .line 55
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 56
    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {v2, p0}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const/4 v3, 0x0

    .line 74
    invoke-virtual {v0, v1, v3, p0, v2}, Lcom/p1/mobile/putong/core/api/g;->Gp(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public final synthetic C()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 6
    .line 7
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 24
    .line 25
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 54
    .line 55
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 56
    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {v2, p0}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const/4 v3, 0x1

    .line 74
    invoke-virtual {v0, v1, v3, p0, v2}, Lcom/p1/mobile/putong/core/api/g;->Gp(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public final synthetic D(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic E(ZLv/VListCell;Lv/VListCell$a;I)V
    .locals 3

    .line 1
    iget-object p2, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string p4, "\u5206\u4eab\u7ed9\u670b\u53cb\u770b\u770b"

    .line 8
    .line 9
    invoke-static {p2, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const-string p4, "p_user_profile_more_popup"

    .line 14
    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    const-string p2, "e_share_to_third_app"

    .line 18
    .line 19
    invoke-static {p2, p4}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 23
    .line 24
    iget-object p2, p2, Ll/zq90;->d:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p2}, Ll/lik0;->c(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    const-string p2, "\u6b64\u7528\u6237\u4e0d\u53ef\u88ab\u5206\u4eab"

    .line 33
    .line 34
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    new-instance v0, Ll/s0b0;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/s0b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/t0b0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/t0b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 50
    .line 51
    .line 52
    const-string v2, "share_bottom"

    .line 53
    .line 54
    invoke-static {p2, v2, v0, v1}, Ll/qtk;->U0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)Ll/pej0;

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    iget-object p2, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 58
    .line 59
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget v1, Lcom/p1/mobile/putong/core/R$string;->r:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->T(Z)V

    .line 80
    .line 81
    .line 82
    :cond_2
    iget-object p1, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 83
    .line 84
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const-string p2, "\u53d6\u6d88\u559c\u6b22"

    .line 89
    .line 90
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_3

    .line 95
    .line 96
    const-string p1, "unlike_from"

    .line 97
    .line 98
    const-string p2, "profile"

    .line 99
    .line 100
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 105
    .line 106
    iget-object p2, p2, Ll/zq90;->d:Ljava/lang/String;

    .line 107
    .line 108
    const-string p3, "other_user_id"

    .line 109
    .line 110
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const-string p2, "e_unlike"

    .line 119
    .line 120
    invoke-static {p2, p4, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 132
    .line 133
    iget-object p4, p3, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 134
    .line 135
    iget-object p3, p3, Ll/zq90;->b:Ljava/lang/String;

    .line 136
    .line 137
    new-instance v0, Ll/u0b0;

    .line 138
    .line 139
    invoke-direct {v0, p0}, Ll/u0b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {p1, p2, p4, p3, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->T7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/y20;)V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_3
    iget-object p1, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 147
    .line 148
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string p2, "\u53d6\u6d88\u5173\u6ce8"

    .line 153
    .line 154
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_4

    .line 159
    .line 160
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 169
    .line 170
    iget-object p4, p3, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 171
    .line 172
    iget-object p3, p3, Ll/zq90;->b:Ljava/lang/String;

    .line 173
    .line 174
    invoke-interface {p1, p2, p4, p3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Vp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_4
    iget-object p1, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 179
    .line 180
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    sget p4, Lcom/p1/mobile/putong/core/R$string;->j5:I

    .line 189
    .line 190
    invoke-virtual {p2, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-eqz p1, :cond_5

    .line 199
    .line 200
    new-instance p1, Ll/v0b0;

    .line 201
    .line 202
    invoke-direct {p1}, Ll/v0b0;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->v(Ljava/lang/Runnable;)V

    .line 206
    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_5
    iget-object p1, p3, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 210
    .line 211
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    sget p3, Lcom/p1/mobile/putong/core/R$string;->x2:I

    .line 220
    .line 221
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p2

    .line 225
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_6

    .line 230
    .line 231
    new-instance p1, Ll/w0b0;

    .line 232
    .line 233
    invoke-direct {p1}, Ll/w0b0;-><init>()V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->S(Ljava/lang/Runnable;)V

    .line 237
    .line 238
    .line 239
    :cond_6
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->h:Ll/w30;

    .line 240
    .line 241
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 242
    .line 243
    .line 244
    return-void
.end method

.method public final synthetic F()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 6
    .line 7
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 24
    .line 25
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 54
    .line 55
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 56
    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {v2, p0}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const/4 v3, 0x0

    .line 74
    invoke-virtual {v0, v1, v3, p0, v2}, Lcom/p1/mobile/putong/core/api/g;->Gp(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public final synthetic G()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 6
    .line 7
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 24
    .line 25
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 54
    .line 55
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 56
    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {v2, p0}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const/4 v3, 0x1

    .line 74
    invoke-virtual {v0, v1, v3, p0, v2}, Lcom/p1/mobile/putong/core/api/g;->Gp(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "\u53d6\u6d88\u559c\u6b22"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const-string p1, "unlike_from"

    .line 10
    .line 11
    const-string v0, "profile"

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 18
    .line 19
    iget-object v0, v0, Ll/zq90;->d:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "other_user_id"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "e_unlike"

    .line 32
    .line 33
    const-string v1, "p_user_profile_more_popup"

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 47
    .line 48
    iget-object v2, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object v1, v1, Ll/zq90;->b:Ljava/lang/String;

    .line 51
    .line 52
    new-instance v3, Ll/g1b0;

    .line 53
    .line 54
    invoke-direct {v3, p0}, Ll/g1b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {p1, v0, v2, v1, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->T7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/zq90;->r()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_0

    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 71
    .line 72
    const-string p1, ""

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/xf9;->f4(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void

    .line 78
    :cond_1
    const-string v0, "\u53d6\u6d88\u5173\u6ce8"

    .line 79
    .line 80
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 95
    .line 96
    iget-object v1, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    iget-object p0, p0, Ll/zq90;->b:Ljava/lang/String;

    .line 99
    .line 100
    invoke-interface {p1, v0, v1, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Vp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 105
    .line 106
    invoke-virtual {p1}, Ll/zq90;->J()Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->T(Z)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final synthetic J()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->J()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->T(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic K(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->j5:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->v(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v2, Lcom/p1/mobile/putong/core/R$string;->x2:I

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->S(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public final synthetic L()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vj5;->d:Ll/ejk0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 6
    .line 7
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 41
    .line 42
    const-string v1, "SUPERLIKED"

    .line 43
    .line 44
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 53
    .line 54
    const-string v1, "unknown_"

    .line 55
    .line 56
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 61
    .line 62
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 63
    .line 64
    iget-object v0, v0, Ll/vj5;->d:Ll/ejk0;

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic M()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/x0b0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/x0b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public N()V
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "p_user_profile_more_popup"

    .line 13
    .line 14
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 19
    .line 20
    iget-object v2, v2, Ll/zq90;->d:Ljava/lang/String;

    .line 21
    .line 22
    const-string v3, "other_user_id"

    .line 23
    .line 24
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    filled-new-array {v2}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 36
    .line 37
    invoke-virtual {v2}, Ll/zq90;->J()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    const-string v2, "\u5206\u4eab\u7ed9\u670b\u53cb\u770b\u770b"

    .line 44
    .line 45
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_2

    .line 57
    .line 58
    const-string v2, "share_pop_from_which"

    .line 59
    .line 60
    const-string v3, "profile"

    .line 61
    .line 62
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    filled-new-array {v2}, [Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 74
    .line 75
    invoke-virtual {v2}, Ll/zq90;->P()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_1

    .line 80
    .line 81
    const-string v2, "\u53d6\u6d88\u559c\u6b22"

    .line 82
    .line 83
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 88
    .line 89
    invoke-virtual {v2}, Ll/zq90;->f()Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_2

    .line 94
    .line 95
    const-string v2, "\u53d6\u6d88\u5173\u6ce8"

    .line 96
    .line 97
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    sget v3, Lcom/p1/mobile/putong/core/R$string;->r:I

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 114
    .line 115
    invoke-virtual {v2}, Ll/zq90;->k()Z

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-nez v2, :cond_3

    .line 120
    .line 121
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 122
    .line 123
    invoke-virtual {v2}, Ll/zq90;->m()Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-nez v2, :cond_3

    .line 128
    .line 129
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 130
    .line 131
    invoke-virtual {v2}, Ll/zq90;->n()Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    if-eqz v2, :cond_5

    .line 136
    .line 137
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 142
    .line 143
    iget-object v3, v3, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 144
    .line 145
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kk(Lcom/p1/mobile/putong/data/User;)Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    const-string v3, "blacklist_management"

    .line 150
    .line 151
    if-nez v2, :cond_4

    .line 152
    .line 153
    const-string v2, "add"

    .line 154
    .line 155
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    filled-new-array {v2}, [Ll/pf60;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v1, v2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    sget v3, Lcom/p1/mobile/putong/core/R$string;->j5:I

    .line 171
    .line 172
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_4
    const-string v2, "remove"

    .line 181
    .line 182
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    filled-new-array {v2}, [Ll/pf60;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    invoke-virtual {v1, v2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    sget v3, Lcom/p1/mobile/putong/core/R$string;->x2:I

    .line 198
    .line 199
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    sget v3, Lcom/p1/mobile/putong/core/R$string;->r:I

    .line 211
    .line 212
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    invoke-interface {v0, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 221
    .line 222
    .line 223
    new-instance v3, Ll/w30$b;

    .line 224
    .line 225
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    invoke-direct {v3, v4}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 230
    .line 231
    .line 232
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 233
    .line 234
    invoke-virtual {v4}, Ll/zq90;->J()Z

    .line 235
    .line 236
    .line 237
    move-result v4

    .line 238
    new-instance v5, Ll/p0b0;

    .line 239
    .line 240
    invoke-direct {v5, v1}, Ll/p0b0;-><init>(Ll/l4g0;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v3, v5}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 248
    .line 249
    .line 250
    move-result-object v5

    .line 251
    sget v6, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 252
    .line 253
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v5

    .line 257
    invoke-virtual {v1, v5}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    new-instance v5, Ll/y0b0;

    .line 262
    .line 263
    invoke-direct {v5, p0}, Ll/y0b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v1, v5}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    invoke-virtual {v1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    filled-new-array {v2}, [I

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    sget v2, Ll/c9c0;->L:I

    .line 279
    .line 280
    filled-new-array {v2}, [I

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    invoke-virtual {v0, v1, v2}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    new-instance v1, Ll/z0b0;

    .line 289
    .line 290
    invoke-direct {v1, p0, v4}, Ll/z0b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Z)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v0, v1}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 294
    .line 295
    .line 296
    invoke-virtual {v3}, Ll/w30$b;->F()Ll/w30;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->h:Ll/w30;

    .line 301
    .line 302
    invoke-virtual {v0}, Ll/w30;->f()V

    .line 303
    .line 304
    .line 305
    return-void
.end method

.method public O()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, ""

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/zq90;->K()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/zq90;->N()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/zq90;->O()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    const-string v1, "\u53d6\u6d88\u559c\u6b22"

    .line 40
    .line 41
    :goto_0
    move-object v7, v1

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/zq90;->f()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    const-string v1, "\u53d6\u6d88\u5173\u6ce8"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    move-object v7, v2

    .line 55
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 60
    .line 61
    iget-object v3, v3, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    invoke-interface {v1, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kk(Lcom/p1/mobile/putong/data/User;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    sget v3, Lcom/p1/mobile/putong/core/R$string;->j5:I

    .line 74
    .line 75
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    :goto_2
    move-object v8, v1

    .line 80
    goto :goto_3

    .line 81
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    sget v3, Lcom/p1/mobile/putong/core/R$string;->x2:I

    .line 86
    .line 87
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    goto :goto_2

    .line 92
    :goto_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_3

    .line 101
    .line 102
    const-string v2, "share_right"

    .line 103
    .line 104
    :cond_3
    move-object v6, v2

    .line 105
    new-instance v9, Ll/a1b0;

    .line 106
    .line 107
    invoke-direct {v9, v0}, Ll/a1b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 108
    .line 109
    .line 110
    new-instance v10, Ll/b1b0;

    .line 111
    .line 112
    invoke-direct {v10, v0}, Ll/b1b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 113
    .line 114
    .line 115
    new-instance v11, Ll/c1b0;

    .line 116
    .line 117
    invoke-direct {v11, v0, v7}, Ll/c1b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    new-instance v13, Ll/d1b0;

    .line 121
    .line 122
    invoke-direct {v13, v0}, Ll/d1b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 123
    .line 124
    .line 125
    new-instance v14, Ll/e1b0;

    .line 126
    .line 127
    invoke-direct {v14, v0, v8}, Ll/e1b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    new-instance v15, Ll/f1b0;

    .line 131
    .line 132
    invoke-direct {v15}, Ll/f1b0;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->x()Ljava/util/List;

    .line 136
    .line 137
    .line 138
    move-result-object v17

    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 140
    .line 141
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 142
    .line 143
    const-string v3, ""

    .line 144
    .line 145
    const-string v5, ""

    .line 146
    .line 147
    const/4 v12, 0x0

    .line 148
    const/16 v16, 0x0

    .line 149
    .line 150
    move-object/from16 v18, v0

    .line 151
    .line 152
    invoke-static/range {v3 .. v18}, Ll/qtk;->a1(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ll/x20;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)Ll/pej0;

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public P()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->e:Ll/vxd0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ll/vxd0;->a(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->f:Ll/byd0;

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public Q()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->c:Ll/wyd0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Ll/pzi0;->t()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->c:Ll/wyd0;

    .line 25
    .line 26
    invoke-static {}, Ll/pzi0;->t()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->d:Ll/vxd0;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->b:Ll/vxd0;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 52
    .line 53
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    invoke-static {v0}, Ll/wj90;->d(Lcom/p1/mobile/putong/data/User;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->d:Ll/vxd0;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/lang/Integer;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public R()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->b:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->a:Ll/vxd0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    add-int/lit8 v0, v0, 0x1

    .line 35
    .line 36
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final S(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 6
    .line 7
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-static {v0, p0, p1}, Ll/tr90;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final T(Z)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 10
    .line 11
    iget-object v2, v2, Ll/zq90;->d:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v5, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-direct {v5, p0, v3, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper$1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Landroid/os/Handler;Z)V

    .line 17
    .line 18
    .line 19
    const-string v6, "profile"

    .line 20
    .line 21
    const/4 v7, 0x1

    .line 22
    const-string v3, ""

    .line 23
    .line 24
    move v4, p1

    .line 25
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->e2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLandroid/os/ResultReceiver;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final U()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->r()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 14
    .line 15
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/xf9;->C3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/zq90;->r()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    const-string v1, "unknown_"

    .line 36
    .line 37
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 42
    .line 43
    :cond_0
    new-instance v0, Ll/r0b0;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/r0b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public V()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->b:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x2

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->a:Ll/vxd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x6

    .line 29
    if-eq v0, v1, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->c:Ll/wyd0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {}, Ll/pzi0;->t()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->d:Ll/vxd0;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, 0x3

    .line 62
    if-gt v0, v1, :cond_1

    .line 63
    .line 64
    invoke-static {}, Ll/lik0;->a()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->y()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_0

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    const/4 p0, 0x0

    .line 78
    return p0

    .line 79
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 80
    return p0
.end method

.method public W()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->d:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x2

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->d:Ll/vxd0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/4 v0, 0x3

    .line 29
    if-ne p0, v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public final u()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final v(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->u()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 6
    .line 7
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    new-instance v2, Ll/q0b0;

    .line 10
    .line 11
    invoke-direct {v2, p0, p1}, Ll/q0b0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1, v2}, Ll/tr90;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public w()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->e:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x3

    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->f:Ll/byd0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Long;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public final x()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ShareItemBean;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final y()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 10
    .line 11
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-static {p0}, Ll/wj90;->d(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final synthetic z(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/zq90;->o()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 24
    .line 25
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->I8(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 41
    .line 42
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->g:Ll/zq90;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 58
    .line 59
    .line 60
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method
