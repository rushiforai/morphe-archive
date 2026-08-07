.class public Ll/zki0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic A(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    sget v3, Ll/dbc0;->jk:I

    .line 5
    .line 6
    const/4 v8, 0x0

    .line 7
    const/4 v9, 0x0

    .line 8
    const-string v1, "\u5ba1\u6838\u4e2d"

    .line 9
    .line 10
    const-string v2, "\u4f60\u5df2\u63d0\u4ea4\u4e86\u8ba4\u8bc1\u7167\u7247\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85\u5ba1\u6838\u7ed3\u679c"

    .line 11
    .line 12
    const-string v4, "\u597d\u7684"

    .line 13
    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v6, 0x0

    .line 16
    const/4 v7, 0x0

    .line 17
    move-object v0, p1

    .line 18
    invoke-static/range {v0 .. v9}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->E1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/xc20;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_id_verification_reverify_confirm_re_click"

    .line 5
    .line 6
    const-string v0, "p_id_verification_fail_guide"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static C(Lcom/p1/mobile/android/app/Act;)V
    .locals 11

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->s4()Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "pending"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "dialog"

    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->fs:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget v0, Lcom/p1/mobile/putong/core/R$string;->es:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    sget v4, Ll/dbc0;->jk:I

    .line 36
    .line 37
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Tr:I

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    const/4 v9, 0x0

    .line 44
    const/4 v10, 0x0

    .line 45
    const/4 v6, 0x0

    .line 46
    const/4 v7, 0x0

    .line 47
    const/4 v8, 0x0

    .line 48
    move-object v1, p0

    .line 49
    invoke-static/range {v1 .. v10}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->E1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static D(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "tantan_verification"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static E(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/zki0;->F(Landroid/content/Context;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static F(Landroid/content/Context;Z)V
    .locals 1

    .line 1
    const-string v0, "tantan_verification"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;->Z1(Landroid/content/Intent;Z)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static G(Lcom/p1/mobile/android/app/Act;ZZLcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->we:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/adc0;->b6:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/widget/ImageView;

    .line 19
    .line 20
    sget v3, Ll/adc0;->K9:I

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroid/widget/LinearLayout;

    .line 27
    .line 28
    sget v4, Ll/adc0;->Ua:I

    .line 29
    .line 30
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    check-cast v4, Lv/VDraweeView;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v5}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    const-string v6, "*\u8fd9\u5f20\u7167\u7247\u4ec5\u7528\u4e8e\u8ba4\u8bc1\uff0c\u5176\u5b83\u7528\u6237\u4e0d\u53ef\u89c1"

    .line 45
    .line 46
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Dialog$e;->r0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    const/4 v6, 0x0

    .line 51
    invoke-virtual {v5, v0, v6}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0, v6}, Lcom/p1/mobile/android/app/Dialog$e;->q(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0, v6}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/16 v5, 0x8

    .line 64
    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    const-string p1, "\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1"

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v2, "\u60a8\u53ea\u9700\u6a21\u4eff\u4e0b\u9762\u7684\u624b\u52bf\u81ea\u62cd\u4e00\u5f20\u5373\u53ef\u5b8c\u6210\u8ba4\u8bc1\u3002\u77ed\u6682\u6838\u5b9e\u540e\uff0c\u6211\u4eec\u5c06\u628a\u60a8\u63a8\u8350\u7ed9\u66f4\u591a\u7528\u6237\u3002"

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const-string v2, "\u51c6\u5907\u597d\u4e86"

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const-string v2, "\u7a0d\u540e\u518d\u8bf4"

    .line 92
    .line 93
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    new-instance p1, Ll/xji0;

    .line 102
    .line 103
    invoke-direct {p1, p0, v2}, Ll/xji0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2, p1}, Lcom/p1/mobile/android/app/Dialog;->o0(Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    new-instance p1, Ll/iki0;

    .line 110
    .line 111
    invoke-direct {p1, v2}, Ll/iki0;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2, p1}, Lcom/p1/mobile/android/app/Dialog;->m0(Ljava/lang/Runnable;)V

    .line 115
    .line 116
    .line 117
    :cond_0
    if-eqz p2, :cond_2

    .line 118
    .line 119
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_1

    .line 124
    .line 125
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 126
    .line 127
    iget-object p2, p3, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 128
    .line 129
    iget p2, p2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 130
    .line 131
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    invoke-virtual {p1, v4, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 136
    .line 137
    .line 138
    :cond_1
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 142
    .line 143
    .line 144
    const-string p1, "\u786e\u8ba4\u63d0\u4ea4"

    .line 145
    .line 146
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    const-string p2, "\u8bf7\u786e\u8ba4\u7167\u7247\u4e0e\u4f60\u7684\u5934\u50cf\u4e00\u81f4\uff0c\u5e76\u505a\u51fa\u4e86\u548c\u793a\u4f8b\u76f8\u540c\u7684\u624b\u52bf\u3002\u5ba1\u6838\u4e2d\u7167\u7247\u65e0\u6cd5\u4fee\u6539\u3002"

    .line 151
    .line 152
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    const-string p2, "\u4e0a\u4f20"

    .line 157
    .line 158
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    const-string p2, "\u91cd\u62cd"

    .line 163
    .line 164
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    new-instance p1, Ll/rki0;

    .line 173
    .line 174
    invoke-direct {p1, v2, p4, p0}, Ll/rki0;-><init>(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/putong/core/data/VerificationCenter;Lcom/p1/mobile/android/app/Act;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v2, p1}, Lcom/p1/mobile/android/app/Dialog;->o0(Ljava/lang/Runnable;)V

    .line 178
    .line 179
    .line 180
    new-instance p1, Ll/ski0;

    .line 181
    .line 182
    invoke-direct {p1, v2, p0}, Ll/ski0;-><init>(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v2, p1}, Lcom/p1/mobile/android/app/Dialog;->m0(Ljava/lang/Runnable;)V

    .line 186
    .line 187
    .line 188
    :cond_2
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public static H(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ll/zq90;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v0, v1}, Ll/zki0;->O(Lcom/p1/mobile/android/app/Act;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 40
    .line 41
    const-string v2, "pending"

    .line 42
    .line 43
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ur:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ps:I

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    sget v3, Ll/dbc0;->v8:I

    .line 62
    .line 63
    sget v4, Lcom/p1/mobile/putong/core/R$string;->os:I

    .line 64
    .line 65
    invoke-virtual {v0, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual/range {p3 .. p3}, Ll/zq90;->K()Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    xor-int/lit8 v15, v5, 0x1

    .line 74
    .line 75
    const/4 v5, 0x0

    .line 76
    const/4 v6, 0x0

    .line 77
    const/4 v7, 0x0

    .line 78
    const/4 v8, 0x0

    .line 79
    const/4 v9, 0x0

    .line 80
    const/4 v10, 0x0

    .line 81
    const/4 v11, 0x1

    .line 82
    const/4 v12, 0x0

    .line 83
    const/4 v13, 0x0

    .line 84
    const/4 v14, 0x0

    .line 85
    invoke-static/range {v0 .. v15}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    invoke-static {}, Ll/hxf;->n()V

    .line 90
    .line 91
    .line 92
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const-string v2, "p_avatarVerification_icon_explain_guide_Unverified"

    .line 99
    .line 100
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 105
    .line 106
    .line 107
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ur:I

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    sget v3, Lcom/p1/mobile/putong/core/R$string;->ps:I

    .line 114
    .line 115
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    move-object v4, v2

    .line 120
    move-object v2, v3

    .line 121
    sget v3, Ll/dbc0;->v8:I

    .line 122
    .line 123
    sget v5, Lcom/p1/mobile/putong/core/R$string;->ns:I

    .line 124
    .line 125
    invoke-virtual {v0, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    move-object v6, v4

    .line 130
    move-object v4, v5

    .line 131
    new-instance v5, Ll/hki0;

    .line 132
    .line 133
    move-object/from16 v7, p3

    .line 134
    .line 135
    invoke-direct {v5, v0, v7}, Ll/hki0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/zq90;)V

    .line 136
    .line 137
    .line 138
    sget v8, Lcom/p1/mobile/putong/core/R$string;->ms:I

    .line 139
    .line 140
    invoke-virtual {v0, v8}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v8

    .line 144
    move-object v7, v8

    .line 145
    new-instance v8, Ll/jki0;

    .line 146
    .line 147
    invoke-direct {v8}, Ll/jki0;-><init>()V

    .line 148
    .line 149
    .line 150
    new-instance v9, Ll/kki0;

    .line 151
    .line 152
    invoke-direct {v9, v1}, Ll/kki0;-><init>(Ll/l4g0;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual/range {p3 .. p3}, Ll/zq90;->K()Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    xor-int/lit8 v15, v1, 0x1

    .line 160
    .line 161
    move-object v1, v6

    .line 162
    const/4 v6, 0x1

    .line 163
    const/4 v10, 0x0

    .line 164
    const/4 v11, 0x1

    .line 165
    const/4 v12, 0x0

    .line 166
    const/4 v13, 0x0

    .line 167
    const/4 v14, 0x0

    .line 168
    invoke-static/range {v0 .. v15}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_2
    invoke-static/range {p0 .. p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->r1(Lcom/p1/mobile/android/app/Act;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public static I(Landroid/content/Context;)V
    .locals 8

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_avatarVerification_profile_cancel_alert"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v6, "profile_show_page"

    .line 14
    .line 15
    const-string v7, "click"

    .line 16
    .line 17
    const-string v2, "passive"

    .line 18
    .line 19
    const-string v3, "alert"

    .line 20
    .line 21
    const-string v4, "alert_system"

    .line 22
    .line 23
    const-string v5, "avatar_verification_cancel_button"

    .line 24
    .line 25
    invoke-static/range {v2 .. v7}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    :try_start_0
    const-string v0, "verification_type"

    .line 30
    .line 31
    const-string v3, "id_verification"

    .line 32
    .line 33
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-virtual {v1, v2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Z7:I

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sget v0, Lcom/p1/mobile/putong/core/R$string;->X7:I

    .line 56
    .line 57
    new-instance v2, Ll/dki0;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/dki0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Y7:I

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    new-instance v0, Ll/eki0;

    .line 73
    .line 74
    invoke-direct {v0, v1}, Ll/eki0;-><init>(Ll/l4g0;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 86
    .line 87
    .line 88
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public static J(Landroid/content/Context;ZLcom/p1/mobile/putong/data/User;)V
    .locals 10

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget v2, Ll/kec0;->Fc:I

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Ll/adc0;->je:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Landroid/widget/TextView;

    .line 24
    .line 25
    sget v3, Ll/adc0;->P1:I

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Landroid/widget/TextView;

    .line 32
    .line 33
    sget v4, Ll/adc0;->O:I

    .line 34
    .line 35
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Lv/VDraweeView;

    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    const-string v5, "TA\u5df2\u5b8c\u6210\u201c\u63a2\u63a2\u8ba4\u8bc1\u201d"

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const-string v5, "\u65b0\u529f\u80fd\uff1a\u63a2\u63a2\u8ba4\u8bc1"

    .line 47
    .line 48
    :goto_0
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    const-string v2, "\u5b8c\u6210\u8ba4\u8bc1\u53ef\u8fdb\u4e00\u6b65\u63d0\u9ad8\u66dd\u5149\u548c\u914d\u5bf9\u6210\u529f\u7387\uff0c\u5feb\u53bb\u8bd5\u8bd5\u5427\uff01"

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const-string v2, "\u9080\u8bf7\u60a8\u4f53\u9a8c\u65b0\u4e0a\u7ebf\u7684\u9ad8\u7ea7\u8ba4\u8bc1\u529f\u80fd\uff0c\u5b8c\u6210\u771f\u5b9e\u5934\u50cf\u548c\u8eab\u4efd\u8ba4\u8bc1\u540e\u5c06\u83b7\u5f97\u4e13\u5c5e\u6807\u5fd7\uff0c\u66f4\u5bb9\u6613\u88ab\u559c\u6b22"

    .line 57
    .line 58
    :goto_1
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {v2, v4, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 72
    .line 73
    .line 74
    const-class p2, Lcom/p1/mobile/android/app/Dialog;

    .line 75
    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    const-string v2, "p_id_verification_other_guide"

    .line 79
    .line 80
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-static {v2, p2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    goto :goto_2

    .line 89
    :cond_2
    const-string v2, "p_id_verification_new_function_guide"

    .line 90
    .line 91
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-static {v2, p2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    :goto_2
    const-string v2, "tooltips_trigger_mode"

    .line 100
    .line 101
    const-string v3, "passive"

    .line 102
    .line 103
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    const-string v2, "tooltips_type"

    .line 108
    .line 109
    const-string v3, "alert"

    .line 110
    .line 111
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    const-string v2, "tooltips_type_ui"

    .line 116
    .line 117
    const-string v3, "alert_self_definition_basic"

    .line 118
    .line 119
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    const-string v2, "tooltips_trigger_page"

    .line 124
    .line 125
    const-string v3, "swipe_page"

    .line 126
    .line 127
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    const-string v2, "tooltips_trigger_reason"

    .line 132
    .line 133
    const-string v3, "guide"

    .line 134
    .line 135
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 136
    .line 137
    .line 138
    move-result-object v8

    .line 139
    const-string v2, "tooltips_trigger_module"

    .line 140
    .line 141
    const-string v3, "card"

    .line 142
    .line 143
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v9

    .line 147
    filled-new-array/range {v4 .. v9}, [Ll/pf60;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {p2, v2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    const/4 v1, 0x0

    .line 163
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    sget v2, Ll/dbc0;->mp:I

    .line 172
    .line 173
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->x0(Landroid/graphics/drawable/Drawable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    if-eqz p1, :cond_3

    .line 182
    .line 183
    const-string v1, "\u7acb\u5373\u8ba4\u8bc1\uff0c\u8ba9TA\u770b\u5230\u6211"

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_3
    const-string v1, "\u53bb\u8bd5\u8bd5"

    .line 187
    .line 188
    :goto_3
    new-instance v2, Ll/yki0;

    .line 189
    .line 190
    invoke-direct {v2, p1, p0}, Ll/yki0;-><init>(ZLandroid/content/Context;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    if-eqz p1, :cond_4

    .line 198
    .line 199
    const-string v0, "\u7a0d\u540e\u518d\u8bf4"

    .line 200
    .line 201
    goto :goto_4

    .line 202
    :cond_4
    const-string v0, "\u653e\u5f03\u4f53\u9a8c"

    .line 203
    .line 204
    :goto_4
    new-instance v1, Ll/yji0;

    .line 205
    .line 206
    invoke-direct {v1, p1}, Ll/yji0;-><init>(Z)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    new-instance p1, Ll/zji0;

    .line 214
    .line 215
    invoke-direct {p1, p2}, Ll/zji0;-><init>(Ll/l4g0;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 223
    .line 224
    .line 225
    invoke-static {p2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method public static K(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

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
    const-string v2, "p_id_verification_fail_guide"

    .line 13
    .line 14
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Q7:I

    .line 19
    .line 20
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget v3, Lcom/p1/mobile/putong/core/R$string;->P7:I

    .line 29
    .line 30
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget v3, Ll/dbc0;->kk:I

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget v3, Lcom/p1/mobile/putong/core/R$string;->T7:I

    .line 45
    .line 46
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    new-instance v4, Ll/vki0;

    .line 51
    .line 52
    invoke-direct {v4, p0}, Ll/vki0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, v3, v4}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    sget v3, Lcom/p1/mobile/putong/core/R$string;->f8:I

    .line 60
    .line 61
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance v3, Ll/wki0;

    .line 66
    .line 67
    invoke-direct {v3}, Ll/wki0;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, p0, v3}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    new-instance v2, Ll/xki0;

    .line 75
    .line 76
    invoke-direct {v2, v1}, Ll/xki0;-><init>(Ll/l4g0;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, v2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public static L(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_alert_avatar_verification_upgrade_guide_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, p0, v0}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;)V
    .locals 12

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
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ci:I

    .line 27
    .line 28
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    sget v2, Lcom/p1/mobile/putong/core/R$string;->c8:I

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :goto_0
    iget-object v3, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v3, Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_3

    .line 48
    .line 49
    iget-object v3, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v3, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Di:I

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    goto :goto_1

    .line 72
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ei:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    goto :goto_1

    .line 79
    :cond_3
    iget-object v3, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v3, Ljava/lang/Boolean;

    .line 82
    .line 83
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-nez v3, :cond_5

    .line 88
    .line 89
    iget-object v3, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast v3, Ljava/lang/Boolean;

    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-eqz v3, :cond_5

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Hi:I

    .line 106
    .line 107
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    goto :goto_1

    .line 112
    :cond_4
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ii:I

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    goto :goto_1

    .line 119
    :cond_5
    iget-object v3, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v3, Ljava/lang/Boolean;

    .line 122
    .line 123
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_7

    .line 128
    .line 129
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast v1, Ljava/lang/Boolean;

    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-nez v1, :cond_7

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_6

    .line 144
    .line 145
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Fi:I

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    goto :goto_1

    .line 152
    :cond_6
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Gi:I

    .line 153
    .line 154
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    goto :goto_1

    .line 159
    :cond_7
    const-string v0, ""

    .line 160
    .line 161
    :goto_1
    invoke-static {}, Ll/nrb0;->b()Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_8

    .line 166
    .line 167
    const-string v0, "\u5b8c\u6210\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1\uff0c\u53ef\u4ee5\u8bbe\u7f6e\u4f18\u5148\u770b\u771f\u5b9e\u5934\u50cf\u7528\u6237\uff0c\u627e\u5230\u540c\u6837\u771f\u8bda\u7684\u4eba\u3002"

    .line 168
    .line 169
    :cond_8
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 170
    .line 171
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 172
    .line 173
    .line 174
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    const-string v3, "p_verification_merge_popup"

    .line 181
    .line 182
    invoke-static {v3, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    const-string v3, "tooltips_trigger_mode"

    .line 187
    .line 188
    const-string v4, "passive"

    .line 189
    .line 190
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    const-string v3, "tooltips_type"

    .line 195
    .line 196
    const-string v4, "alert"

    .line 197
    .line 198
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 199
    .line 200
    .line 201
    move-result-object v6

    .line 202
    const-string v3, "tooltips_type_ui"

    .line 203
    .line 204
    const-string v4, "alert_self_definition_basic"

    .line 205
    .line 206
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 207
    .line 208
    .line 209
    move-result-object v7

    .line 210
    const-string v3, "tooltips_trigger_page"

    .line 211
    .line 212
    const-string v4, "swipe_page"

    .line 213
    .line 214
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 215
    .line 216
    .line 217
    move-result-object v8

    .line 218
    const-string v3, "tooltips_trigger_reason"

    .line 219
    .line 220
    const-string v4, "guide"

    .line 221
    .line 222
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 223
    .line 224
    .line 225
    move-result-object v9

    .line 226
    const-string v3, "tooltips_trigger_module"

    .line 227
    .line 228
    const-string v4, "null"

    .line 229
    .line 230
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 231
    .line 232
    .line 233
    move-result-object v10

    .line 234
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 235
    .line 236
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 237
    .line 238
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/d0;->W:Ll/vxd0;

    .line 239
    .line 240
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    check-cast v3, Ljava/lang/Integer;

    .line 245
    .line 246
    const-string v4, "verification_popup_user_times"

    .line 247
    .line 248
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 249
    .line 250
    .line 251
    move-result-object v11

    .line 252
    filled-new-array/range {v5 .. v11}, [Ll/pf60;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    invoke-virtual {v1, v3}, Ll/l4g0;->p([Ll/pf60;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 264
    .line 265
    .line 266
    move-result-object v3

    .line 267
    invoke-virtual {v3, v2}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    invoke-virtual {v2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    const/4 v2, 0x1

    .line 276
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->J(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    new-instance v2, Ll/aki0;

    .line 285
    .line 286
    invoke-direct {v2, v1}, Ll/aki0;-><init>(Ll/l4g0;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Is:I

    .line 294
    .line 295
    new-instance v3, Ll/bki0;

    .line 296
    .line 297
    invoke-direct {v3, p0}, Ll/bki0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    sget v2, Lcom/p1/mobile/putong/core/R$string;->b8:I

    .line 305
    .line 306
    new-instance v3, Ll/cki0;

    .line 307
    .line 308
    invoke-direct {v3}, Ll/cki0;-><init>()V

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 312
    .line 313
    .line 314
    sget v2, Ll/c9c0;->c2:I

    .line 315
    .line 316
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->T(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 317
    .line 318
    .line 319
    const/4 v2, 0x0

    .line 320
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->R(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 321
    .line 322
    .line 323
    const/16 v2, 0xc

    .line 324
    .line 325
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->U(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 326
    .line 327
    .line 328
    invoke-static {}, Ll/bnl0;->w0()I

    .line 329
    .line 330
    .line 331
    move-result v2

    .line 332
    const/16 v3, 0x4b0

    .line 333
    .line 334
    if-gt v2, v3, :cond_d

    .line 335
    .line 336
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    const-string v4, "ja"

    .line 345
    .line 346
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 347
    .line 348
    .line 349
    move-result v4

    .line 350
    if-nez v4, :cond_c

    .line 351
    .line 352
    const-string v4, "in"

    .line 353
    .line 354
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result v4

    .line 358
    if-nez v4, :cond_c

    .line 359
    .line 360
    const-string v4, "id"

    .line 361
    .line 362
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    move-result v4

    .line 366
    if-eqz v4, :cond_9

    .line 367
    .line 368
    goto :goto_2

    .line 369
    :cond_9
    const-string v4, "en"

    .line 370
    .line 371
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    move-result v2

    .line 375
    if-eqz v2, :cond_b

    .line 376
    .line 377
    invoke-static {}, Ll/bnl0;->w0()I

    .line 378
    .line 379
    .line 380
    move-result v2

    .line 381
    if-gt v2, v3, :cond_a

    .line 382
    .line 383
    const/high16 v2, 0x41200000    # 10.0f

    .line 384
    .line 385
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 386
    .line 387
    .line 388
    move-result v2

    .line 389
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->x(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 390
    .line 391
    .line 392
    :cond_a
    const/4 v2, 0x4

    .line 393
    goto :goto_3

    .line 394
    :cond_b
    const/16 v2, 0x14

    .line 395
    .line 396
    goto :goto_3

    .line 397
    :cond_c
    :goto_2
    const/16 v2, 0xa

    .line 398
    .line 399
    :goto_3
    int-to-float v2, v2

    .line 400
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 401
    .line 402
    .line 403
    move-result v2

    .line 404
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->d0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 405
    .line 406
    .line 407
    :cond_d
    sget v2, Ll/dbc0;->lk:I

    .line 408
    .line 409
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;->a0(Landroid/graphics/drawable/Drawable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 414
    .line 415
    .line 416
    move-result-object p0

    .line 417
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 418
    .line 419
    .line 420
    move-result-object p0

    .line 421
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 422
    .line 423
    .line 424
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 425
    .line 426
    .line 427
    return-void
.end method

.method public static N(Landroid/content/Context;)V
    .locals 9

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_id_verification_identify_confirm_guide"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "tooltips_trigger_mode"

    .line 14
    .line 15
    const-string v2, "passive"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v1, "tooltips_type"

    .line 22
    .line 23
    const-string v2, "alert"

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const-string v1, "tooltips_type_ui"

    .line 30
    .line 31
    const-string v2, "alert_system"

    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    const-string v1, "tooltips_trigger_page"

    .line 38
    .line 39
    const-string v2, "setting_page"

    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string v1, "tooltips_trigger_reason"

    .line 46
    .line 47
    const-string v2, "tips"

    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    const-string v1, "tooltips_trigger_module"

    .line 54
    .line 55
    const-string v2, "tantan_certified_recommend_first_button"

    .line 56
    .line 57
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    filled-new-array/range {v3 .. v8}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    sget v2, Lcom/p1/mobile/putong/core/R$string;->v8:I

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    sget v2, Lcom/p1/mobile/putong/core/R$string;->x8:I

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    sget v2, Lcom/p1/mobile/putong/core/R$string;->u8:I

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    sget v2, Lcom/p1/mobile/putong/core/R$string;->w8:I

    .line 92
    .line 93
    new-instance v3, Ll/fki0;

    .line 94
    .line 95
    invoke-direct {v3, p0}, Ll/fki0;-><init>(Landroid/content/Context;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    new-instance v1, Ll/gki0;

    .line 103
    .line 104
    invoke-direct {v1, v0}, Ll/gki0;-><init>(Ll/l4g0;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 112
    .line 113
    .line 114
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public static O(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 5

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
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez p1, :cond_4

    .line 21
    .line 22
    const-string p1, "p_id_verification_icon_explain_guide_unverified"

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    const-string p1, "p_id_verification_icon_explain_guide_verified"

    .line 29
    .line 30
    :cond_1
    const-class v2, Lcom/p1/mobile/android/app/Dialog;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {p1, v2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v2, Ll/jl80$a;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    sget p0, Lcom/p1/mobile/putong/core/R$string;->h8:I

    .line 51
    .line 52
    new-array v0, v3, [Ljava/lang/Object;

    .line 53
    .line 54
    invoke-virtual {v2, p0, v0}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sget v0, Lcom/p1/mobile/putong/core/R$string;->t8:I

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/jl80$a;->Z(I)Ll/jl80$a;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/R$string;->g8:I

    .line 65
    .line 66
    new-array v1, v3, [Ljava/lang/Object;

    .line 67
    .line 68
    invoke-virtual {v2, v0, v1}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    sget v1, Lcom/p1/mobile/putong/core/R$string;->d8:I

    .line 73
    .line 74
    new-instance v4, Ll/mki0;

    .line 75
    .line 76
    invoke-direct {v4, p0}, Ll/mki0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1, v4}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget v0, Lcom/p1/mobile/putong/core/R$string;->f8:I

    .line 84
    .line 85
    new-instance v1, Ll/nki0;

    .line 86
    .line 87
    invoke-direct {v1}, Ll/nki0;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v0, v1}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 91
    .line 92
    .line 93
    sget p0, Ll/dbc0;->v8:I

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/R$string;->h8:I

    .line 97
    .line 98
    new-array v1, v3, [Ljava/lang/Object;

    .line 99
    .line 100
    invoke-virtual {v2, v0, v1}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    sget v1, Lcom/p1/mobile/putong/core/R$string;->e8:I

    .line 105
    .line 106
    new-instance v4, Ll/oki0;

    .line 107
    .line 108
    invoke-direct {v4, p0}, Ll/oki0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1, v4}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    sget v0, Lcom/p1/mobile/putong/core/R$string;->f8:I

    .line 116
    .line 117
    new-instance v1, Ll/pki0;

    .line 118
    .line 119
    invoke-direct {v1}, Ll/pki0;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v0, v1}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 123
    .line 124
    .line 125
    :goto_0
    sget p0, Ll/dbc0;->w8:I

    .line 126
    .line 127
    :goto_1
    invoke-virtual {v2, p0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    sget v0, Lcom/p1/mobile/putong/core/R$string;->O7:I

    .line 132
    .line 133
    new-array v1, v3, [Ljava/lang/Object;

    .line 134
    .line 135
    invoke-virtual {p0, v0, v1}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 136
    .line 137
    .line 138
    new-instance p0, Ll/qki0;

    .line 139
    .line 140
    invoke-direct {p0, p1}, Ll/qki0;-><init>(Ll/l4g0;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2, p0}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 148
    .line 149
    .line 150
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_4
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    sget-object v0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_canceled_profile_id_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 163
    .line 164
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {p1, p0, v0}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public static P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 2

    .line 1
    const-string v0, "rejected"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object p2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_identityVerification_fail_popup_verificationCenter:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p1, p0, p2}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string v0, "invalid"

    .line 28
    .line 29
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-static {p0}, Ll/zki0;->K(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    const-string v0, "pending"

    .line 40
    .line 41
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget-object p2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_review_id_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p1, p0, p2}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    const-string v1, "verified"

    .line 66
    .line 67
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_6

    .line 72
    .line 73
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_5

    .line 86
    .line 87
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_3

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    sget-object p2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_review_id_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 109
    .line 110
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {p1, p0, p2}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    sget-object p2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_id_verification_unactivated_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 127
    .line 128
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p1, p0, p2}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_5
    :goto_0
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    sget-object p2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_identityVerification_succeed_popup_verificationCenter:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 145
    .line 146
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-virtual {p1, p0, p2}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    :cond_6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Dialog;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string p1, "\u91cd\u65b0\u4e0a\u4f20"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->p0(Ljava/lang/String;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->X()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 12
    .line 13
    .line 14
    const-string p1, "\u4e0a\u4f20\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5\uff01"

    .line 15
    .line 16
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string p1, "\u8fd4\u56de"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->n0(Ljava/lang/String;)Landroid/widget/TextView;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->X()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/lki0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/lki0;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic b()V
    .locals 2

    .line 1
    const-string v0, "e_id_verification_explain_cancel_click"

    .line 2
    .line 3
    const-string v1, "p_id_verification_icon_explain_guide_unverified"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/zki0;->D(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_id_verification_identify_confirm_guide_click"

    .line 5
    .line 6
    const-string v0, "p_id_verification_identify_confirm_guide"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d()V
    .locals 2

    .line 1
    const-string v0, "e_id_verification_explain_cancel_click"

    .line 2
    .line 3
    const-string v1, "p_id_verification_icon_explain_guide_unverified"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Ll/zq90;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "e_avatarVerification_explain_click"

    .line 4
    .line 5
    const-string v2, "p_avatarVerification_icon_explain_guide_Unverified"

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->s4()Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "pending"

    .line 19
    .line 20
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    const-string v1, "dialog"

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/R$string;->fs:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget v2, Lcom/p1/mobile/putong/core/R$string;->es:I

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget v3, Ll/dbc0;->jk:I

    .line 45
    .line 46
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Tr:I

    .line 47
    .line 48
    invoke-virtual {v0, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-virtual/range {p1 .. p1}, Ll/zq90;->K()Z

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    xor-int/lit8 v15, v5, 0x1

    .line 57
    .line 58
    const/4 v5, 0x0

    .line 59
    const/4 v6, 0x0

    .line 60
    const/4 v7, 0x0

    .line 61
    const/4 v8, 0x0

    .line 62
    const/4 v9, 0x0

    .line 63
    const/4 v10, 0x0

    .line 64
    const/4 v11, 0x1

    .line 65
    const/4 v12, 0x0

    .line 66
    const/4 v13, 0x0

    .line 67
    const/4 v14, 0x0

    .line 68
    invoke-static/range {v0 .. v15}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const-string v0, "verification_popup_operation"

    .line 2
    .line 3
    const-string v1, "confirm"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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
    const-string v1, "e_verification_merge_popup"

    .line 14
    .line 15
    const-string v2, "p_verification_merge_popup"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v0, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    const-string v0, "dialog"

    .line 39
    .line 40
    invoke-static {p0, v0}, Ll/hxf;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v0, Ljava/lang/Boolean;

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 77
    .line 78
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_1

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 87
    .line 88
    const-string v1, "invalid"

    .line 89
    .line 90
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_1

    .line 95
    .line 96
    const/4 v0, 0x0

    .line 97
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_1
    invoke-static {p0}, Ll/zki0;->D(Landroid/content/Context;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M0:Ll/u7b;

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/u7b;->d3(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    const-string v0, "e_avatarVerification_cancel_confirm_click"

    .line 11
    .line 12
    const-string v1, "p_avatarVerification_profile_cancel_alert"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    const-string v2, "pending"

    .line 28
    .line 29
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 42
    .line 43
    invoke-static {p0, v1, v0}, Ll/zki0;->P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-static {p0}, Ll/zki0;->D(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    const-string p0, "id_verification_button_state"

    .line 51
    .line 52
    const-string v0, "waiting_verification"

    .line 53
    .line 54
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    filled-new-array {p0}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, "e_id_verification_explain_confirm_click"

    .line 63
    .line 64
    const-string v1, "p_id_verification_icon_explain_guide_unverified"

    .line 65
    .line 66
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    invoke-static {p1, p0, p0}, Ll/l7y;->j(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic o(ZLandroid/content/Context;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "e_id_verification_other_guide_confirm_click"

    .line 4
    .line 5
    const-string v0, "p_id_verification_other_guide"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p0, "e_id_verification_new_function_guide_confirm_click"

    .line 12
    .line 13
    const-string v0, "p_id_verification_new_function_guide"

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-static {p1}, Ll/zki0;->D(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/putong/core/data/VerificationCenter;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-string v0, "\u4e0a\u4f20\u4e2d\u2026"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog;->p0(Ljava/lang/String;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->X()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/d0;->o4(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/tki0;

    .line 31
    .line 32
    invoke-direct {v0, p0, p2}, Ll/tki0;-><init>(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    new-instance p2, Ll/uki0;

    .line 36
    .line 37
    invoke-direct {p2, p0}, Ll/uki0;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic q()V
    .locals 2

    .line 1
    const-string v0, "e_id_verification_reverify_cancel_click"

    .line 2
    .line 3
    const-string v1, "p_id_verification_fail_guide"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic r()V
    .locals 3

    .line 1
    const-string v0, "verification_popup_operation"

    .line 2
    .line 3
    const-string v1, "refuse"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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
    const-string v1, "e_verification_merge_popup"

    .line 14
    .line 15
    const-string v2, "p_verification_merge_popup"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0, v0}, Ll/l7y;->j(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic t(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v()V
    .locals 2

    .line 1
    const-string v0, "e_avatarVerification_explain_cancle_click"

    .line 2
    .line 3
    const-string v1, "p_avatarVerification_icon_explain_guide_Unverified"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/zki0;->C(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "id_verification_button_state"

    .line 5
    .line 6
    const-string v0, "waiting_active"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "e_id_verification_explain_confirm_click"

    .line 17
    .line 18
    const-string v1, "p_id_verification_icon_explain_guide_unverified"

    .line 19
    .line 20
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic y(Z)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "e_id_verification_other_guide_cancel_click"

    .line 4
    .line 5
    const-string v0, "p_id_verification_other_guide"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "e_idVerification_newFunction_guide_cancle_click"

    .line 12
    .line 13
    const-string v0, "p_id_verification_new_function_guide"

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic z(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
