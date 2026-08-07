.class public Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;

.field public e:Lv/VDraweeView;

.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Landroid/view/View;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public k:Landroid/widget/FrameLayout;

.field public l:Landroid/widget/FrameLayout;

.field public m:Lv/VDraweeView;

.field public n:Lv/VImage;

.field public o:Landroid/widget/FrameLayout;

.field public p:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public q:Landroid/widget/TextView;

.field public r:Landroid/widget/TextView;

.field public s:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->k0(I)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->l0(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method private synthetic k0(I)V
    .locals 7

    .line 1
    sget v0, Ll/qa00;->i:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->f:Landroid/view/View;

    .line 4
    .line 5
    new-instance v2, Ll/fnd0;

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    const/16 v3, 0x8

    .line 9
    .line 10
    new-array v3, v3, [F

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    aput v0, v3, v4

    .line 14
    .line 15
    const/4 v5, 0x1

    .line 16
    aput v0, v3, v5

    .line 17
    .line 18
    const/4 v5, 0x2

    .line 19
    const/4 v6, 0x0

    .line 20
    aput v6, v3, v5

    .line 21
    .line 22
    const/4 v5, 0x3

    .line 23
    aput v6, v3, v5

    .line 24
    .line 25
    const/4 v5, 0x4

    .line 26
    aput v6, v3, v5

    .line 27
    .line 28
    const/4 v5, 0x5

    .line 29
    aput v6, v3, v5

    .line 30
    .line 31
    const/4 v5, 0x6

    .line 32
    aput v0, v3, v5

    .line 33
    .line 34
    const/4 v5, 0x7

    .line 35
    aput v0, v3, v5

    .line 36
    .line 37
    invoke-direct {v2, v3, p1}, Ll/fnd0;-><init>([FI)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-static {v4, v0, v1, v2}, Landroid/graphics/Color;->argb(IIII)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    filled-new-array {p1, v0}, [I

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 64
    .line 65
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 66
    .line 67
    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->g:Landroid/view/View;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h520;->a(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l0(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->f:Landroid/view/View;

    .line 8
    .line 9
    new-instance p2, Ll/f520;

    .line 10
    .line 11
    invoke-direct {p2, p0, p3}, Ll/f520;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public m0(Ll/i420;Ljava/lang/Boolean;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->d:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;

    .line 2
    .line 3
    const/high16 v1, 0x42e00000    # 112.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/i420;->f()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Ll/i420;->c()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->f:Landroid/view/View;

    .line 33
    .line 34
    xor-int/lit8 v3, v0, 0x1

    .line 35
    .line 36
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->g:Landroid/view/View;

    .line 40
    .line 41
    xor-int/lit8 v3, v0, 0x1

    .line 42
    .line 43
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ll/i420;->e()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->s:Landroid/widget/TextView;

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    const/4 v5, 0x1

    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    move v6, v5

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    move v6, v4

    .line 61
    :goto_0
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->h:Landroid/view/View;

    .line 65
    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    sget v6, Ll/mbc0;->u0:I

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    sget v6, Ll/mbc0;->x:I

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    sget v6, Ll/mbc0;->x:I

    .line 77
    .line 78
    :goto_1
    invoke-virtual {v3, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->q:Landroid/widget/TextView;

    .line 82
    .line 83
    sget-object v6, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 84
    .line 85
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 86
    .line 87
    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->r:Landroid/widget/TextView;

    .line 89
    .line 90
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 91
    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->i:Landroid/widget/FrameLayout;

    .line 94
    .line 95
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->k:Landroid/widget/FrameLayout;

    .line 99
    .line 100
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->o:Landroid/widget/FrameLayout;

    .line 104
    .line 105
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->n:Lv/VImage;

    .line 109
    .line 110
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->l:Landroid/widget/FrameLayout;

    .line 114
    .line 115
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 116
    .line 117
    .line 118
    const/high16 v3, 0x41000000    # 8.0f

    .line 119
    .line 120
    const/high16 v6, 0x41a00000    # 20.0f

    .line 121
    .line 122
    if-eqz v2, :cond_5

    .line 123
    .line 124
    const/4 v2, -0x1

    .line 125
    if-eqz v0, :cond_3

    .line 126
    .line 127
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->q:Landroid/widget/TextView;

    .line 128
    .line 129
    sget v7, Lcom/p1/mobile/putong/live/base/R$string;->n0:I

    .line 130
    .line 131
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(I)V

    .line 132
    .line 133
    .line 134
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->q:Landroid/widget/TextView;

    .line 135
    .line 136
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    invoke-static {v3, v7}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 141
    .line 142
    .line 143
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->r:Landroid/widget/TextView;

    .line 144
    .line 145
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    invoke-static {v3, v6}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 150
    .line 151
    .line 152
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->o:Landroid/widget/FrameLayout;

    .line 153
    .line 154
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->p:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 158
    .line 159
    const-string v5, "https://auto.tancdn.com/v1/raw/77e1a643-4ab1-4215-a7df-cac7b55b884912.pdf"

    .line 160
    .line 161
    invoke-virtual {v3, v5, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 162
    .line 163
    .line 164
    goto/16 :goto_3

    .line 165
    .line 166
    :cond_3
    invoke-virtual {p1}, Ll/i420;->d()Z

    .line 167
    .line 168
    .line 169
    move-result v6

    .line 170
    iget-object v7, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->q:Landroid/widget/TextView;

    .line 171
    .line 172
    if-eqz v6, :cond_4

    .line 173
    .line 174
    sget v6, Lcom/p1/mobile/putong/live/base/R$string;->W:I

    .line 175
    .line 176
    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(I)V

    .line 177
    .line 178
    .line 179
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->s:Landroid/widget/TextView;

    .line 180
    .line 181
    sget v7, Lcom/p1/mobile/putong/live/base/R$string;->Y:I

    .line 182
    .line 183
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    .line 184
    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_4
    sget v6, Lcom/p1/mobile/putong/live/base/R$string;->N:I

    .line 188
    .line 189
    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(I)V

    .line 190
    .line 191
    .line 192
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->s:Landroid/widget/TextView;

    .line 193
    .line 194
    sget v7, Lcom/p1/mobile/putong/live/base/R$string;->p:I

    .line 195
    .line 196
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    .line 197
    .line 198
    .line 199
    :goto_2
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->q:Landroid/widget/TextView;

    .line 200
    .line 201
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 202
    .line 203
    .line 204
    move-result v7

    .line 205
    invoke-static {v6, v7}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 206
    .line 207
    .line 208
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->r:Landroid/widget/TextView;

    .line 209
    .line 210
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    invoke-static {v6, v3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 215
    .line 216
    .line 217
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->i:Landroid/widget/FrameLayout;

    .line 218
    .line 219
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 220
    .line 221
    .line 222
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->l:Landroid/widget/FrameLayout;

    .line 223
    .line 224
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 225
    .line 226
    .line 227
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 228
    .line 229
    const-string v5, "https://auto.tancdn.com/v1/raw/abba7f84-cd90-45f7-ae91-088c8c77a40111.pdf"

    .line 230
    .line 231
    invoke-virtual {v3, v5, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 232
    .line 233
    .line 234
    goto :goto_3

    .line 235
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->q:Landroid/widget/TextView;

    .line 236
    .line 237
    if-eqz v0, :cond_6

    .line 238
    .line 239
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    invoke-static {v2, v3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 244
    .line 245
    .line 246
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->r:Landroid/widget/TextView;

    .line 247
    .line 248
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    invoke-static {v2, v3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 253
    .line 254
    .line 255
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->n:Lv/VImage;

    .line 256
    .line 257
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 258
    .line 259
    .line 260
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->q:Landroid/widget/TextView;

    .line 261
    .line 262
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->y1:I

    .line 263
    .line 264
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 265
    .line 266
    .line 267
    goto :goto_3

    .line 268
    :cond_6
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 269
    .line 270
    .line 271
    move-result v6

    .line 272
    invoke-static {v2, v6}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 273
    .line 274
    .line 275
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->r:Landroid/widget/TextView;

    .line 276
    .line 277
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 278
    .line 279
    .line 280
    move-result v3

    .line 281
    invoke-static {v2, v3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 282
    .line 283
    .line 284
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->k:Landroid/widget/FrameLayout;

    .line 285
    .line 286
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 287
    .line 288
    .line 289
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->l:Landroid/widget/FrameLayout;

    .line 290
    .line 291
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 292
    .line 293
    .line 294
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->q:Landroid/widget/TextView;

    .line 295
    .line 296
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->o0:I

    .line 297
    .line 298
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 299
    .line 300
    .line 301
    :goto_3
    if-eqz v0, :cond_9

    .line 302
    .line 303
    invoke-virtual {p1}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 304
    .line 305
    .line 306
    move-result-object v2

    .line 307
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 308
    .line 309
    new-instance v3, Ljava/lang/StringBuilder;

    .line 310
    .line 311
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 312
    .line 313
    .line 314
    iget-object v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 315
    .line 316
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 317
    .line 318
    .line 319
    move-result-object v5

    .line 320
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 321
    .line 322
    .line 323
    move-result v6

    .line 324
    const-string v7, " "

    .line 325
    .line 326
    if-eqz v6, :cond_7

    .line 327
    .line 328
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v6

    .line 332
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 333
    .line 334
    iget-object v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->name:Ljava/lang/String;

    .line 335
    .line 336
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    goto :goto_4

    .line 343
    :cond_7
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v3

    .line 347
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 348
    .line 349
    .line 350
    move-result v5

    .line 351
    if-nez v5, :cond_8

    .line 352
    .line 353
    invoke-virtual {v3, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v3

    .line 357
    goto :goto_5

    .line 358
    :cond_8
    const-string v3, ""

    .line 359
    .line 360
    :goto_5
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->r:Landroid/widget/TextView;

    .line 361
    .line 362
    new-instance v6, Ljava/lang/StringBuilder;

    .line 363
    .line 364
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 365
    .line 366
    .line 367
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 371
    .line 372
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v2

    .line 379
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 380
    .line 381
    .line 382
    goto :goto_6

    .line 383
    :cond_9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->r:Landroid/widget/TextView;

    .line 384
    .line 385
    invoke-virtual {p1}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 386
    .line 387
    .line 388
    move-result-object v3

    .line 389
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 390
    .line 391
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 392
    .line 393
    .line 394
    :goto_6
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->n0(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    if-eqz v0, :cond_a

    .line 398
    .line 399
    sget p1, Ll/qa00;->i:I

    .line 400
    .line 401
    int-to-float p2, p1

    .line 402
    int-to-float v0, p1

    .line 403
    int-to-float v1, p1

    .line 404
    int-to-float p1, p1

    .line 405
    invoke-static {p2, v0, v1, p1}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 406
    .line 407
    .line 408
    move-result-object p1

    .line 409
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->e:Lv/VDraweeView;

    .line 410
    .line 411
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 412
    .line 413
    .line 414
    move-result-object p2

    .line 415
    check-cast p2, Ll/wlj;

    .line 416
    .line 417
    invoke-virtual {p2, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 418
    .line 419
    .line 420
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->e:Lv/VDraweeView;

    .line 421
    .line 422
    sget p1, Ll/mbc0;->t:I

    .line 423
    .line 424
    invoke-static {p0, p1}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 425
    .line 426
    .line 427
    return-void

    .line 428
    :cond_a
    sget p2, Ll/qa00;->i:I

    .line 429
    .line 430
    int-to-float v0, p2

    .line 431
    int-to-float p2, p2

    .line 432
    const/4 v1, 0x0

    .line 433
    invoke-static {v1, v0, p2, v1}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 434
    .line 435
    .line 436
    move-result-object p2

    .line 437
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->e:Lv/VDraweeView;

    .line 438
    .line 439
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    check-cast v0, Ll/wlj;

    .line 444
    .line 445
    invoke-virtual {v0, p2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 446
    .line 447
    .line 448
    invoke-virtual {p1}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 449
    .line 450
    .line 451
    move-result-object p1

    .line 452
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->getCoverUrl()Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object p1

    .line 456
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->e:Lv/VDraweeView;

    .line 457
    .line 458
    new-instance v0, Ll/q3d0;

    .line 459
    .line 460
    const/high16 v1, 0x44200000    # 640.0f

    .line 461
    .line 462
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 463
    .line 464
    .line 465
    move-result v2

    .line 466
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 467
    .line 468
    .line 469
    move-result v1

    .line 470
    invoke-direct {v0, v2, v1}, Ll/q3d0;-><init>(II)V

    .line 471
    .line 472
    .line 473
    invoke-static {v4, p1, p2, v0}, Ll/r230;->t(ZLjava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)Ljava/lang/String;

    .line 474
    .line 475
    .line 476
    move-result-object p1

    .line 477
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->e:Lv/VDraweeView;

    .line 478
    .line 479
    new-instance v0, Ll/e520;

    .line 480
    .line 481
    invoke-direct {v0, p0, p1}, Ll/e520;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    new-instance v1, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView$a;

    .line 485
    .line 486
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView$a;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;)V

    .line 487
    .line 488
    .line 489
    invoke-static {p2, p1, v0, v1}, Ll/g23;->f(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/hk70;Ll/fn2;)V

    .line 490
    .line 491
    .line 492
    return-void
.end method

.method public n0(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const-string v0, "context_square"

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p1}, Ll/g23;->g(I)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->m:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {v0, p0, p2, v1, p1}, Ll/izs;->p(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->m:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-static {v0, p0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
