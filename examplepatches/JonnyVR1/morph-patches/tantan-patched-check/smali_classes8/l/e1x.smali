.class public Ll/e1x;
.super Ll/hzw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/e1x$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hzw<",
        "Ll/d1x;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VScroll;

.field public d:Lv/VText;

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Ll/d1x;


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

.method public static bridge synthetic j(Ll/e1x;)Ll/d1x;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    return-object p0
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/e1x$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    packed-switch p1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_0
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 18
    .line 19
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 20
    .line 21
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 32
    .line 33
    return-void

    .line 34
    :pswitch_1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 39
    .line 40
    iget-object v0, p0, Ll/e1x;->f:Ll/d1x;

    .line 41
    .line 42
    iget-object v0, v0, Ll/d1x;->b:Ljava/lang/String;

    .line 43
    .line 44
    filled-new-array {v0}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateAddress:Ljava/util/List;

    .line 53
    .line 54
    :pswitch_2
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 63
    .line 64
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->T8(Ljava/lang/String;)Landroid/util/Pair;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 75
    .line 76
    iget-object p2, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast p2, Ljava/util/List;

    .line 79
    .line 80
    iput-object p2, p1, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 81
    .line 82
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast p0, Ljava/util/List;

    .line 85
    .line 86
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserWealth;->upperIncome:Ljava/util/List;

    .line 87
    .line 88
    return-void

    .line 89
    :pswitch_3
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 94
    .line 95
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 96
    .line 97
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 98
    .line 99
    filled-new-array {p0}, [Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateQualification:Ljava/util/List;

    .line 108
    .line 109
    return-void

    .line 110
    :pswitch_4
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 115
    .line 116
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 117
    .line 118
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 119
    .line 120
    filled-new-array {p0}, [Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateIncome:Ljava/util/List;

    .line 129
    .line 130
    return-void

    .line 131
    :pswitch_5
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 134
    .line 135
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 136
    .line 137
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 138
    .line 139
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 140
    .line 141
    filled-new-array {p0}, [Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserWealth;->monthlyCost:Ljava/util/List;

    .line 150
    .line 151
    return-void

    .line 152
    :pswitch_6
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 153
    .line 154
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 155
    .line 156
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 157
    .line 158
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 159
    .line 160
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 161
    .line 162
    filled-new-array {p0}, [Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->babyWilling:Ljava/util/List;

    .line 171
    .line 172
    return-void

    .line 173
    :pswitch_7
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 174
    .line 175
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 176
    .line 177
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 178
    .line 179
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 180
    .line 181
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 182
    .line 183
    filled-new-array {p0}, [Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->mateStatus:Ljava/util/List;

    .line 192
    .line 193
    return-void

    .line 194
    :pswitch_8
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 195
    .line 196
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 197
    .line 198
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 199
    .line 200
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 201
    .line 202
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 203
    .line 204
    filled-new-array {p0}, [Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 213
    .line 214
    return-void

    .line 215
    :pswitch_9
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 216
    .line 217
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 218
    .line 219
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 220
    .line 221
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 222
    .line 223
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 224
    .line 225
    filled-new-array {p0}, [Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserWealth;->car:Ljava/util/List;

    .line 234
    .line 235
    return-void

    .line 236
    :pswitch_a
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 237
    .line 238
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 239
    .line 240
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 241
    .line 242
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 243
    .line 244
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 245
    .line 246
    filled-new-array {p0}, [Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->expectedTime:Ljava/util/List;

    .line 255
    .line 256
    return-void

    .line 257
    :pswitch_b
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 258
    .line 259
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 260
    .line 261
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 262
    .line 263
    iget-object p0, p0, Ll/e1x;->f:Ll/d1x;

    .line 264
    .line 265
    iget-object p0, p0, Ll/d1x;->b:Ljava/lang/String;

    .line 266
    .line 267
    filled-new-array {p0}, [Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->status:Ljava/util/List;

    .line 276
    .line 277
    return-void

    .line 278
    nop

    .line 279
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/e1x;->d:Lv/VText;

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
    invoke-virtual {p2, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/e1x;->d:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getTitleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ll/e1x$b;

    .line 22
    .line 23
    invoke-static {p1}, Ll/l5x;->d(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {p2, p0, p1}, Ll/e1x$b;-><init>(Ll/e1x;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/e1x;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/d1x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e1x;->l(Ll/d1x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e1x;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/g1x;->b(Ll/e1x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/d1x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e1x;->f:Ll/d1x;

    .line 2
    .line 3
    return-void
.end method
