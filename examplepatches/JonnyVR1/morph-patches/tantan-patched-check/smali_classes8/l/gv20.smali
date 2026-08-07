.class public Ll/gv20;
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

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Ll/a0g;->E(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/newui/fake/b;->C(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b(Ll/kcg0;Ll/y20;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "fakeDialogExample"

    .line 7
    .line 8
    invoke-virtual {p2, v0, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/fph0;->o()V

    .line 15
    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/y20;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const-string p0, "e_fake_alert_popup_back_button"

    .line 9
    .line 10
    const-string p2, "p_fake_alert_popup_view"

    .line 11
    .line 12
    invoke-static {p0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public static synthetic d(Ljava/lang/Runnable;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/fph0;->n()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Ll/a0g;->E(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ll/gv20$a;

    .line 10
    .line 11
    invoke-direct {v2, p1}, Ll/gv20$a;-><init>(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/fake/b;->D(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic f()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/api/e0;->a()Lcom/p1/mobile/putong/core/api/e0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e0;->c(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic g(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_fake_alert_popup_age_change_button"

    .line 2
    .line 3
    const-string v0, "p_fake_alert_popup_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 15
    .line 16
    .line 17
    :cond_0
    const-string p0, "alert"

    .line 18
    .line 19
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    sget-object p2, Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct;->Companion:Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct$a;

    .line 23
    .line 24
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct$a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic h(Ll/jl80;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_fake_alert_popup_example"

    .line 2
    .line 3
    const-string v0, "p_fake_alert_popup_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {p0, p2, p1, v0}, Ll/ks90;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/Runnable;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/String;Ll/y20;Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    instance-of p4, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-virtual {p4}, Ll/hlh0;->d()Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    sget v0, Ll/kec0;->f3:I

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {p4, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    sget v0, Ll/adc0;->O:I

    .line 29
    .line 30
    invoke-virtual {p4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lv/VDraweeView;

    .line 35
    .line 36
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 37
    .line 38
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-virtual {v1, v0, v2, v3}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 56
    .line 57
    .line 58
    sget v0, Ll/adc0;->je:I

    .line 59
    .line 60
    invoke-virtual {p4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Landroid/widget/TextView;

    .line 65
    .line 66
    sget v1, Ll/adc0;->P1:I

    .line 67
    .line 68
    invoke-virtual {p4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Landroid/widget/TextView;

    .line 73
    .line 74
    sget v2, Ll/adc0;->Ra:I

    .line 75
    .line 76
    invoke-virtual {p4, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    sget v2, Ll/adc0;->Z0:I

    .line 84
    .line 85
    invoke-virtual {p4, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    sget v4, Ll/dbc0;->U:I

    .line 90
    .line 91
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    sget v2, Ll/adc0;->Y0:I

    .line 95
    .line 96
    invoke-virtual {p4, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    sget v4, Ll/dbc0;->U:I

    .line 101
    .line 102
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 103
    .line 104
    .line 105
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 108
    .line 109
    invoke-virtual {v2}, Ll/dkb;->k8()Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_1

    .line 114
    .line 115
    sget v2, Lcom/p1/mobile/putong/core/R$string;->A4:I

    .line 116
    .line 117
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    sget v0, Lcom/p1/mobile/putong/core/R$string;->B4:I

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_1
    sget v2, Lcom/p1/mobile/putong/core/R$string;->D4:I

    .line 135
    .line 136
    invoke-virtual {p0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    sget v0, Lcom/p1/mobile/putong/core/R$string;->C4:I

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    :goto_0
    new-instance v0, Ll/jl80$a;

    .line 153
    .line 154
    invoke-direct {v0, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, p4}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    const/4 v1, 0x1

    .line 162
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 171
    .line 172
    .line 173
    invoke-static {p2}, Ll/fph0;->p(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    sget p2, Ll/adc0;->Q0:I

    .line 177
    .line 178
    invoke-virtual {p4, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    new-instance v2, Ll/xu20;

    .line 183
    .line 184
    invoke-direct {v2, p3, v0}, Ll/xu20;-><init>(Ll/y20;Ll/jl80;)V

    .line 185
    .line 186
    .line 187
    invoke-static {p2, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 188
    .line 189
    .line 190
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 191
    .line 192
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 193
    .line 194
    invoke-virtual {p2}, Ll/dkb;->k8()Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    if-eqz p2, :cond_2

    .line 199
    .line 200
    sget p1, Ll/adc0;->Z0:I

    .line 201
    .line 202
    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 207
    .line 208
    .line 209
    const-string p2, "e_fake_alert_popup_age_change_button"

    .line 210
    .line 211
    const-string v2, "p_fake_alert_popup_view"

    .line 212
    .line 213
    invoke-static {p2, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    new-instance p2, Ll/yu20;

    .line 217
    .line 218
    invoke-direct {p2, v0, p0}, Ll/yu20;-><init>(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 219
    .line 220
    .line 221
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 229
    .line 230
    const/high16 v2, 0x41000000    # 8.0f

    .line 231
    .line 232
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    iput v2, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 237
    .line 238
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 239
    .line 240
    .line 241
    sget p1, Ll/adc0;->Y0:I

    .line 242
    .line 243
    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 248
    .line 249
    .line 250
    sget p1, Ll/adc0;->Ra:I

    .line 251
    .line 252
    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 257
    .line 258
    .line 259
    goto :goto_1

    .line 260
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/api/e0;->a()Lcom/p1/mobile/putong/core/api/e0;

    .line 261
    .line 262
    .line 263
    move-result-object p2

    .line 264
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/e0;->e()Z

    .line 265
    .line 266
    .line 267
    move-result p2

    .line 268
    if-eqz p2, :cond_3

    .line 269
    .line 270
    instance-of p2, p0, Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSwipeAct;

    .line 271
    .line 272
    if-nez p2, :cond_3

    .line 273
    .line 274
    goto :goto_2

    .line 275
    :cond_3
    sget p2, Ll/adc0;->Ra:I

    .line 276
    .line 277
    invoke-virtual {p4, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 278
    .line 279
    .line 280
    move-result-object p2

    .line 281
    new-instance v2, Ll/zu20;

    .line 282
    .line 283
    invoke-direct {v2, p0, p1}, Ll/zu20;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 284
    .line 285
    .line 286
    invoke-static {p2, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 287
    .line 288
    .line 289
    sget p2, Ll/adc0;->Y0:I

    .line 290
    .line 291
    invoke-virtual {p4, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object p2

    .line 295
    new-instance p4, Ll/av20;

    .line 296
    .line 297
    invoke-direct {p4, p1, v0}, Ll/av20;-><init>(Ljava/lang/Runnable;Ll/jl80;)V

    .line 298
    .line 299
    .line 300
    invoke-static {p2, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 301
    .line 302
    .line 303
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/fake/b;->q()Lrx/c;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    new-instance p2, Ll/bv20;

    .line 316
    .line 317
    invoke-direct {p2, v0}, Ll/bv20;-><init>(Ll/jl80;)V

    .line 318
    .line 319
    .line 320
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 321
    .line 322
    .line 323
    move-result-object p2

    .line 324
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    new-instance p2, Ll/cv20;

    .line 329
    .line 330
    invoke-direct {p2, p1, p3}, Ll/cv20;-><init>(Ll/kcg0;Ll/y20;)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v0, p2}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 337
    .line 338
    .line 339
    move-result p1

    .line 340
    if-nez p1, :cond_4

    .line 341
    .line 342
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    const-string p2, "fakeDialogExample"

    .line 347
    .line 348
    invoke-virtual {p1, v1, p2}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {v0}, Ll/jl80;->show()V

    .line 352
    .line 353
    .line 354
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 355
    .line 356
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 357
    .line 358
    invoke-virtual {p1}, Ll/dkb;->k8()Z

    .line 359
    .line 360
    .line 361
    move-result p1

    .line 362
    if-nez p1, :cond_4

    .line 363
    .line 364
    new-instance p1, Ll/dv20;

    .line 365
    .line 366
    invoke-direct {p1}, Ll/dv20;-><init>()V

    .line 367
    .line 368
    .line 369
    const-wide/16 p2, 0x1f4

    .line 370
    .line 371
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 372
    .line 373
    .line 374
    :cond_4
    :goto_2
    return-void
.end method

.method public static k(Lcom/p1/mobile/android/app/Act;)Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, Ll/ev20;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ev20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Ll/y20;)Ljava/lang/Runnable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Runnable;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/fv20;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/fv20;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static m(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/gv20;->k(Lcom/p1/mobile/android/app/Act;)Ljava/lang/Runnable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Ll/gv20;->n(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static n(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/gv20;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static o(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, Ll/gv20;->p(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static p(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0, p3}, Ll/gv20;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/String;Ll/y20;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
