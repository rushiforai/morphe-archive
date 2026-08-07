.class public Ll/hw80;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ww80;",
        ">;"
    }
.end annotation


# static fields
.field public static final e:Ljava/lang/String;

.field public static f:Z


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/putong/data/Settings;

.field public c:Lcom/p1/mobile/putong/data/SettingGroups;

.field public d:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "http://m.staging2.p1staff.com"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "https://m.tantanapp.com"

    .line 11
    .line 12
    :goto_0
    const-string v1, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/information/rec-proto/index.html"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/hw80;->e:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    sput-boolean v0, Ll/hw80;->f:Z

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic G0(Landroid/os/Bundle;)V
    .locals 1

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
    const-string v0, "from"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/ww80;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/ww80;->R(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic I0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ww80;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ww80;->w()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic J0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/hw80;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->clone()Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/ww80;

    .line 18
    .line 19
    iget-object p0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-virtual {v0, p1, p0}, Ll/ww80;->Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Settings;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic e0(Ll/hw80;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hw80;->R0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/hw80;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hw80;->G0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/hw80;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hw80;->Q0(Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method private g1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/hw80;->h1(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private h1(Z)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/hw80;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_3

    .line 8
    .line 9
    iget-object p1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    iget-object p1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 28
    .line 29
    iget-object v0, p0, Ll/hw80;->a:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Settings;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_3

    .line 38
    .line 39
    new-instance p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 40
    .line 41
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 45
    .line 46
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserPrivacySettings;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 50
    .line 51
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideContacts()Ljava/lang/Boolean;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 60
    .line 61
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts()Ljava/lang/Boolean;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 68
    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 70
    .line 71
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->personalizeSuggest()Ljava/lang/Boolean;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 78
    .line 79
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 80
    .line 81
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->personalizeAdsSuggest()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->adsSuggest:Ljava/lang/Boolean;

    .line 92
    .line 93
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 94
    .line 95
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->heartbeatDisable()Ljava/lang/Boolean;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->heartbeatDisable:Ljava/lang/Boolean;

    .line 102
    .line 103
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 104
    .line 105
    check-cast v0, Ll/ww80;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/ww80;->B()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_0

    .line 112
    .line 113
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 114
    .line 115
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolNameNoDefaults()Ljava/lang/Boolean;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 122
    .line 123
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 124
    .line 125
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getOnlineReminder()Ljava/lang/Boolean;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 132
    .line 133
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 134
    .line 135
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 136
    .line 137
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->unrepliedReminder()Ljava/lang/Boolean;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Vg()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_1

    .line 152
    .line 153
    invoke-static {}, Lcom/p1/mobile/putong/data/UserMomentSettings;->new_()Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideAutoLike()Ljava/lang/Boolean;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserMomentSettings;->autoLike:Ljava/lang/Boolean;

    .line 164
    .line 165
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 166
    .line 167
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 168
    .line 169
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hidePublicMoment()Ljava/lang/Boolean;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 176
    .line 177
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 184
    .line 185
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 186
    .line 187
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 188
    .line 189
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 190
    .line 191
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getAiPictureEnable()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->aiPictureEnable:Ljava/lang/String;

    .line 196
    .line 197
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 198
    .line 199
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 200
    .line 201
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->justReceiveVeriUserMsg()Ljava/lang/Boolean;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 206
    .line 207
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 208
    .line 209
    if-nez v0, :cond_2

    .line 210
    .line 211
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 212
    .line 213
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 218
    .line 219
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 220
    .line 221
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 222
    .line 223
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 224
    .line 225
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 230
    .line 231
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/MarrySettings;->closeMode:Z

    .line 232
    .line 233
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/MarrySettings;->closeMode:Z

    .line 234
    .line 235
    iget-object v0, p0, Ll/hw80;->a:Lcom/p1/mobile/putong/data/User;

    .line 236
    .line 237
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 238
    .line 239
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->subtract(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-eqz v0, :cond_3

    .line 252
    .line 253
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 254
    .line 255
    check-cast v0, Ll/ww80;

    .line 256
    .line 257
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 262
    .line 263
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    const/4 v2, 0x1

    .line 268
    invoke-virtual {v0, v1, v2}, Ll/ww80;->W(Ljava/lang/String;Z)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p0, p1}, Ll/hw80;->f1(Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 272
    .line 273
    .line 274
    :cond_3
    return-void
.end method

.method public static synthetic i0(Ll/hw80;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hw80;->I0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j0(Ll/hw80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hw80;->O0()V

    return-void
.end method

.method public static synthetic k0(Ll/hw80;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hw80;->L0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic l0(Ll/hw80;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hw80;->P0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic m0(Ll/hw80;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hw80;->S0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic n0(Ll/uxj0;)Lrx/c;
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

.method public static synthetic o0(Ll/hw80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hw80;->N0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p0(Ll/hw80;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hw80;->W0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic s0(Ll/hw80;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hw80;->J0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic t0(Ll/hw80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hw80;->V0()V

    return-void
.end method

.method public static synthetic u0(Ll/hw80;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hw80;->H0(Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic x0(Ll/hw80;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hw80;->U0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic y0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hidePublicMoments:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public C0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public D0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hw80;->c:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hw80;->i1()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/hw80;->d:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/hw80;->d:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public E0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hw80;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v2, "moment_auto_like"

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_2

    .line 22
    .line 23
    new-instance v2, Lorg/json/JSONObject;

    .line 24
    .line 25
    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/hw80;->a:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    const-string p0, "autoLikeFemale"

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0

    .line 43
    :cond_1
    const-string p0, "autoLikeMale"

    .line 44
    .line 45
    invoke-virtual {v2, p0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    return p0

    .line 50
    :catch_0
    :cond_2
    return v1
.end method

.method public F0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, " "

    .line 10
    .line 11
    sget-object v2, Ll/hw80;->e:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v1, v2}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ww80;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ww80;->Y(Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/hw80;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/ww80;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ww80;->T()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic N0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/MarrySettings;->closeMode:Z

    .line 11
    .line 12
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic O0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 8
    .line 9
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v1, Ll/ww80;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/ww80;->d0()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    xor-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic P0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ww80;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/ww80;->z(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "switch"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {v0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "e_vip_badge_show_switch_button"

    .line 24
    .line 25
    const-string v2, "p_privacy_and_permission_settings_view"

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p0, Ll/ww80;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/ww80;->Y(Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic R0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ww80;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ww80;->S(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic S0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ww80;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ww80;->V()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic U0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ww80;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ww80;->U(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic V0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 8
    .line 9
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v1, Ll/ww80;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/ww80;->c0()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic W0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ww80;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/ww80;->y(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public X0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

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
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    new-instance p1, Ll/th0$a;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {p1, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "\u5173\u95ed\u60f3\u7ed3\u5a5a\u6a21\u5f0f\u540e\u4f60\u5c06\u4e0d\u518d\u88ab\u63a8\u8350\uff0c\u53ef\u80fd\u4f1a\u9519\u5931\u7f18\u5206\uff0c\u786e\u8ba4\u8981\u5173\u95ed\u5417\uff1f"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "\u518d\u60f3\u60f3"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/wv80;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/wv80;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "\u786e\u8ba4\u5173\u95ed"

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/xv80;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/xv80;-><init>(Ll/hw80;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    iget-object p1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 76
    .line 77
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/MarrySettings;->closeMode:Z

    .line 78
    .line 79
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public Y0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "true"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p1, "false"

    .line 15
    .line 16
    :goto_0
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->aiPictureEnable:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ov80;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ov80;-><init>(Ll/hw80;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dkb;->J7()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/yv80;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/yv80;-><init>(Ll/hw80;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/zv80;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/zv80;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ao(Ljava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/aw80;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/aw80;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/bw80;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/bw80;-><init>(Ll/hw80;)V

    .line 73
    .line 74
    .line 75
    new-instance v2, Ll/cw80;

    .line 76
    .line 77
    invoke-direct {v2}, Ll/cw80;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j9()Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/dw80;

    .line 96
    .line 97
    invoke-direct {v1}, Ll/dw80;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v1, Ll/ew80;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/ew80;-><init>(Ll/hw80;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/fw80;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/fw80;-><init>(Ll/hw80;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 137
    .line 138
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 139
    .line 140
    iget-object v0, v0, Ll/dkb;->R:Ll/gyd0;

    .line 141
    .line 142
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 147
    .line 148
    iput-object v0, p0, Ll/hw80;->c:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 149
    .line 150
    return-void
.end method

.method public a1(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "on"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "off"

    .line 7
    .line 8
    :goto_0
    const-string v1, "after_status"

    .line 9
    .line 10
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    filled-new-array {v0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "e_chat_to_verified_switch"

    .line 19
    .line 20
    const-string v2, "p_privacy_and_permission_settings_view"

    .line 21
    .line 22
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 32
    .line 33
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public b1(Z)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/v;->T:Ll/jxd0;

    .line 6
    .line 7
    xor-int/lit8 v0, p1, 0x1

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const-string p0, "on"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p0, "off"

    .line 22
    .line 23
    :goto_0
    const-string p1, "qb_switch_status"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {p0}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "e_quickchat_broadcast_switch"

    .line 34
    .line 35
    const-string v0, "p_privacy_and_permission_settings_view"

    .line 36
    .line 37
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public c1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v2, Lcom/p1/mobile/putong/core/ui/settings/MomentMutedAct;

    .line 12
    .line 13
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d1(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 10
    .line 11
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/ww80;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/ww80;->d0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    xor-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "android.permission.READ_CONTACTS"

    .line 36
    .line 37
    filled-new-array {v0}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v0, Ll/sv80;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Ll/sv80;-><init>(Ll/hw80;)V

    .line 57
    .line 58
    .line 59
    new-instance v1, Ll/tv80;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/tv80;-><init>(Ll/hw80;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e1(Lcom/p1/mobile/putong/data/UserPrivacySettings;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/dkb;->y9(Lcom/p1/mobile/putong/data/UserPrivacySettings;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/qv80;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/qv80;-><init>(Ll/hw80;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/rv80;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/rv80;-><init>(Ll/hw80;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public f1(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k8(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/uv80;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/uv80;-><init>(Ll/hw80;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/vv80;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/vv80;-><init>(Ll/hw80;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public i1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ww80;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, v1, v2}, Ll/ww80;->W(Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/hw80;->c:Lcom/p1/mobile/putong/data/SettingGroups;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/hw80;->e1(Lcom/p1/mobile/putong/data/UserPrivacySettings;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public j1(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->heartbeatDisable:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 16
    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const-string p0, "close"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p0, "open"

    .line 24
    .line 25
    :goto_0
    const-string p1, "switch_type"

    .line 26
    .line 27
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    filled-new-array {p0}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "e_heartsignal_control"

    .line 36
    .line 37
    const-string v0, "p_privacy_and_permission_settings_view"

    .line 38
    .line 39
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public k1(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 10
    .line 11
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/ww80;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/ww80;->c0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v0, "android.permission.READ_CONTACTS"

    .line 34
    .line 35
    filled-new-array {v0}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/gw80;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/gw80;-><init>(Ll/hw80;)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/pv80;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/pv80;-><init>(Ll/hw80;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public l1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 58
    .line 59
    iget-object v1, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    xor-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 82
    .line 83
    .line 84
    :cond_0
    return-void
.end method

.method public m1(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->adsSuggest:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 16
    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const-string p0, "on"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p0, "off"

    .line 24
    .line 25
    :goto_0
    const-string p1, "after_status"

    .line 26
    .line 27
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    filled-new-array {p0}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "e_personalized_ad_button"

    .line 36
    .line 37
    const-string v0, "p_privacy_and_permission_settings_view"

    .line 38
    .line 39
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public n1(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Ll/hw80;->f:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->personalizeSuggest:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 19
    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const-string p0, "off2on"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p0, "on2off"

    .line 27
    .line 28
    :goto_0
    const-string p1, "change"

    .line 29
    .line 30
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    filled-new-array {p0}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "e_personalized_recommend_button"

    .line 39
    .line 40
    const-string v0, "p_privacy_and_permission_settings_view"

    .line 41
    .line 42
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public o1(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->unrepliedReminder:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public z0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hw80;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserMomentSettings;->autoLike:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/hw80;->g1()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
