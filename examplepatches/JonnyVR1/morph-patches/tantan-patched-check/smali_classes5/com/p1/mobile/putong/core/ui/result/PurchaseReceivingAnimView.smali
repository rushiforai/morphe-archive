.class public Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/ImageView;

.field public final g:Landroid/view/animation/LinearInterpolator;

.field public h:Landroid/animation/ObjectAnimator;

.field public i:Landroid/animation/Animator;

.field public j:Landroid/animation/Animator;

.field public k:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->k:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->j:Landroid/animation/Animator;

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sgb0;->a(Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->i:Landroid/animation/Animator;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->h:Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->h:Landroid/animation/ObjectAnimator;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->j:Landroid/animation/Animator;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->j:Landroid/animation/Animator;

    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public final synthetic f(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "pageproducttype"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string p2, "e_pay_gift_get"

    .line 12
    .line 13
    const-string v0, "p_pay_result"

    .line 14
    .line 15
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->i()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/PrivilegeDetail;)V
    .locals 6

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
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 16
    .line 17
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->N:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 25
    .line 26
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->O:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_0
    const-string v1, "boost"

    .line 33
    .line 34
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const-string v2, "\n"

    .line 39
    .line 40
    const/high16 v3, 0x436a0000    # 234.0f

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f:Landroid/widget/ImageView;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget v4, Ll/jbc0;->x7:I

    .line 51
    .line 52
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->c:Lv/VDraweeView;

    .line 62
    .line 63
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const-string v5, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjNSS0NZTUhNTFBZMzJYSTJSQldXUjdENVdGRERGUTE0IiwidyI6NzA1LCJoIjo3MDUsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMjQwMTQ3NDExMTIyOTQ1Nn0.webp"

    .line 72
    .line 73
    invoke-virtual {p1, v1, v5, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 74
    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 77
    .line 78
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->i0:I

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v1, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 96
    .line 97
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->U:I

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const-string v1, "#f258d8"

    .line 111
    .line 112
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    const-string v2, "see"

    .line 117
    .line 118
    goto/16 :goto_1

    .line 119
    .line 120
    :cond_1
    const-string v1, "superLike"

    .line 121
    .line 122
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_2

    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f:Landroid/widget/ImageView;

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    sget v4, Ll/jbc0;->z7:I

    .line 135
    .line 136
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 141
    .line 142
    .line 143
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->c:Lv/VDraweeView;

    .line 146
    .line 147
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    const-string v5, "https://fe-static.tancdn.com/v1/images/eyJpZCI6Ijc2NUVPQlNPRlFUNjZEQzdZUVRXNTY0VFpRMkMyTDE0IiwidyI6NzA1LCJoIjo3MDUsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMjQwMTYxMTU0OTEzNDM1Mn0.webp"

    .line 156
    .line 157
    invoke-virtual {p1, v1, v5, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 158
    .line 159
    .line 160
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 161
    .line 162
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->j0:I

    .line 163
    .line 164
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    new-instance v1, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 180
    .line 181
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->T:I

    .line 182
    .line 183
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    const-string v1, "#3cc8fd"

    .line 195
    .line 196
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    const-string v2, "vip"

    .line 201
    .line 202
    goto :goto_1

    .line 203
    :cond_2
    const-string v1, "quickchatNumber"

    .line 204
    .line 205
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-eqz p1, :cond_3

    .line 210
    .line 211
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f:Landroid/widget/ImageView;

    .line 212
    .line 213
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    sget v4, Ll/jbc0;->y7:I

    .line 218
    .line 219
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 224
    .line 225
    .line 226
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 227
    .line 228
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->c:Lv/VDraweeView;

    .line 229
    .line 230
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 231
    .line 232
    .line 233
    move-result v4

    .line 234
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    const-string v5, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IllRS1pTU05XR09ENElYQldFNVNHWlpIVEE0RFFGMzE0IiwidyI6NzA1LCJoIjo3MDUsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDE0OTY3NDI5NzU0NDIwOH0.webp"

    .line 239
    .line 240
    invoke-virtual {p1, v1, v5, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 241
    .line 242
    .line 243
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 244
    .line 245
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->a0:I

    .line 246
    .line 247
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    new-instance v1, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 263
    .line 264
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->S:I

    .line 265
    .line 266
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    const-string v1, "#ff846b"

    .line 278
    .line 279
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    const-string v2, "quickchat"

    .line 284
    .line 285
    goto :goto_1

    .line 286
    :cond_3
    const-string p1, ""

    .line 287
    .line 288
    const/4 v1, 0x0

    .line 289
    move-object v2, p1

    .line 290
    :goto_1
    iget-wide v3, p2, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->count:J

    .line 291
    .line 292
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 293
    .line 294
    .line 295
    move-result-object p2

    .line 296
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object p2

    .line 300
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p2

    .line 304
    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    new-instance v3, Landroid/text/SpannableString;

    .line 309
    .line 310
    invoke-direct {v3, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 311
    .line 312
    .line 313
    new-instance p2, Landroid/text/style/ForegroundColorSpan;

    .line 314
    .line 315
    invoke-direct {p2, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    add-int/2addr p1, v0

    .line 323
    const/16 v1, 0x21

    .line 324
    .line 325
    invoke-virtual {v3, p2, v0, p1, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 326
    .line 327
    .line 328
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->d:Landroid/widget/TextView;

    .line 329
    .line 330
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 331
    .line 332
    .line 333
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->e:Landroid/widget/TextView;

    .line 334
    .line 335
    new-instance p2, Ll/rgb0;

    .line 336
    .line 337
    invoke-direct {p2, p0, v2}, Ll/rgb0;-><init>(Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 341
    .line 342
    .line 343
    const-string p0, "pageproducttype"

    .line 344
    .line 345
    invoke-static {p0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    filled-new-array {p0}, [Ll/pf60;

    .line 350
    .line 351
    .line 352
    move-result-object p0

    .line 353
    const-string p1, "e_pay_gift_get"

    .line 354
    .line 355
    const-string p2, "p_pay_result"

    .line 356
    .line 357
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 358
    .line 359
    .line 360
    return-void
.end method

.method public h()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->b:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 6
    .line 7
    const/4 v9, 0x2

    .line 8
    new-array v8, v9, [F

    .line 9
    .line 10
    fill-array-data v8, :array_0

    .line 11
    .line 12
    .line 13
    const-string v2, "alpha"

    .line 14
    .line 15
    const-wide/16 v3, 0x0

    .line 16
    .line 17
    const-wide/16 v5, 0x12c

    .line 18
    .line 19
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f:Landroid/widget/ImageView;

    .line 24
    .line 25
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 26
    .line 27
    new-array v3, v9, [F

    .line 28
    .line 29
    fill-array-data v3, :array_1

    .line 30
    .line 31
    .line 32
    const-string v11, "alpha"

    .line 33
    .line 34
    const-wide/16 v12, 0x0

    .line 35
    .line 36
    const-wide/16 v14, 0x12c

    .line 37
    .line 38
    move-object/from16 v16, v2

    .line 39
    .line 40
    move-object/from16 v17, v3

    .line 41
    .line 42
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->b:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    sget-object v11, Ll/gt0;->i:Landroid/util/Property;

    .line 49
    .line 50
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 51
    .line 52
    new-array v4, v9, [F

    .line 53
    .line 54
    fill-array-data v4, :array_2

    .line 55
    .line 56
    .line 57
    move-object/from16 v16, v3

    .line 58
    .line 59
    move-object/from16 v17, v4

    .line 60
    .line 61
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f:Landroid/widget/ImageView;

    .line 66
    .line 67
    sget-object v11, Ll/gt0;->i:Landroid/util/Property;

    .line 68
    .line 69
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 70
    .line 71
    new-array v5, v9, [F

    .line 72
    .line 73
    fill-array-data v5, :array_3

    .line 74
    .line 75
    .line 76
    move-object/from16 v16, v4

    .line 77
    .line 78
    move-object/from16 v17, v5

    .line 79
    .line 80
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    filled-new-array {v1, v2, v3, v4}, [Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->c:Lv/VDraweeView;

    .line 93
    .line 94
    new-array v3, v9, [F

    .line 95
    .line 96
    fill-array-data v3, :array_4

    .line 97
    .line 98
    .line 99
    const-string v4, "rotation"

    .line 100
    .line 101
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iput-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->h:Landroid/animation/ObjectAnimator;

    .line 106
    .line 107
    const-wide/16 v3, 0xbb8

    .line 108
    .line 109
    invoke-virtual {v2, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 110
    .line 111
    .line 112
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->h:Landroid/animation/ObjectAnimator;

    .line 113
    .line 114
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 115
    .line 116
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 117
    .line 118
    .line 119
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->h:Landroid/animation/ObjectAnimator;

    .line 120
    .line 121
    const/4 v3, -0x1

    .line 122
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 123
    .line 124
    .line 125
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->h:Landroid/animation/ObjectAnimator;

    .line 126
    .line 127
    new-array v3, v9, [Landroid/animation/Animator;

    .line 128
    .line 129
    const/4 v4, 0x0

    .line 130
    aput-object v1, v3, v4

    .line 131
    .line 132
    const/4 v1, 0x1

    .line 133
    aput-object v2, v3, v1

    .line 134
    .line 135
    invoke-static {v3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->i:Landroid/animation/Animator;

    .line 140
    .line 141
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :array_2
    .array-data 4
        0x3e99999a    # 0.3f
        0x3f800000    # 1.0f
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    :array_3
    .array-data 4
        0x3e99999a    # 0.3f
        0x3f800000    # 1.0f
    .end array-data

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    :array_4
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method public i()V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->e()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f:Landroid/widget/ImageView;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-static {}, Ll/bnl0;->w0()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    int-to-float v2, v2

    .line 18
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->b:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 21
    .line 22
    invoke-virtual {v3}, Landroid/view/View;->getAlpha()F

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/4 v11, 0x2

    .line 27
    new-array v10, v11, [F

    .line 28
    .line 29
    const/4 v12, 0x0

    .line 30
    aput v4, v10, v12

    .line 31
    .line 32
    const/4 v13, 0x1

    .line 33
    const/4 v4, 0x0

    .line 34
    aput v4, v10, v13

    .line 35
    .line 36
    const-string v4, "alpha"

    .line 37
    .line 38
    const-wide/16 v5, 0x0

    .line 39
    .line 40
    const-wide/16 v7, 0x12c

    .line 41
    .line 42
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f:Landroid/widget/ImageView;

    .line 47
    .line 48
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 49
    .line 50
    sub-float/2addr v2, v1

    .line 51
    new-array v1, v13, [F

    .line 52
    .line 53
    aput v2, v1, v12

    .line 54
    .line 55
    const-string v15, "translationY"

    .line 56
    .line 57
    const-wide/16 v16, 0x0

    .line 58
    .line 59
    const-wide/16 v18, 0x190

    .line 60
    .line 61
    move-object/from16 v21, v1

    .line 62
    .line 63
    move-object/from16 v20, v4

    .line 64
    .line 65
    invoke-static/range {v14 .. v21}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f:Landroid/widget/ImageView;

    .line 70
    .line 71
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 72
    .line 73
    invoke-virtual {v14}, Landroid/view/View;->getAlpha()F

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    new-array v5, v11, [F

    .line 78
    .line 79
    aput v4, v5, v12

    .line 80
    .line 81
    const v4, 0x3dcccccd    # 0.1f

    .line 82
    .line 83
    .line 84
    aput v4, v5, v13

    .line 85
    .line 86
    const-string v15, "alpha"

    .line 87
    .line 88
    move-object/from16 v20, v2

    .line 89
    .line 90
    move-object/from16 v21, v5

    .line 91
    .line 92
    invoke-static/range {v14 .. v21}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->f:Landroid/widget/ImageView;

    .line 97
    .line 98
    sget-object v15, Ll/gt0;->i:Landroid/util/Property;

    .line 99
    .line 100
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g:Landroid/view/animation/LinearInterpolator;

    .line 101
    .line 102
    invoke-virtual {v14}, Landroid/view/View;->getScaleX()F

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    new-array v6, v11, [F

    .line 107
    .line 108
    aput v5, v6, v12

    .line 109
    .line 110
    const v5, 0x3e99999a    # 0.3f

    .line 111
    .line 112
    .line 113
    aput v5, v6, v13

    .line 114
    .line 115
    move-object/from16 v20, v4

    .line 116
    .line 117
    move-object/from16 v21, v6

    .line 118
    .line 119
    invoke-static/range {v14 .. v21}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    filled-new-array {v3, v1, v2, v4}, [Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->j:Landroid/animation/Animator;

    .line 132
    .line 133
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->k:Ll/x20;

    .line 134
    .line 135
    if-eqz v2, :cond_0

    .line 136
    .line 137
    new-instance v2, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView$a;

    .line 138
    .line 139
    invoke-direct {v2, v0}, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView$a;-><init>(Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 143
    .line 144
    .line 145
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->j:Landroid/animation/Animator;

    .line 146
    .line 147
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->e()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->a:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->e:Landroid/widget/TextView;

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->L:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setExitAction(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->k:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
