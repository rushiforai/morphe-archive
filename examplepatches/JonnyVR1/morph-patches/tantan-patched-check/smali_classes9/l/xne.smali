.class public Ll/xne;
.super Ll/dy90;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dy90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private A0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 31
    .line 32
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 53
    .line 54
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 67
    .line 68
    const-string v2, "pending"

    .line 69
    .line 70
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    goto :goto_0

    .line 78
    :cond_0
    move v0, v1

    .line 79
    :goto_0
    iget-object v2, p0, Ll/dy90;->z:Lv/VText;

    .line 80
    .line 81
    new-instance v3, Ll/pne;

    .line 82
    .line 83
    invoke-direct {v3, p0}, Ll/pne;-><init>(Ll/xne;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v2, v3, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Ll/dy90;->B:Lv/VText;

    .line 90
    .line 91
    new-instance v3, Ll/sne;

    .line 92
    .line 93
    invoke-direct {v3, p0, v0}, Ll/sne;-><init>(Ll/xne;Z)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v2, v3, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 97
    .line 98
    .line 99
    iget-object v2, p0, Ll/dy90;->C:Lv/VText;

    .line 100
    .line 101
    new-instance v3, Ll/tne;

    .line 102
    .line 103
    invoke-direct {v3, p0}, Ll/tne;-><init>(Ll/xne;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v2, v3, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 107
    .line 108
    .line 109
    iget-object v2, p0, Ll/dy90;->D:Lv/VText;

    .line 110
    .line 111
    new-instance v3, Ll/une;

    .line 112
    .line 113
    invoke-direct {v3, p0}, Ll/une;-><init>(Ll/xne;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v2, v3, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 117
    .line 118
    .line 119
    iget-object v2, p0, Ll/dy90;->G:Lv/VText;

    .line 120
    .line 121
    new-instance v3, Ll/vne;

    .line 122
    .line 123
    invoke-direct {v3, p0, v0}, Ll/vne;-><init>(Ll/xne;Z)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, v2, v3, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Ll/dy90;->A:Lv/VText;

    .line 130
    .line 131
    new-instance v3, Ll/wne;

    .line 132
    .line 133
    invoke-direct {v3, p0, v0}, Ll/wne;-><init>(Ll/xne;Z)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, v2, v3, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/dy90;->I:Lv/VText;

    .line 140
    .line 141
    new-instance v2, Ll/ine;

    .line 142
    .line 143
    invoke-direct {v2, p0}, Ll/ine;-><init>(Ll/xne;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, v0, v2, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/dy90;->K:Lv/VText;

    .line 150
    .line 151
    new-instance v2, Ll/jne;

    .line 152
    .line 153
    invoke-direct {v2, p0}, Ll/jne;-><init>(Ll/xne;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v0, v2, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 157
    .line 158
    .line 159
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->j()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_1

    .line 164
    .line 165
    iget-object v0, p0, Ll/dy90;->w:Lv/VText;

    .line 166
    .line 167
    new-instance v2, Ll/kne;

    .line 168
    .line 169
    invoke-direct {v2, p0}, Ll/kne;-><init>(Ll/xne;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0, v0, v2, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/dy90;->x:Lv/VText;

    .line 176
    .line 177
    new-instance v2, Ll/lne;

    .line 178
    .line 179
    invoke-direct {v2, p0}, Ll/lne;-><init>(Ll/xne;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, v0, v2, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 183
    .line 184
    .line 185
    :cond_1
    iget-object v0, p0, Ll/dy90;->E:Lv/VText;

    .line 186
    .line 187
    new-instance v2, Ll/qne;

    .line 188
    .line 189
    invoke-direct {v2, p0}, Ll/qne;-><init>(Ll/xne;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0, v0, v2, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Ll/dy90;->F:Lv/VText;

    .line 196
    .line 197
    new-instance v2, Ll/rne;

    .line 198
    .line 199
    invoke-direct {v2, p0}, Ll/rne;-><init>(Ll/xne;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0, v0, v2, v1}, Ll/ep90;->N(Landroid/view/View;Ll/x20;Z)V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method public static synthetic j0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->M0()V

    return-void
.end method

.method public static synthetic k0(Ll/xne;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xne;->K0(Z)V

    return-void
.end method

.method public static synthetic l0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->P0()V

    return-void
.end method

.method public static synthetic m0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->I0()V

    return-void
.end method

.method public static synthetic n0(Ll/xne;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xne;->O0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic o0(Ll/xne;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xne;->Q0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic p0(Ll/xne;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xne;->J0(Z)V

    return-void
.end method

.method public static synthetic q0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->C0()V

    return-void
.end method

.method public static synthetic r0(Ll/xne;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xne;->G0(Z)V

    return-void
.end method

.method public static synthetic s0(Ll/xne;Lv/VText;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xne;->B0(Lv/VText;)V

    return-void
.end method

.method public static synthetic t0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->F0()V

    return-void
.end method

.method public static synthetic u0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->D0()V

    return-void
.end method

.method public static synthetic v0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->N0()V

    return-void
.end method

.method public static synthetic w0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->H0()V

    return-void
.end method

.method public static synthetic x0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->E0()V

    return-void
.end method

.method public static synthetic y0(Ll/xne;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xne;->L0()V

    return-void
.end method


# virtual methods
.method public final synthetic B0(Lv/VText;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/dy90;->Z()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/c9c0;->O1:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0, p1}, Ll/ep90;->C(ILandroid/widget/TextView;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic C0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SCHOOL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic D0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->LANGUAGE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic E0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_intl_edit_profile_view_degree"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUALIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic F0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_intl_edit_profile_view_school"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SCHOOL_NEW:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic G0(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "\u5ba1\u6838\u4e2d\uff0c\u8bf7\u7a0d\u540e\u64cd\u4f5c\u3002"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p1, "edit_profile_my_info_name"

    .line 10
    .line 11
    const-string v0, "industry"

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "e_edit_profile_my_info"

    .line 22
    .line 23
    const-string v1, "p_edit_profile_view"

    .line 24
    .line 25
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->INDUSTRY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 45
    .line 46
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic H0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 12
    .line 13
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 14
    .line 15
    const-string v1, "edit_profile_my_info_name"

    .line 16
    .line 17
    const-string v2, "p_edit_profile_view"

    .line 18
    .line 19
    const-string v3, "e_edit_profile_my_info"

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "department"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v3, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MAJOR:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 53
    .line 54
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    const-string v0, "job"

    .line 59
    .line 60
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v3, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->DEPARTMENT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 88
    .line 89
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final synthetic I0()V
    .locals 3

    .line 1
    const-string v0, "edit_profile_my_info_name"

    .line 2
    .line 3
    const-string v1, "company"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_edit_profile_my_info"

    .line 14
    .line 15
    const-string v2, "p_edit_profile_view"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->COMPANY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 37
    .line 38
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic J0(Z)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "\u5ba1\u6838\u4e2d\uff0c\u8bf7\u7a0d\u540e\u64cd\u4f5c\u3002"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 20
    .line 21
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 22
    .line 23
    const-string v0, "school"

    .line 24
    .line 25
    const-string v1, "edit_profile_my_info_name"

    .line 26
    .line 27
    const-string v2, "p_edit_profile_view"

    .line 28
    .line 29
    const-string v3, "e_edit_profile_my_info"

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {v3, v2, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->G(Lcom/p1/mobile/android/app/Frag;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {v3, v2, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SCHOOL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 84
    .line 85
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic K0(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "\u5ba1\u6838\u4e2d\uff0c\u8bf7\u7a0d\u540e\u64cd\u4f5c\u3002"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p1, "edit_profile_my_info_name"

    .line 10
    .line 11
    const-string v0, "school"

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "e_edit_profile_my_info"

    .line 22
    .line 23
    const-string v1, "p_edit_profile_view"

    .line 24
    .line 25
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SCHOOL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 45
    .line 46
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic L0()V
    .locals 3

    .line 1
    const-string v0, "edit_profile_my_info_name"

    .line 2
    .line 3
    const-string v1, "hometown"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_edit_profile_my_info"

    .line 14
    .line 15
    const-string v2, "p_edit_profile_view"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HOMETOWN:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 37
    .line 38
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic M0()V
    .locals 3

    .line 1
    const-string v0, "edit_profile_my_info_name"

    .line 2
    .line 3
    const-string v1, "hangouts"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_edit_profile_my_info"

    .line 14
    .line 15
    const-string v2, "p_edit_profile_view"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HANGOUTS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/16 v2, 0x1f4

    .line 39
    .line 40
    invoke-static {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->E(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/data/User;I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic N0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->ETHNICITY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic O0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic P0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->R3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Q0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolNameNoDefaults()Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Jl:I

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Q:I

    .line 81
    .line 82
    new-instance v1, Ll/nne;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/nne;-><init>(Ll/xne;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 98
    .line 99
    .line 100
    :cond_0
    return-void
.end method

.method public R0()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserPrivacySettings;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolNameNoDefaults()Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideSchool:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 42
    .line 43
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolNameNoDefaults()Ljava/lang/Boolean;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-eq v1, v2, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 62
    .line 63
    .line 64
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Ll/dkb;->D9(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/hne;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/hne;-><init>(Ll/xne;)V

    .line 75
    .line 76
    .line 77
    new-instance v2, Ll/one;

    .line 78
    .line 79
    invoke-direct {v2, p0}, Ll/one;-><init>(Ll/xne;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    :cond_0
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dy90;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xne;->z0()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Ll/xne;->A0()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/dy90;->e0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public z0()V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/dy90;->w:Lv/VText;

    .line 4
    .line 5
    iget-object v2, v0, Ll/dy90;->x:Lv/VText;

    .line 6
    .line 7
    iget-object v3, v0, Ll/dy90;->B:Lv/VText;

    .line 8
    .line 9
    iget-object v4, v0, Ll/dy90;->D:Lv/VText;

    .line 10
    .line 11
    iget-object v5, v0, Ll/dy90;->G:Lv/VText;

    .line 12
    .line 13
    iget-object v6, v0, Ll/dy90;->I:Lv/VText;

    .line 14
    .line 15
    iget-object v7, v0, Ll/dy90;->C:Lv/VText;

    .line 16
    .line 17
    iget-object v8, v0, Ll/dy90;->K:Lv/VText;

    .line 18
    .line 19
    iget-object v9, v0, Ll/dy90;->A:Lv/VText;

    .line 20
    .line 21
    iget-object v10, v0, Ll/dy90;->z:Lv/VText;

    .line 22
    .line 23
    iget-object v11, v0, Ll/dy90;->J:Lv/VText;

    .line 24
    .line 25
    iget-object v12, v0, Ll/dy90;->H:Lv/VText;

    .line 26
    .line 27
    iget-object v13, v0, Ll/dy90;->M:Lv/VText;

    .line 28
    .line 29
    iget-object v14, v0, Ll/dy90;->N:Lv/VText;

    .line 30
    .line 31
    iget-object v15, v0, Ll/dy90;->O:Lv/VText;

    .line 32
    .line 33
    move-object/from16 v16, v1

    .line 34
    .line 35
    iget-object v1, v0, Ll/dy90;->P:Lv/VText;

    .line 36
    .line 37
    move-object/from16 v17, v1

    .line 38
    .line 39
    iget-object v1, v0, Ll/dy90;->F:Lv/VText;

    .line 40
    .line 41
    move-object/from16 v18, v1

    .line 42
    .line 43
    iget-object v1, v0, Ll/dy90;->E:Lv/VText;

    .line 44
    .line 45
    move-object/from16 v19, v1

    .line 46
    .line 47
    iget-object v1, v0, Ll/dy90;->Q:Lv/VText;

    .line 48
    .line 49
    move-object/from16 v20, v19

    .line 50
    .line 51
    move-object/from16 v19, v1

    .line 52
    .line 53
    move-object/from16 v1, v16

    .line 54
    .line 55
    move-object/from16 v16, v17

    .line 56
    .line 57
    move-object/from16 v17, v18

    .line 58
    .line 59
    move-object/from16 v18, v20

    .line 60
    .line 61
    filled-new-array/range {v1 .. v19}, [Lv/VText;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    new-instance v2, Ll/mne;

    .line 70
    .line 71
    invoke-direct {v2, v0}, Ll/mne;-><init>(Ll/xne;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
