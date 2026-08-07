.class public Ll/go1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/do1;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VLinear;

.field public c:Landroid/view/View;

.field public d:Lv/VFrame;

.field public e:Lv/VImage;

.field public f:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public g:Lcom/tantan/library/svga/SVGAnimationView;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public i:Lv/VText;

.field public j:Landroid/view/View;

.field public k:Lv/VFrame;

.field public l:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public m:Lv/VImage;

.field public n:Lv/VButton;

.field public o:Lcom/p1/mobile/android/app/Act;

.field public p:Ll/do1;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/go1;->o:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/go1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/go1;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/go1;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/go1;->j(Landroid/view/View;)V

    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/go1;->h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 2
    .line 3
    const-string v1, "#000000"

    .line 4
    .line 5
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/go1;->l:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 13
    .line 14
    sget v1, Ll/dbc0;->Kh:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/go1;->m:Lv/VImage;

    .line 20
    .line 21
    sget v0, Ll/dbc0;->Th:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/go1;->o:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ho1;->b(Ll/go1;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/do1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/go1;->p:Ll/do1;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    new-instance v0, Landroid/animation/LayoutTransition;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/go1;->b:Lv/VLinear;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/go1;->m:Lv/VImage;

    .line 17
    .line 18
    invoke-static {}, Ll/bnl0;->F0()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/go1;->m:Lv/VImage;

    .line 26
    .line 27
    new-instance v1, Ll/eo1;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/eo1;-><init>(Ll/go1;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/go1;->l:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 36
    .line 37
    new-instance v1, Ll/fo1;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/fo1;-><init>(Ll/go1;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/do1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/go1;->d(Ll/do1;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/go1;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/gra;->z()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Ll/go1;->e()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p1
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/go1;->p:Ll/do1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/do1;->C0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ll/u5d0;II)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "fake_risk_audit_default_"

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    iget-object v2, p0, Ll/go1;->f:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/go1;->c:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/u5d0;->y()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    int-to-float v1, v1

    .line 67
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/go1;->a:Lv/VImage;

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/u5d0;->x()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/go1;->e:Lv/VImage;

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/u5d0;->p()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Ll/u5d0;->w()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    const/4 v1, -0x1

    .line 101
    const/4 v2, 0x1

    .line 102
    if-nez v0, :cond_0

    .line 103
    .line 104
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p1}, Ll/u5d0;->w()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v3, Ll/go1$a;

    .line 125
    .line 126
    invoke-direct {v3, p0, p1}, Ll/go1$a;-><init>(Ll/go1;Ll/u5d0;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-object v3, p0, Ll/go1;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 138
    .line 139
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_0
    iget-object v0, p0, Ll/go1;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 144
    .line 145
    invoke-virtual {p1}, Ll/u5d0;->v()I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Ll/go1;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 153
    .line 154
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 155
    .line 156
    .line 157
    :goto_0
    iget-object v0, p0, Ll/go1;->h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 158
    .line 159
    invoke-virtual {p1}, Ll/u5d0;->u()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ll/go1;->i:Lv/VText;

    .line 167
    .line 168
    invoke-virtual {p1}, Ll/u5d0;->t()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/go1;->j:Landroid/view/View;

    .line 176
    .line 177
    invoke-virtual {p1}, Ll/u5d0;->z()Z

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {p1, v0}, Ll/u5d0;->r(Landroid/content/Context;)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iget-object v3, p0, Ll/go1;->l:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 193
    .line 194
    invoke-virtual {p1}, Ll/u5d0;->o()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Ll/go1;->k:Lv/VFrame;

    .line 202
    .line 203
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 204
    .line 205
    .line 206
    if-nez v0, :cond_1

    .line 207
    .line 208
    goto/16 :goto_6

    .line 209
    .line 210
    :cond_1
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 211
    .line 212
    const/4 v3, -0x2

    .line 213
    invoke-direct {p1, v1, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 214
    .line 215
    .line 216
    iget-object p0, p0, Ll/go1;->k:Lv/VFrame;

    .line 217
    .line 218
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 219
    .line 220
    .line 221
    instance-of p0, v0, Ll/z4m;

    .line 222
    .line 223
    if-eqz p0, :cond_2

    .line 224
    .line 225
    move-object p0, v0

    .line 226
    check-cast p0, Ll/z4m;

    .line 227
    .line 228
    invoke-interface {p0, p2, p3}, Ll/z4m;->L(II)V

    .line 229
    .line 230
    .line 231
    :cond_2
    invoke-static {}, Ll/gra;->z()Z

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    if-eqz p0, :cond_c

    .line 236
    .line 237
    sget p0, Ll/adc0;->y5:I

    .line 238
    .line 239
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    check-cast p0, Lv/VImage;

    .line 244
    .line 245
    sget p1, Ll/adc0;->A5:I

    .line 246
    .line 247
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    check-cast p1, Lv/VImage;

    .line 252
    .line 253
    sget p3, Ll/adc0;->C5:I

    .line 254
    .line 255
    invoke-virtual {v0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object p3

    .line 259
    check-cast p3, Lv/VImage;

    .line 260
    .line 261
    sget v1, Ll/adc0;->D5:I

    .line 262
    .line 263
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    check-cast v1, Lv/VImage;

    .line 268
    .line 269
    sget v3, Ll/adc0;->E5:I

    .line 270
    .line 271
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    check-cast v0, Lv/VImage;

    .line 276
    .line 277
    if-eqz p0, :cond_4

    .line 278
    .line 279
    if-ne p2, v2, :cond_3

    .line 280
    .line 281
    sget v3, Ll/dbc0;->E0:I

    .line 282
    .line 283
    goto :goto_1

    .line 284
    :cond_3
    sget v3, Ll/dbc0;->M0:I

    .line 285
    .line 286
    :goto_1
    invoke-virtual {p0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 287
    .line 288
    .line 289
    :cond_4
    if-eqz p1, :cond_6

    .line 290
    .line 291
    if-ne p2, v2, :cond_5

    .line 292
    .line 293
    sget p0, Ll/dbc0;->F0:I

    .line 294
    .line 295
    goto :goto_2

    .line 296
    :cond_5
    sget p0, Ll/dbc0;->N0:I

    .line 297
    .line 298
    :goto_2
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 299
    .line 300
    .line 301
    :cond_6
    if-eqz p3, :cond_8

    .line 302
    .line 303
    if-ne p2, v2, :cond_7

    .line 304
    .line 305
    sget p0, Ll/dbc0;->G0:I

    .line 306
    .line 307
    goto :goto_3

    .line 308
    :cond_7
    sget p0, Ll/dbc0;->O0:I

    .line 309
    .line 310
    :goto_3
    invoke-virtual {p3, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 311
    .line 312
    .line 313
    :cond_8
    if-eqz v1, :cond_a

    .line 314
    .line 315
    if-ne p2, v2, :cond_9

    .line 316
    .line 317
    sget p0, Ll/dbc0;->H0:I

    .line 318
    .line 319
    goto :goto_4

    .line 320
    :cond_9
    sget p0, Ll/dbc0;->P0:I

    .line 321
    .line 322
    :goto_4
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 323
    .line 324
    .line 325
    :cond_a
    if-eqz v0, :cond_c

    .line 326
    .line 327
    if-ne p2, v2, :cond_b

    .line 328
    .line 329
    sget p0, Ll/dbc0;->I0:I

    .line 330
    .line 331
    goto :goto_5

    .line 332
    :cond_b
    sget p0, Ll/dbc0;->Q0:I

    .line 333
    .line 334
    :goto_5
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 335
    .line 336
    .line 337
    :cond_c
    :goto_6
    return-void
.end method
