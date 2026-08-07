.class public Ll/ozj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ozj;->a:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/ozj;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ozj;->f(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Ll/ozj;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ozj;->h(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c(Ll/ozj;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ozj;->g(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d(Ll/ozj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ozj;->i(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method


# virtual methods
.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ozj;->b:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ozj;->b:Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ozj;->b:Landroid/animation/AnimatorSet;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic f(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ozj;->a:Lv/VText;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Ll/ozj;->k(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic g(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ozj;->a:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {v0, p1}, Landroid/content/res/ColorStateList;->withAlpha(I)Landroid/content/res/ColorStateList;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic h(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ozj;->a:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {v0, p1}, Landroid/content/res/ColorStateList;->withAlpha(I)Landroid/content/res/ColorStateList;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ozj;->a:Lv/VText;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->needToPlayAnim:Z

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 16
    .line 17
    const/high16 v1, 0x41000000    # 8.0f

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ll/ozj;->a:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 39
    .line 40
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    float-to-int v0, v0

    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    add-int/2addr v0, v3

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    move v0, v2

    .line 56
    :goto_1
    iget-object v3, p0, Ll/ozj;->a:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    float-to-int v3, v3

    .line 69
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    add-int/2addr v3, v1

    .line 74
    iget-object v1, p0, Ll/ozj;->a:Lv/VText;

    .line 75
    .line 76
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v3}, Ll/ozj;->k(I)V

    .line 82
    .line 83
    .line 84
    filled-new-array {v3, v0}, [I

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    new-instance v3, Ll/kzj;

    .line 93
    .line 94
    invoke-direct {v3, p0}, Ll/kzj;-><init>(Ll/ozj;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 98
    .line 99
    .line 100
    const-wide/16 v3, 0x190

    .line 101
    .line 102
    invoke-virtual {v1, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 103
    .line 104
    .line 105
    const/16 v3, 0xff

    .line 106
    .line 107
    filled-new-array {v3, v2}, [I

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    new-instance v5, Ll/lzj;

    .line 116
    .line 117
    invoke-direct {v5, p0}, Ll/lzj;-><init>(Ll/ozj;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 121
    .line 122
    .line 123
    const-wide/16 v5, 0xc8

    .line 124
    .line 125
    invoke-virtual {v4, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 126
    .line 127
    .line 128
    if-nez v0, :cond_3

    .line 129
    .line 130
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 131
    .line 132
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 133
    .line 134
    .line 135
    iput-object v0, p0, Ll/ozj;->b:Landroid/animation/AnimatorSet;

    .line 136
    .line 137
    const/4 v3, 0x2

    .line 138
    new-array v3, v3, [Landroid/animation/Animator;

    .line 139
    .line 140
    aput-object v1, v3, v2

    .line 141
    .line 142
    const/4 v1, 0x1

    .line 143
    aput-object v4, v3, v1

    .line 144
    .line 145
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_3
    filled-new-array {v2, v3}, [I

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    new-instance v3, Ll/mzj;

    .line 158
    .line 159
    invoke-direct {v3, p0}, Ll/mzj;-><init>(Ll/ozj;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 163
    .line 164
    .line 165
    new-instance v3, Ll/nzj;

    .line 166
    .line 167
    invoke-direct {v3, p0, p1}, Ll/nzj;-><init>(Ll/ozj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 168
    .line 169
    .line 170
    invoke-static {v0, v3}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 174
    .line 175
    .line 176
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 177
    .line 178
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 179
    .line 180
    .line 181
    iput-object v3, p0, Ll/ozj;->b:Landroid/animation/AnimatorSet;

    .line 182
    .line 183
    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 188
    .line 189
    .line 190
    iget-object v1, p0, Ll/ozj;->b:Landroid/animation/AnimatorSet;

    .line 191
    .line 192
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 197
    .line 198
    .line 199
    :goto_2
    iget-object v0, p0, Ll/ozj;->b:Landroid/animation/AnimatorSet;

    .line 200
    .line 201
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 202
    .line 203
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Ll/ozj;->b:Landroid/animation/AnimatorSet;

    .line 210
    .line 211
    const-wide/16 v3, 0x640

    .line 212
    .line 213
    invoke-virtual {v0, v3, v4}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 214
    .line 215
    .line 216
    iput-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->needToPlayAnim:Z

    .line 217
    .line 218
    iget-object p0, p0, Ll/ozj;->b:Landroid/animation/AnimatorSet;

    .line 219
    .line 220
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 221
    .line 222
    .line 223
    return-void
.end method

.method public final k(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ozj;->a:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 12
    .line 13
    iget-object p1, p0, Ll/ozj;->a:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/ozj;->a:Lv/VText;

    .line 19
    .line 20
    const/high16 p1, 0x40800000    # 4.0f

    .line 21
    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p0, v0, v2, p1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
