.class public Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;
.super Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP<",
        "Ll/ujf0;",
        "Ll/rkf0;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/ujf0;

.field public d:Ll/rkf0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->g2(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static a2(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static b2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SignUpData;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "signup_data"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;ZZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "data"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "b1"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "b2"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-object v0
.end method


# virtual methods
.method public d2()Ll/ujf0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c:Ll/ujf0;

    .line 2
    .line 3
    return-object p0
.end method

.method public e2()Ll/rkf0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->d:Ll/rkf0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic g2(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->Q0()Ll/wyd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->O0()Ll/mxd0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/lang/Double;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    sget-object v4, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 30
    .line 31
    invoke-virtual {v4}, Lcom/p1/mobile/putong/account/api/a;->P0()Ll/wyd0;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Ljava/lang/String;

    .line 40
    .line 41
    sget-object v5, Ll/ino;->INSTANCE:Ll/ino;

    .line 42
    .line 43
    invoke-virtual {v5}, Ll/ino;->j()Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-eqz v5, :cond_1

    .line 48
    .line 49
    sget-object v5, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 50
    .line 51
    invoke-virtual {v5}, Lcom/p1/mobile/putong/account/api/a;->N1()Ll/wyd0;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    check-cast v5, Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-nez v6, :cond_0

    .line 66
    .line 67
    iput-object v5, p1, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 68
    .line 69
    :cond_0
    sget-object v5, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 70
    .line 71
    invoke-virtual {v5}, Lcom/p1/mobile/putong/account/api/a;->O1()Ll/jxd0;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    check-cast v5, Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    iput-boolean v5, p1, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 86
    .line 87
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-nez v5, :cond_2

    .line 92
    .line 93
    invoke-static {v4}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    iput-object v4, p1, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    if-nez v5, :cond_2

    .line 105
    .line 106
    const-string v5, "nonbinary"

    .line 107
    .line 108
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-nez v5, :cond_2

    .line 113
    .line 114
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    if-nez v5, :cond_2

    .line 119
    .line 120
    invoke-static {v4}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    iput-object v4, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 125
    .line 126
    :cond_2
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    if-nez v4, :cond_3

    .line 131
    .line 132
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 133
    .line 134
    :cond_3
    const-wide/16 v4, 0x0

    .line 135
    .line 136
    cmpl-double v0, v2, v4

    .line 137
    .line 138
    if-eqz v0, :cond_4

    .line 139
    .line 140
    iput-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 141
    .line 142
    :cond_4
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 143
    .line 144
    const-string v1, "facebook"

    .line 145
    .line 146
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_5

    .line 151
    .line 152
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->facebook:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 153
    .line 154
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 155
    .line 156
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->R0()Ll/wyd0;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    if-nez v1, :cond_5

    .line 173
    .line 174
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 175
    .line 176
    const-string v0, "image/jpeg"

    .line 177
    .line 178
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->profileMineType:Ljava/lang/String;

    .line 179
    .line 180
    :cond_5
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 181
    .line 182
    const-string v1, "google"

    .line 183
    .line 184
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_6

    .line 189
    .line 190
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->google:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 191
    .line 192
    iput-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 193
    .line 194
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c:Ll/ujf0;

    .line 195
    .line 196
    const/4 v1, 0x0

    .line 197
    invoke-virtual {v0, p1, v1, v1}, Ll/ujf0;->l1(Lcom/p1/mobile/putong/data/SignUpData;ZZ)V

    .line 198
    .line 199
    .line 200
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->d:Ll/rkf0;

    .line 201
    .line 202
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 203
    .line 204
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {p0, p1}, Ll/rkf0;->y0(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 212
    .line 213
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {p0, p1}, Ll/x95;->k(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method public bridge synthetic generateSignInPresenter()Ll/ibf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->d2()Ll/ujf0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic generateSignInViewModel()Ll/jbf0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->e2()Ll/rkf0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->d:Ll/rkf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    new-instance v0, Ll/rkf0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rkf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->d:Ll/rkf0;

    .line 7
    .line 8
    new-instance v0, Ll/ujf0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/ujf0;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c:Ll/ujf0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->d:Ll/rkf0;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    invoke-super {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->initDataOnCreate()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 24
    .line 25
    const-string v0, "Onboarding Started"

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p0, v0, v1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c:Ll/ujf0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ujf0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->d:Ll/rkf0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/rkf0;->o0(Landroid/view/Menu;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c:Ll/ujf0;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/ujf0;->D1(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStartLifecycle()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c:Ll/ujf0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/ujf0;->E1(Ll/l4g0;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_profile_signup_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    sget v0, Ll/a9c0;->s:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x10

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "signup_data"

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

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
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 35
    .line 36
    :goto_0
    move v1, v2

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/data/SignUpData;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "data"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const-string v3, "b1"

    .line 94
    .line 95
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    const-string v4, "b2"

    .line 104
    .line 105
    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    new-instance v3, Lcom/p1/mobile/putong/data/SignUpData;

    .line 110
    .line 111
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 112
    .line 113
    .line 114
    iget-object v4, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 115
    .line 116
    iput-object v4, v3, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 117
    .line 118
    iget v4, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 119
    .line 120
    iput v4, v3, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 121
    .line 122
    iget v0, v0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 123
    .line 124
    iput v0, v3, Lcom/p1/mobile/putong/data/SignUpData;->code:I

    .line 125
    .line 126
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 127
    .line 128
    iput-object v0, v3, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 129
    .line 130
    move v0, v2

    .line 131
    move v2, v1

    .line 132
    move v1, v0

    .line 133
    move-object v0, v3

    .line 134
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c:Ll/ujf0;

    .line 135
    .line 136
    invoke-virtual {v3, v0, v2, v1}, Ll/ujf0;->l1(Lcom/p1/mobile/putong/data/SignUpData;ZZ)V

    .line 137
    .line 138
    .line 139
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/account/ui/account/SignInBaseActMVP;->preCreateView(Landroid/os/Bundle;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    new-instance p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 144
    .line 145
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/SignUpData;-><init>()V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->d:Ll/rkf0;

    .line 149
    .line 150
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->Y0()Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    new-instance v1, Ll/ejf0;

    .line 165
    .line 166
    invoke-direct {v1, p0, p1}, Ll/ejf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 167
    .line 168
    .line 169
    new-instance p0, Ll/fjf0;

    .line 170
    .line 171
    invoke-direct {p0}, Ll/fjf0;-><init>()V

    .line 172
    .line 173
    .line 174
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
