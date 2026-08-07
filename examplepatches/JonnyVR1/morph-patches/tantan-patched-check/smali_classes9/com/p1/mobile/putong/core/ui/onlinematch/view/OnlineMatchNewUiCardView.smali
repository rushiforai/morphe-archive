.class public Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;
.super Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VRelative;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Landroid/widget/FrameLayout;

.field public l:Lv/VText;

.field public m:Ljava/lang/String;

.field public final n:Ll/vxd0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->m:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p1, Ll/vxd0;

    .line 9
    .line 10
    const-string v0, "onlineMatchCardNewUiBlurRadius"

    .line 11
    .line 12
    const/4 v1, 0x5

    .line 13
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->n:Ll/vxd0;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->m:Ljava/lang/String;

    .line 21
    new-instance p1, Ll/vxd0;

    const-string p2, "onlineMatchCardNewUiBlurRadius"

    const/4 v0, 0x5

    invoke-direct {p1, p2, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->n:Ll/vxd0;

    return-void
.end method

.method public static synthetic h(Ll/z20;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-interface {p0, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->n()V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->m(I)V

    return-void
.end method

.method private l(Ll/z20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->l:Lv/VText;

    .line 2
    .line 3
    new-instance v0, Ll/su50;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/su50;-><init>(Ll/z20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public f(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ll/z20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;",
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 15
    .line 16
    invoke-static {p1}, Ll/wtd0;->d(Lcom/p1/mobile/putong/data/User;)J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    long-to-double v1, v1

    .line 21
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/api/f;->i3(Lcom/p1/mobile/putong/data/User;D)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->h:Lv/VText;

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->g:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->n:Ll/vxd0;

    .line 47
    .line 48
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Ljava/lang/Integer;

    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    const/4 v4, 0x2

    .line 59
    invoke-virtual {v0, v1, v2, v4, v3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->i:Lv/VText;

    .line 63
    .line 64
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    const/4 v1, 0x0

    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->i:Lv/VText;

    .line 77
    .line 78
    sget v2, Ll/dbc0;->Iq:I

    .line 79
    .line 80
    invoke-virtual {v0, v1, v1, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->i:Lv/VText;

    .line 89
    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    sget v0, Ll/dbc0;->Du:I

    .line 93
    .line 94
    invoke-virtual {v2, v1, v1, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    invoke-virtual {v2, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 99
    .line 100
    .line 101
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->i:Lv/VText;

    .line 102
    .line 103
    invoke-static {v0, v1, v1, v1}, Ll/bnl0;->l0(Landroid/view/View;IZZ)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->j:Lv/VText;

    .line 107
    .line 108
    const/4 v1, 0x1

    .line 109
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 118
    .line 119
    iget v2, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 122
    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->C(ILjava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-nez v2, :cond_3

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v1, " \u00b7 "

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    :cond_3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->H(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 148
    .line 149
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 150
    .line 151
    invoke-static {v2}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    const-string v2, "%1$s \u00b7 %2$s"

    .line 160
    .line 161
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->j:Lv/VText;

    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->l:Lv/VText;

    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_4

    .line 184
    .line 185
    const-string v1, "\u5979"

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_4
    const-string v1, "\u4ed6"

    .line 189
    .line 190
    :goto_1
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    const-string v2, "\u548c%s\u804a\u804a"

    .line 195
    .line 196
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->l(Ll/z20;)V

    .line 204
    .line 205
    .line 206
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->m:Ljava/lang/String;

    .line 207
    .line 208
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 209
    .line 210
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    if-nez p2, :cond_5

    .line 215
    .line 216
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->f:Lv/VRelative;

    .line 217
    .line 218
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 219
    .line 220
    new-instance v6, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 221
    .line 222
    invoke-direct {v6}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 223
    .line 224
    .line 225
    const/4 p2, 0x3

    .line 226
    new-array v7, p2, [F

    .line 227
    .line 228
    fill-array-data v7, :array_0

    .line 229
    .line 230
    .line 231
    const-wide/16 v2, 0xc8

    .line 232
    .line 233
    const-wide/16 v4, 0x258

    .line 234
    .line 235
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    invoke-virtual {p2}, Landroid/animation/Animator;->start()V

    .line 240
    .line 241
    .line 242
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->f:Lv/VRelative;

    .line 243
    .line 244
    new-instance v0, Ll/ru50;

    .line 245
    .line 246
    invoke-direct {v0, p0}, Ll/ru50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;)V

    .line 247
    .line 248
    .line 249
    const-wide/16 v1, 0x12c

    .line 250
    .line 251
    invoke-virtual {p2, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 252
    .line 253
    .line 254
    :cond_5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 255
    .line 256
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->m:Ljava/lang/String;

    .line 257
    .line 258
    return-void

    .line 259
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f75c28f    # 0.96f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vu50;->a(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(I)V
    .locals 3

    .line 1
    const/high16 v0, 0x43fa0000    # 500.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-le p1, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    mul-int/lit16 v0, p1, 0x159

    .line 11
    .line 12
    div-int/lit16 v0, v0, 0x258

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 21
    .line 22
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    mul-int/lit16 v0, p1, 0x13d

    .line 30
    .line 31
    div-int/lit16 v0, v0, 0x258

    .line 32
    .line 33
    mul-int/lit16 v1, v0, 0xdc

    .line 34
    .line 35
    div-int/lit16 v1, v1, 0x13d

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->f:Lv/VRelative;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 44
    .line 45
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->f:Lv/VRelative;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 53
    .line 54
    mul-int/lit16 v1, p1, 0x9b

    .line 55
    .line 56
    div-int/lit16 v1, v1, 0x258

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->f:Lv/VRelative;

    .line 62
    .line 63
    mul-int/lit16 p1, p1, 0xb2

    .line 64
    .line 65
    div-int/lit16 p1, p1, 0x258

    .line 66
    .line 67
    invoke-static {v0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;->e()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic n()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "https://auto.tancdn.com/v1/raw/b6726e7d-58d7-4b1d-97e5-48172706796c10.svga"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 8
    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->m:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-int/2addr v0, v1

    .line 24
    invoke-static {}, Ll/bnl0;->F0()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr v0, v1

    .line 29
    const/high16 v1, 0x42300000    # 44.0f

    .line 30
    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    sub-int/2addr v0, v1

    .line 36
    const/high16 v1, 0x42600000    # 56.0f

    .line 37
    .line 38
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    sub-int/2addr v0, v1

    .line 43
    const/high16 v1, 0x41c00000    # 24.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    sub-int/2addr v0, v1

    .line 50
    const/high16 v1, 0x41400000    # 12.0f

    .line 51
    .line 52
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    sub-int/2addr v0, v1

    .line 57
    const/high16 v1, 0x44160000    # 600.0f

    .line 58
    .line 59
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-lt v0, v1, :cond_0

    .line 64
    .line 65
    const/high16 v1, 0x44200000    # 640.0f

    .line 66
    .line 67
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    sub-int v1, v0, v1

    .line 72
    .line 73
    if-lez v1, :cond_2

    .line 74
    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 76
    .line 77
    const/high16 v3, 0x431b0000    # 155.0f

    .line 78
    .line 79
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    div-int/lit8 v1, v1, 0x2

    .line 84
    .line 85
    add-int/2addr v3, v1

    .line 86
    invoke-static {v2, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->f:Lv/VRelative;

    .line 90
    .line 91
    const/high16 v3, 0x43280000    # 168.0f

    .line 92
    .line 93
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    add-int/2addr v3, v1

    .line 98
    invoke-static {v2, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->l:Lv/VText;

    .line 102
    .line 103
    const/high16 v2, 0x42380000    # 46.0f

    .line 104
    .line 105
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-static {v1, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_0
    const/high16 v1, 0x43fa0000    # 500.0f

    .line 114
    .line 115
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->a:Lv/VLinear;

    .line 120
    .line 121
    if-lt v0, v1, :cond_1

    .line 122
    .line 123
    const/high16 v1, 0x40a00000    # 5.0f

    .line 124
    .line 125
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-static {v2, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->b:Lv/VImage;

    .line 133
    .line 134
    const/high16 v2, 0x41200000    # 10.0f

    .line 135
    .line 136
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 144
    .line 145
    const/high16 v2, 0x43020000    # 130.0f

    .line 146
    .line 147
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->f:Lv/VRelative;

    .line 155
    .line 156
    const/high16 v2, 0x430f0000    # 143.0f

    .line 157
    .line 158
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 163
    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_1
    const/4 v1, 0x0

    .line 167
    invoke-static {v2, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 168
    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->b:Lv/VImage;

    .line 171
    .line 172
    const/high16 v2, 0x40000000    # 2.0f

    .line 173
    .line 174
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 179
    .line 180
    .line 181
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->c:Lv/VText;

    .line 182
    .line 183
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    const/4 v2, 0x1

    .line 188
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 189
    .line 190
    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->l:Lv/VText;

    .line 192
    .line 193
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 198
    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;->i:Lv/VText;

    .line 201
    .line 202
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 203
    .line 204
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 205
    .line 206
    .line 207
    new-instance v1, Ll/qu50;

    .line 208
    .line 209
    invoke-direct {v1, p0, v0}, Ll/qu50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCardView;I)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 213
    .line 214
    .line 215
    return-void
.end method
