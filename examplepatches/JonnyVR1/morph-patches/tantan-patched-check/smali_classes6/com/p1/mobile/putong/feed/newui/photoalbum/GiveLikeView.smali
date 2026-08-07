.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;
.super Lv/VImage;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# instance fields
.field public d:J

.field public e:Ljava/lang/String;

.field public f:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->d:J

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, 0x0

    .line 15
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->d:J

    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->e:Ljava/lang/String;

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, 0x0

    .line 19
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->d:J

    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->e:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    return-void
.end method

.method private h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    :cond_0
    const/16 v0, 0x8

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setId(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->e:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->h()V

    .line 12
    .line 13
    .line 14
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->e:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public setVisibility(I)V
    .locals 14

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    move v0, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v1

    .line 14
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 20
    .line 21
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 29
    .line 30
    .line 31
    const-wide/16 v3, 0x64

    .line 32
    .line 33
    invoke-virtual {p1, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/sunshine/engine/base/InterpolatorType;->accelerate:Lcom/sunshine/engine/base/InterpolatorType;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/sunshine/engine/base/InterpolatorType;->obtain()Landroid/view/animation/Interpolator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x2

    .line 46
    new-array v5, v0, [F

    .line 47
    .line 48
    fill-array-data v5, :array_0

    .line 49
    .line 50
    .line 51
    const-string v6, "scaleX"

    .line 52
    .line 53
    invoke-static {p0, v6, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    new-array v7, v0, [F

    .line 58
    .line 59
    fill-array-data v7, :array_1

    .line 60
    .line 61
    .line 62
    const-string v8, "scaleY"

    .line 63
    .line 64
    invoke-static {p0, v8, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    new-array v9, v0, [F

    .line 69
    .line 70
    fill-array-data v9, :array_2

    .line 71
    .line 72
    .line 73
    const-string v10, "alpha"

    .line 74
    .line 75
    invoke-static {p0, v10, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 76
    .line 77
    .line 78
    move-result-object v9

    .line 79
    const/4 v11, 0x3

    .line 80
    new-array v12, v11, [Landroid/animation/Animator;

    .line 81
    .line 82
    aput-object v5, v12, v1

    .line 83
    .line 84
    aput-object v7, v12, v2

    .line 85
    .line 86
    aput-object v9, v12, v0

    .line 87
    .line 88
    invoke-virtual {p1, v12}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 89
    .line 90
    .line 91
    new-instance v5, Landroid/animation/AnimatorSet;

    .line 92
    .line 93
    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 94
    .line 95
    .line 96
    const-wide/16 v12, 0x190

    .line 97
    .line 98
    invoke-virtual {v5, v12, v13}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 99
    .line 100
    .line 101
    sget-object v7, Lcom/sunshine/engine/base/InterpolatorType;->shake:Lcom/sunshine/engine/base/InterpolatorType;

    .line 102
    .line 103
    invoke-virtual {v7}, Lcom/sunshine/engine/base/InterpolatorType;->obtain()Landroid/view/animation/Interpolator;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    invoke-virtual {v5, v7}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 108
    .line 109
    .line 110
    new-array v7, v0, [F

    .line 111
    .line 112
    fill-array-data v7, :array_3

    .line 113
    .line 114
    .line 115
    invoke-static {p0, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    new-array v9, v0, [F

    .line 120
    .line 121
    fill-array-data v9, :array_4

    .line 122
    .line 123
    .line 124
    invoke-static {p0, v8, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 125
    .line 126
    .line 127
    move-result-object v9

    .line 128
    new-array v12, v0, [Landroid/animation/Animator;

    .line 129
    .line 130
    aput-object v7, v12, v1

    .line 131
    .line 132
    aput-object v9, v12, v2

    .line 133
    .line 134
    invoke-virtual {v5, v12}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 135
    .line 136
    .line 137
    new-instance v7, Landroid/animation/AnimatorSet;

    .line 138
    .line 139
    invoke-direct {v7}, Landroid/animation/AnimatorSet;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v7, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 143
    .line 144
    .line 145
    sget-object v9, Lcom/sunshine/engine/base/InterpolatorType;->linear:Lcom/sunshine/engine/base/InterpolatorType;

    .line 146
    .line 147
    invoke-virtual {v9}, Lcom/sunshine/engine/base/InterpolatorType;->obtain()Landroid/view/animation/Interpolator;

    .line 148
    .line 149
    .line 150
    move-result-object v9

    .line 151
    invoke-virtual {v7, v9}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 152
    .line 153
    .line 154
    new-array v9, v0, [F

    .line 155
    .line 156
    fill-array-data v9, :array_5

    .line 157
    .line 158
    .line 159
    invoke-static {p0, v6, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 160
    .line 161
    .line 162
    move-result-object v9

    .line 163
    new-array v12, v0, [F

    .line 164
    .line 165
    fill-array-data v12, :array_6

    .line 166
    .line 167
    .line 168
    invoke-static {p0, v8, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    new-array v13, v0, [Landroid/animation/Animator;

    .line 173
    .line 174
    aput-object v9, v13, v1

    .line 175
    .line 176
    aput-object v12, v13, v2

    .line 177
    .line 178
    invoke-virtual {v7, v13}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 179
    .line 180
    .line 181
    new-instance v9, Landroid/animation/AnimatorSet;

    .line 182
    .line 183
    invoke-direct {v9}, Landroid/animation/AnimatorSet;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v9, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 187
    .line 188
    .line 189
    sget-object v3, Lcom/sunshine/engine/base/InterpolatorType;->decelerate:Lcom/sunshine/engine/base/InterpolatorType;

    .line 190
    .line 191
    invoke-virtual {v3}, Lcom/sunshine/engine/base/InterpolatorType;->obtain()Landroid/view/animation/Interpolator;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    invoke-virtual {v9, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 196
    .line 197
    .line 198
    new-array v3, v0, [F

    .line 199
    .line 200
    fill-array-data v3, :array_7

    .line 201
    .line 202
    .line 203
    invoke-static {p0, v6, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    new-array v4, v0, [F

    .line 208
    .line 209
    fill-array-data v4, :array_8

    .line 210
    .line 211
    .line 212
    invoke-static {p0, v8, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    new-array v6, v0, [F

    .line 217
    .line 218
    fill-array-data v6, :array_9

    .line 219
    .line 220
    .line 221
    invoke-static {p0, v10, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 222
    .line 223
    .line 224
    move-result-object v6

    .line 225
    new-array v8, v11, [Landroid/animation/Animator;

    .line 226
    .line 227
    aput-object v3, v8, v1

    .line 228
    .line 229
    aput-object v4, v8, v2

    .line 230
    .line 231
    aput-object v6, v8, v0

    .line 232
    .line 233
    invoke-virtual {v9, v8}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 234
    .line 235
    .line 236
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 237
    .line 238
    const/4 v4, 0x4

    .line 239
    new-array v4, v4, [Landroid/animation/Animator;

    .line 240
    .line 241
    aput-object p1, v4, v1

    .line 242
    .line 243
    aput-object v5, v4, v2

    .line 244
    .line 245
    aput-object v7, v4, v0

    .line 246
    .line 247
    aput-object v9, v4, v11

    .line 248
    .line 249
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 253
    .line 254
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 255
    .line 256
    .line 257
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeView;->f:Landroid/animation/AnimatorSet;

    .line 258
    .line 259
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 260
    .line 261
    .line 262
    :cond_1
    return-void

    .line 263
    :array_0
    .array-data 4
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data

    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    :array_1
    .array-data 4
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data

    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    :array_2
    .array-data 4
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data

    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3fc00000    # 1.5f
    .end array-data

    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x3fc00000    # 1.5f
    .end array-data

    :array_5
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_6
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_7
    .array-data 4
        0x3f800000    # 1.0f
        0x3e99999a    # 0.3f
    .end array-data

    :array_8
    .array-data 4
        0x3f800000    # 1.0f
        0x3e99999a    # 0.3f
    .end array-data

    :array_9
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
