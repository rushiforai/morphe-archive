.class public Ll/jzw;
.super Ll/hzw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hzw<",
        "Ll/izw;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroid/widget/TextView;

.field public d:Lv/VLinear;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hzw;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic j(Ll/jzw;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jzw;->n()V

    return-void
.end method

.method public static bridge synthetic k(Ll/jzw;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jzw;->s(I)V

    return-void
.end method

.method public static bridge synthetic l(Ll/jzw;Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jzw;->u(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jzw;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/jzw;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/jzw;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jzw;->q()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/data/Settings;->new_()Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    long-to-double v0, v0

    .line 22
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 27
    .line 28
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iget-object p1, p0, Ll/jzw;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {p1, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    if-eqz p2, :cond_4

    .line 13
    .line 14
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->sn()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/16 v2, 0x17

    .line 37
    .line 38
    if-lt v0, v2, :cond_1

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    iget-object p1, p0, Ll/jzw;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setNormalAge(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/jzw;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 48
    .line 49
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setNormalAge(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/jzw;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 53
    .line 54
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setNormalAge(I)V

    .line 55
    .line 56
    .line 57
    :cond_1
    sget-object p1, Ll/pzi0;->k:Ljava/text/SimpleDateFormat;

    .line 58
    .line 59
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 68
    .line 69
    const-string v2, "MM"

    .line 70
    .line 71
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-direct {v0, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 76
    .line 77
    .line 78
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 79
    .line 80
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget-object v2, Ll/pzi0;->o:Ljava/text/SimpleDateFormat;

    .line 87
    .line 88
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 89
    .line 90
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 91
    .line 92
    invoke-virtual {v2, p2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    iget-object v2, p0, Ll/jzw;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 97
    .line 98
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Ll/jzw;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 102
    .line 103
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    invoke-virtual {v2, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 115
    .line 116
    .line 117
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    const/4 v3, 0x2

    .line 122
    invoke-virtual {v2, v3, v1}, Ljava/util/Calendar;->set(II)V

    .line 123
    .line 124
    .line 125
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    const/4 v4, 0x5

    .line 130
    invoke-virtual {v2, v4, v1}, Ljava/util/Calendar;->set(II)V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    sget-object v5, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 138
    .line 139
    invoke-virtual {v5}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 140
    .line 141
    .line 142
    move-result-wide v5

    .line 143
    invoke-virtual {v1, v5, v6}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 144
    .line 145
    .line 146
    invoke-static {v2, v1}, Ll/zab;->O(Ljava/util/Calendar;Ljava/util/Calendar;)I

    .line 147
    .line 148
    .line 149
    move-result v5

    .line 150
    const/16 v6, 0x64

    .line 151
    .line 152
    if-lt v5, v6, :cond_3

    .line 153
    .line 154
    if-ne v5, v6, :cond_2

    .line 155
    .line 156
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    if-ne v5, v3, :cond_2

    .line 165
    .line 166
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-ne v2, v1, :cond_2

    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_2
    iget-object p1, p0, Ll/jzw;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 178
    .line 179
    const-string p2, ""

    .line 180
    .line 181
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Ll/jzw;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 185
    .line 186
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Ll/jzw;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 190
    .line 191
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    const/4 p1, 0x0

    .line 195
    const/4 p2, -0x1

    .line 196
    invoke-static {p2, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o(III)V

    .line 197
    .line 198
    .line 199
    goto :goto_1

    .line 200
    :cond_3
    :goto_0
    iget-object v1, p0, Ll/jzw;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 201
    .line 202
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result p2

    .line 217
    invoke-static {p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o(III)V

    .line 218
    .line 219
    .line 220
    :goto_1
    iget-object p1, p0, Ll/jzw;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 221
    .line 222
    new-instance p2, Ll/jzw$a;

    .line 223
    .line 224
    invoke-direct {p2, p0}, Ll/jzw$a;-><init>(Ll/jzw;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V

    .line 228
    .line 229
    .line 230
    iget-object p1, p0, Ll/jzw;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 231
    .line 232
    new-instance p2, Ll/jzw$b;

    .line 233
    .line 234
    invoke-direct {p2, p0}, Ll/jzw$b;-><init>(Ll/jzw;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V

    .line 238
    .line 239
    .line 240
    iget-object p1, p0, Ll/jzw;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 241
    .line 242
    new-instance p2, Ll/jzw$c;

    .line 243
    .line 244
    invoke-direct {p2, p0}, Ll/jzw$c;-><init>(Ll/jzw;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V

    .line 248
    .line 249
    .line 250
    :cond_4
    :goto_2
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/izw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jzw;->p(Ll/izw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jzw;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kzw;->b(Ll/jzw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final n()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/z7c0;->a:I

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/jzw;->h:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public p(Ll/izw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q()Ljava/util/Calendar;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/jzw;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->getFinalNum()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/jzw;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->getFinalNum()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr v1, v2

    .line 29
    const/4 v2, 0x2

    .line 30
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/jzw;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->getFinalNum()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/4 v1, 0x5

    .line 40
    invoke-virtual {v0, v1, p0}, Ljava/util/Calendar;->set(II)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0xb

    .line 44
    .line 45
    const/16 v1, 0x8

    .line 46
    .line 47
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0xc

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 54
    .line 55
    .line 56
    const/16 p0, 0xd

    .line 57
    .line 58
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0xe

    .line 62
    .line 63
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public final s(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/jzw;->h:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->A3:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x6

    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Ll/jzw;->h:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->c0:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x2

    .line 40
    if-ne p1, v0, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Ll/jzw;->h:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->G3:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/4 v0, 0x3

    .line 59
    if-ne p1, v0, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Ll/jzw;->h:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->G3:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    const/4 v0, 0x4

    .line 78
    if-ne p1, v0, :cond_4

    .line 79
    .line 80
    iget-object p1, p0, Ll/jzw;->h:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->C3:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_4
    const/4 v0, 0x5

    .line 97
    if-ne p1, v0, :cond_5

    .line 98
    .line 99
    iget-object p1, p0, Ll/jzw;->h:Lv/VText;

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->B3:I

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    :cond_5
    :goto_0
    iget-object p0, p0, Ll/jzw;->h:Lv/VText;

    .line 115
    .line 116
    const/4 p1, 0x0

    .line 117
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    const-string p0, ""

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-le v0, v1, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sub-int/2addr v0, v1

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-interface {p0, v1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 44
    .line 45
    .line 46
    return-void
.end method
