.class public Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;
.super Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lv/VRelative;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VText;

.field public k:Lcom/tantan/library/svga/SVGAnimationView;

.field public l:Landroid/widget/FrameLayout;

.field public m:Lv/VText;

.field public n:Ljava/lang/String;

.field public o:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->n:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->n:Ljava/lang/String;

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->n(I)V

    return-void
.end method

.method public static synthetic i(Ll/z20;Landroid/view/View;)V
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

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->p(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->o(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic n(I)V
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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->e:Lv/VImage;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->e:Lv/VImage;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->f:Lv/VRelative;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->f:Lv/VRelative;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->e:Lv/VImage;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->f:Lv/VRelative;

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

.method private q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->k:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 5
    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->n:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->o:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public f(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ll/z20;)V
    .locals 12
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
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->n:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->h:Lv/VText;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->h:Lv/VText;

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v1, v4, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 37
    .line 38
    .line 39
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->g:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    const/4 v6, 0x2

    .line 56
    const/4 v7, 0x5

    .line 57
    invoke-virtual {v1, v4, v5, v6, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    const-string v1, "\u5979"

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    const-string v1, "\u4ed6"

    .line 70
    .line 71
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->d:Lv/VText;

    .line 72
    .line 73
    const-string v5, "%s\u548c\u4f60\u8fd8\u86ee\u5408\u9002\u7684\uff0c\u53bb\u548c%s\u804a\u804a\u5427\uff01"

    .line 74
    .line 75
    filled-new-array {v1, v1}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v5, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->i:Landroid/widget/TextView;

    .line 87
    .line 88
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    const/4 v4, 0x0

    .line 98
    if-eqz v1, :cond_3

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->i:Landroid/widget/TextView;

    .line 101
    .line 102
    sget v5, Ll/fbc0;->D:I

    .line 103
    .line 104
    invoke-virtual {v1, v4, v4, v5, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->i:Landroid/widget/TextView;

    .line 113
    .line 114
    if-eqz v1, :cond_4

    .line 115
    .line 116
    sget v1, Ll/fbc0;->z:I

    .line 117
    .line 118
    invoke-virtual {v5, v4, v4, v1, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 119
    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_4
    invoke-virtual {v5, v4, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 123
    .line 124
    .line 125
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->i:Landroid/widget/TextView;

    .line 126
    .line 127
    invoke-static {v1, v4, v4, v4}, Ll/bnl0;->l0(Landroid/view/View;IZZ)V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->j:Lv/VText;

    .line 131
    .line 132
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 149
    .line 150
    iget v5, v4, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 151
    .line 152
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 153
    .line 154
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 155
    .line 156
    invoke-interface {v2, v5, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ob(ILjava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    if-nez v4, :cond_5

    .line 165
    .line 166
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    const-string v2, " \u00b7 "

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-interface {v2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qj(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->j:Lv/VText;

    .line 190
    .line 191
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->m:Lv/VText;

    .line 199
    .line 200
    const-string v2, "\u7acb\u5373\u63a5\u542c 5s"

    .line 201
    .line 202
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    const-wide/16 v1, 0x1

    .line 206
    .line 207
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 208
    .line 209
    invoke-static {v1, v2, v4}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    const/4 v2, 0x6

    .line 214
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    new-instance v2, Ll/lxb0;

    .line 227
    .line 228
    invoke-direct {v2, p0, p1}, Ll/lxb0;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 229
    .line 230
    .line 231
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    invoke-virtual {v1, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->o:Ll/kcg0;

    .line 240
    .line 241
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->m:Lv/VText;

    .line 242
    .line 243
    new-instance v1, Ll/mxb0;

    .line 244
    .line 245
    invoke-direct {v1, p2}, Ll/mxb0;-><init>(Ll/z20;)V

    .line 246
    .line 247
    .line 248
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 249
    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->n:Ljava/lang/String;

    .line 252
    .line 253
    iget-object p2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 254
    .line 255
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-nez p1, :cond_6

    .line 260
    .line 261
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->f:Lv/VRelative;

    .line 262
    .line 263
    sget-object v5, Ll/gt0;->i:Landroid/util/Property;

    .line 264
    .line 265
    new-instance v10, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 266
    .line 267
    invoke-direct {v10}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 268
    .line 269
    .line 270
    new-array v11, v3, [F

    .line 271
    .line 272
    fill-array-data v11, :array_0

    .line 273
    .line 274
    .line 275
    const-wide/16 v6, 0xc8

    .line 276
    .line 277
    const-wide/16 v8, 0x258

    .line 278
    .line 279
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 284
    .line 285
    .line 286
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->tc()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->f:Lv/VRelative;

    .line 299
    .line 300
    new-instance v1, Ll/nxb0;

    .line 301
    .line 302
    invoke-direct {v1, p0, p1}, Ll/nxb0;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    const-wide/16 v2, 0x12c

    .line 306
    .line 307
    invoke-virtual {p2, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 308
    .line 309
    .line 310
    :cond_6
    iget-object p1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 311
    .line 312
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->n:Ljava/lang/String;

    .line 313
    .line 314
    return-void

    .line 315
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f75c28f    # 0.96f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oxb0;->a(Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ljava/lang/Long;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->m:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    const-wide/16 v3, 0x5

    .line 8
    .line 9
    sub-long v1, v3, v1

    .line 10
    .line 11
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "\u7acb\u5373\u63a5\u542c %ss"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    cmp-long p2, v0, v3

    .line 33
    .line 34
    if-ltz p2, :cond_0

    .line 35
    .line 36
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->p1:Lcom/p1/mobile/putong/core/api/CoreAudioMatch;

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreAudioMatch;->u3()Lrx/c;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->consume()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->q()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->q()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->l(Landroid/view/View;)V

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->e:Lv/VImage;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->f:Lv/VRelative;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->m:Lv/VText;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->a:Lv/VLinear;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->b:Lv/VImage;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->e:Lv/VImage;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->f:Lv/VRelative;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->b:Lv/VImage;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->c:Lv/VText;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->m:Lv/VText;

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
    new-instance v1, Ll/kxb0;

    .line 201
    .line 202
    invoke-direct {v1, p0, v0}, Ll/kxb0;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;I)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method public final synthetic p(Ljava/lang/String;)V
    .locals 1

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
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, -0x1

    .line 14
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView$a;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView$a;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->k:Lcom/tantan/library/svga/SVGAnimationView;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/QuickAudioCardView;->k:Lcom/tantan/library/svga/SVGAnimationView;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
