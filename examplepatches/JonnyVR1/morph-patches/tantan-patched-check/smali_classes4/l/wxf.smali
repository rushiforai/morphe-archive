.class public Ll/wxf;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wxf$b;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/xxf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wxf;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/jl80;Ll/uxj0;)V
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

.method public static synthetic b(Ll/kcg0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/fph0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/AppealInfo;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_fake_avatar_star_appeal"

    .line 2
    .line 3
    const-string v0, "p_fake_avatar_star"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 9
    .line 10
    const-string p2, "inProgress"

    .line 11
    .line 12
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    new-instance p0, Ll/dyf;

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ll/dyf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/dyf;->show()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic d(Ljava/lang/Runnable;Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_fake_avatar_star_change"

    .line 2
    .line 3
    const-string v0, "p_fake_avatar_star"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public static e()Ll/wxf;
    .locals 1

    .line 1
    invoke-static {}, Ll/wxf$b;->a()Ll/wxf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final f(Lcom/p1/mobile/android/app/Act;Lv/VText;ILjava/lang/Runnable;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    sget v0, Lcom/p1/mobile/putong/core/R$string;->J4:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    invoke-direct {v1, p3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/wxf$a;

    .line 33
    .line 34
    invoke-direct {v2, p0, p1, p4}, Ll/wxf$a;-><init>(Ll/wxf;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 46
    .line 47
    .line 48
    move-result p4

    .line 49
    add-int/2addr p1, p4

    .line 50
    const/16 p4, 0x21

    .line 51
    .line 52
    invoke-virtual {v1, v2, p0, p1, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 53
    .line 54
    .line 55
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 56
    .line 57
    const-string p1, "#FE7E1D"

    .line 58
    .line 59
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-direct {p0, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p3, v0

    .line 79
    invoke-virtual {v1, p0, p1, p3, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 90
    .line 91
    .line 92
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 93
    .line 94
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    sget p1, Ll/c9c0;->V1:I

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 105
    .line 106
    .line 107
    :cond_1
    :goto_0
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Lcom/p1/mobile/putong/core/data/AppealInfo;)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/kec0;->h3:I

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/jl80$a;

    .line 27
    .line 28
    invoke-direct {v1, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ll/jl80$a;->O()Ll/jl80;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-virtual {v1, v3}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 46
    .line 47
    .line 48
    sget v4, Ll/adc0;->O:I

    .line 49
    .line 50
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Lv/VDraweeView;

    .line 55
    .line 56
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 57
    .line 58
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 61
    .line 62
    invoke-virtual {v6}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-virtual {v5, v4, v6, v3}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 75
    .line 76
    .line 77
    sget v4, Ll/adc0;->je:I

    .line 78
    .line 79
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    check-cast v4, Lv/VText;

    .line 84
    .line 85
    sget v5, Lcom/p1/mobile/putong/core/R$string;->K4:I

    .line 86
    .line 87
    invoke-virtual {p1, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    sget v4, Ll/adc0;->P1:I

    .line 95
    .line 96
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    check-cast v4, Lv/VText;

    .line 101
    .line 102
    iget v5, p3, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 103
    .line 104
    if-nez v5, :cond_1

    .line 105
    .line 106
    sget v5, Lcom/p1/mobile/putong/core/R$string;->G4:I

    .line 107
    .line 108
    invoke-virtual {p0, p1, v4, v5, p2}, Ll/wxf;->f(Lcom/p1/mobile/android/app/Act;Lv/VText;ILjava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    if-ne v5, v2, :cond_2

    .line 113
    .line 114
    sget v5, Lcom/p1/mobile/putong/core/R$string;->H4:I

    .line 115
    .line 116
    invoke-virtual {p0, p1, v4, v5, p2}, Ll/wxf;->f(Lcom/p1/mobile/android/app/Act;Lv/VText;ILjava/lang/Runnable;)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_2
    sget v5, Lcom/p1/mobile/putong/core/R$string;->I4:I

    .line 121
    .line 122
    invoke-virtual {p0, p1, v4, v5, p2}, Ll/wxf;->f(Lcom/p1/mobile/android/app/Act;Lv/VText;ILjava/lang/Runnable;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    sget p0, Ll/adc0;->Y0:I

    .line 126
    .line 127
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    check-cast p0, Lv/VButton;

    .line 132
    .line 133
    sget v4, Lcom/p1/mobile/putong/core/R$string;->el:I

    .line 134
    .line 135
    invoke-virtual {p1, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    new-instance v4, Ll/sxf;

    .line 143
    .line 144
    invoke-direct {v4, p2, v1}, Ll/sxf;-><init>(Ljava/lang/Runnable;Ll/jl80;)V

    .line 145
    .line 146
    .line 147
    invoke-static {p0, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 148
    .line 149
    .line 150
    sget p0, Ll/adc0;->K:I

    .line 151
    .line 152
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    check-cast p0, Lv/VText;

    .line 157
    .line 158
    iget p2, p3, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 159
    .line 160
    if-nez p2, :cond_3

    .line 161
    .line 162
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    sget p2, Lcom/p1/mobile/putong/core/R$string;->E4:I

    .line 166
    .line 167
    invoke-virtual {p1, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_3
    if-ne p2, v2, :cond_4

    .line 176
    .line 177
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    sget p2, Lcom/p1/mobile/putong/core/R$string;->F4:I

    .line 181
    .line 182
    invoke-virtual {p1, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_4
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    :goto_1
    new-instance p2, Ll/txf;

    .line 194
    .line 195
    invoke-direct {p2, p3, p1}, Ll/txf;-><init>(Lcom/p1/mobile/putong/core/data/AppealInfo;Lcom/p1/mobile/android/app/Act;)V

    .line 196
    .line 197
    .line 198
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 199
    .line 200
    .line 201
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/fake/b;->q()Lrx/c;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-virtual {p1, p0, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    new-instance p2, Ll/uxf;

    .line 214
    .line 215
    invoke-direct {p2, v1}, Ll/uxf;-><init>(Ll/jl80;)V

    .line 216
    .line 217
    .line 218
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    new-instance p2, Ll/vxf;

    .line 227
    .line 228
    invoke-direct {p2, p0}, Ll/vxf;-><init>(Ll/kcg0;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v1, p2}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    if-nez p0, :cond_5

    .line 239
    .line 240
    invoke-virtual {v1}, Ll/jl80;->show()V

    .line 241
    .line 242
    .line 243
    iget p0, p3, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 244
    .line 245
    invoke-static {p0}, Ll/fph0;->u(I)V

    .line 246
    .line 247
    .line 248
    :cond_5
    :goto_2
    return-void
.end method
