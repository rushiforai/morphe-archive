.class public Ll/m93;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lv/VImage;

.field public g:Landroid/view/View;

.field public h:Landroid/widget/TextView;

.field public i:Lcom/tantan/library/svga/SVGAnimationView;

.field public j:Lcom/tantan/library/svga/SVGAnimationView;

.field public k:Ljava/lang/String;

.field public l:Lcom/p1/mobile/android/app/Act;

.field public m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/bgc0;->d:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    iput-object v0, p0, Ll/m93;->k:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v0, Ll/m93$a;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/m93$a;-><init>(Ll/m93;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/m93;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 16
    .line 17
    iput-object p1, p0, Ll/m93;->l:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/m93;->k:Ljava/lang/String;

    .line 24
    .line 25
    sget v1, Ll/pec0;->I0:I

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    const v2, 0x1020002

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Ll/ddc0;->h:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/widget/FrameLayout;

    .line 51
    .line 52
    const v2, 0x106000d

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, p0, Ll/m93;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 63
    .line 64
    const/4 v2, 0x3

    .line 65
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/m93;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 69
    .line 70
    const/4 v2, 0x1

    .line 71
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/m93;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 75
    .line 76
    iget-object v3, p0, Ll/m93;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 77
    .line 78
    invoke-virtual {v1, v3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 79
    .line 80
    .line 81
    sget v1, Ll/ddc0;->d:I

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Lv/VImage;

    .line 88
    .line 89
    iput-object v1, p0, Ll/m93;->f:Lv/VImage;

    .line 90
    .line 91
    const/16 v3, 0x99

    .line 92
    .line 93
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageAlpha(I)V

    .line 94
    .line 95
    .line 96
    sget v1, Ll/ddc0;->C:I

    .line 97
    .line 98
    invoke-virtual {p0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, p0, Ll/m93;->g:Landroid/view/View;

    .line 103
    .line 104
    new-instance v3, Ll/k93;

    .line 105
    .line 106
    invoke-direct {v3, p0, p1}, Ll/k93;-><init>(Ll/m93;Lcom/p1/mobile/android/app/Act;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    sget v1, Ll/ddc0;->v:I

    .line 113
    .line 114
    invoke-virtual {p0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Landroid/widget/TextView;

    .line 119
    .line 120
    iput-object v1, p0, Ll/m93;->h:Landroid/widget/TextView;

    .line 121
    .line 122
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ll/ric0;->m()Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    iget-object v3, p0, Ll/m93;->h:Landroid/widget/TextView;

    .line 134
    .line 135
    const-string v4, "\u7acb\u5373\u4f7f\u7528"

    .line 136
    .line 137
    const-string v5, "\u7acb\u5373\u83b7\u53d6"

    .line 138
    .line 139
    if-eqz v1, :cond_2

    .line 140
    .line 141
    invoke-static {}, Ll/joa;->S3()Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_1

    .line 146
    .line 147
    move-object v4, v5

    .line 148
    :cond_1
    invoke-static {v3, v4}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s8()Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_3

    .line 165
    .line 166
    move-object v4, v5

    .line 167
    :cond_3
    invoke-static {v3, v4}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    :goto_0
    iget-object v1, p0, Ll/m93;->h:Landroid/widget/TextView;

    .line 171
    .line 172
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-static {v3}, Ll/lny;->a(Landroid/content/Context;)Z

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    if-eqz v3, :cond_4

    .line 181
    .line 182
    sget v3, Ll/qa00;->j:I

    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_4
    sget v3, Ll/qa00;->A:I

    .line 186
    .line 187
    :goto_1
    invoke-static {v1, v3}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 188
    .line 189
    .line 190
    iget-object v1, p0, Ll/m93;->h:Landroid/widget/TextView;

    .line 191
    .line 192
    new-instance v3, Ll/l93;

    .line 193
    .line 194
    invoke-direct {v3, p0, p1, p2}, Ll/l93;-><init>(Ll/m93;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-static {p1}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 205
    .line 206
    .line 207
    sget p1, Ll/ddc0;->e:I

    .line 208
    .line 209
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    check-cast p1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 214
    .line 215
    iput-object p1, p0, Ll/m93;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 216
    .line 217
    sget p1, Ll/ddc0;->c:I

    .line 218
    .line 219
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    check-cast p1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 224
    .line 225
    iput-object p1, p0, Ll/m93;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 226
    .line 227
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    const-string p2, "https://auto.tancdn.com/v1/raw/c8af9bff-3dbd-425d-9be3-058125b716eb13.svga"

    .line 236
    .line 237
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    iget-object p2, p0, Ll/m93;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 246
    .line 247
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    const-string p2, "https://auto.tancdn.com/v1/raw/31429bf5-9bbd-42df-b607-5a5929f6256b12.svga"

    .line 259
    .line 260
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    invoke-virtual {p1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    iget-object p0, p0, Ll/m93;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 273
    .line 274
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 275
    .line 276
    .line 277
    return-void
.end method

.method public static bridge synthetic A(Ll/m93;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m93;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private synthetic F()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m93;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/m93;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic x(Ll/m93;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/m93;->E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/m93;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m93;->D(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/m93;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m93;->F()V

    return-void
.end method


# virtual methods
.method public final C()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m93;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic D(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/m93;->C()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "button_type"

    .line 6
    .line 7
    const-string v1, "close"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "e_boost_guide"

    .line 18
    .line 19
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/ric0;->m()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    sget-object p0, Ll/y9;->Companion:Ll/y9$a;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/y9$a;->r(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final synthetic E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/m93;->C()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const-string v0, "button_type"

    .line 6
    .line 7
    const-string v1, "open"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "e_boost_guide"

    .line 18
    .line 19
    invoke-static {v1, p3, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/ric0;->m()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    const/4 p3, 0x0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    sget-object p0, Ll/y9;->Companion:Ll/y9$a;

    .line 33
    .line 34
    invoke-virtual {p0, p1, p3, p2}, Ll/y9$a;->t(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-static {p1, p3, p2}, Ll/v83;->f(Landroid/content/Context;ZLjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public show()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    const-string v0, "e_boost_guide"

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/m93;->C()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/m93;->l:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    new-instance v1, Ll/j93;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/j93;-><init>(Ll/m93;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v2, 0xc8

    .line 21
    .line 22
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
