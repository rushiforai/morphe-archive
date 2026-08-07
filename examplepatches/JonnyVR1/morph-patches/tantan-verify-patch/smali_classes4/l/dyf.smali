.class public Ll/dyf;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Landroid/view/View;

.field public h:Ll/l4g0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/agc0;->e:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/dyf;->f:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/l4g0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "p_fake_avatar_star_appeal_policy"

    .line 23
    .line 24
    invoke-direct {p1, v1, v0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/dyf;->h:Ll/l4g0;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic A(Ll/dyf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dyf;->F()V

    return-void
.end method

.method public static synthetic C(Ll/dyf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dyf;->I(Landroid/view/View;)V

    return-void
.end method

.method private E()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dyf;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/kec0;->j:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/dyf;->g:Landroid/view/View;

    .line 15
    .line 16
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    const/4 v1, -0x1

    .line 19
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    const/high16 v1, 0x41200000    # 10.0f

    .line 23
    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 29
    .line 30
    iget-object v1, p0, Ll/dyf;->g:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {p0, v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/dyf;->g:Landroid/view/View;

    .line 36
    .line 37
    sget v1, Ll/adc0;->Le:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroid/widget/TextView;

    .line 44
    .line 45
    iget-object v1, p0, Ll/dyf;->g:Landroid/view/View;

    .line 46
    .line 47
    sget v2, Ll/adc0;->Ce:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Landroid/widget/TextView;

    .line 54
    .line 55
    iget-object v2, p0, Ll/dyf;->g:Landroid/view/View;

    .line 56
    .line 57
    sget v3, Ll/adc0;->He:I

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Landroid/widget/TextView;

    .line 64
    .line 65
    iget-object v3, p0, Ll/dyf;->g:Landroid/view/View;

    .line 66
    .line 67
    sget v4, Ll/adc0;->Ae:I

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Landroid/widget/TextView;

    .line 74
    .line 75
    iget-object v4, p0, Ll/dyf;->g:Landroid/view/View;

    .line 76
    .line 77
    sget v5, Ll/adc0;->B6:I

    .line 78
    .line 79
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    check-cast v4, Landroid/widget/ImageView;

    .line 84
    .line 85
    sget v5, Lcom/p1/mobile/putong/core/R$string;->M4:I

    .line 86
    .line 87
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(I)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 93
    .line 94
    .line 95
    iget-object v5, p0, Ll/dyf;->f:Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    sget v6, Lcom/p1/mobile/putong/core/R$string;->L4:I

    .line 98
    .line 99
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v5, "\n"

    .line 107
    .line 108
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget-object v5, p0, Ll/dyf;->f:Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    sget v6, Lcom/p1/mobile/putong/core/R$string;->xs:I

    .line 114
    .line 115
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v5, "https://miniprogram-kyc.tencentcloudapi.com/s/h5/protocolTencent.html\n"

    .line 123
    .line 124
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget-object v5, p0, Ll/dyf;->f:Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    sget v6, Lcom/p1/mobile/putong/core/R$string;->us:I

    .line 130
    .line 131
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v5, "https://terms.aliyun.com/legal-agreement/terms/suit_bu1_ali_cloud/suit_bu1_ali_cloud202107281509_18386.html?spm=a2c4g.11186623.0.0.37c330e5LyeciZ\n\n"

    .line 139
    .line 140
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    iget-object v5, p0, Ll/dyf;->f:Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    sget v6, Lcom/p1/mobile/putong/core/R$string;->vs:I

    .line 146
    .line 147
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string v5, "\n\n"

    .line 155
    .line 156
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    iget-object v5, p0, Ll/dyf;->f:Lcom/p1/mobile/android/app/Act;

    .line 160
    .line 161
    sget v6, Lcom/p1/mobile/putong/core/R$string;->ws:I

    .line 162
    .line 163
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    const-string v5, "https://cosmos.immomo.com/\n\n"

    .line 171
    .line 172
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    iget-object v5, p0, Ll/dyf;->f:Lcom/p1/mobile/android/app/Act;

    .line 176
    .line 177
    sget v6, Lcom/p1/mobile/putong/core/R$string;->ts:I

    .line 178
    .line 179
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v5

    .line 183
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    .line 192
    .line 193
    sget v0, Lcom/p1/mobile/putong/core/R$string;->ss:I

    .line 194
    .line 195
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 196
    .line 197
    .line 198
    new-instance v0, Ll/yxf;

    .line 199
    .line 200
    invoke-direct {v0, p0}, Ll/yxf;-><init>(Ll/dyf;)V

    .line 201
    .line 202
    .line 203
    invoke-static {v2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 204
    .line 205
    .line 206
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ds:I

    .line 207
    .line 208
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 209
    .line 210
    .line 211
    new-instance v0, Ll/zxf;

    .line 212
    .line 213
    invoke-direct {v0, p0}, Ll/zxf;-><init>(Ll/dyf;)V

    .line 214
    .line 215
    .line 216
    invoke-static {v3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 217
    .line 218
    .line 219
    new-instance v0, Ll/ayf;

    .line 220
    .line 221
    invoke-direct {v0, p0}, Ll/ayf;-><init>(Ll/dyf;)V

    .line 222
    .line 223
    .line 224
    invoke-static {v4, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const-string p0, "\u7f51\u7edc\u9519\u8bef"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p1, "e_fake_avatar_star_appeal_policy_agree"

    .line 16
    .line 17
    const-string v0, "p_fake_avatar_star_appeal_policy"

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 41
    .line 42
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 51
    .line 52
    :cond_1
    invoke-static {p1}, Ll/hxf;->o(Lcom/p1/mobile/putong/data/PhoneNumber;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/dyf;->f:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    const-string v0, "fakeBatch"

    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/dyf;->dismiss()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_fake_avatar_star_appeal_policy_no"

    .line 2
    .line 3
    const-string v0, "p_fake_avatar_star_appeal_policy"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/dyf;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dyf;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/dyf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dyf;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/dyf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dyf;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/agc0;->f:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final D()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const v1, 0x1020002

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Ll/adc0;->q2:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/widget/FrameLayout;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget v3, Ll/dbc0;->S:I

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/dyf$a;

    .line 36
    .line 37
    invoke-direct {v1, p0, v2}, Ll/dyf$a;-><init>(Ll/dyf;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    new-instance p0, Ll/cyf;

    .line 44
    .line 45
    invoke-direct {p0, v0}, Ll/cyf;-><init>(Landroid/view/Window;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic F()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyf;->h:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/dyf;->h:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/agc0;->a:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/byf;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/byf;-><init>(Ll/dyf;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dyf;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/dyf;->E()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, -0x1

    .line 12
    invoke-virtual {p0, p1, p1}, Landroid/view/Window;->setLayout(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dyf;->h:Ll/l4g0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/dyf;->h:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/l4g0;->r()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/dyf;->g:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/view/ViewGroup;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->getState()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x3

    .line 31
    if-eq v0, v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dyf;->D()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
