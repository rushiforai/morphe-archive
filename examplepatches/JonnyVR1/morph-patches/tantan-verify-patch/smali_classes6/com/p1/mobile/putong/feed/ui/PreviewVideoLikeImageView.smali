.class public Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;
.super Lv/VImage;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# instance fields
.field public d:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->d:Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->d:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->d:Landroid/animation/AnimatorSet;

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->d:Landroid/animation/AnimatorSet;

    .line 3
    .line 4
    const/16 p1, 0x8

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->d:Landroid/animation/AnimatorSet;

    .line 3
    .line 4
    const/16 p1, 0x8

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
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

.method public setVisibility(I)V
    .locals 9

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->d:Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 29
    .line 30
    .line 31
    const-wide/16 v3, 0x190

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
    new-array v3, v0, [F

    .line 47
    .line 48
    fill-array-data v3, :array_0

    .line 49
    .line 50
    .line 51
    const-string v4, "scaleX"

    .line 52
    .line 53
    invoke-static {p0, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    new-array v5, v0, [F

    .line 58
    .line 59
    fill-array-data v5, :array_1

    .line 60
    .line 61
    .line 62
    const-string v6, "scaleY"

    .line 63
    .line 64
    invoke-static {p0, v6, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    new-array v7, v0, [Landroid/animation/Animator;

    .line 69
    .line 70
    aput-object v3, v7, v1

    .line 71
    .line 72
    aput-object v5, v7, v2

    .line 73
    .line 74
    invoke-virtual {p1, v7}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 75
    .line 76
    .line 77
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 78
    .line 79
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 80
    .line 81
    .line 82
    const-wide/16 v7, 0x1f4

    .line 83
    .line 84
    invoke-virtual {v3, v7, v8}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 85
    .line 86
    .line 87
    sget-object v5, Lcom/sunshine/engine/base/InterpolatorType;->linear:Lcom/sunshine/engine/base/InterpolatorType;

    .line 88
    .line 89
    invoke-virtual {v5}, Lcom/sunshine/engine/base/InterpolatorType;->obtain()Landroid/view/animation/Interpolator;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 94
    .line 95
    .line 96
    new-array v5, v0, [F

    .line 97
    .line 98
    fill-array-data v5, :array_2

    .line 99
    .line 100
    .line 101
    invoke-static {p0, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    new-array v5, v0, [F

    .line 106
    .line 107
    fill-array-data v5, :array_3

    .line 108
    .line 109
    .line 110
    invoke-static {p0, v6, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    const/high16 v6, 0x40800000    # 4.0f

    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getY()F

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    mul-float/2addr v7, v6

    .line 121
    const/high16 v6, 0x40a00000    # 5.0f

    .line 122
    .line 123
    div-float/2addr v7, v6

    .line 124
    new-array v6, v2, [F

    .line 125
    .line 126
    aput v7, v6, v1

    .line 127
    .line 128
    const-string v7, "translationY"

    .line 129
    .line 130
    invoke-static {p0, v7, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    new-array v7, v0, [F

    .line 135
    .line 136
    fill-array-data v7, :array_4

    .line 137
    .line 138
    .line 139
    const-string v8, "alpha"

    .line 140
    .line 141
    invoke-static {p0, v8, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 142
    .line 143
    .line 144
    move-result-object v7

    .line 145
    const/4 v8, 0x4

    .line 146
    new-array v8, v8, [Landroid/animation/Animator;

    .line 147
    .line 148
    aput-object v4, v8, v1

    .line 149
    .line 150
    aput-object v5, v8, v2

    .line 151
    .line 152
    aput-object v6, v8, v0

    .line 153
    .line 154
    const/4 v4, 0x3

    .line 155
    aput-object v7, v8, v4

    .line 156
    .line 157
    invoke-virtual {v3, v8}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 158
    .line 159
    .line 160
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->d:Landroid/animation/AnimatorSet;

    .line 161
    .line 162
    new-array v0, v0, [Landroid/animation/Animator;

    .line 163
    .line 164
    aput-object p1, v0, v1

    .line 165
    .line 166
    aput-object v3, v0, v2

    .line 167
    .line 168
    invoke-virtual {v4, v0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->d:Landroid/animation/AnimatorSet;

    .line 172
    .line 173
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 174
    .line 175
    .line 176
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->d:Landroid/animation/AnimatorSet;

    .line 177
    .line 178
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 179
    .line 180
    .line 181
    :cond_1
    return-void

    .line 182
    nop

    .line 183
    :array_0
    .array-data 4
        0x3fc00000    # 1.5f
        0x3f333333    # 0.7f
    .end array-data

    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    :array_1
    .array-data 4
        0x3fc00000    # 1.5f
        0x3f333333    # 0.7f
    .end array-data

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    :array_2
    .array-data 4
        0x3f333333    # 0.7f
        0x40600000    # 3.5f
    .end array-data

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    :array_3
    .array-data 4
        0x3f333333    # 0.7f
        0x40600000    # 3.5f
    .end array-data

    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
