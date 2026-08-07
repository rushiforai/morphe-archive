.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VDraweeView;

.field public i:Landroid/animation/AnimatorSet;


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->g(Ll/x20;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->f()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->h(Ll/x20;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tfm;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f()V
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

.method public final synthetic g(Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    invoke-interface {p1}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final h(Ll/x20;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const-string v1, "https://auto.tancdn.com/v1/raw/80ca3e7c-8dd2-4c1f-a8f6-e35ea72e0a0511.so"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->b:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->c:Lv/VDraweeView;

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    new-array v4, v3, [F

    .line 19
    .line 20
    fill-array-data v4, :array_0

    .line 21
    .line 22
    .line 23
    const-string v5, "alpha"

    .line 24
    .line 25
    invoke-static {v0, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-wide/16 v6, 0x5dc

    .line 30
    .line 31
    invoke-virtual {v0, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 35
    .line 36
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 40
    .line 41
    .line 42
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->e:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    new-array v8, v3, [F

    .line 45
    .line 46
    fill-array-data v8, :array_1

    .line 47
    .line 48
    .line 49
    invoke-static {v4, v5, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 57
    .line 58
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4, v8}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->a:Landroid/view/View;

    .line 65
    .line 66
    new-array v9, v3, [F

    .line 67
    .line 68
    fill-array-data v9, :array_2

    .line 69
    .line 70
    .line 71
    invoke-static {v8, v5, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-virtual {v5, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 76
    .line 77
    .line 78
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 79
    .line 80
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v5, v6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 84
    .line 85
    .line 86
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->b:Landroid/widget/FrameLayout;

    .line 87
    .line 88
    const/high16 v7, 0x43080000    # 136.0f

    .line 89
    .line 90
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v8

    .line 94
    int-to-double v8, v8

    .line 95
    const-wide v10, -0x4046666666666666L    # -0.1

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    mul-double/2addr v8, v10

    .line 101
    double-to-float v8, v8

    .line 102
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    neg-int v7, v7

    .line 107
    int-to-float v7, v7

    .line 108
    const/4 v9, 0x3

    .line 109
    new-array v9, v9, [F

    .line 110
    .line 111
    const/4 v10, 0x0

    .line 112
    aput v1, v9, v10

    .line 113
    .line 114
    aput v8, v9, v2

    .line 115
    .line 116
    aput v7, v9, v3

    .line 117
    .line 118
    const-string v1, "translationY"

    .line 119
    .line 120
    invoke-static {v6, v1, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    const-wide/16 v2, 0x1f4

    .line 125
    .line 126
    invoke-virtual {v1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 127
    .line 128
    .line 129
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 130
    .line 131
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 135
    .line 136
    .line 137
    const-wide/16 v2, 0xbb8

    .line 138
    .line 139
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 140
    .line 141
    .line 142
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 143
    .line 144
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 145
    .line 146
    .line 147
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->i:Landroid/animation/AnimatorSet;

    .line 148
    .line 149
    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0, v5}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->i:Landroid/animation/AnimatorSet;

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->i:Landroid/animation/AnimatorSet;

    .line 166
    .line 167
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0, v5}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->i:Landroid/animation/AnimatorSet;

    .line 175
    .line 176
    new-instance v1, Ll/rfm;

    .line 177
    .line 178
    invoke-direct {v1, p0}, Ll/rfm;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;)V

    .line 179
    .line 180
    .line 181
    new-instance v2, Ll/sfm;

    .line 182
    .line 183
    invoke-direct {v2, p0, p1}, Ll/sfm;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;Ll/x20;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v0, v1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 187
    .line 188
    .line 189
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->i:Landroid/animation/AnimatorSet;

    .line 190
    .line 191
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public i(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;Ll/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "https://auto.tancdn.com/v1/raw/80ca3e7c-8dd2-4c1f-a8f6-e35ea72e0a0511.so"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->downloadOnly()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->f:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->userName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->c:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->avatarUrl:Ljava/lang/String;

    .line 11
    .line 12
    const-string v2, "context_livingAct"

    .line 13
    .line 14
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->grade:J

    .line 22
    .line 23
    const-wide/16 v3, 0x2a

    .line 24
    .line 25
    cmp-long p1, v1, v3

    .line 26
    .line 27
    if-ltz p1, :cond_0

    .line 28
    .line 29
    sget p1, Ll/i0k;->b:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget p1, Ll/i0k;->a:I

    .line 33
    .line 34
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->h:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-static {v0, v1, p1}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->g:Lv/VText;

    .line 42
    .line 43
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->fe:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->e()V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/IdolUserUpgradeView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
