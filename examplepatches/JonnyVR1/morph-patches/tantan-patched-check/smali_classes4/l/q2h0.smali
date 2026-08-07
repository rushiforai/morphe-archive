.class public Ll/q2h0;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/android/app/Act$w<",
        "Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;",
        "Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lv/VDraweeView;

.field public final b:Landroid/widget/LinearLayout;

.field public c:F


# direct methods
.method public constructor <init>(Lv/VDraweeView;Landroid/widget/LinearLayout;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act$w;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/q2h0;->c:F

    .line 7
    .line 8
    iput-object p1, p0, Ll/q2h0;->a:Lv/VDraweeView;

    .line 9
    .line 10
    iput-object p2, p0, Ll/q2h0;->b:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic i(ILandroid/view/View;)V
    .locals 0

    .line 1
    int-to-float p0, p0

    .line 2
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic j(ILcom/p1/mobile/putong/core/ui/PictureView;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float p0, p0

    .line 6
    mul-float/2addr v0, p0

    .line 7
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Float;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    div-float/2addr v0, p0

    .line 18
    float-to-int p0, v0

    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-virtual {p1, p0, p2, p0, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/asj0;->d0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->V()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic l(Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 4
    .line 5
    new-instance v1, Ll/m2h0;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/m2h0;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Ll/q3m;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/q3m;->o2()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic m(Ll/q2h0;Ll/pf60;)Landroid/animation/Animator;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q2h0;->w(Ll/pf60;)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Landroid/view/View;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q2h0;->n(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/q2h0;->o(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic d(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/q2h0;->p(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic h(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/q2h0;->v(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->a3()Ll/q3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public o(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;
    .locals 36

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p2}, Ll/q2h0;->u(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ll/q3m;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-interface {v2, v3}, Ll/q3m;->r3(I)Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iget-object v2, v0, Ll/q2h0;->a:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v4}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-static {v4, v2, v5}, Ll/bnl0;->K0(Landroid/view/View;Ll/bnl0$g;Ll/bnl0$g;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v2, Ll/q3m;

    .line 38
    .line 39
    invoke-interface {v2}, Ll/q3m;->w3()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v5, v0, Ll/q2h0;->b:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    invoke-static {v5}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    iget-object v6, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v6, Ll/q3m;

    .line 52
    .line 53
    invoke-interface {v6}, Ll/q3m;->w3()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-static {v6}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-static {v2, v5, v6}, Ll/bnl0;->K0(Landroid/view/View;Ll/bnl0$g;Ll/bnl0$g;)V

    .line 62
    .line 63
    .line 64
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v2, Ll/q3m;

    .line 67
    .line 68
    invoke-interface {v2}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v5, Ll/q3m;

    .line 79
    .line 80
    invoke-interface {v5}, Ll/q3m;->U()Ll/bnl0$g;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-static {v4}, Ll/bnl0;->a0(Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    iget v6, v2, Ll/bnl0$g;->d:I

    .line 88
    .line 89
    iget v5, v5, Ll/bnl0$g;->b:I

    .line 90
    .line 91
    iget v2, v2, Ll/bnl0$g;->b:I

    .line 92
    .line 93
    sub-int/2addr v5, v2

    .line 94
    sub-int/2addr v6, v5

    .line 95
    const/high16 v2, 0x41f00000    # 30.0f

    .line 96
    .line 97
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    add-int v11, v6, v2

    .line 102
    .line 103
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v2, Ll/q3m;

    .line 106
    .line 107
    invoke-interface {v2}, Ll/q3m;->o0()Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iget v2, v2, Ll/bnl0$g;->a:I

    .line 116
    .line 117
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast v5, Ll/q3m;

    .line 120
    .line 121
    invoke-interface {v5}, Ll/q3m;->B1()Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    new-instance v6, Ll/j2h0;

    .line 126
    .line 127
    invoke-direct {v6, v11}, Ll/j2h0;-><init>(I)V

    .line 128
    .line 129
    .line 130
    invoke-static {v5, v6}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 131
    .line 132
    .line 133
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast v5, Ll/q3m;

    .line 136
    .line 137
    invoke-interface {v5}, Ll/q3m;->o0()Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    int-to-float v6, v2

    .line 142
    invoke-virtual {v5, v6}, Landroid/view/View;->setTranslationX(F)V

    .line 143
    .line 144
    .line 145
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast v5, Ll/q3m;

    .line 148
    .line 149
    invoke-interface {v5}, Ll/q3m;->o0()Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    const/high16 v6, 0x43b40000    # 360.0f

    .line 154
    .line 155
    invoke-virtual {v5, v6}, Landroid/view/View;->setRotation(F)V

    .line 156
    .line 157
    .line 158
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 159
    .line 160
    check-cast v5, Ll/q3m;

    .line 161
    .line 162
    invoke-interface {v5}, Ll/q3m;->J()Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    neg-int v2, v2

    .line 167
    int-to-float v2, v2

    .line 168
    invoke-virtual {v5, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 169
    .line 170
    .line 171
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 172
    .line 173
    check-cast v2, Ll/q3m;

    .line 174
    .line 175
    invoke-interface {v2}, Ll/q3m;->J()Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    const/high16 v5, -0x3c4c0000    # -360.0f

    .line 180
    .line 181
    invoke-virtual {v2, v5}, Landroid/view/View;->setRotation(F)V

    .line 182
    .line 183
    .line 184
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 185
    .line 186
    check-cast v2, Ll/q3m;

    .line 187
    .line 188
    invoke-interface {v2}, Ll/q3m;->S1()Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    int-to-float v5, v11

    .line 193
    invoke-virtual {v2, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 194
    .line 195
    .line 196
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 197
    .line 198
    check-cast v2, Ll/q3m;

    .line 199
    .line 200
    invoke-interface {v2}, Ll/q3m;->y1()Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {v2, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 205
    .line 206
    .line 207
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v2, Ll/q3m;

    .line 210
    .line 211
    invoke-interface {v2}, Ll/q3m;->q2()Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {v2, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 216
    .line 217
    .line 218
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 219
    .line 220
    check-cast v2, Ll/q3m;

    .line 221
    .line 222
    invoke-interface {v2}, Ll/q3m;->Q2()Landroid/view/View;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    const/4 v13, 0x0

    .line 227
    invoke-virtual {v2, v13}, Landroid/view/View;->setAlpha(F)V

    .line 228
    .line 229
    .line 230
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 231
    .line 232
    check-cast v2, Ll/q3m;

    .line 233
    .line 234
    invoke-interface {v2}, Ll/q3m;->Q2()Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    const/4 v14, 0x1

    .line 239
    new-array v5, v14, [F

    .line 240
    .line 241
    const/high16 v15, 0x3f800000    # 1.0f

    .line 242
    .line 243
    aput v15, v5, v3

    .line 244
    .line 245
    const-string v6, "alpha"

    .line 246
    .line 247
    invoke-static {v2, v6, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 248
    .line 249
    .line 250
    move-result-object v16

    .line 251
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 252
    .line 253
    check-cast v2, Ll/q3m;

    .line 254
    .line 255
    invoke-interface {v2}, Ll/q3m;->S1()Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v17

    .line 259
    invoke-virtual {v0}, Ll/q2h0;->r()I

    .line 260
    .line 261
    .line 262
    move-result v2

    .line 263
    int-to-long v5, v2

    .line 264
    invoke-virtual {v0}, Ll/q2h0;->t()I

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    int-to-long v7, v2

    .line 269
    sget-object v24, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 270
    .line 271
    new-array v2, v14, [F

    .line 272
    .line 273
    aput v13, v2, v3

    .line 274
    .line 275
    const-string v18, "translationY"

    .line 276
    .line 277
    move-wide/from16 v19, v5

    .line 278
    .line 279
    move-wide/from16 v21, v7

    .line 280
    .line 281
    move-object/from16 v23, v24

    .line 282
    .line 283
    move-object/from16 v24, v2

    .line 284
    .line 285
    invoke-static/range {v17 .. v24}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 286
    .line 287
    .line 288
    move-result-object v17

    .line 289
    move-object/from16 v24, v23

    .line 290
    .line 291
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 292
    .line 293
    check-cast v2, Ll/q3m;

    .line 294
    .line 295
    invoke-interface {v2}, Ll/q3m;->o0()Landroid/view/View;

    .line 296
    .line 297
    .line 298
    move-result-object v18

    .line 299
    invoke-virtual {v0}, Ll/q2h0;->r()I

    .line 300
    .line 301
    .line 302
    move-result v2

    .line 303
    int-to-long v5, v2

    .line 304
    invoke-virtual {v0}, Ll/q2h0;->t()I

    .line 305
    .line 306
    .line 307
    move-result v2

    .line 308
    int-to-long v7, v2

    .line 309
    new-array v2, v14, [F

    .line 310
    .line 311
    aput v13, v2, v3

    .line 312
    .line 313
    const-string v19, "translationX"

    .line 314
    .line 315
    move-object/from16 v25, v2

    .line 316
    .line 317
    move-wide/from16 v20, v5

    .line 318
    .line 319
    move-wide/from16 v22, v7

    .line 320
    .line 321
    invoke-static/range {v18 .. v25}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 326
    .line 327
    check-cast v5, Ll/q3m;

    .line 328
    .line 329
    invoke-interface {v5}, Ll/q3m;->o0()Landroid/view/View;

    .line 330
    .line 331
    .line 332
    move-result-object v18

    .line 333
    invoke-virtual {v0}, Ll/q2h0;->r()I

    .line 334
    .line 335
    .line 336
    move-result v5

    .line 337
    int-to-long v5, v5

    .line 338
    invoke-virtual {v0}, Ll/q2h0;->t()I

    .line 339
    .line 340
    .line 341
    move-result v7

    .line 342
    int-to-long v7, v7

    .line 343
    new-array v9, v14, [F

    .line 344
    .line 345
    aput v13, v9, v3

    .line 346
    .line 347
    const-string v19, "rotation"

    .line 348
    .line 349
    move-wide/from16 v20, v5

    .line 350
    .line 351
    move-wide/from16 v22, v7

    .line 352
    .line 353
    move-object/from16 v25, v9

    .line 354
    .line 355
    invoke-static/range {v18 .. v25}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 356
    .line 357
    .line 358
    move-result-object v26

    .line 359
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 360
    .line 361
    check-cast v5, Ll/q3m;

    .line 362
    .line 363
    invoke-interface {v5}, Ll/q3m;->J()Landroid/view/View;

    .line 364
    .line 365
    .line 366
    move-result-object v18

    .line 367
    invoke-virtual {v0}, Ll/q2h0;->r()I

    .line 368
    .line 369
    .line 370
    move-result v5

    .line 371
    int-to-long v5, v5

    .line 372
    invoke-virtual {v0}, Ll/q2h0;->t()I

    .line 373
    .line 374
    .line 375
    move-result v7

    .line 376
    int-to-long v7, v7

    .line 377
    new-array v9, v14, [F

    .line 378
    .line 379
    aput v13, v9, v3

    .line 380
    .line 381
    const-string v19, "translationX"

    .line 382
    .line 383
    move-wide/from16 v20, v5

    .line 384
    .line 385
    move-wide/from16 v22, v7

    .line 386
    .line 387
    move-object/from16 v25, v9

    .line 388
    .line 389
    invoke-static/range {v18 .. v25}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 390
    .line 391
    .line 392
    move-result-object v27

    .line 393
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 394
    .line 395
    check-cast v5, Ll/q3m;

    .line 396
    .line 397
    invoke-interface {v5}, Ll/q3m;->J()Landroid/view/View;

    .line 398
    .line 399
    .line 400
    move-result-object v18

    .line 401
    invoke-virtual {v0}, Ll/q2h0;->r()I

    .line 402
    .line 403
    .line 404
    move-result v5

    .line 405
    int-to-long v5, v5

    .line 406
    invoke-virtual {v0}, Ll/q2h0;->t()I

    .line 407
    .line 408
    .line 409
    move-result v7

    .line 410
    int-to-long v7, v7

    .line 411
    new-array v9, v14, [F

    .line 412
    .line 413
    aput v13, v9, v3

    .line 414
    .line 415
    const-string v19, "rotation"

    .line 416
    .line 417
    move-wide/from16 v20, v5

    .line 418
    .line 419
    move-wide/from16 v22, v7

    .line 420
    .line 421
    move-object/from16 v25, v9

    .line 422
    .line 423
    invoke-static/range {v18 .. v25}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 424
    .line 425
    .line 426
    move-result-object v21

    .line 427
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 428
    .line 429
    move-object v7, v5

    .line 430
    check-cast v7, Ll/q3m;

    .line 431
    .line 432
    invoke-virtual {v0}, Ll/q2h0;->r()I

    .line 433
    .line 434
    .line 435
    move-result v8

    .line 436
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 437
    .line 438
    .line 439
    move-result v9

    .line 440
    sget-object v34, Ll/gt0;->c:Landroid/view/animation/Interpolator;

    .line 441
    .line 442
    const/4 v12, 0x0

    .line 443
    move-object/from16 v10, v34

    .line 444
    .line 445
    invoke-static/range {v7 .. v12}, Ll/pza0;->e(Ll/q3m;IILandroid/view/animation/Interpolator;II)Landroid/animation/Animator;

    .line 446
    .line 447
    .line 448
    move-result-object v22

    .line 449
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 450
    .line 451
    check-cast v5, Ll/q3m;

    .line 452
    .line 453
    invoke-interface {v5}, Ll/q3m;->y1()Landroid/view/View;

    .line 454
    .line 455
    .line 456
    move-result-object v28

    .line 457
    invoke-virtual {v0}, Ll/q2h0;->r()I

    .line 458
    .line 459
    .line 460
    move-result v5

    .line 461
    int-to-long v5, v5

    .line 462
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 463
    .line 464
    .line 465
    move-result v7

    .line 466
    int-to-long v7, v7

    .line 467
    new-array v9, v14, [F

    .line 468
    .line 469
    aput v13, v9, v3

    .line 470
    .line 471
    const-string v29, "translationY"

    .line 472
    .line 473
    move-wide/from16 v30, v5

    .line 474
    .line 475
    move-wide/from16 v32, v7

    .line 476
    .line 477
    move-object/from16 v35, v9

    .line 478
    .line 479
    invoke-static/range {v28 .. v35}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 480
    .line 481
    .line 482
    move-result-object v23

    .line 483
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 484
    .line 485
    check-cast v5, Ll/q3m;

    .line 486
    .line 487
    invoke-interface {v5}, Ll/q3m;->q2()Landroid/view/View;

    .line 488
    .line 489
    .line 490
    move-result-object v28

    .line 491
    invoke-virtual {v0}, Ll/q2h0;->r()I

    .line 492
    .line 493
    .line 494
    move-result v5

    .line 495
    int-to-long v5, v5

    .line 496
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 497
    .line 498
    .line 499
    move-result v7

    .line 500
    int-to-long v7, v7

    .line 501
    new-array v9, v14, [F

    .line 502
    .line 503
    aput v13, v9, v3

    .line 504
    .line 505
    const-string v29, "translationY"

    .line 506
    .line 507
    move-wide/from16 v30, v5

    .line 508
    .line 509
    move-wide/from16 v32, v7

    .line 510
    .line 511
    move-object/from16 v35, v9

    .line 512
    .line 513
    invoke-static/range {v28 .. v35}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 514
    .line 515
    .line 516
    move-result-object v24

    .line 517
    sget-object v5, Ll/gt0;->i:Landroid/util/Property;

    .line 518
    .line 519
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 520
    .line 521
    .line 522
    move-result v6

    .line 523
    int-to-long v8, v6

    .line 524
    sget-object v34, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 525
    .line 526
    new-array v11, v14, [F

    .line 527
    .line 528
    aput v15, v11, v3

    .line 529
    .line 530
    const-wide/16 v6, 0x0

    .line 531
    .line 532
    move-object/from16 v10, v34

    .line 533
    .line 534
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 535
    .line 536
    .line 537
    move-result-object v25

    .line 538
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 539
    .line 540
    .line 541
    move-result v5

    .line 542
    int-to-long v8, v5

    .line 543
    new-array v11, v14, [F

    .line 544
    .line 545
    aput v13, v11, v3

    .line 546
    .line 547
    const-string v5, "translationX"

    .line 548
    .line 549
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 550
    .line 551
    .line 552
    move-result-object v12

    .line 553
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 554
    .line 555
    .line 556
    move-result v5

    .line 557
    int-to-long v8, v5

    .line 558
    new-array v11, v14, [F

    .line 559
    .line 560
    aput v13, v11, v3

    .line 561
    .line 562
    const-string v5, "translationY"

    .line 563
    .line 564
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 565
    .line 566
    .line 567
    move-result-object v5

    .line 568
    iget-object v6, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 569
    .line 570
    check-cast v6, Ll/q3m;

    .line 571
    .line 572
    invoke-interface {v6}, Ll/q3m;->w3()Landroid/view/View;

    .line 573
    .line 574
    .line 575
    move-result-object v28

    .line 576
    sget-object v29, Ll/gt0;->i:Landroid/util/Property;

    .line 577
    .line 578
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 579
    .line 580
    .line 581
    move-result v6

    .line 582
    int-to-long v6, v6

    .line 583
    new-array v8, v14, [F

    .line 584
    .line 585
    aput v15, v8, v3

    .line 586
    .line 587
    const-wide/16 v30, 0x0

    .line 588
    .line 589
    move-wide/from16 v32, v6

    .line 590
    .line 591
    move-object/from16 v35, v8

    .line 592
    .line 593
    invoke-static/range {v28 .. v35}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 594
    .line 595
    .line 596
    move-result-object v6

    .line 597
    iget-object v7, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 598
    .line 599
    check-cast v7, Ll/q3m;

    .line 600
    .line 601
    invoke-interface {v7}, Ll/q3m;->w3()Landroid/view/View;

    .line 602
    .line 603
    .line 604
    move-result-object v28

    .line 605
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 606
    .line 607
    .line 608
    move-result v7

    .line 609
    int-to-long v7, v7

    .line 610
    new-array v9, v14, [F

    .line 611
    .line 612
    aput v13, v9, v3

    .line 613
    .line 614
    const-string v29, "translationX"

    .line 615
    .line 616
    move-wide/from16 v32, v7

    .line 617
    .line 618
    move-object/from16 v35, v9

    .line 619
    .line 620
    invoke-static/range {v28 .. v35}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 621
    .line 622
    .line 623
    move-result-object v7

    .line 624
    iget-object v8, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 625
    .line 626
    check-cast v8, Ll/q3m;

    .line 627
    .line 628
    invoke-interface {v8}, Ll/q3m;->w3()Landroid/view/View;

    .line 629
    .line 630
    .line 631
    move-result-object v28

    .line 632
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 633
    .line 634
    .line 635
    move-result v0

    .line 636
    int-to-long v8, v0

    .line 637
    new-array v0, v14, [F

    .line 638
    .line 639
    aput v13, v0, v3

    .line 640
    .line 641
    const-string v29, "translationY"

    .line 642
    .line 643
    move-object/from16 v35, v0

    .line 644
    .line 645
    move-wide/from16 v32, v8

    .line 646
    .line 647
    invoke-static/range {v28 .. v35}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 648
    .line 649
    .line 650
    move-result-object v30

    .line 651
    move-object/from16 v18, v2

    .line 652
    .line 653
    move-object/from16 v28, v6

    .line 654
    .line 655
    move-object/from16 v29, v7

    .line 656
    .line 657
    move-object/from16 v19, v26

    .line 658
    .line 659
    move-object/from16 v20, v27

    .line 660
    .line 661
    move-object/from16 v27, v5

    .line 662
    .line 663
    move-object/from16 v26, v12

    .line 664
    .line 665
    filled-new-array/range {v16 .. v30}, [Landroid/animation/Animator;

    .line 666
    .line 667
    .line 668
    move-result-object v0

    .line 669
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 670
    .line 671
    .line 672
    move-result-object v0

    .line 673
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 674
    .line 675
    check-cast v2, Ll/q3m;

    .line 676
    .line 677
    invoke-interface {v2}, Ll/q3m;->k3()V

    .line 678
    .line 679
    .line 680
    new-instance v2, Ll/k2h0;

    .line 681
    .line 682
    invoke-direct {v2, v1, v4}, Ll/k2h0;-><init>(Ll/pf60;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 683
    .line 684
    .line 685
    invoke-static {v0, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 686
    .line 687
    .line 688
    move-result-object v0

    .line 689
    return-object v0

    .line 690
    :cond_0
    const/4 v0, 0x0

    .line 691
    return-object v0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;
    .locals 6

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q2h0;->u(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    iget-object p1, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/q3m;

    .line 8
    .line 9
    invoke-interface {p1}, Ll/q3m;->u2()Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 p2, 0x0

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    return-object p2

    .line 17
    :cond_0
    invoke-virtual {p1}, Lv/VPager;->b0()V

    .line 18
    .line 19
    .line 20
    iget-object v0, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Ll/q3m;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/bnl0;->u(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Ll/bnl0;->v(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Ll/q3m;

    .line 37
    .line 38
    invoke-interface {v0}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 57
    .line 58
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0, v4}, Ll/q2h0;->w(Ll/pf60;)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_1
    const/16 p1, 0xbb8

    .line 70
    .line 71
    invoke-static {p1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-static {}, Ll/bnl0;->y0()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    int-to-float p1, p1

    .line 80
    const v0, 0x3f4ccccd    # 0.8f

    .line 81
    .line 82
    .line 83
    div-float/2addr p1, v0

    .line 84
    float-to-int v3, p1

    .line 85
    iget-object p1, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 86
    .line 87
    check-cast p1, Ll/q3m;

    .line 88
    .line 89
    invoke-interface {p1}, Ll/t3m;->i3()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    add-int v2, v3, p1

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/q2h0;->q()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    int-to-float p1, p1

    .line 100
    int-to-float v1, v2

    .line 101
    div-float/2addr p1, v1

    .line 102
    int-to-float v1, v0

    .line 103
    mul-float/2addr p1, v1

    .line 104
    float-to-int p1, p1

    .line 105
    int-to-float p1, p1

    .line 106
    sub-float p1, v1, p1

    .line 107
    .line 108
    div-float/2addr p1, v1

    .line 109
    iput p1, p0, Ll/q2h0;->c:F

    .line 110
    .line 111
    const v1, 0x3c23d70a    # 0.01f

    .line 112
    .line 113
    .line 114
    cmpg-float p1, p1, v1

    .line 115
    .line 116
    if-gtz p1, :cond_2

    .line 117
    .line 118
    iput v1, p0, Ll/q2h0;->c:F

    .line 119
    .line 120
    :cond_2
    const/4 p1, 0x0

    .line 121
    filled-new-array {v2, p1}, [I

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    int-to-long v0, v0

    .line 130
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 134
    .line 135
    .line 136
    new-instance v0, Ll/q2h0$a;

    .line 137
    .line 138
    move-object v1, p0

    .line 139
    invoke-direct/range {v0 .. v5}, Ll/q2h0$a;-><init>(Ll/q2h0;IILl/pf60;Landroid/animation/Animator;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 143
    .line 144
    .line 145
    new-instance p0, Ll/l2h0;

    .line 146
    .line 147
    invoke-direct {p0, p1}, Ll/l2h0;-><init>(Landroid/animation/ValueAnimator;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v5, p0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 151
    .line 152
    .line 153
    return-object v5
.end method

.method public final q()I
    .locals 1

    .line 1
    iget p0, p0, Ll/q2h0;->c:F

    .line 2
    .line 3
    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, p0, v0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const v0, 0x43898000    # 275.0f

    .line 10
    .line 11
    .line 12
    mul-float/2addr p0, v0

    .line 13
    float-to-int p0, p0

    .line 14
    return p0

    .line 15
    :cond_0
    const/16 p0, 0x113

    .line 16
    .line 17
    return p0
.end method

.method public final r()I
    .locals 1

    .line 1
    iget p0, p0, Ll/q2h0;->c:F

    .line 2
    .line 3
    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, p0, v0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/high16 v0, 0x41700000    # 15.0f

    .line 10
    .line 11
    mul-float/2addr p0, v0

    .line 12
    float-to-int p0, p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/16 p0, 0xf

    .line 15
    .line 16
    return p0
.end method

.method public final s()I
    .locals 1

    .line 1
    iget p0, p0, Ll/q2h0;->c:F

    .line 2
    .line 3
    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, p0, v0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/high16 v0, 0x436b0000    # 235.0f

    .line 10
    .line 11
    mul-float/2addr p0, v0

    .line 12
    float-to-int p0, p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/16 p0, 0xeb

    .line 15
    .line 16
    return p0
.end method

.method public final t()I
    .locals 0

    .line 1
    const/16 p0, 0x190

    .line 2
    .line 3
    return p0
.end method

.method public u(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;",
            "Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;",
            ")",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;",
            "Ll/q3m;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->a3()Ll/q3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public v(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final w(Ll/pf60;)Landroid/animation/Animator;
    .locals 37
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;",
            "Ll/q3m;",
            ">;)",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Ll/q3m;

    .line 8
    .line 9
    invoke-interface {v2}, Ll/q3m;->c0()I

    .line 10
    .line 11
    .line 12
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v2, Ll/q3m;

    .line 15
    .line 16
    invoke-interface {v2}, Ll/q3m;->U0()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, v0, Ll/q2h0;->a:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-static {v3}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v5, Ll/q3m;

    .line 33
    .line 34
    invoke-interface {v5}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-static {v5}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    iget-object v6, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v6, Ll/q3m;

    .line 45
    .line 46
    invoke-interface {v6}, Ll/q3m;->U()Ll/bnl0$g;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    iget-object v7, v0, Ll/q2h0;->b:Landroid/widget/LinearLayout;

    .line 51
    .line 52
    invoke-static {v7}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    iget-object v8, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast v8, Ll/q3m;

    .line 59
    .line 60
    invoke-interface {v8}, Ll/q3m;->w3()Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-static {v8}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 65
    .line 66
    .line 67
    move-result-object v8

    .line 68
    iget v9, v5, Ll/bnl0$g;->d:I

    .line 69
    .line 70
    iget v6, v6, Ll/bnl0$g;->b:I

    .line 71
    .line 72
    iget v5, v5, Ll/bnl0$g;->b:I

    .line 73
    .line 74
    sub-int/2addr v6, v5

    .line 75
    sub-int/2addr v9, v6

    .line 76
    const/high16 v5, 0x41f00000    # 30.0f

    .line 77
    .line 78
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    add-int v15, v9, v5

    .line 83
    .line 84
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v5, Ll/q3m;

    .line 87
    .line 88
    invoke-interface {v5}, Ll/q3m;->o0()Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-static {v5}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    iget v5, v5, Ll/bnl0$g;->a:I

    .line 97
    .line 98
    iget v6, v3, Ll/bnl0$g;->c:I

    .line 99
    .line 100
    int-to-float v6, v6

    .line 101
    const/high16 v9, 0x3f800000    # 1.0f

    .line 102
    .line 103
    mul-float/2addr v6, v9

    .line 104
    iget v10, v4, Ll/bnl0$g;->c:I

    .line 105
    .line 106
    int-to-float v10, v10

    .line 107
    div-float/2addr v6, v10

    .line 108
    iget v10, v3, Ll/bnl0$g;->d:I

    .line 109
    .line 110
    int-to-float v10, v10

    .line 111
    mul-float/2addr v10, v9

    .line 112
    iget v11, v4, Ll/bnl0$g;->d:I

    .line 113
    .line 114
    int-to-float v11, v11

    .line 115
    div-float/2addr v10, v11

    .line 116
    invoke-static {v6, v10}, Ljava/lang/Math;->max(FF)F

    .line 117
    .line 118
    .line 119
    move-result v11

    .line 120
    iget v12, v4, Ll/bnl0$g;->c:I

    .line 121
    .line 122
    int-to-float v12, v12

    .line 123
    mul-float/2addr v12, v11

    .line 124
    iget v13, v3, Ll/bnl0$g;->c:I

    .line 125
    .line 126
    int-to-float v13, v13

    .line 127
    sub-float/2addr v12, v13

    .line 128
    const/high16 v13, 0x40000000    # 2.0f

    .line 129
    .line 130
    div-float/2addr v12, v13

    .line 131
    float-to-int v12, v12

    .line 132
    sget-object v14, Ll/gt0;->i:Landroid/util/Property;

    .line 133
    .line 134
    move/from16 v16, v9

    .line 135
    .line 136
    const/4 v9, 0x1

    .line 137
    move/from16 v17, v13

    .line 138
    .line 139
    new-array v13, v9, [F

    .line 140
    .line 141
    const/16 v18, 0x0

    .line 142
    .line 143
    aput v11, v13, v18

    .line 144
    .line 145
    invoke-static {v2, v14, v13}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 146
    .line 147
    .line 148
    move-result-object v13

    .line 149
    check-cast v13, Landroid/animation/ObjectAnimator;

    .line 150
    .line 151
    cmpl-float v10, v10, v6

    .line 152
    .line 153
    iget v14, v3, Ll/bnl0$g;->a:I

    .line 154
    .line 155
    if-ltz v10, :cond_0

    .line 156
    .line 157
    iget v6, v4, Ll/bnl0$g;->a:I

    .line 158
    .line 159
    sub-int/2addr v14, v6

    .line 160
    int-to-float v6, v14

    .line 161
    iget v10, v4, Ll/bnl0$g;->c:I

    .line 162
    .line 163
    int-to-float v10, v10

    .line 164
    mul-float/2addr v10, v11

    .line 165
    iget v11, v3, Ll/bnl0$g;->c:I

    .line 166
    .line 167
    int-to-float v11, v11

    .line 168
    sub-float/2addr v10, v11

    .line 169
    div-float v10, v10, v17

    .line 170
    .line 171
    sub-float/2addr v6, v10

    .line 172
    iget v3, v3, Ll/bnl0$g;->b:I

    .line 173
    .line 174
    iget v4, v4, Ll/bnl0$g;->b:I

    .line 175
    .line 176
    sub-int/2addr v3, v4

    .line 177
    int-to-float v3, v3

    .line 178
    goto :goto_0

    .line 179
    :cond_0
    iget v10, v4, Ll/bnl0$g;->a:I

    .line 180
    .line 181
    sub-int/2addr v14, v10

    .line 182
    int-to-float v10, v14

    .line 183
    iget v11, v3, Ll/bnl0$g;->b:I

    .line 184
    .line 185
    iget v14, v4, Ll/bnl0$g;->b:I

    .line 186
    .line 187
    sub-int/2addr v11, v14

    .line 188
    int-to-float v11, v11

    .line 189
    iget v4, v4, Ll/bnl0$g;->d:I

    .line 190
    .line 191
    int-to-float v4, v4

    .line 192
    mul-float/2addr v4, v6

    .line 193
    iget v3, v3, Ll/bnl0$g;->d:I

    .line 194
    .line 195
    int-to-float v3, v3

    .line 196
    sub-float/2addr v4, v3

    .line 197
    div-float v4, v4, v17

    .line 198
    .line 199
    sub-float v3, v11, v4

    .line 200
    .line 201
    move v6, v10

    .line 202
    :goto_0
    new-instance v4, Ll/n2h0;

    .line 203
    .line 204
    invoke-direct {v4, v12, v2}, Ll/n2h0;-><init>(ILcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v13, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    int-to-long v10, v4

    .line 215
    iget-object v4, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 216
    .line 217
    check-cast v4, Ll/q3m;

    .line 218
    .line 219
    invoke-interface {v4}, Ll/q3m;->S1()Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v19

    .line 223
    invoke-virtual {v0}, Ll/q2h0;->r()I

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    move-wide/from16 v27, v10

    .line 228
    .line 229
    int-to-long v9, v4

    .line 230
    invoke-virtual {v0}, Ll/q2h0;->q()I

    .line 231
    .line 232
    .line 233
    move-result v4

    .line 234
    int-to-long v11, v4

    .line 235
    sget-object v35, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 236
    .line 237
    int-to-float v4, v15

    .line 238
    const/4 v14, 0x1

    .line 239
    new-array v0, v14, [F

    .line 240
    .line 241
    aput v4, v0, v18

    .line 242
    .line 243
    const-string v20, "translationY"

    .line 244
    .line 245
    move-object/from16 v26, v0

    .line 246
    .line 247
    move-wide/from16 v21, v9

    .line 248
    .line 249
    move-wide/from16 v23, v11

    .line 250
    .line 251
    move-object/from16 v25, v35

    .line 252
    .line 253
    invoke-static/range {v19 .. v26}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    iget-object v9, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 258
    .line 259
    check-cast v9, Ll/q3m;

    .line 260
    .line 261
    invoke-interface {v9}, Ll/q3m;->o0()Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v29

    .line 265
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->r()I

    .line 266
    .line 267
    .line 268
    move-result v9

    .line 269
    int-to-long v9, v9

    .line 270
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->q()I

    .line 271
    .line 272
    .line 273
    move-result v11

    .line 274
    int-to-long v11, v11

    .line 275
    int-to-float v14, v5

    .line 276
    move-object/from16 v19, v0

    .line 277
    .line 278
    move/from16 v20, v3

    .line 279
    .line 280
    const/4 v0, 0x1

    .line 281
    new-array v3, v0, [F

    .line 282
    .line 283
    aput v14, v3, v18

    .line 284
    .line 285
    const-string v30, "translationX"

    .line 286
    .line 287
    move-object/from16 v36, v3

    .line 288
    .line 289
    move-wide/from16 v31, v9

    .line 290
    .line 291
    move-wide/from16 v33, v11

    .line 292
    .line 293
    invoke-static/range {v29 .. v36}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    iget-object v9, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 298
    .line 299
    check-cast v9, Ll/q3m;

    .line 300
    .line 301
    invoke-interface {v9}, Ll/q3m;->o0()Landroid/view/View;

    .line 302
    .line 303
    .line 304
    move-result-object v29

    .line 305
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->r()I

    .line 306
    .line 307
    .line 308
    move-result v9

    .line 309
    int-to-long v9, v9

    .line 310
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->q()I

    .line 311
    .line 312
    .line 313
    move-result v11

    .line 314
    int-to-long v11, v11

    .line 315
    new-array v14, v0, [F

    .line 316
    .line 317
    const/high16 v0, 0x43b40000    # 360.0f

    .line 318
    .line 319
    aput v0, v14, v18

    .line 320
    .line 321
    const-string v30, "rotation"

    .line 322
    .line 323
    move-wide/from16 v31, v9

    .line 324
    .line 325
    move-wide/from16 v33, v11

    .line 326
    .line 327
    move-object/from16 v36, v14

    .line 328
    .line 329
    invoke-static/range {v29 .. v36}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    iget-object v9, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 334
    .line 335
    check-cast v9, Ll/q3m;

    .line 336
    .line 337
    invoke-interface {v9}, Ll/q3m;->J()Landroid/view/View;

    .line 338
    .line 339
    .line 340
    move-result-object v29

    .line 341
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->r()I

    .line 342
    .line 343
    .line 344
    move-result v9

    .line 345
    int-to-long v9, v9

    .line 346
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->q()I

    .line 347
    .line 348
    .line 349
    move-result v11

    .line 350
    int-to-long v11, v11

    .line 351
    neg-int v5, v5

    .line 352
    int-to-float v5, v5

    .line 353
    move-object/from16 v21, v0

    .line 354
    .line 355
    const/4 v14, 0x1

    .line 356
    new-array v0, v14, [F

    .line 357
    .line 358
    aput v5, v0, v18

    .line 359
    .line 360
    const-string v30, "translationX"

    .line 361
    .line 362
    move-object/from16 v36, v0

    .line 363
    .line 364
    move-wide/from16 v31, v9

    .line 365
    .line 366
    move-wide/from16 v33, v11

    .line 367
    .line 368
    invoke-static/range {v29 .. v36}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 373
    .line 374
    check-cast v5, Ll/q3m;

    .line 375
    .line 376
    invoke-interface {v5}, Ll/q3m;->J()Landroid/view/View;

    .line 377
    .line 378
    .line 379
    move-result-object v29

    .line 380
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->r()I

    .line 381
    .line 382
    .line 383
    move-result v5

    .line 384
    int-to-long v9, v5

    .line 385
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->q()I

    .line 386
    .line 387
    .line 388
    move-result v5

    .line 389
    int-to-long v11, v5

    .line 390
    new-array v5, v14, [F

    .line 391
    .line 392
    const/high16 v17, -0x3c4c0000    # -360.0f

    .line 393
    .line 394
    aput v17, v5, v18

    .line 395
    .line 396
    const-string v30, "rotation"

    .line 397
    .line 398
    move-object/from16 v36, v5

    .line 399
    .line 400
    move-wide/from16 v31, v9

    .line 401
    .line 402
    move-wide/from16 v33, v11

    .line 403
    .line 404
    invoke-static/range {v29 .. v36}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 405
    .line 406
    .line 407
    move-result-object v5

    .line 408
    iget-object v9, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 409
    .line 410
    check-cast v9, Ll/q3m;

    .line 411
    .line 412
    invoke-interface {v9}, Ll/q3m;->Q2()Landroid/view/View;

    .line 413
    .line 414
    .line 415
    move-result-object v29

    .line 416
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->s()I

    .line 417
    .line 418
    .line 419
    move-result v9

    .line 420
    int-to-long v9, v9

    .line 421
    new-array v11, v14, [F

    .line 422
    .line 423
    const/4 v12, 0x0

    .line 424
    aput v12, v11, v18

    .line 425
    .line 426
    const-string v30, "alpha"

    .line 427
    .line 428
    const-wide/16 v31, 0x0

    .line 429
    .line 430
    const/16 v35, 0x0

    .line 431
    .line 432
    move-wide/from16 v33, v9

    .line 433
    .line 434
    move-object/from16 v36, v11

    .line 435
    .line 436
    invoke-static/range {v29 .. v36}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 437
    .line 438
    .line 439
    move-result-object v9

    .line 440
    iget-object v10, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 441
    .line 442
    check-cast v10, Ll/q3m;

    .line 443
    .line 444
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->s()I

    .line 445
    .line 446
    .line 447
    move-result v12

    .line 448
    move-object v11, v13

    .line 449
    const/4 v13, 0x0

    .line 450
    const/4 v14, 0x0

    .line 451
    move-object/from16 v22, v11

    .line 452
    .line 453
    const/4 v11, 0x0

    .line 454
    move-object/from16 v24, v3

    .line 455
    .line 456
    move/from16 v23, v4

    .line 457
    .line 458
    move-wide/from16 v3, v27

    .line 459
    .line 460
    invoke-static/range {v10 .. v15}, Ll/pza0;->e(Ll/q3m;IILandroid/view/animation/Interpolator;II)Landroid/animation/Animator;

    .line 461
    .line 462
    .line 463
    move-result-object v10

    .line 464
    iget-object v11, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 465
    .line 466
    check-cast v11, Ll/q3m;

    .line 467
    .line 468
    invoke-interface {v11}, Ll/q3m;->y1()Landroid/view/View;

    .line 469
    .line 470
    .line 471
    move-result-object v25

    .line 472
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->s()I

    .line 473
    .line 474
    .line 475
    move-result v11

    .line 476
    int-to-long v11, v11

    .line 477
    const/4 v14, 0x1

    .line 478
    new-array v13, v14, [F

    .line 479
    .line 480
    aput v23, v13, v18

    .line 481
    .line 482
    const-string v26, "translationY"

    .line 483
    .line 484
    const-wide/16 v27, 0x0

    .line 485
    .line 486
    const/16 v31, 0x0

    .line 487
    .line 488
    move-wide/from16 v29, v11

    .line 489
    .line 490
    move-object/from16 v32, v13

    .line 491
    .line 492
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 493
    .line 494
    .line 495
    move-result-object v11

    .line 496
    iget-object v12, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 497
    .line 498
    check-cast v12, Ll/q3m;

    .line 499
    .line 500
    invoke-interface {v12}, Ll/q3m;->q2()Landroid/view/View;

    .line 501
    .line 502
    .line 503
    move-result-object v25

    .line 504
    invoke-virtual/range {p0 .. p0}, Ll/q2h0;->s()I

    .line 505
    .line 506
    .line 507
    move-result v12

    .line 508
    int-to-long v12, v12

    .line 509
    new-array v15, v14, [F

    .line 510
    .line 511
    aput v23, v15, v18

    .line 512
    .line 513
    const-string v26, "translationY"

    .line 514
    .line 515
    move-wide/from16 v29, v12

    .line 516
    .line 517
    move-object/from16 v32, v15

    .line 518
    .line 519
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 520
    .line 521
    .line 522
    move-result-object v12

    .line 523
    new-array v13, v14, [F

    .line 524
    .line 525
    aput v6, v13, v18

    .line 526
    .line 527
    const-string v6, "translationX"

    .line 528
    .line 529
    invoke-static {v2, v6, v13}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 530
    .line 531
    .line 532
    move-result-object v13

    .line 533
    new-array v15, v14, [F

    .line 534
    .line 535
    aput v20, v15, v18

    .line 536
    .line 537
    const-string v14, "translationY"

    .line 538
    .line 539
    invoke-static {v2, v14, v15}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 540
    .line 541
    .line 542
    move-result-object v2

    .line 543
    iget-object v15, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 544
    .line 545
    check-cast v15, Ll/q3m;

    .line 546
    .line 547
    invoke-interface {v15}, Ll/q3m;->w3()Landroid/view/View;

    .line 548
    .line 549
    .line 550
    move-result-object v15

    .line 551
    move-object/from16 v20, v0

    .line 552
    .line 553
    sget-object v0, Ll/gt0;->i:Landroid/util/Property;

    .line 554
    .line 555
    move-object/from16 p0, v2

    .line 556
    .line 557
    iget v2, v7, Ll/bnl0$g;->c:I

    .line 558
    .line 559
    int-to-float v2, v2

    .line 560
    mul-float v2, v2, v16

    .line 561
    .line 562
    move/from16 v16, v2

    .line 563
    .line 564
    iget v2, v8, Ll/bnl0$g;->c:I

    .line 565
    .line 566
    int-to-float v2, v2

    .line 567
    div-float v2, v16, v2

    .line 568
    .line 569
    move/from16 v16, v2

    .line 570
    .line 571
    move-object/from16 v17, v5

    .line 572
    .line 573
    const/4 v2, 0x1

    .line 574
    new-array v5, v2, [F

    .line 575
    .line 576
    aput v16, v5, v18

    .line 577
    .line 578
    invoke-static {v15, v0, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 579
    .line 580
    .line 581
    move-result-object v0

    .line 582
    iget-object v5, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 583
    .line 584
    check-cast v5, Ll/q3m;

    .line 585
    .line 586
    invoke-interface {v5}, Ll/q3m;->w3()Landroid/view/View;

    .line 587
    .line 588
    .line 589
    move-result-object v5

    .line 590
    iget v15, v7, Ll/bnl0$g;->a:I

    .line 591
    .line 592
    iget v2, v8, Ll/bnl0$g;->a:I

    .line 593
    .line 594
    sub-int/2addr v15, v2

    .line 595
    int-to-float v2, v15

    .line 596
    move-object/from16 v16, v0

    .line 597
    .line 598
    const/4 v15, 0x1

    .line 599
    new-array v0, v15, [F

    .line 600
    .line 601
    aput v2, v0, v18

    .line 602
    .line 603
    invoke-static {v5, v6, v0}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 604
    .line 605
    .line 606
    move-result-object v0

    .line 607
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 608
    .line 609
    check-cast v2, Ll/q3m;

    .line 610
    .line 611
    invoke-interface {v2}, Ll/q3m;->w3()Landroid/view/View;

    .line 612
    .line 613
    .line 614
    move-result-object v2

    .line 615
    iget v5, v7, Ll/bnl0$g;->b:I

    .line 616
    .line 617
    iget v6, v8, Ll/bnl0$g;->b:I

    .line 618
    .line 619
    sub-int/2addr v5, v6

    .line 620
    int-to-float v5, v5

    .line 621
    new-array v6, v15, [F

    .line 622
    .line 623
    aput v5, v6, v18

    .line 624
    .line 625
    invoke-static {v2, v14, v6}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 626
    .line 627
    .line 628
    move-result-object v2

    .line 629
    const/16 v5, 0xf

    .line 630
    .line 631
    new-array v5, v5, [Landroid/animation/Animator;

    .line 632
    .line 633
    aput-object v19, v5, v18

    .line 634
    .line 635
    aput-object v24, v5, v15

    .line 636
    .line 637
    const/4 v6, 0x2

    .line 638
    aput-object v21, v5, v6

    .line 639
    .line 640
    const/4 v6, 0x3

    .line 641
    aput-object v20, v5, v6

    .line 642
    .line 643
    const/4 v6, 0x4

    .line 644
    aput-object v17, v5, v6

    .line 645
    .line 646
    const/4 v6, 0x5

    .line 647
    aput-object v9, v5, v6

    .line 648
    .line 649
    const/4 v6, 0x6

    .line 650
    aput-object v10, v5, v6

    .line 651
    .line 652
    const/4 v6, 0x7

    .line 653
    aput-object v11, v5, v6

    .line 654
    .line 655
    const/16 v6, 0x8

    .line 656
    .line 657
    aput-object v12, v5, v6

    .line 658
    .line 659
    const/16 v6, 0x9

    .line 660
    .line 661
    aput-object v22, v5, v6

    .line 662
    .line 663
    const/16 v6, 0xa

    .line 664
    .line 665
    aput-object v13, v5, v6

    .line 666
    .line 667
    const/16 v7, 0xb

    .line 668
    .line 669
    aput-object p0, v5, v7

    .line 670
    .line 671
    const/16 v7, 0xc

    .line 672
    .line 673
    aput-object v16, v5, v7

    .line 674
    .line 675
    const/16 v7, 0xd

    .line 676
    .line 677
    aput-object v0, v5, v7

    .line 678
    .line 679
    const/16 v0, 0xe

    .line 680
    .line 681
    aput-object v2, v5, v0

    .line 682
    .line 683
    invoke-static {v3, v4, v5}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 684
    .line 685
    .line 686
    move-result-object v0

    .line 687
    invoke-static {v6}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 688
    .line 689
    .line 690
    move-result-object v2

    .line 691
    filled-new-array {v0, v2}, [Landroid/animation/Animator;

    .line 692
    .line 693
    .line 694
    move-result-object v0

    .line 695
    invoke-static {v0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 696
    .line 697
    .line 698
    move-result-object v0

    .line 699
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 700
    .line 701
    check-cast v1, Ll/q3m;

    .line 702
    .line 703
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    .line 705
    .line 706
    new-instance v2, Ll/o2h0;

    .line 707
    .line 708
    invoke-direct {v2, v1}, Ll/o2h0;-><init>(Ll/q3m;)V

    .line 709
    .line 710
    .line 711
    invoke-static {v0, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 712
    .line 713
    .line 714
    return-object v0
.end method
