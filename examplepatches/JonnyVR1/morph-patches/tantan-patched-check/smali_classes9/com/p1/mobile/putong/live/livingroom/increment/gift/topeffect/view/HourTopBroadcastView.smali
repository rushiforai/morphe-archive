.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/animation/AnimatorSet;


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->i()V

    return-void
.end method

.method public static synthetic b(Ll/q4j0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;->getSchema()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/q4j0;->l4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->j(Ll/x20;)V

    return-void
.end method

.method private getDefaultDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/obc0;->P2:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xll;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->h:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;)[I
    .locals 2

    .line 1
    const-string p0, "#"

    .line 2
    .line 3
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getStartBackendColor()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getEndBackendColor()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception p0

    .line 45
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    const-string p0, "#ff5ba1"

    .line 49
    .line 50
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const-string p0, "#ff83c9"

    .line 55
    .line 56
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    :goto_0
    filled-new-array {v0, p0}, [I

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public final g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x41c00000    # 24.0f

    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;)[I

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->BL_TR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public h()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic i()V
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

.method public final synthetic j(Ll/x20;)V
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

.method public k(Ljava/lang/String;Ll/x20;J)V
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
    const/4 v2, 0x2

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 11
    .line 12
    const-string v3, "https://auto.tancdn.com/v1/raw/f2058928-21b2-4d80-9725-b137873a9da710.so"

    .line 13
    .line 14
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-virtual {v1, v3}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 25
    .line 26
    const/4 v3, -0x1

    .line 27
    move-object/from16 v4, p1

    .line 28
    .line 29
    invoke-virtual {v1, v4, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->b:Landroid/widget/FrameLayout;

    .line 33
    .line 34
    const/high16 v3, 0x42600000    # 56.0f

    .line 35
    .line 36
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    neg-int v3, v3

    .line 41
    int-to-float v3, v3

    .line 42
    const/high16 v4, 0x426c0000    # 59.0f

    .line 43
    .line 44
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    int-to-float v5, v5

    .line 49
    new-array v6, v2, [F

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    aput v3, v6, v7

    .line 53
    .line 54
    const/4 v3, 0x1

    .line 55
    aput v5, v6, v3

    .line 56
    .line 57
    const-string v5, "translationY"

    .line 58
    .line 59
    invoke-static {v1, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-wide/16 v8, 0x12c

    .line 64
    .line 65
    invoke-virtual {v1, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 66
    .line 67
    .line 68
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 69
    .line 70
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 74
    .line 75
    .line 76
    iget-object v6, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->a:Lv/VDraweeView;

    .line 77
    .line 78
    new-array v10, v2, [F

    .line 79
    .line 80
    fill-array-data v10, :array_0

    .line 81
    .line 82
    .line 83
    const-string v11, "alpha"

    .line 84
    .line 85
    invoke-static {v6, v11, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-virtual {v6, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 90
    .line 91
    .line 92
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 93
    .line 94
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v6, v8}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 98
    .line 99
    .line 100
    iget-object v8, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->b:Landroid/widget/FrameLayout;

    .line 101
    .line 102
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    int-to-float v4, v4

    .line 107
    const/high16 v9, 0x42440000    # 49.0f

    .line 108
    .line 109
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v10

    .line 113
    int-to-float v10, v10

    .line 114
    new-array v12, v2, [F

    .line 115
    .line 116
    aput v4, v12, v7

    .line 117
    .line 118
    aput v10, v12, v3

    .line 119
    .line 120
    invoke-static {v8, v5, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    const-wide/16 v12, 0xc8

    .line 125
    .line 126
    invoke-virtual {v4, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 127
    .line 128
    .line 129
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 130
    .line 131
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v4, v8}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 135
    .line 136
    .line 137
    iget-object v8, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->a:Lv/VDraweeView;

    .line 138
    .line 139
    new-array v10, v2, [F

    .line 140
    .line 141
    fill-array-data v10, :array_1

    .line 142
    .line 143
    .line 144
    invoke-static {v8, v11, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    const-wide/16 v12, 0x258

    .line 149
    .line 150
    invoke-virtual {v8, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v8, v2}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 154
    .line 155
    .line 156
    move-wide/from16 v14, p3

    .line 157
    .line 158
    long-to-int v10, v14

    .line 159
    div-int/lit16 v10, v10, 0x258

    .line 160
    .line 161
    invoke-virtual {v8, v10}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 162
    .line 163
    .line 164
    new-instance v10, Landroid/view/animation/LinearInterpolator;

    .line 165
    .line 166
    invoke-direct {v10}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v8, v10}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 170
    .line 171
    .line 172
    iget-object v10, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->b:Landroid/widget/FrameLayout;

    .line 173
    .line 174
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 175
    .line 176
    .line 177
    move-result v9

    .line 178
    int-to-float v9, v9

    .line 179
    const/high16 v14, 0x42d20000    # 105.0f

    .line 180
    .line 181
    invoke-static {v14}, Ll/qa00;->d(F)I

    .line 182
    .line 183
    .line 184
    move-result v14

    .line 185
    neg-int v14, v14

    .line 186
    int-to-float v14, v14

    .line 187
    new-array v15, v2, [F

    .line 188
    .line 189
    aput v9, v15, v7

    .line 190
    .line 191
    aput v14, v15, v3

    .line 192
    .line 193
    invoke-static {v10, v5, v15}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-virtual {v3, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 198
    .line 199
    .line 200
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 201
    .line 202
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v3, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 206
    .line 207
    .line 208
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->a:Lv/VDraweeView;

    .line 209
    .line 210
    new-array v2, v2, [F

    .line 211
    .line 212
    fill-array-data v2, :array_2

    .line 213
    .line 214
    .line 215
    invoke-static {v5, v11, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-virtual {v2, v12, v13}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 220
    .line 221
    .line 222
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 223
    .line 224
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v2, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 228
    .line 229
    .line 230
    new-instance v5, Landroid/animation/AnimatorSet;

    .line 231
    .line 232
    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    .line 233
    .line 234
    .line 235
    iput-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->h:Landroid/animation/AnimatorSet;

    .line 236
    .line 237
    invoke-virtual {v5, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    invoke-virtual {v5, v6}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 242
    .line 243
    .line 244
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->h:Landroid/animation/AnimatorSet;

    .line 245
    .line 246
    invoke-virtual {v5, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 251
    .line 252
    .line 253
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->h:Landroid/animation/AnimatorSet;

    .line 254
    .line 255
    invoke-virtual {v1, v6}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    invoke-virtual {v1, v8}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 260
    .line 261
    .line 262
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->h:Landroid/animation/AnimatorSet;

    .line 263
    .line 264
    invoke-virtual {v1, v8}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 269
    .line 270
    .line 271
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->h:Landroid/animation/AnimatorSet;

    .line 272
    .line 273
    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 278
    .line 279
    .line 280
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->h:Landroid/animation/AnimatorSet;

    .line 281
    .line 282
    new-instance v2, Ll/vll;

    .line 283
    .line 284
    invoke-direct {v2, v0}, Ll/vll;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;)V

    .line 285
    .line 286
    .line 287
    new-instance v3, Ll/wll;

    .line 288
    .line 289
    move-object/from16 v4, p2

    .line 290
    .line 291
    invoke-direct {v3, v0, v4}, Ll/wll;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;Ll/x20;)V

    .line 292
    .line 293
    .line 294
    invoke-static {v1, v2, v3}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 295
    .line 296
    .line 297
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->h:Landroid/animation/AnimatorSet;

    .line 298
    .line 299
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 300
    .line 301
    .line 302
    return-void

    .line 303
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
    .end array-data

    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;Ll/x20;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;->getUserImage()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->f:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;->getUserName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->g:Lv/VText;

    .line 22
    .line 23
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 24
    .line 25
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->r6:I

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;->getRank()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v1, v3, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->g:Lv/VText;

    .line 47
    .line 48
    const/16 v0, -0xda

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 60
    .line 61
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->getDefaultDrawable()Landroid/graphics/drawable/Drawable;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->a:Lv/VDraweeView;

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->a:Lv/VDraweeView;

    .line 75
    .line 76
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    const-string v3, "https://auto.tancdn.com/v1/raw/f9911d44-74c0-4d30-b518-03f4ff09198813.webp"

    .line 81
    .line 82
    invoke-static {v2, p1, v3, v0, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 83
    .line 84
    .line 85
    const-string p1, "https://auto.tancdn.com/v1/raw/e0f94e81-0276-45b7-b69e-fc0f97fc069b10.pdf"

    .line 86
    .line 87
    const-wide/16 v0, 0x578

    .line 88
    .line 89
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->k(Ljava/lang/String;Ll/x20;J)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public m(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;Ll/x20;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getAvatarUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->f:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getUserName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->g:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getContent()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getSubtitleColor()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->g:Lv/VText;

    .line 39
    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getSubtitleColor()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/16 v0, -0x22e7

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getBackgroundSVGAUrl()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->a:Lv/VDraweeView;

    .line 68
    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    sget v0, Ll/obc0;->M7:I

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getEffectBackgroundUrl()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v2, v1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getDuration()J

    .line 85
    .line 86
    .line 87
    move-result-wide v0

    .line 88
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getBackgroundUrl()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 97
    .line 98
    if-nez v2, :cond_2

    .line 99
    .line 100
    sget v2, Ll/obc0;->s8:I

    .line 101
    .line 102
    invoke-virtual {v3, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 103
    .line 104
    .line 105
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getBackgroundUrl()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    const/high16 v2, 0x43340000    # 180.0f

    .line 112
    .line 113
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v7

    .line 117
    const/high16 v2, 0x42600000    # 56.0f

    .line 118
    .line 119
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result v8

    .line 123
    invoke-static {}, Ll/irn;->a()Z

    .line 124
    .line 125
    .line 126
    move-result v11

    .line 127
    const/4 v12, 0x0

    .line 128
    const-string v4, "context_single_room"

    .line 129
    .line 130
    const/4 v9, 0x0

    .line 131
    const/4 v10, 0x0

    .line 132
    invoke-static/range {v4 .. v12}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_2
    sget v2, Ll/obc0;->s8:I

    .line 137
    .line 138
    invoke-virtual {v3, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 139
    .line 140
    .line 141
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 142
    .line 143
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;)Landroid/graphics/drawable/GradientDrawable;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 148
    .line 149
    .line 150
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TopEffect;->getBackgroundSVGAUrl()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    const-wide/16 v2, 0x0

    .line 155
    .line 156
    cmp-long v2, v0, v2

    .line 157
    .line 158
    if-nez v2, :cond_3

    .line 159
    .line 160
    const-wide/16 v0, 0x578

    .line 161
    .line 162
    :cond_3
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->k(Ljava/lang/String;Ll/x20;J)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public n(Ll/q4j0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;->getAvatarUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->f:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;->getTitle()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->f:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;->getTitleColor()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->g:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;->getContent()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->g:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;->getContentColor()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;->getDuration()J

    .line 57
    .line 58
    .line 59
    move-result-wide v0

    .line 60
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;->getBackgroundUrl()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_0

    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 71
    .line 72
    sget v3, Ll/obc0;->s8:I

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 75
    .line 76
    .line 77
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;->getBackgroundUrl()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    const/high16 v2, 0x43340000    # 180.0f

    .line 84
    .line 85
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    const/high16 v2, 0x42600000    # 56.0f

    .line 90
    .line 91
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    const/4 v2, 0x2

    .line 96
    invoke-static {v2}, Ll/wft;->b(I)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    xor-int/lit8 v11, v2, 0x1

    .line 101
    .line 102
    const/4 v12, 0x0

    .line 103
    const-string v4, "context_single_room"

    .line 104
    .line 105
    const/4 v9, 0x0

    .line 106
    const/4 v10, 0x0

    .line 107
    invoke-static/range {v4 .. v12}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 108
    .line 109
    .line 110
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 111
    .line 112
    new-instance v3, Ll/ull;

    .line 113
    .line 114
    invoke-direct {v3, p1, p2}, Ll/ull;-><init>(Ll/q4j0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceLiveTopEffectMessage;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 118
    .line 119
    .line 120
    const-wide/16 p1, 0x0

    .line 121
    .line 122
    cmp-long p1, v0, p1

    .line 123
    .line 124
    if-nez p1, :cond_1

    .line 125
    .line 126
    const-wide/16 v0, 0x578

    .line 127
    .line 128
    :cond_1
    const/4 p1, 0x0

    .line 129
    invoke-virtual {p0, p1, p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->k(Ljava/lang/String;Ll/x20;J)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "context_single_room"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->e:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->f:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->g:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-virtual {p1, p2}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->c:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->getDefaultDrawable()Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    const-wide/16 v0, 0x578

    .line 34
    .line 35
    invoke-virtual {p0, p2, p4, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->k(Ljava/lang/String;Ll/x20;J)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->e()V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/HourTopBroadcastView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
