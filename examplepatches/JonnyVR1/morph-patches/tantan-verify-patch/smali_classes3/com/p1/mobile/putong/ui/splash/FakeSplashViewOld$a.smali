.class public Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;
.super Ll/cf60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->y()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cf60;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->k(Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->c:Lv/VPagerWormIndicator;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->b:Lv/VPager;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->getCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/lit8 v1, v1, -0x1

    .line 16
    .line 17
    if-ne p1, v1, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->b:Lv/VPager;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    add-int/lit8 p0, p0, 0x1

    .line 30
    .line 31
    :goto_0
    invoke-virtual {v0, p0}, Lv/VPagerWormIndicator;->setCurrentItem(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCount()I
    .locals 0

    const/4 p0, 0x3

    return p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->j:Lv/VText;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->g:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->m(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;I)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->h:Lv/VFrame_FixRatio;

    .line 27
    .line 28
    const v3, 0x3f9b26ca

    .line 29
    .line 30
    .line 31
    iput v3, v2, Lv/VFrame_FixRatio;->a:F

    .line 32
    .line 33
    invoke-static {}, Ll/ive0;->e()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 38
    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    iget-object v2, v3, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->j:Lv/VText;

    .line 42
    .line 43
    const/high16 v3, 0x41a00000    # 20.0f

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->j:Lv/VText;

    .line 51
    .line 52
    const/high16 v3, 0x42100000    # 36.0f

    .line 53
    .line 54
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->h:Lv/VFrame_FixRatio;

    .line 64
    .line 65
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-static {v2, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    iget-object v2, v3, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->j:Lv/VText;

    .line 74
    .line 75
    const/high16 v3, 0x41880000    # 17.0f

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 78
    .line 79
    .line 80
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 81
    .line 82
    iget-object v2, v2, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->j:Lv/VText;

    .line 83
    .line 84
    const/high16 v3, 0x41b80000    # 23.0f

    .line 85
    .line 86
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 94
    .line 95
    iget-object v2, v2, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->h:Lv/VFrame_FixRatio;

    .line 96
    .line 97
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    invoke-static {v2, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 105
    .line 106
    iget-object v2, v2, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->i:Lv/VImage;

    .line 107
    .line 108
    invoke-virtual {v2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 109
    .line 110
    .line 111
    if-nez p2, :cond_2

    .line 112
    .line 113
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 118
    .line 119
    if-eqz p1, :cond_1

    .line 120
    .line 121
    sget p1, Lcom/p1/mobile/putong/common/R$string;->I2:I

    .line 122
    .line 123
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 128
    .line 129
    sget v3, Lcom/p1/mobile/putong/common/R$string;->J2:I

    .line 130
    .line 131
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 144
    .line 145
    sget v3, Lcom/p1/mobile/putong/common/R$string;->J2:I

    .line 146
    .line 147
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    goto :goto_1

    .line 152
    :cond_1
    sget p1, Lcom/p1/mobile/putong/common/R$string;->i3:I

    .line 153
    .line 154
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 159
    .line 160
    sget v3, Lcom/p1/mobile/putong/common/R$string;->j3:I

    .line 161
    .line 162
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    const-string v2, "%1$s %2$s"

    .line 171
    .line 172
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 177
    .line 178
    sget v3, Lcom/p1/mobile/putong/common/R$string;->i3:I

    .line 179
    .line 180
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    goto :goto_1

    .line 185
    :cond_2
    const/4 p1, 0x1

    .line 186
    if-ne p2, p1, :cond_3

    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 189
    .line 190
    sget v2, Lcom/p1/mobile/putong/common/R$string;->h3:I

    .line 191
    .line 192
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 197
    .line 198
    sget v3, Lcom/p1/mobile/putong/common/R$string;->g3:I

    .line 199
    .line 200
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 213
    .line 214
    sget v3, Lcom/p1/mobile/putong/common/R$string;->g3:I

    .line 215
    .line 216
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    goto :goto_1

    .line 221
    :cond_3
    const/4 p1, 0x2

    .line 222
    if-ne p2, p1, :cond_4

    .line 223
    .line 224
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 225
    .line 226
    sget v2, Lcom/p1/mobile/putong/common/R$string;->f3:I

    .line 227
    .line 228
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 233
    .line 234
    sget v3, Lcom/p1/mobile/putong/common/R$string;->e3:I

    .line 235
    .line 236
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 249
    .line 250
    sget v3, Lcom/p1/mobile/putong/common/R$string;->e3:I

    .line 251
    .line 252
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->B(I)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    goto :goto_1

    .line 257
    :cond_4
    const/4 p1, 0x0

    .line 258
    move-object v2, p1

    .line 259
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 260
    .line 261
    invoke-static {v3, v0, p1, v2}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->n(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;->a:Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;

    .line 265
    .line 266
    iget-object p1, p1, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->b:Lv/VPager;

    .line 267
    .line 268
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 269
    .line 270
    .line 271
    new-instance p1, Ll/g4g;

    .line 272
    .line 273
    invoke-direct {p1, p0}, Ll/g4g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld$a;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v1, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 277
    .line 278
    .line 279
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-virtual {v1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 284
    .line 285
    .line 286
    return-object v1
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
