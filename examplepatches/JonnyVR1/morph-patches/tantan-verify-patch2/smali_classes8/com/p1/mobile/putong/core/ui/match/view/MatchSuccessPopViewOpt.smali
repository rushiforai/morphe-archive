.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/syl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Ll/ryl;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public E(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->c:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p1, v2}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->b(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public N(Ljava/lang/Runnable;)V
    .locals 9

    .line 1
    new-instance v6, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const v0, 0x3f19999a    # 0.6f

    .line 4
    .line 5
    .line 6
    const v1, 0x3f11eb85    # 0.57f

    .line 7
    .line 8
    .line 9
    const v2, 0x3e851eb8    # 0.26f

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-direct {v6, v2, v3, v0, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 19
    .line 20
    invoke-interface {v1}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->getPopOutDuring()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-long v4, v1

    .line 29
    const/4 v1, 0x2

    .line 30
    new-array v7, v1, [F

    .line 31
    .line 32
    fill-array-data v7, :array_0

    .line 33
    .line 34
    .line 35
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 36
    .line 37
    const-wide/16 v2, 0x0

    .line 38
    .line 39
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 46
    .line 47
    invoke-interface {v1}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->getPopOutDuring()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    int-to-long v4, v1

    .line 56
    const/high16 v1, 0x42f00000    # 120.0f

    .line 57
    .line 58
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    neg-int v1, v1

    .line 63
    int-to-float v1, v1

    .line 64
    const/4 v2, 0x1

    .line 65
    new-array v7, v2, [F

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    aput v1, v7, v2

    .line 69
    .line 70
    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 71
    .line 72
    const-wide/16 v2, 0x0

    .line 73
    .line 74
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    filled-new-array {v8, v0}, [Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt$a;

    .line 87
    .line 88
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;Ljava/lang/Runnable;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    nop

    .line 99
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public V()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->c()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->b(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xgx;->a(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final b(Z)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->a0()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 11
    .line 12
    invoke-interface {v1}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->getAvatarX()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 21
    .line 22
    invoke-interface {v2}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->getAvatarDelay()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    new-instance v9, Ll/fzf0;

    .line 31
    .line 32
    const/high16 v3, 0x3f000000    # 0.5f

    .line 33
    .line 34
    invoke-direct {v9, v3}, Ll/fzf0;-><init>(F)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const/4 v11, 0x2

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->b:Lv/VDraweeView;

    .line 45
    .line 46
    int-to-long v3, v2

    .line 47
    new-instance v18, Landroid/view/animation/LinearInterpolator;

    .line 48
    .line 49
    invoke-direct/range {v18 .. v18}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 50
    .line 51
    .line 52
    new-array v5, v11, [F

    .line 53
    .line 54
    fill-array-data v5, :array_0

    .line 55
    .line 56
    .line 57
    sget-object v14, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 58
    .line 59
    move-object v13, v14

    .line 60
    const-wide/16 v14, 0x0

    .line 61
    .line 62
    move-wide/from16 v16, v3

    .line 63
    .line 64
    move-object/from16 v19, v5

    .line 65
    .line 66
    invoke-static/range {v12 .. v19}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->c:Lv/VDraweeView;

    .line 71
    .line 72
    new-instance v19, Landroid/view/animation/LinearInterpolator;

    .line 73
    .line 74
    invoke-direct/range {v19 .. v19}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 75
    .line 76
    .line 77
    new-array v5, v11, [F

    .line 78
    .line 79
    fill-array-data v5, :array_1

    .line 80
    .line 81
    .line 82
    move-wide/from16 v17, v16

    .line 83
    .line 84
    const-wide/16 v15, 0x0

    .line 85
    .line 86
    move-object/from16 v20, v5

    .line 87
    .line 88
    move-object v14, v13

    .line 89
    move-object v13, v4

    .line 90
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    filled-new-array {v3, v4}, [Landroid/animation/Animator;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-static {v3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    :cond_1
    move-object v12, v3

    .line 103
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->b:Lv/VDraweeView;

    .line 104
    .line 105
    int-to-long v5, v2

    .line 106
    int-to-long v7, v1

    .line 107
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 108
    .line 109
    if-eqz p1, :cond_2

    .line 110
    .line 111
    invoke-interface {v1}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iget v1, v1, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->avatarRepeatTransX:I

    .line 116
    .line 117
    :goto_0
    int-to-float v1, v1

    .line 118
    goto :goto_1

    .line 119
    :cond_2
    invoke-interface {v1}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iget v1, v1, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->avatarTransX:I

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :goto_1
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    neg-int v1, v1

    .line 131
    int-to-float v1, v1

    .line 132
    const/4 v2, 0x0

    .line 133
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    int-to-float v4, v4

    .line 138
    new-array v10, v11, [F

    .line 139
    .line 140
    const/4 v13, 0x0

    .line 141
    aput v1, v10, v13

    .line 142
    .line 143
    const/4 v1, 0x1

    .line 144
    aput v4, v10, v1

    .line 145
    .line 146
    sget-object v4, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 147
    .line 148
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 149
    .line 150
    .line 151
    move-result-object v14

    .line 152
    move-wide v15, v5

    .line 153
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->c:Lv/VDraweeView;

    .line 154
    .line 155
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 156
    .line 157
    if-eqz p1, :cond_3

    .line 158
    .line 159
    invoke-interface {v5}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    iget v5, v5, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->avatarRepeatTransX:I

    .line 164
    .line 165
    :goto_2
    int-to-float v5, v5

    .line 166
    goto :goto_3

    .line 167
    :cond_3
    invoke-interface {v5}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    iget v5, v5, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->avatarTransX:I

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :goto_3
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 175
    .line 176
    .line 177
    move-result v5

    .line 178
    int-to-float v5, v5

    .line 179
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    int-to-float v2, v2

    .line 184
    new-array v10, v11, [F

    .line 185
    .line 186
    aput v5, v10, v13

    .line 187
    .line 188
    aput v2, v10, v1

    .line 189
    .line 190
    move-wide v5, v15

    .line 191
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->b:Lv/VDraweeView;

    .line 196
    .line 197
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 198
    .line 199
    invoke-interface {v2}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->getAvatarAlpha()I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    int-to-long v2, v2

    .line 208
    new-instance v19, Landroid/view/animation/LinearInterpolator;

    .line 209
    .line 210
    invoke-direct/range {v19 .. v19}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 211
    .line 212
    .line 213
    new-array v4, v11, [F

    .line 214
    .line 215
    fill-array-data v4, :array_2

    .line 216
    .line 217
    .line 218
    move-object v5, v14

    .line 219
    sget-object v14, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 220
    .line 221
    move-wide/from16 v17, v2

    .line 222
    .line 223
    move-object/from16 v20, v4

    .line 224
    .line 225
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->c:Lv/VDraweeView;

    .line 230
    .line 231
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 232
    .line 233
    invoke-interface {v0}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->getAvatarAlpha()I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    int-to-long v3, v0

    .line 242
    new-instance v19, Landroid/view/animation/LinearInterpolator;

    .line 243
    .line 244
    invoke-direct/range {v19 .. v19}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 245
    .line 246
    .line 247
    new-array v0, v11, [F

    .line 248
    .line 249
    fill-array-data v0, :array_3

    .line 250
    .line 251
    .line 252
    move-object/from16 v20, v0

    .line 253
    .line 254
    move-wide/from16 v17, v3

    .line 255
    .line 256
    invoke-static/range {v13 .. v20}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    filled-new-array {v12, v5, v1, v2, v0}, [Landroid/animation/Animator;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 269
    .line 270
    .line 271
    return-void

    .line 272
    nop

    .line 273
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final c()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v7, Landroid/view/animation/PathInterpolator;

    .line 9
    .line 10
    const v0, 0x3f547ae1    # 0.83f

    .line 11
    .line 12
    .line 13
    const v1, 0x3ecccccd    # 0.4f

    .line 14
    .line 15
    .line 16
    const/high16 v2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    invoke-direct {v7, v1, v0, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 24
    .line 25
    invoke-interface {v0}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->getPopEnterDuring()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    int-to-long v5, v0

    .line 34
    const/4 v0, 0x2

    .line 35
    new-array v8, v0, [F

    .line 36
    .line 37
    fill-array-data v8, :array_0

    .line 38
    .line 39
    .line 40
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 41
    .line 42
    const-wide/16 v3, 0x0

    .line 43
    .line 44
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object v9

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->a:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 51
    .line 52
    invoke-interface {p0}, Ll/ryl;->getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->getPopEnterDuring()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    int-to-long v5, p0

    .line 61
    const/high16 p0, 0x42f00000    # 120.0f

    .line 62
    .line 63
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    neg-int p0, p0

    .line 68
    int-to-float p0, p0

    .line 69
    new-array v8, v0, [F

    .line 70
    .line 71
    const/4 v0, 0x0

    .line 72
    aput p0, v8, v0

    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    const/4 v0, 0x1

    .line 76
    aput p0, v8, v0

    .line 77
    .line 78
    sget-object v2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 79
    .line 80
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    filled-new-array {v9, p0}, [Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    nop

    .line 97
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public getRootView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->d:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/syl;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 3

    .line 1
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->b:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {p2, v0, v1, v2}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 23
    .line 24
    .line 25
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->c:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p2, p0, p1, v2}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public x(Ll/ryl;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/syl;->x(Ll/ryl;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopViewOpt;->e:Ll/ryl;

    .line 5
    .line 6
    return-void
.end method
