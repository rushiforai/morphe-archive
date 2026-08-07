.class public Lv/smart_refresh/SmartRefreshLayout$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvc0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/smart_refresh/SmartRefreshLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "n"
.end annotation


# instance fields
.field public final synthetic a:Lv/smart_refresh/SmartRefreshLayout;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)Landroid/animation/ValueAnimator;
    .locals 3

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->z:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    iget v1, p0, Lv/smart_refresh/SmartRefreshLayout;->f:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, p1, v2, v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->h(IILandroid/view/animation/Interpolator;I)Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public b(Ll/gvc0;I)Ll/lvc0;
    .locals 2
    .param p1    # Ll/gvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->a1:Landroid/graphics/Paint;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    new-instance v1, Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->a1:Landroid/graphics/Paint;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 17
    .line 18
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iput p2, v1, Lv/smart_refresh/SmartRefreshLayout;->g1:I

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    iget-object v0, v1, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 40
    .line 41
    iput p2, p1, Lv/smart_refresh/SmartRefreshLayout;->h1:I

    .line 42
    .line 43
    :cond_2
    return-object p0
.end method

.method public c()Ll/mvc0;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/lvc0;
    .locals 3

    .line 1
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    sget-object v2, Lv/smart_refresh/constant/RefreshState;->TwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 6
    .line 7
    if-ne v1, v2, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 10
    .line 11
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->TwoLevelFinish:Lv/smart_refresh/constant/RefreshState;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 17
    .line 18
    iget v0, v0, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, v1, v1}, Lv/smart_refresh/SmartRefreshLayout$n;->e(IZ)Ll/lvc0;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 27
    .line 28
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout$n;->a(I)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 39
    .line 40
    iget v1, v1, Lv/smart_refresh/SmartRefreshLayout;->e:I

    .line 41
    .line 42
    int-to-long v1, v1

    .line 43
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    .line 46
    :cond_1
    return-object p0
.end method

.method public e(IZ)Ll/lvc0;
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 6
    .line 7
    iget v3, v2, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 8
    .line 9
    if-ne v3, v1, :cond_1

    .line 10
    .line 11
    iget-object v2, v2, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-interface {v2}, Ll/gvc0;->e()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 22
    .line 23
    iget-object v2, v2, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 24
    .line 25
    if-eqz v2, :cond_2d

    .line 26
    .line 27
    invoke-interface {v2}, Ll/gvc0;->e()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    goto/16 :goto_15

    .line 34
    .line 35
    :cond_1
    iget-object v2, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 36
    .line 37
    iget v3, v2, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 38
    .line 39
    iput v1, v2, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 40
    .line 41
    const/high16 v4, 0x41200000    # 10.0f

    .line 42
    .line 43
    if-eqz p2, :cond_8

    .line 44
    .line 45
    iget-object v5, v2, Lv/smart_refresh/SmartRefreshLayout;->e1:Lv/smart_refresh/constant/RefreshState;

    .line 46
    .line 47
    iget-boolean v6, v5, Lv/smart_refresh/constant/RefreshState;->isDragging:Z

    .line 48
    .line 49
    if-nez v6, :cond_2

    .line 50
    .line 51
    iget-boolean v5, v5, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 52
    .line 53
    if-eqz v5, :cond_8

    .line 54
    .line 55
    :cond_2
    int-to-float v5, v1

    .line 56
    iget v6, v2, Lv/smart_refresh/SmartRefreshLayout;->U0:F

    .line 57
    .line 58
    cmpg-float v7, v6, v4

    .line 59
    .line 60
    if-gez v7, :cond_3

    .line 61
    .line 62
    iget v7, v2, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 63
    .line 64
    int-to-float v7, v7

    .line 65
    mul-float/2addr v6, v7

    .line 66
    :cond_3
    cmpl-float v5, v5, v6

    .line 67
    .line 68
    if-lez v5, :cond_4

    .line 69
    .line 70
    iget-object v5, v2, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 71
    .line 72
    sget-object v6, Lv/smart_refresh/constant/RefreshState;->ReleaseToTwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 73
    .line 74
    if-eq v5, v6, :cond_8

    .line 75
    .line 76
    iget-object v5, v2, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 77
    .line 78
    sget-object v6, Lv/smart_refresh/constant/RefreshState;->ReleaseToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 79
    .line 80
    invoke-interface {v5, v6}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    neg-int v5, v1

    .line 85
    int-to-float v5, v5

    .line 86
    iget v6, v2, Lv/smart_refresh/SmartRefreshLayout;->V0:F

    .line 87
    .line 88
    cmpg-float v7, v6, v4

    .line 89
    .line 90
    if-gez v7, :cond_5

    .line 91
    .line 92
    iget v7, v2, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 93
    .line 94
    int-to-float v7, v7

    .line 95
    mul-float/2addr v6, v7

    .line 96
    :cond_5
    cmpl-float v5, v5, v6

    .line 97
    .line 98
    if-lez v5, :cond_6

    .line 99
    .line 100
    iget-boolean v5, v2, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 101
    .line 102
    if-nez v5, :cond_6

    .line 103
    .line 104
    iget-object v5, v2, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 105
    .line 106
    sget-object v6, Lv/smart_refresh/constant/RefreshState;->ReleaseToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 107
    .line 108
    invoke-interface {v5, v6}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_6
    if-gez v1, :cond_7

    .line 113
    .line 114
    iget-boolean v5, v2, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 115
    .line 116
    if-nez v5, :cond_7

    .line 117
    .line 118
    iget-object v5, v2, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 119
    .line 120
    sget-object v6, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 121
    .line 122
    invoke-interface {v5, v6}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_7
    if-lez v1, :cond_8

    .line 127
    .line 128
    iget-object v5, v2, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 129
    .line 130
    sget-object v6, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 131
    .line 132
    invoke-interface {v5, v6}, Ll/lvc0;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 133
    .line 134
    .line 135
    :cond_8
    :goto_0
    iget-object v5, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 136
    .line 137
    iget-object v6, v5, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 138
    .line 139
    const/4 v7, 0x1

    .line 140
    const/4 v8, 0x0

    .line 141
    if-eqz v6, :cond_14

    .line 142
    .line 143
    if-ltz v1, :cond_a

    .line 144
    .line 145
    iget-boolean v6, v5, Lv/smart_refresh/SmartRefreshLayout;->F:Z

    .line 146
    .line 147
    iget-object v9, v5, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 148
    .line 149
    invoke-virtual {v5, v6, v9}, Lv/smart_refresh/SmartRefreshLayout;->A(ZLl/gvc0;)Z

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    if-eqz v5, :cond_9

    .line 154
    .line 155
    move v5, v1

    .line 156
    move v6, v7

    .line 157
    goto :goto_1

    .line 158
    :cond_9
    if-gez v3, :cond_a

    .line 159
    .line 160
    move v6, v7

    .line 161
    move v5, v8

    .line 162
    goto :goto_1

    .line 163
    :cond_a
    move v5, v8

    .line 164
    move v6, v5

    .line 165
    :goto_1
    if-gtz v1, :cond_c

    .line 166
    .line 167
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 168
    .line 169
    iget-boolean v10, v9, Lv/smart_refresh/SmartRefreshLayout;->G:Z

    .line 170
    .line 171
    iget-object v11, v9, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 172
    .line 173
    invoke-virtual {v9, v10, v11}, Lv/smart_refresh/SmartRefreshLayout;->A(ZLl/gvc0;)Z

    .line 174
    .line 175
    .line 176
    move-result v9

    .line 177
    if-eqz v9, :cond_b

    .line 178
    .line 179
    move v5, v1

    .line 180
    move v6, v7

    .line 181
    goto :goto_2

    .line 182
    :cond_b
    if-lez v3, :cond_c

    .line 183
    .line 184
    move v6, v7

    .line 185
    move v5, v8

    .line 186
    :cond_c
    :goto_2
    if-eqz v6, :cond_14

    .line 187
    .line 188
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 189
    .line 190
    iget-object v9, v6, Lv/smart_refresh/SmartRefreshLayout;->Z0:Ll/hvc0;

    .line 191
    .line 192
    iget v10, v6, Lv/smart_refresh/SmartRefreshLayout;->s:I

    .line 193
    .line 194
    iget v6, v6, Lv/smart_refresh/SmartRefreshLayout;->t:I

    .line 195
    .line 196
    invoke-interface {v9, v5, v10, v6}, Ll/hvc0;->e(III)V

    .line 197
    .line 198
    .line 199
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 200
    .line 201
    iget-boolean v9, v6, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 202
    .line 203
    if-eqz v9, :cond_d

    .line 204
    .line 205
    iget-boolean v9, v6, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 206
    .line 207
    if-eqz v9, :cond_d

    .line 208
    .line 209
    iget-boolean v9, v6, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 210
    .line 211
    if-eqz v9, :cond_d

    .line 212
    .line 213
    iget-object v6, v6, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 214
    .line 215
    instance-of v9, v6, Ll/jvc0;

    .line 216
    .line 217
    if-eqz v9, :cond_d

    .line 218
    .line 219
    invoke-interface {v6}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    sget-object v9, Ll/wwf0;->d:Ll/wwf0;

    .line 224
    .line 225
    if-ne v6, v9, :cond_d

    .line 226
    .line 227
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 228
    .line 229
    iget-boolean v9, v6, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 230
    .line 231
    invoke-virtual {v6, v9}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 232
    .line 233
    .line 234
    move-result v6

    .line 235
    if-eqz v6, :cond_d

    .line 236
    .line 237
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 238
    .line 239
    iget-object v6, v6, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 240
    .line 241
    invoke-interface {v6}, Ll/gvc0;->getView()Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v6

    .line 245
    invoke-static {v8, v5}, Ljava/lang/Math;->max(II)I

    .line 246
    .line 247
    .line 248
    move-result v9

    .line 249
    int-to-float v9, v9

    .line 250
    invoke-virtual {v6, v9}, Landroid/view/View;->setTranslationY(F)V

    .line 251
    .line 252
    .line 253
    :cond_d
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 254
    .line 255
    iget-boolean v9, v6, Lv/smart_refresh/SmartRefreshLayout;->D:Z

    .line 256
    .line 257
    if-eqz v9, :cond_e

    .line 258
    .line 259
    iget-object v6, v6, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 260
    .line 261
    if-eqz v6, :cond_e

    .line 262
    .line 263
    invoke-interface {v6}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 264
    .line 265
    .line 266
    move-result-object v6

    .line 267
    sget-object v9, Ll/wwf0;->f:Ll/wwf0;

    .line 268
    .line 269
    if-ne v6, v9, :cond_e

    .line 270
    .line 271
    goto :goto_3

    .line 272
    :cond_e
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 273
    .line 274
    iget v6, v6, Lv/smart_refresh/SmartRefreshLayout;->g1:I

    .line 275
    .line 276
    if-eqz v6, :cond_f

    .line 277
    .line 278
    :goto_3
    move v6, v7

    .line 279
    goto :goto_4

    .line 280
    :cond_f
    move v6, v8

    .line 281
    :goto_4
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 282
    .line 283
    iget-boolean v10, v9, Lv/smart_refresh/SmartRefreshLayout;->E:Z

    .line 284
    .line 285
    if-eqz v10, :cond_10

    .line 286
    .line 287
    iget-object v9, v9, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 288
    .line 289
    if-eqz v9, :cond_10

    .line 290
    .line 291
    invoke-interface {v9}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 292
    .line 293
    .line 294
    move-result-object v9

    .line 295
    sget-object v10, Ll/wwf0;->f:Ll/wwf0;

    .line 296
    .line 297
    if-ne v9, v10, :cond_10

    .line 298
    .line 299
    goto :goto_5

    .line 300
    :cond_10
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 301
    .line 302
    iget v9, v9, Lv/smart_refresh/SmartRefreshLayout;->h1:I

    .line 303
    .line 304
    if-eqz v9, :cond_11

    .line 305
    .line 306
    :goto_5
    move v9, v7

    .line 307
    goto :goto_6

    .line 308
    :cond_11
    move v9, v8

    .line 309
    :goto_6
    if-eqz v6, :cond_12

    .line 310
    .line 311
    if-gez v5, :cond_13

    .line 312
    .line 313
    if-gtz v3, :cond_13

    .line 314
    .line 315
    :cond_12
    if-eqz v9, :cond_14

    .line 316
    .line 317
    if-lez v5, :cond_13

    .line 318
    .line 319
    if-gez v3, :cond_14

    .line 320
    .line 321
    :cond_13
    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    .line 322
    .line 323
    .line 324
    :cond_14
    const/high16 v5, 0x3f800000    # 1.0f

    .line 325
    .line 326
    const/high16 v6, 0x40000000    # 2.0f

    .line 327
    .line 328
    if-gez v1, :cond_16

    .line 329
    .line 330
    if-lez v3, :cond_15

    .line 331
    .line 332
    goto :goto_7

    .line 333
    :cond_15
    move/from16 v17, v4

    .line 334
    .line 335
    move/from16 v18, v5

    .line 336
    .line 337
    goto/16 :goto_e

    .line 338
    .line 339
    :cond_16
    :goto_7
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 340
    .line 341
    iget-object v9, v9, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 342
    .line 343
    if-eqz v9, :cond_15

    .line 344
    .line 345
    invoke-static {v1, v8}, Ljava/lang/Math;->max(II)I

    .line 346
    .line 347
    .line 348
    move-result v13

    .line 349
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 350
    .line 351
    iget v14, v9, Lv/smart_refresh/SmartRefreshLayout;->M0:I

    .line 352
    .line 353
    iget v10, v9, Lv/smart_refresh/SmartRefreshLayout;->S0:F

    .line 354
    .line 355
    cmpg-float v11, v10, v4

    .line 356
    .line 357
    if-gez v11, :cond_17

    .line 358
    .line 359
    int-to-float v11, v14

    .line 360
    mul-float/2addr v10, v11

    .line 361
    :cond_17
    float-to-int v15, v10

    .line 362
    int-to-float v10, v13

    .line 363
    mul-float/2addr v10, v5

    .line 364
    iget v11, v9, Lv/smart_refresh/SmartRefreshLayout;->U0:F

    .line 365
    .line 366
    cmpg-float v12, v11, v4

    .line 367
    .line 368
    if-gez v12, :cond_18

    .line 369
    .line 370
    int-to-float v12, v14

    .line 371
    mul-float/2addr v11, v12

    .line 372
    :cond_18
    div-float v12, v10, v11

    .line 373
    .line 374
    iget-boolean v10, v9, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 375
    .line 376
    invoke-virtual {v9, v10}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 377
    .line 378
    .line 379
    move-result v9

    .line 380
    if-nez v9, :cond_1a

    .line 381
    .line 382
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 383
    .line 384
    iget-object v9, v9, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 385
    .line 386
    sget-object v10, Lv/smart_refresh/constant/RefreshState;->RefreshFinish:Lv/smart_refresh/constant/RefreshState;

    .line 387
    .line 388
    if-ne v9, v10, :cond_19

    .line 389
    .line 390
    if-nez p2, :cond_19

    .line 391
    .line 392
    goto :goto_8

    .line 393
    :cond_19
    move/from16 v17, v4

    .line 394
    .line 395
    move/from16 v18, v5

    .line 396
    .line 397
    goto/16 :goto_d

    .line 398
    .line 399
    :cond_1a
    :goto_8
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 400
    .line 401
    iget v10, v9, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 402
    .line 403
    if-eq v3, v10, :cond_1e

    .line 404
    .line 405
    iget-object v9, v9, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 406
    .line 407
    invoke-interface {v9}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 408
    .line 409
    .line 410
    move-result-object v9

    .line 411
    sget-object v10, Ll/wwf0;->d:Ll/wwf0;

    .line 412
    .line 413
    iget-object v11, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 414
    .line 415
    if-ne v9, v10, :cond_1c

    .line 416
    .line 417
    iget-object v9, v11, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 418
    .line 419
    invoke-interface {v9}, Ll/gvc0;->getView()Landroid/view/View;

    .line 420
    .line 421
    .line 422
    move-result-object v9

    .line 423
    iget-object v10, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 424
    .line 425
    iget v10, v10, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 426
    .line 427
    int-to-float v10, v10

    .line 428
    invoke-virtual {v9, v10}, Landroid/view/View;->setTranslationY(F)V

    .line 429
    .line 430
    .line 431
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 432
    .line 433
    iget v10, v9, Lv/smart_refresh/SmartRefreshLayout;->g1:I

    .line 434
    .line 435
    if-eqz v10, :cond_1b

    .line 436
    .line 437
    iget-object v10, v9, Lv/smart_refresh/SmartRefreshLayout;->a1:Landroid/graphics/Paint;

    .line 438
    .line 439
    if-eqz v10, :cond_1b

    .line 440
    .line 441
    iget-boolean v10, v9, Lv/smart_refresh/SmartRefreshLayout;->F:Z

    .line 442
    .line 443
    iget-object v11, v9, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 444
    .line 445
    invoke-virtual {v9, v10, v11}, Lv/smart_refresh/SmartRefreshLayout;->A(ZLl/gvc0;)Z

    .line 446
    .line 447
    .line 448
    move-result v9

    .line 449
    if-nez v9, :cond_1b

    .line 450
    .line 451
    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    .line 452
    .line 453
    .line 454
    :cond_1b
    move/from16 v17, v4

    .line 455
    .line 456
    move/from16 v18, v5

    .line 457
    .line 458
    goto :goto_a

    .line 459
    :cond_1c
    iget-object v9, v11, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 460
    .line 461
    invoke-interface {v9}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 462
    .line 463
    .line 464
    move-result-object v9

    .line 465
    iget-boolean v9, v9, Ll/wwf0;->c:Z

    .line 466
    .line 467
    if-eqz v9, :cond_1b

    .line 468
    .line 469
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 470
    .line 471
    iget-object v9, v9, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 472
    .line 473
    invoke-interface {v9}, Ll/gvc0;->getView()Landroid/view/View;

    .line 474
    .line 475
    .line 476
    move-result-object v9

    .line 477
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 478
    .line 479
    .line 480
    move-result-object v10

    .line 481
    instance-of v11, v10, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 482
    .line 483
    if-eqz v11, :cond_1d

    .line 484
    .line 485
    check-cast v10, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 486
    .line 487
    goto :goto_9

    .line 488
    :cond_1d
    sget-object v10, Lv/smart_refresh/SmartRefreshLayout;->t1:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 489
    .line 490
    :goto_9
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    .line 491
    .line 492
    .line 493
    move-result v11

    .line 494
    invoke-static {v11, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 495
    .line 496
    .line 497
    move-result v11

    .line 498
    move/from16 v17, v4

    .line 499
    .line 500
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 501
    .line 502
    iget v4, v4, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 503
    .line 504
    move/from16 v18, v5

    .line 505
    .line 506
    iget v5, v10, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 507
    .line 508
    sub-int/2addr v4, v5

    .line 509
    iget v5, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 510
    .line 511
    sub-int/2addr v4, v5

    .line 512
    invoke-static {v4, v8}, Ljava/lang/Math;->max(II)I

    .line 513
    .line 514
    .line 515
    move-result v4

    .line 516
    invoke-static {v4, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 517
    .line 518
    .line 519
    move-result v4

    .line 520
    invoke-virtual {v9, v11, v4}, Landroid/view/View;->measure(II)V

    .line 521
    .line 522
    .line 523
    iget v4, v10, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 524
    .line 525
    iget v5, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 526
    .line 527
    iget-object v10, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 528
    .line 529
    iget v10, v10, Lv/smart_refresh/SmartRefreshLayout;->Q0:I

    .line 530
    .line 531
    add-int/2addr v5, v10

    .line 532
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    .line 533
    .line 534
    .line 535
    move-result v10

    .line 536
    add-int/2addr v10, v4

    .line 537
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredHeight()I

    .line 538
    .line 539
    .line 540
    move-result v11

    .line 541
    add-int/2addr v11, v5

    .line 542
    invoke-virtual {v9, v4, v5, v10, v11}, Landroid/view/View;->layout(IIII)V

    .line 543
    .line 544
    .line 545
    :goto_a
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 546
    .line 547
    iget-object v10, v4, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 548
    .line 549
    move/from16 v11, p2

    .line 550
    .line 551
    invoke-interface/range {v10 .. v15}, Ll/gvc0;->l(ZFIII)V

    .line 552
    .line 553
    .line 554
    goto :goto_b

    .line 555
    :cond_1e
    move/from16 v17, v4

    .line 556
    .line 557
    move/from16 v18, v5

    .line 558
    .line 559
    :goto_b
    if-eqz p2, :cond_20

    .line 560
    .line 561
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 562
    .line 563
    iget-object v4, v4, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 564
    .line 565
    invoke-interface {v4}, Ll/gvc0;->e()Z

    .line 566
    .line 567
    .line 568
    move-result v4

    .line 569
    if-eqz v4, :cond_20

    .line 570
    .line 571
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 572
    .line 573
    iget v4, v4, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 574
    .line 575
    float-to-int v4, v4

    .line 576
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 577
    .line 578
    .line 579
    move-result v5

    .line 580
    iget-object v9, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 581
    .line 582
    iget v10, v9, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 583
    .line 584
    if-nez v5, :cond_1f

    .line 585
    .line 586
    move v11, v7

    .line 587
    goto :goto_c

    .line 588
    :cond_1f
    move v11, v5

    .line 589
    :goto_c
    int-to-float v11, v11

    .line 590
    div-float/2addr v10, v11

    .line 591
    iget-object v9, v9, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 592
    .line 593
    invoke-interface {v9, v10, v4, v5}, Ll/gvc0;->d(FII)V

    .line 594
    .line 595
    .line 596
    :cond_20
    :goto_d
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 597
    .line 598
    iget v5, v4, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 599
    .line 600
    if-eq v3, v5, :cond_21

    .line 601
    .line 602
    iget-object v10, v4, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 603
    .line 604
    if-eqz v10, :cond_21

    .line 605
    .line 606
    iget-object v4, v4, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 607
    .line 608
    instance-of v5, v4, Ll/kvc0;

    .line 609
    .line 610
    if-eqz v5, :cond_21

    .line 611
    .line 612
    move-object v11, v4

    .line 613
    check-cast v11, Ll/kvc0;

    .line 614
    .line 615
    move/from16 v16, v15

    .line 616
    .line 617
    move v15, v14

    .line 618
    move v14, v13

    .line 619
    move v13, v12

    .line 620
    move/from16 v12, p2

    .line 621
    .line 622
    invoke-interface/range {v10 .. v16}, Ll/xm50;->A0(Ll/kvc0;ZFIII)V

    .line 623
    .line 624
    .line 625
    :cond_21
    :goto_e
    if-lez v1, :cond_22

    .line 626
    .line 627
    if-gez v3, :cond_2d

    .line 628
    .line 629
    :cond_22
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 630
    .line 631
    iget-object v4, v4, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 632
    .line 633
    if-eqz v4, :cond_2d

    .line 634
    .line 635
    invoke-static {v1, v8}, Ljava/lang/Math;->min(II)I

    .line 636
    .line 637
    .line 638
    move-result v1

    .line 639
    neg-int v1, v1

    .line 640
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 641
    .line 642
    iget v5, v4, Lv/smart_refresh/SmartRefreshLayout;->O0:I

    .line 643
    .line 644
    iget v9, v4, Lv/smart_refresh/SmartRefreshLayout;->T0:F

    .line 645
    .line 646
    cmpg-float v10, v9, v17

    .line 647
    .line 648
    if-gez v10, :cond_23

    .line 649
    .line 650
    int-to-float v10, v5

    .line 651
    mul-float/2addr v9, v10

    .line 652
    :cond_23
    float-to-int v9, v9

    .line 653
    int-to-float v10, v1

    .line 654
    mul-float v10, v10, v18

    .line 655
    .line 656
    iget v11, v4, Lv/smart_refresh/SmartRefreshLayout;->V0:F

    .line 657
    .line 658
    cmpg-float v12, v11, v17

    .line 659
    .line 660
    if-gez v12, :cond_24

    .line 661
    .line 662
    int-to-float v12, v5

    .line 663
    mul-float/2addr v11, v12

    .line 664
    :cond_24
    div-float v21, v10, v11

    .line 665
    .line 666
    iget-boolean v10, v4, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 667
    .line 668
    invoke-virtual {v4, v10}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 669
    .line 670
    .line 671
    move-result v4

    .line 672
    if-nez v4, :cond_26

    .line 673
    .line 674
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 675
    .line 676
    iget-object v4, v4, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 677
    .line 678
    sget-object v10, Lv/smart_refresh/constant/RefreshState;->LoadFinish:Lv/smart_refresh/constant/RefreshState;

    .line 679
    .line 680
    if-ne v4, v10, :cond_25

    .line 681
    .line 682
    if-nez p2, :cond_25

    .line 683
    .line 684
    goto :goto_f

    .line 685
    :cond_25
    move/from16 v22, v1

    .line 686
    .line 687
    move/from16 v23, v5

    .line 688
    .line 689
    move/from16 v24, v9

    .line 690
    .line 691
    goto/16 :goto_14

    .line 692
    .line 693
    :cond_26
    :goto_f
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 694
    .line 695
    iget v10, v4, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 696
    .line 697
    if-eq v3, v10, :cond_2a

    .line 698
    .line 699
    iget-object v4, v4, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 700
    .line 701
    invoke-interface {v4}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 702
    .line 703
    .line 704
    move-result-object v4

    .line 705
    sget-object v10, Ll/wwf0;->d:Ll/wwf0;

    .line 706
    .line 707
    iget-object v11, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 708
    .line 709
    if-ne v4, v10, :cond_27

    .line 710
    .line 711
    iget-object v4, v11, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 712
    .line 713
    invoke-interface {v4}, Ll/gvc0;->getView()Landroid/view/View;

    .line 714
    .line 715
    .line 716
    move-result-object v4

    .line 717
    iget-object v6, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 718
    .line 719
    iget v6, v6, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 720
    .line 721
    int-to-float v6, v6

    .line 722
    invoke-virtual {v4, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 723
    .line 724
    .line 725
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 726
    .line 727
    iget v6, v4, Lv/smart_refresh/SmartRefreshLayout;->h1:I

    .line 728
    .line 729
    if-eqz v6, :cond_29

    .line 730
    .line 731
    iget-object v6, v4, Lv/smart_refresh/SmartRefreshLayout;->a1:Landroid/graphics/Paint;

    .line 732
    .line 733
    if-eqz v6, :cond_29

    .line 734
    .line 735
    iget-boolean v6, v4, Lv/smart_refresh/SmartRefreshLayout;->G:Z

    .line 736
    .line 737
    iget-object v8, v4, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 738
    .line 739
    invoke-virtual {v4, v6, v8}, Lv/smart_refresh/SmartRefreshLayout;->A(ZLl/gvc0;)Z

    .line 740
    .line 741
    .line 742
    move-result v4

    .line 743
    if-nez v4, :cond_29

    .line 744
    .line 745
    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    .line 746
    .line 747
    .line 748
    goto :goto_11

    .line 749
    :cond_27
    iget-object v4, v11, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 750
    .line 751
    invoke-interface {v4}, Ll/gvc0;->getSpinnerStyle()Ll/wwf0;

    .line 752
    .line 753
    .line 754
    move-result-object v4

    .line 755
    iget-boolean v4, v4, Ll/wwf0;->c:Z

    .line 756
    .line 757
    if-eqz v4, :cond_29

    .line 758
    .line 759
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 760
    .line 761
    iget-object v4, v4, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 762
    .line 763
    invoke-interface {v4}, Ll/gvc0;->getView()Landroid/view/View;

    .line 764
    .line 765
    .line 766
    move-result-object v4

    .line 767
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 768
    .line 769
    .line 770
    move-result-object v10

    .line 771
    instance-of v11, v10, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 772
    .line 773
    if-eqz v11, :cond_28

    .line 774
    .line 775
    check-cast v10, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 776
    .line 777
    goto :goto_10

    .line 778
    :cond_28
    sget-object v10, Lv/smart_refresh/SmartRefreshLayout;->t1:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 779
    .line 780
    :goto_10
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 781
    .line 782
    .line 783
    move-result v11

    .line 784
    invoke-static {v11, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 785
    .line 786
    .line 787
    move-result v11

    .line 788
    iget-object v12, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 789
    .line 790
    iget v12, v12, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 791
    .line 792
    neg-int v12, v12

    .line 793
    iget v13, v10, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 794
    .line 795
    sub-int/2addr v12, v13

    .line 796
    iget v13, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 797
    .line 798
    sub-int/2addr v12, v13

    .line 799
    invoke-static {v12, v8}, Ljava/lang/Math;->max(II)I

    .line 800
    .line 801
    .line 802
    move-result v8

    .line 803
    invoke-static {v8, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 804
    .line 805
    .line 806
    move-result v6

    .line 807
    invoke-virtual {v4, v11, v6}, Landroid/view/View;->measure(II)V

    .line 808
    .line 809
    .line 810
    iget v6, v10, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 811
    .line 812
    iget v8, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 813
    .line 814
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 815
    .line 816
    .line 817
    move-result v10

    .line 818
    add-int/2addr v8, v10

    .line 819
    iget-object v10, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 820
    .line 821
    iget v10, v10, Lv/smart_refresh/SmartRefreshLayout;->R0:I

    .line 822
    .line 823
    sub-int/2addr v8, v10

    .line 824
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 825
    .line 826
    .line 827
    move-result v10

    .line 828
    sub-int v10, v8, v10

    .line 829
    .line 830
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 831
    .line 832
    .line 833
    move-result v11

    .line 834
    add-int/2addr v11, v6

    .line 835
    invoke-virtual {v4, v6, v10, v11, v8}, Landroid/view/View;->layout(IIII)V

    .line 836
    .line 837
    .line 838
    :cond_29
    :goto_11
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 839
    .line 840
    iget-object v4, v4, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 841
    .line 842
    move/from16 v20, p2

    .line 843
    .line 844
    move/from16 v22, v1

    .line 845
    .line 846
    move-object/from16 v19, v4

    .line 847
    .line 848
    move/from16 v23, v5

    .line 849
    .line 850
    move/from16 v24, v9

    .line 851
    .line 852
    invoke-interface/range {v19 .. v24}, Ll/gvc0;->l(ZFIII)V

    .line 853
    .line 854
    .line 855
    goto :goto_12

    .line 856
    :cond_2a
    move/from16 v22, v1

    .line 857
    .line 858
    move/from16 v23, v5

    .line 859
    .line 860
    move/from16 v24, v9

    .line 861
    .line 862
    :goto_12
    if-eqz p2, :cond_2c

    .line 863
    .line 864
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 865
    .line 866
    iget-object v1, v1, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 867
    .line 868
    invoke-interface {v1}, Ll/gvc0;->e()Z

    .line 869
    .line 870
    .line 871
    move-result v1

    .line 872
    if-eqz v1, :cond_2c

    .line 873
    .line 874
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 875
    .line 876
    iget v1, v1, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 877
    .line 878
    float-to-int v1, v1

    .line 879
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 880
    .line 881
    .line 882
    move-result v2

    .line 883
    iget-object v4, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 884
    .line 885
    iget v5, v4, Lv/smart_refresh/SmartRefreshLayout;->j:F

    .line 886
    .line 887
    if-nez v2, :cond_2b

    .line 888
    .line 889
    goto :goto_13

    .line 890
    :cond_2b
    move v7, v2

    .line 891
    :goto_13
    int-to-float v6, v7

    .line 892
    div-float/2addr v5, v6

    .line 893
    iget-object v4, v4, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 894
    .line 895
    invoke-interface {v4, v5, v1, v2}, Ll/gvc0;->d(FII)V

    .line 896
    .line 897
    .line 898
    :cond_2c
    :goto_14
    iget-object v1, v0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 899
    .line 900
    iget v2, v1, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 901
    .line 902
    if-eq v3, v2, :cond_2d

    .line 903
    .line 904
    iget-object v2, v1, Lv/smart_refresh/SmartRefreshLayout;->F0:Ll/xm50;

    .line 905
    .line 906
    if-eqz v2, :cond_2d

    .line 907
    .line 908
    iget-object v1, v1, Lv/smart_refresh/SmartRefreshLayout;->Y0:Ll/gvc0;

    .line 909
    .line 910
    instance-of v3, v1, Ll/jvc0;

    .line 911
    .line 912
    if-eqz v3, :cond_2d

    .line 913
    .line 914
    move-object/from16 v20, v1

    .line 915
    .line 916
    check-cast v20, Ll/jvc0;

    .line 917
    .line 918
    move-object/from16 v19, v2

    .line 919
    .line 920
    move/from16 v25, v24

    .line 921
    .line 922
    move/from16 v24, v23

    .line 923
    .line 924
    move/from16 v23, v22

    .line 925
    .line 926
    move/from16 v22, v21

    .line 927
    .line 928
    move/from16 v21, p2

    .line 929
    .line 930
    invoke-interface/range {v19 .. v25}, Ll/xm50;->k(Ll/jvc0;ZFIII)V

    .line 931
    .line 932
    .line 933
    :cond_2d
    :goto_15
    return-object v0
.end method

.method public f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;
    .locals 2
    .param p1    # Lv/smart_refresh/constant/RefreshState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lv/smart_refresh/SmartRefreshLayout$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 16
    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :pswitch_0
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->setStateLoading(Z)V

    .line 23
    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :pswitch_1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lv/smart_refresh/SmartRefreshLayout;->setStateRefreshing(Z)V

    .line 30
    .line 31
    .line 32
    goto/16 :goto_0

    .line 33
    .line 34
    :pswitch_2
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 35
    .line 36
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 37
    .line 38
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 39
    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 51
    .line 52
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->LoadReleased:Lv/smart_refresh/constant/RefreshState;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 55
    .line 56
    .line 57
    goto/16 :goto_0

    .line 58
    .line 59
    :cond_0
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 60
    .line 61
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->LoadReleased:Lv/smart_refresh/constant/RefreshState;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 64
    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :pswitch_3
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 69
    .line 70
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 71
    .line 72
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 73
    .line 74
    if-nez v0, :cond_1

    .line 75
    .line 76
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 85
    .line 86
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->RefreshReleased:Lv/smart_refresh/constant/RefreshState;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 89
    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :cond_1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 94
    .line 95
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->RefreshReleased:Lv/smart_refresh/constant/RefreshState;

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 98
    .line 99
    .line 100
    goto/16 :goto_0

    .line 101
    .line 102
    :pswitch_4
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 103
    .line 104
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 105
    .line 106
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 107
    .line 108
    if-nez v0, :cond_2

    .line 109
    .line 110
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_2

    .line 117
    .line 118
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 119
    .line 120
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->ReleaseToTwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 123
    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :cond_2
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 128
    .line 129
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->ReleaseToTwoLevel:Lv/smart_refresh/constant/RefreshState;

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 132
    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :pswitch_5
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 137
    .line 138
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_4

    .line 145
    .line 146
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 147
    .line 148
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 149
    .line 150
    iget-boolean v1, v0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 151
    .line 152
    if-nez v1, :cond_4

    .line 153
    .line 154
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 155
    .line 156
    if-nez v0, :cond_4

    .line 157
    .line 158
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 159
    .line 160
    if-eqz v0, :cond_3

    .line 161
    .line 162
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 163
    .line 164
    if-eqz v0, :cond_3

    .line 165
    .line 166
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 167
    .line 168
    if-nez v0, :cond_4

    .line 169
    .line 170
    :cond_3
    sget-object p0, Lv/smart_refresh/constant/RefreshState;->ReleaseToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 171
    .line 172
    invoke-virtual {p1, p0}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 173
    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_4
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 178
    .line 179
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->ReleaseToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 180
    .line 181
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 182
    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :pswitch_6
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 187
    .line 188
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 189
    .line 190
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 191
    .line 192
    if-nez v0, :cond_5

    .line 193
    .line 194
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 195
    .line 196
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-eqz p1, :cond_5

    .line 201
    .line 202
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 203
    .line 204
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->ReleaseToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 205
    .line 206
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 207
    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :cond_5
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 212
    .line 213
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->ReleaseToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 214
    .line 215
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :pswitch_7
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 221
    .line 222
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 223
    .line 224
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    if-eqz p1, :cond_7

    .line 229
    .line 230
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 231
    .line 232
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 233
    .line 234
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 235
    .line 236
    if-nez v0, :cond_7

    .line 237
    .line 238
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 239
    .line 240
    if-eqz v0, :cond_6

    .line 241
    .line 242
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 243
    .line 244
    if-eqz v0, :cond_6

    .line 245
    .line 246
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 247
    .line 248
    if-nez v0, :cond_7

    .line 249
    .line 250
    :cond_6
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->PullUpCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 251
    .line 252
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 253
    .line 254
    .line 255
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 256
    .line 257
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout$n;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 258
    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :cond_7
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 263
    .line 264
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->PullUpCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 265
    .line 266
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 267
    .line 268
    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :pswitch_8
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 272
    .line 273
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 274
    .line 275
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 276
    .line 277
    if-nez v0, :cond_8

    .line 278
    .line 279
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 280
    .line 281
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    if-eqz p1, :cond_8

    .line 286
    .line 287
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 288
    .line 289
    sget-object v0, Lv/smart_refresh/constant/RefreshState;->PullDownCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 290
    .line 291
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 292
    .line 293
    .line 294
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 295
    .line 296
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout$n;->f(Lv/smart_refresh/constant/RefreshState;)Ll/lvc0;

    .line 297
    .line 298
    .line 299
    goto/16 :goto_0

    .line 300
    .line 301
    :cond_8
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 302
    .line 303
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->PullDownCanceled:Lv/smart_refresh/constant/RefreshState;

    .line 304
    .line 305
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 306
    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :pswitch_9
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 311
    .line 312
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->C:Z

    .line 313
    .line 314
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 315
    .line 316
    .line 317
    move-result p1

    .line 318
    if-eqz p1, :cond_a

    .line 319
    .line 320
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 321
    .line 322
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 323
    .line 324
    iget-boolean v1, v0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 325
    .line 326
    if-nez v1, :cond_a

    .line 327
    .line 328
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isFinishing:Z

    .line 329
    .line 330
    if-nez v0, :cond_a

    .line 331
    .line 332
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->T:Z

    .line 333
    .line 334
    if-eqz v0, :cond_9

    .line 335
    .line 336
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->H:Z

    .line 337
    .line 338
    if-eqz v0, :cond_9

    .line 339
    .line 340
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->U:Z

    .line 341
    .line 342
    if-nez v0, :cond_a

    .line 343
    .line 344
    :cond_9
    sget-object p0, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 345
    .line 346
    invoke-virtual {p1, p0}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 347
    .line 348
    .line 349
    goto :goto_0

    .line 350
    :cond_a
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 351
    .line 352
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->PullUpToLoad:Lv/smart_refresh/constant/RefreshState;

    .line 353
    .line 354
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 355
    .line 356
    .line 357
    goto :goto_0

    .line 358
    :pswitch_a
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 359
    .line 360
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 361
    .line 362
    iget-boolean v0, v0, Lv/smart_refresh/constant/RefreshState;->isOpening:Z

    .line 363
    .line 364
    if-nez v0, :cond_b

    .line 365
    .line 366
    iget-boolean v0, p1, Lv/smart_refresh/SmartRefreshLayout;->B:Z

    .line 367
    .line 368
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->z(Z)Z

    .line 369
    .line 370
    .line 371
    move-result p1

    .line 372
    if-eqz p1, :cond_b

    .line 373
    .line 374
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 375
    .line 376
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 377
    .line 378
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 379
    .line 380
    .line 381
    goto :goto_0

    .line 382
    :cond_b
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 383
    .line 384
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 385
    .line 386
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->setViceState(Lv/smart_refresh/constant/RefreshState;)V

    .line 387
    .line 388
    .line 389
    goto :goto_0

    .line 390
    :pswitch_b
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$n;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 391
    .line 392
    iget-object v0, p1, Lv/smart_refresh/SmartRefreshLayout;->d1:Lv/smart_refresh/constant/RefreshState;

    .line 393
    .line 394
    sget-object v1, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 395
    .line 396
    if-eq v0, v1, :cond_c

    .line 397
    .line 398
    iget v0, p1, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 399
    .line 400
    if-nez v0, :cond_c

    .line 401
    .line 402
    invoke-virtual {p1, v1}, Lv/smart_refresh/SmartRefreshLayout;->D(Lv/smart_refresh/constant/RefreshState;)V

    .line 403
    .line 404
    .line 405
    goto :goto_0

    .line 406
    :cond_c
    iget p1, p1, Lv/smart_refresh/SmartRefreshLayout;->b:I

    .line 407
    .line 408
    if-eqz p1, :cond_d

    .line 409
    .line 410
    const/4 p1, 0x0

    .line 411
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout$n;->a(I)Landroid/animation/ValueAnimator;

    .line 412
    .line 413
    .line 414
    :cond_d
    :goto_0
    const/4 p0, 0x0

    .line 415
    return-object p0

    .line 416
    nop

    .line 417
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
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
