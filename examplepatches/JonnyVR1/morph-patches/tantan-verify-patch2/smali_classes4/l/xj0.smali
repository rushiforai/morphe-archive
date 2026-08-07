.class public Ll/xj0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/pej0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/xj0;->f()V

    .line 2
    .line 3
    .line 4
    const-string p1, "e_go_verify"

    .line 5
    .line 6
    const-string v0, "p_suggest_verified_not_certified_alert"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Ll/pq4;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic b(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/xj0;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/xj0;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/xj0;->f()V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_cancel_btn"

    .line 5
    .line 6
    const-string v0, "p_suggest_verified_not_certified_alert"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/xj0;->f()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    instance-of p1, p0, Ll/cvl;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    check-cast p0, Ll/cvl;

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-interface {p0, p1, v0}, Ll/cvl;->C1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const-string p0, "e_verified_under_review_see_other"

    .line 37
    .line 38
    const-string p1, "p_suggest_verified_under_review"

    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static f()V
    .locals 2

    .line 1
    sget-object v0, Ll/xj0;->a:Ljava/lang/ref/WeakReference;

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
    sget-object v0, Ll/xj0;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/pej0;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/pej0;->dismiss()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;)Z
    .locals 4
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {}, Ll/joa;->G3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v2, 0x1

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    invoke-static {p0}, Ll/xj0;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    return v2

    .line 31
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {p0}, Ll/xj0;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    return v2

    .line 39
    :cond_3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 40
    .line 41
    const-string v3, "verified"

    .line 42
    .line 43
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_4

    .line 48
    .line 49
    return v1

    .line 50
    :cond_4
    const-string v1, "rejected"

    .line 51
    .line 52
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_5

    .line 57
    .line 58
    invoke-static {p0}, Ll/xj0;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 59
    .line 60
    .line 61
    return v2

    .line 62
    :cond_5
    const-string v1, "pending"

    .line 63
    .line 64
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_6

    .line 69
    .line 70
    invoke-static {p0}, Ll/xj0;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 71
    .line 72
    .line 73
    return v2

    .line 74
    :cond_6
    invoke-static {p0}, Ll/xj0;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 75
    .line 76
    .line 77
    return v2
.end method

.method public static h(Lcom/p1/mobile/android/app/Act;)V
    .locals 8

    .line 1
    new-instance v0, Ll/pej0;

    .line 2
    .line 3
    sget v1, Ll/agc0;->h:I

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Ll/xj0;->a:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 17
    .line 18
    .line 19
    sget v2, Ll/kec0;->F0:I

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 22
    .line 23
    .line 24
    sget v2, Ll/adc0;->i6:I

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lv/VImage;

    .line 31
    .line 32
    sget v3, Ll/adc0;->ne:I

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Landroid/widget/TextView;

    .line 39
    .line 40
    sget v4, Ll/adc0;->g9:I

    .line 41
    .line 42
    invoke-virtual {v0, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    check-cast v4, Landroid/widget/TextView;

    .line 47
    .line 48
    sget v5, Ll/adc0;->A:I

    .line 49
    .line 50
    invoke-virtual {v0, v5}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    check-cast v5, Landroid/widget/TextView;

    .line 55
    .line 56
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    invoke-virtual {v6}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    iget-object v7, v6, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 65
    .line 66
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    if-eqz v7, :cond_0

    .line 71
    .line 72
    iget-object v7, v6, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 73
    .line 74
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    if-eqz v7, :cond_0

    .line 79
    .line 80
    iget-object v7, v6, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 81
    .line 82
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 83
    .line 84
    invoke-static {v7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    if-nez v7, :cond_0

    .line 89
    .line 90
    iget-object v7, v6, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 91
    .line 92
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    check-cast v7, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 99
    .line 100
    iget-object v7, v7, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 101
    .line 102
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    if-eqz v7, :cond_0

    .line 107
    .line 108
    iget-object v6, v6, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 109
    .line 110
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    check-cast v6, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 117
    .line 118
    iget-object v6, v6, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 119
    .line 120
    iget-object v6, v6, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 121
    .line 122
    const-string v7, "female"

    .line 123
    .line 124
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v6

    .line 128
    if-eqz v6, :cond_0

    .line 129
    .line 130
    sget v6, Ll/dbc0;->rj:I

    .line 131
    .line 132
    invoke-virtual {v2, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 133
    .line 134
    .line 135
    const-string v2, "\u5b8c\u6210\u5934\u50cf\u8ba4\u8bc1\uff0c\u5373\u523b\u4e0e\u5979\u4eec\u9082\u9005"

    .line 136
    .line 137
    new-array v1, v1, [Ljava/lang/Object;

    .line 138
    .line 139
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_0
    sget v6, Ll/dbc0;->sj:I

    .line 148
    .line 149
    invoke-virtual {v2, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 150
    .line 151
    .line 152
    const-string v2, "\u5b8c\u6210\u5934\u50cf\u8ba4\u8bc1\uff0c\u5373\u523b\u4e0e\u4ed6\u4eec\u9082\u9005"

    .line 153
    .line 154
    new-array v1, v1, [Ljava/lang/Object;

    .line 155
    .line 156
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    .line 162
    .line 163
    :goto_0
    const-class v1, Ll/pej0;

    .line 164
    .line 165
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    const-string v2, "p_suggest_verified_not_certified_alert"

    .line 170
    .line 171
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    new-instance v3, Ll/sj0;

    .line 176
    .line 177
    invoke-direct {v3, p0}, Ll/sj0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v4, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 181
    .line 182
    .line 183
    new-instance v3, Ll/tj0;

    .line 184
    .line 185
    invoke-direct {v3}, Ll/tj0;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v5, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 189
    .line 190
    .line 191
    new-instance v3, Ll/uj0;

    .line 192
    .line 193
    invoke-direct {v3, v1}, Ll/uj0;-><init>(Ll/l4g0;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 197
    .line 198
    .line 199
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    invoke-virtual {v3}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    if-eqz v3, :cond_1

    .line 208
    .line 209
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    sget-object v4, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->HOME_AUTH_TAB:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 214
    .line 215
    const/16 v5, 0x4e20

    .line 216
    .line 217
    invoke-virtual {v3, v4, p0, v0, v5}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 218
    .line 219
    .line 220
    goto :goto_1

    .line 221
    :cond_1
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-static {v0}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-virtual {p0, v0}, Ll/cl80;->q(Ll/al80;)V

    .line 230
    .line 231
    .line 232
    :goto_1
    const-string p0, "e_go_verify"

    .line 233
    .line 234
    invoke-static {p0, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    const-string p0, "e_cancel_btn"

    .line 238
    .line 239
    invoke-static {p0, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 243
    .line 244
    .line 245
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;)V
    .locals 6

    .line 1
    new-instance v0, Ll/pej0;

    .line 2
    .line 3
    sget v1, Ll/agc0;->h:I

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Ll/xj0;->a:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 17
    .line 18
    .line 19
    sget v1, Ll/kec0;->G0:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 22
    .line 23
    .line 24
    sget v1, Ll/adc0;->h9:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/widget/TextView;

    .line 31
    .line 32
    const-class v2, Ll/pej0;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v3, "p_suggest_verified_under_review"

    .line 39
    .line 40
    invoke-static {v3, v2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    new-instance v4, Ll/vj0;

    .line 45
    .line 46
    invoke-direct {v4, p0}, Ll/vj0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/wj0;

    .line 53
    .line 54
    invoke-direct {v1, v2}, Ll/wj0;-><init>(Ll/l4g0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_0

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    sget-object v4, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->HOME_AUTH_TAB:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 75
    .line 76
    const/16 v5, 0x4e20

    .line 77
    .line 78
    invoke-virtual {v1, v4, p0, v0, v5}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {v0}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p0, v0}, Ll/cl80;->q(Ll/al80;)V

    .line 91
    .line 92
    .line 93
    :goto_0
    const-string p0, "e_verified_under_review_see_other"

    .line 94
    .line 95
    invoke-static {p0, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method
