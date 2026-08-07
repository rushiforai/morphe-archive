.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->e()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->f(Ll/x20;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rzn0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->f:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic e()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic f(Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public g(Ljava/lang/String;Ll/x20;J)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string v1, "https://auto.tancdn.com/v1/raw/f2058928-21b2-4d80-9725-b137873a9da710.so"

    .line 13
    .line 14
    invoke-virtual {v2, v1, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, -0x1

    .line 19
    move-object/from16 v4, p1

    .line 20
    .line 21
    invoke-virtual {v2, v4, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->b:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    const/high16 v2, 0x42600000    # 56.0f

    .line 27
    .line 28
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    neg-int v2, v2

    .line 33
    int-to-float v2, v2

    .line 34
    const/high16 v4, 0x426c0000    # 59.0f

    .line 35
    .line 36
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    int-to-float v5, v5

    .line 41
    new-array v6, v3, [F

    .line 42
    .line 43
    const/4 v7, 0x0

    .line 44
    aput v2, v6, v7

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    aput v5, v6, v2

    .line 48
    .line 49
    const-string v5, "translationY"

    .line 50
    .line 51
    invoke-static {v1, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-wide/16 v8, 0x12c

    .line 56
    .line 57
    invoke-virtual {v1, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 58
    .line 59
    .line 60
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 61
    .line 62
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 66
    .line 67
    .line 68
    iget-object v6, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->a:Lv/VDraweeView;

    .line 69
    .line 70
    new-array v10, v3, [F

    .line 71
    .line 72
    fill-array-data v10, :array_0

    .line 73
    .line 74
    .line 75
    const-string v11, "alpha"

    .line 76
    .line 77
    invoke-static {v6, v11, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-virtual {v6, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 82
    .line 83
    .line 84
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 85
    .line 86
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v6, v8}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 90
    .line 91
    .line 92
    iget-object v8, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->b:Landroid/widget/FrameLayout;

    .line 93
    .line 94
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    int-to-float v4, v4

    .line 99
    const/high16 v9, 0x42440000    # 49.0f

    .line 100
    .line 101
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v10

    .line 105
    int-to-float v10, v10

    .line 106
    new-array v12, v3, [F

    .line 107
    .line 108
    aput v4, v12, v7

    .line 109
    .line 110
    aput v10, v12, v2

    .line 111
    .line 112
    invoke-static {v8, v5, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    const-wide/16 v12, 0xc8

    .line 117
    .line 118
    invoke-virtual {v4, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 119
    .line 120
    .line 121
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 122
    .line 123
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4, v8}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 127
    .line 128
    .line 129
    iget-object v8, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->a:Lv/VDraweeView;

    .line 130
    .line 131
    new-array v10, v3, [F

    .line 132
    .line 133
    fill-array-data v10, :array_1

    .line 134
    .line 135
    .line 136
    invoke-static {v8, v11, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    const-wide/16 v12, 0x258

    .line 141
    .line 142
    invoke-virtual {v8, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v8, v3}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 146
    .line 147
    .line 148
    move-wide/from16 v14, p3

    .line 149
    .line 150
    long-to-int v10, v14

    .line 151
    div-int/lit16 v10, v10, 0x258

    .line 152
    .line 153
    invoke-virtual {v8, v10}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 154
    .line 155
    .line 156
    new-instance v10, Landroid/view/animation/LinearInterpolator;

    .line 157
    .line 158
    invoke-direct {v10}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v8, v10}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 162
    .line 163
    .line 164
    iget-object v10, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->b:Landroid/widget/FrameLayout;

    .line 165
    .line 166
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 167
    .line 168
    .line 169
    move-result v9

    .line 170
    int-to-float v9, v9

    .line 171
    const/high16 v14, 0x42d20000    # 105.0f

    .line 172
    .line 173
    invoke-static {v14}, Ll/qa00;->d(F)I

    .line 174
    .line 175
    .line 176
    move-result v14

    .line 177
    neg-int v14, v14

    .line 178
    int-to-float v14, v14

    .line 179
    new-array v15, v3, [F

    .line 180
    .line 181
    aput v9, v15, v7

    .line 182
    .line 183
    aput v14, v15, v2

    .line 184
    .line 185
    invoke-static {v10, v5, v15}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {v2, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 190
    .line 191
    .line 192
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 193
    .line 194
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v2, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 198
    .line 199
    .line 200
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->a:Lv/VDraweeView;

    .line 201
    .line 202
    new-array v3, v3, [F

    .line 203
    .line 204
    fill-array-data v3, :array_2

    .line 205
    .line 206
    .line 207
    invoke-static {v5, v11, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-virtual {v3, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 212
    .line 213
    .line 214
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 215
    .line 216
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v3, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 220
    .line 221
    .line 222
    new-instance v5, Landroid/animation/AnimatorSet;

    .line 223
    .line 224
    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 225
    .line 226
    .line 227
    iput-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->f:Landroid/animation/AnimatorSet;

    .line 228
    .line 229
    invoke-virtual {v5, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 230
    .line 231
    .line 232
    move-result-object v5

    .line 233
    invoke-virtual {v5, v6}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 234
    .line 235
    .line 236
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->f:Landroid/animation/AnimatorSet;

    .line 237
    .line 238
    invoke-virtual {v5, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 243
    .line 244
    .line 245
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->f:Landroid/animation/AnimatorSet;

    .line 246
    .line 247
    invoke-virtual {v1, v6}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {v1, v8}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 252
    .line 253
    .line 254
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->f:Landroid/animation/AnimatorSet;

    .line 255
    .line 256
    invoke-virtual {v1, v8}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 261
    .line 262
    .line 263
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->f:Landroid/animation/AnimatorSet;

    .line 264
    .line 265
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 270
    .line 271
    .line 272
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->f:Landroid/animation/AnimatorSet;

    .line 273
    .line 274
    new-instance v2, Ll/pzn0;

    .line 275
    .line 276
    invoke-direct {v2, v0}, Ll/pzn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;)V

    .line 277
    .line 278
    .line 279
    new-instance v3, Ll/qzn0;

    .line 280
    .line 281
    move-object/from16 v4, p2

    .line 282
    .line 283
    invoke-direct {v3, v0, v4}, Ll/qzn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;Ll/x20;)V

    .line 284
    .line 285
    .line 286
    invoke-static {v1, v2, v3}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 287
    .line 288
    .line 289
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->f:Landroid/animation/AnimatorSet;

    .line 290
    .line 291
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 292
    .line 293
    .line 294
    return-void

    .line 295
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
    .end array-data

    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;Ll/x20;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getAnchorImage()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "context_single_room"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->d:Lv/VDraweeView;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->e:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getTitle()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->e:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getTitleColor()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->a:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->a:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    const-string v4, "https://auto.tancdn.com/v1/raw/f9911d44-74c0-4d30-b518-03f4ff09198813.webp"

    .line 53
    .line 54
    invoke-static {v2, v0, v4, v1, v3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveTopBroadCast$VoiceLiveHourLeaderboardTopEffectMessage;->getDuration()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    const-string p1, "https://auto.tancdn.com/v1/raw/2680822e-9a16-4999-b545-7e4d7370665411.pdf"

    .line 62
    .line 63
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->g(Ljava/lang/String;Ll/x20;J)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->d()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/VoiceLiveHourTopBroadcastView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
