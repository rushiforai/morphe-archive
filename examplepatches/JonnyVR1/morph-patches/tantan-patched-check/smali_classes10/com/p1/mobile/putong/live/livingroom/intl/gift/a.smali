.class public Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public d:Ll/jjs;

.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

.field public f:I

.field public g:Landroid/animation/AnimatorSet;

.field public h:Landroid/animation/AnimatorSet;

.field public i:Z

.field public j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->i:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->f()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->j()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->i(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->d:Ll/jjs;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->click:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->combosGears:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p0}, Ll/kyb;->a(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-ltz p1, :cond_1

    .line 29
    .line 30
    if-ge p1, v0, :cond_1

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final d(Landroid/view/View;)Landroid/animation/AnimatorSet;
    .locals 5

    .line 1
    sget-object p0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    new-array v1, v0, [F

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {p1, p0, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-wide/16 v1, 0xb4

    .line 14
    .line 15
    invoke-virtual {p0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 16
    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {p0, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 20
    .line 21
    .line 22
    sget-object v4, Ll/gt0;->i:Landroid/util/Property;

    .line 23
    .line 24
    new-array v0, v0, [F

    .line 25
    .line 26
    fill-array-data v0, :array_1

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v4, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 42
    .line 43
    .line 44
    filled-new-array {p0, p1}, [Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 49
    .line 50
    .line 51
    return-object v0

    .line 52
    nop

    .line 53
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final e(Landroid/view/View;I)Landroid/animation/AnimatorSet;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 6
    .line 7
    const/4 v3, 0x2

    .line 8
    new-array v4, v3, [F

    .line 9
    .line 10
    fill-array-data v4, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v1, v2, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-wide/16 v4, 0xe6

    .line 18
    .line 19
    invoke-virtual {v2, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-virtual {v2, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 24
    .line 25
    .line 26
    sget-object v5, Ll/gt0;->i:Landroid/util/Property;

    .line 27
    .line 28
    new-array v6, v3, [F

    .line 29
    .line 30
    fill-array-data v6, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v5, v6}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    const-wide/16 v6, 0xb4

    .line 38
    .line 39
    invoke-virtual {v5, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v5, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 43
    .line 44
    .line 45
    sget-object v8, Ll/gt0;->i:Landroid/util/Property;

    .line 46
    .line 47
    new-array v9, v3, [F

    .line 48
    .line 49
    fill-array-data v9, :array_2

    .line 50
    .line 51
    .line 52
    invoke-static {v1, v8, v9}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    const-wide/16 v9, 0x78

    .line 57
    .line 58
    invoke-virtual {v8, v9, v10}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v8, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    new-instance v11, Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    invoke-direct {v11}, Landroid/animation/AnimatorSet;-><init>()V

    .line 67
    .line 68
    .line 69
    filled-new-array {v5, v8}, [Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-virtual {v11, v5}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 74
    .line 75
    .line 76
    sget-object v5, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 77
    .line 78
    const/high16 v8, 0x43480000    # 200.0f

    .line 79
    .line 80
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v8

    .line 84
    int-to-float v8, v8

    .line 85
    const/high16 v12, 0x41200000    # 10.0f

    .line 86
    .line 87
    invoke-static {v12}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v13

    .line 91
    neg-int v13, v13

    .line 92
    int-to-float v13, v13

    .line 93
    new-array v14, v3, [F

    .line 94
    .line 95
    const/4 v15, 0x0

    .line 96
    aput v8, v14, v15

    .line 97
    .line 98
    const/4 v8, 0x1

    .line 99
    aput v13, v14, v8

    .line 100
    .line 101
    invoke-static {v1, v5, v14}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 102
    .line 103
    .line 104
    move-result-object v13

    .line 105
    invoke-virtual {v13, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v13, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v12}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    neg-int v6, v6

    .line 116
    int-to-float v6, v6

    .line 117
    new-array v7, v3, [F

    .line 118
    .line 119
    aput v6, v7, v15

    .line 120
    .line 121
    const/4 v6, 0x0

    .line 122
    aput v6, v7, v8

    .line 123
    .line 124
    invoke-static {v1, v5, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v5, v9, v10}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v5, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 132
    .line 133
    .line 134
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 135
    .line 136
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 137
    .line 138
    .line 139
    filled-new-array {v13, v5}, [Landroid/animation/Animator;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 144
    .line 145
    .line 146
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 147
    .line 148
    if-ne v1, v4, :cond_0

    .line 149
    .line 150
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 151
    .line 152
    const/high16 v4, 0x42700000    # 60.0f

    .line 153
    .line 154
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 155
    .line 156
    .line 157
    move-result v4

    .line 158
    int-to-float v4, v4

    .line 159
    new-array v3, v3, [F

    .line 160
    .line 161
    aput v4, v3, v15

    .line 162
    .line 163
    aput v6, v3, v8

    .line 164
    .line 165
    invoke-static {v1, v0, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 166
    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 170
    .line 171
    if-ne v1, v0, :cond_1

    .line 172
    .line 173
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 174
    .line 175
    const/high16 v4, 0x42a00000    # 80.0f

    .line 176
    .line 177
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    neg-int v4, v4

    .line 182
    int-to-float v4, v4

    .line 183
    new-array v3, v3, [F

    .line 184
    .line 185
    aput v4, v3, v15

    .line 186
    .line 187
    aput v6, v3, v8

    .line 188
    .line 189
    invoke-static {v1, v0, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 190
    .line 191
    .line 192
    :cond_1
    :goto_0
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 193
    .line 194
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 195
    .line 196
    .line 197
    invoke-static/range {p2 .. p2}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    move/from16 v3, p2

    .line 202
    .line 203
    int-to-long v3, v3

    .line 204
    invoke-virtual {v0, v3, v4}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-virtual {v2, v11}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 216
    .line 217
    .line 218
    return-object v0

    .line 219
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    :array_1
    .array-data 4
        0x0
        0x3f8ccccd    # 1.1f
    .end array-data

    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    :array_2
    .array-data 4
        0x3f8ccccd    # 1.1f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->n(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->n(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->n(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;->SMALL:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->b(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;->MIDDLE:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->b(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;->LARGE:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->b(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView$IntlContinueType;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final g(Ll/jjs;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->d:Ll/jjs;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/jjs;->q(Ll/jjs;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public h()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 18
    .line 19
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;ILandroid/view/View;)V
    .locals 8

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->getGears()Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;->combosHitNum:J

    .line 10
    .line 11
    long-to-int v7, v0

    .line 12
    new-instance v2, Ll/jne0;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->d:Ll/jjs;

    .line 15
    .line 16
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 17
    .line 18
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->f:I

    .line 19
    .line 20
    move v5, p2

    .line 21
    invoke-direct/range {v2 .. v7}, Ll/jne0;-><init>(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;III)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

    .line 25
    .line 26
    invoke-interface {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;->a(Ll/jne0;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic j()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->o(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->g:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->h:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->d:Ll/jjs;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->i:Z

    .line 16
    .line 17
    return-void
.end method

.method public final l(Ll/jjs;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->c(Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;Ll/jjs;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->c(Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;Ll/jjs;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;->c(Lcom/p1/mobile/putong/live/base/data/BLiveGiftCombosGears;Ll/jjs;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->h:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->g(Ll/jjs;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->i:Z

    .line 14
    .line 15
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->d:Ll/jjs;

    .line 18
    .line 19
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

    .line 20
    .line 21
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->f:I

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->l(Ll/jjs;)V

    .line 24
    .line 25
    .line 26
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->i:Z

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->q()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->o(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/pno;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/pno;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o(I)V
    .locals 4

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->i:Z

    .line 10
    .line 11
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-nez p1, :cond_2

    .line 15
    .line 16
    move v3, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_2
    move v3, v1

    .line 19
    :goto_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 23
    .line 24
    if-nez p1, :cond_3

    .line 25
    .line 26
    move v3, v2

    .line 27
    goto :goto_1

    .line 28
    :cond_3
    move v3, v1

    .line 29
    :goto_1
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 33
    .line 34
    if-nez p1, :cond_4

    .line 35
    .line 36
    move v1, v2

    .line 37
    :cond_4
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public p(Ll/x20;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->h:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->h:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->d(Landroid/view/View;)Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 18
    .line 19
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->d(Landroid/view/View;)Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 24
    .line 25
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->d(Landroid/view/View;)Landroid/animation/AnimatorSet;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->h:Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    const/4 v5, 0x3

    .line 37
    new-array v5, v5, [Landroid/animation/Animator;

    .line 38
    .line 39
    aput-object v0, v5, v1

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    aput-object v2, v5, v0

    .line 43
    .line 44
    const/4 v0, 0x2

    .line 45
    aput-object v3, v5, v0

    .line 46
    .line 47
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->h:Landroid/animation/AnimatorSet;

    .line 51
    .line 52
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    new-instance v2, Ll/bri0;

    .line 56
    .line 57
    invoke-direct {v2, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->h:Landroid/animation/AnimatorSet;

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 66
    .line 67
    .line 68
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->i:Z

    .line 69
    .line 70
    return-void
.end method

.method public final q()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->g:Landroid/animation/AnimatorSet;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 23
    .line 24
    const/16 v2, 0x64

    .line 25
    .line 26
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->e(Landroid/view/View;I)Landroid/animation/AnimatorSet;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 31
    .line 32
    const/16 v3, 0x8c

    .line 33
    .line 34
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->e(Landroid/view/View;I)Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->c:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 39
    .line 40
    const/16 v4, 0xb4

    .line 41
    .line 42
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->e(Landroid/view/View;I)Landroid/animation/AnimatorSet;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 47
    .line 48
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->g:Landroid/animation/AnimatorSet;

    .line 52
    .line 53
    const/4 v5, 0x3

    .line 54
    new-array v5, v5, [Landroid/animation/Animator;

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    aput-object v0, v5, v6

    .line 58
    .line 59
    aput-object v2, v5, v1

    .line 60
    .line 61
    const/4 v0, 0x2

    .line 62
    aput-object v3, v5, v0

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->g:Landroid/animation/AnimatorSet;

    .line 68
    .line 69
    new-instance v2, Ll/qno;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Ll/qno;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->g:Landroid/animation/AnimatorSet;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 80
    .line 81
    .line 82
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->i:Z

    .line 83
    .line 84
    return-void
.end method
