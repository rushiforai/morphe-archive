.class public Lcom/p1/mobile/putong/ui/MultipleChatIconView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public final d:[I

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:F

.field public h:Landroid/animation/ValueAnimator;

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 34
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    filled-new-array {p1, p2, v0, v1}, [I

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 25
    .line 26
    new-instance p1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->e:Ljava/util/List;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/ui/MultipleChatIconView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->l0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/ui/MultipleChatIconView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->n0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/ui/MultipleChatIconView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->o0(Z)V

    return-void
.end method

.method private l0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    shr-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotX(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    shr-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    int-to-float v0, v0

    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotY(F)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x2

    .line 32
    new-array v1, v0, [F

    .line 33
    .line 34
    fill-array-data v1, :array_0

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    new-instance v2, Ll/su10;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Ll/su10;-><init>(Lcom/p1/mobile/putong/ui/MultipleChatIconView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    const/4 v2, -0x1

    .line 54
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    const-wide/16 v1, 0x320

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f8ccccd    # 1.1f
    .end array-data
.end method

.method private m0(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/ru10;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/ru10;-><init>(Lcom/p1/mobile/putong/ui/MultipleChatIconView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    const/high16 p1, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method private synthetic n0(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/lang/Float;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic o0(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->setSize(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private setSize(Z)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x6

    .line 8
    const/4 v2, 0x7

    .line 9
    const/4 v3, 0x4

    .line 10
    const/4 v4, 0x3

    .line 11
    const/4 v5, 0x0

    .line 12
    const/4 v6, 0x1

    .line 13
    if-ne v0, v6, :cond_0

    .line 14
    .line 15
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 16
    .line 17
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v6, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 21
    .line 22
    aget v6, v6, v5

    .line 23
    .line 24
    invoke-virtual {v0, v6, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 28
    .line 29
    aget v1, v1, v5

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 35
    .line 36
    aget v1, v1, v5

    .line 37
    .line 38
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 42
    .line 43
    aget v1, v1, v5

    .line 44
    .line 45
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 49
    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->e:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/high16 v7, 0x40000000    # 2.0f

    .line 60
    .line 61
    const/high16 v8, 0x3f000000    # 0.5f

    .line 62
    .line 63
    const/4 v9, 0x2

    .line 64
    if-ne v0, v9, :cond_1

    .line 65
    .line 66
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 67
    .line 68
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 69
    .line 70
    .line 71
    iget-object v9, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 72
    .line 73
    aget v9, v9, v5

    .line 74
    .line 75
    iget v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 76
    .line 77
    div-float/2addr v10, v7

    .line 78
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 79
    .line 80
    .line 81
    move-result v11

    .line 82
    int-to-float v11, v11

    .line 83
    sub-float/2addr v10, v11

    .line 84
    float-to-int v10, v10

    .line 85
    invoke-virtual {v0, v9, v10}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 86
    .line 87
    .line 88
    iget-object v9, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 89
    .line 90
    aget v9, v9, v5

    .line 91
    .line 92
    invoke-virtual {v0, v9, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 96
    .line 97
    aget v1, v1, v5

    .line 98
    .line 99
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 103
    .line 104
    aget v1, v1, v5

    .line 105
    .line 106
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 110
    .line 111
    aget v1, v1, v6

    .line 112
    .line 113
    iget v9, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 114
    .line 115
    div-float/2addr v9, v7

    .line 116
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    int-to-float v7, v7

    .line 121
    sub-float/2addr v9, v7

    .line 122
    float-to-int v7, v9

    .line 123
    invoke-virtual {v0, v1, v7}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 127
    .line 128
    aget v1, v1, v6

    .line 129
    .line 130
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 134
    .line 135
    aget v1, v1, v6

    .line 136
    .line 137
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 141
    .line 142
    aget v1, v1, v6

    .line 143
    .line 144
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 148
    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->e:Ljava/util/List;

    .line 153
    .line 154
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-ne v0, v4, :cond_2

    .line 159
    .line 160
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 161
    .line 162
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 163
    .line 164
    .line 165
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 166
    .line 167
    aget v10, v10, v5

    .line 168
    .line 169
    iget v11, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 170
    .line 171
    div-float/2addr v11, v7

    .line 172
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 173
    .line 174
    .line 175
    move-result v12

    .line 176
    int-to-float v12, v12

    .line 177
    sub-float/2addr v11, v12

    .line 178
    float-to-int v11, v11

    .line 179
    invoke-virtual {v0, v10, v11}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 180
    .line 181
    .line 182
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 183
    .line 184
    aget v10, v10, v5

    .line 185
    .line 186
    invoke-virtual {v0, v10, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 187
    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 190
    .line 191
    aget v1, v1, v5

    .line 192
    .line 193
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 194
    .line 195
    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 197
    .line 198
    aget v1, v1, v5

    .line 199
    .line 200
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 201
    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 204
    .line 205
    aget v1, v1, v6

    .line 206
    .line 207
    iget v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 208
    .line 209
    div-float/2addr v10, v7

    .line 210
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 211
    .line 212
    .line 213
    move-result v11

    .line 214
    int-to-float v11, v11

    .line 215
    sub-float/2addr v10, v11

    .line 216
    float-to-int v10, v10

    .line 217
    invoke-virtual {v0, v1, v10}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 218
    .line 219
    .line 220
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 221
    .line 222
    aget v1, v1, v6

    .line 223
    .line 224
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 225
    .line 226
    .line 227
    move-result v10

    .line 228
    div-int/2addr v10, v9

    .line 229
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 230
    .line 231
    .line 232
    move-result v11

    .line 233
    sub-int/2addr v10, v11

    .line 234
    invoke-virtual {v0, v1, v10}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 235
    .line 236
    .line 237
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 238
    .line 239
    aget v1, v1, v6

    .line 240
    .line 241
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 242
    .line 243
    .line 244
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 245
    .line 246
    aget v1, v1, v6

    .line 247
    .line 248
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 249
    .line 250
    .line 251
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 252
    .line 253
    aget v1, v1, v9

    .line 254
    .line 255
    iget v4, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 256
    .line 257
    div-float/2addr v4, v7

    .line 258
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 259
    .line 260
    .line 261
    move-result v6

    .line 262
    int-to-float v6, v6

    .line 263
    sub-float/2addr v4, v6

    .line 264
    float-to-int v4, v4

    .line 265
    invoke-virtual {v0, v1, v4}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 266
    .line 267
    .line 268
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 269
    .line 270
    aget v1, v1, v9

    .line 271
    .line 272
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 273
    .line 274
    .line 275
    move-result v4

    .line 276
    div-int/2addr v4, v9

    .line 277
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 278
    .line 279
    .line 280
    move-result v6

    .line 281
    sub-int/2addr v4, v6

    .line 282
    invoke-virtual {v0, v1, v4}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 283
    .line 284
    .line 285
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 286
    .line 287
    aget v1, v1, v9

    .line 288
    .line 289
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 290
    .line 291
    .line 292
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 293
    .line 294
    aget v1, v1, v9

    .line 295
    .line 296
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 300
    .line 301
    .line 302
    goto/16 :goto_0

    .line 303
    .line 304
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->e:Ljava/util/List;

    .line 305
    .line 306
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    if-ne v0, v3, :cond_3

    .line 311
    .line 312
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 313
    .line 314
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 315
    .line 316
    .line 317
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 318
    .line 319
    aget v10, v10, v5

    .line 320
    .line 321
    iget v11, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 322
    .line 323
    div-float/2addr v11, v7

    .line 324
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 325
    .line 326
    .line 327
    move-result v12

    .line 328
    int-to-float v12, v12

    .line 329
    sub-float/2addr v11, v12

    .line 330
    float-to-int v11, v11

    .line 331
    invoke-virtual {v0, v10, v11}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 332
    .line 333
    .line 334
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 335
    .line 336
    aget v10, v10, v5

    .line 337
    .line 338
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 339
    .line 340
    .line 341
    move-result v11

    .line 342
    div-int/2addr v11, v9

    .line 343
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 344
    .line 345
    .line 346
    move-result v12

    .line 347
    sub-int/2addr v11, v12

    .line 348
    invoke-virtual {v0, v10, v11}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 349
    .line 350
    .line 351
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 352
    .line 353
    aget v10, v10, v5

    .line 354
    .line 355
    invoke-virtual {v0, v10, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 356
    .line 357
    .line 358
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 359
    .line 360
    aget v10, v10, v5

    .line 361
    .line 362
    invoke-virtual {v0, v10, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 363
    .line 364
    .line 365
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 366
    .line 367
    aget v10, v10, v6

    .line 368
    .line 369
    iget v11, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 370
    .line 371
    div-float/2addr v11, v7

    .line 372
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 373
    .line 374
    .line 375
    move-result v12

    .line 376
    int-to-float v12, v12

    .line 377
    sub-float/2addr v11, v12

    .line 378
    float-to-int v11, v11

    .line 379
    invoke-virtual {v0, v10, v11}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 380
    .line 381
    .line 382
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 383
    .line 384
    aget v10, v10, v6

    .line 385
    .line 386
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 387
    .line 388
    .line 389
    move-result v11

    .line 390
    div-int/2addr v11, v9

    .line 391
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 392
    .line 393
    .line 394
    move-result v12

    .line 395
    sub-int/2addr v11, v12

    .line 396
    invoke-virtual {v0, v10, v11}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 397
    .line 398
    .line 399
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 400
    .line 401
    aget v10, v10, v6

    .line 402
    .line 403
    invoke-virtual {v0, v10, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 404
    .line 405
    .line 406
    iget-object v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 407
    .line 408
    aget v6, v10, v6

    .line 409
    .line 410
    invoke-virtual {v0, v6, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 411
    .line 412
    .line 413
    iget-object v6, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 414
    .line 415
    aget v6, v6, v9

    .line 416
    .line 417
    iget v10, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 418
    .line 419
    div-float/2addr v10, v7

    .line 420
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 421
    .line 422
    .line 423
    move-result v11

    .line 424
    int-to-float v11, v11

    .line 425
    sub-float/2addr v10, v11

    .line 426
    float-to-int v10, v10

    .line 427
    invoke-virtual {v0, v6, v10}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 428
    .line 429
    .line 430
    iget-object v6, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 431
    .line 432
    aget v6, v6, v9

    .line 433
    .line 434
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 435
    .line 436
    .line 437
    move-result v10

    .line 438
    div-int/2addr v10, v9

    .line 439
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 440
    .line 441
    .line 442
    move-result v11

    .line 443
    sub-int/2addr v10, v11

    .line 444
    invoke-virtual {v0, v6, v10}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 445
    .line 446
    .line 447
    iget-object v6, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 448
    .line 449
    aget v6, v6, v9

    .line 450
    .line 451
    invoke-virtual {v0, v6, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 452
    .line 453
    .line 454
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 455
    .line 456
    aget v1, v1, v9

    .line 457
    .line 458
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 459
    .line 460
    .line 461
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 462
    .line 463
    aget v1, v1, v4

    .line 464
    .line 465
    iget v6, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 466
    .line 467
    div-float/2addr v6, v7

    .line 468
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 469
    .line 470
    .line 471
    move-result v7

    .line 472
    int-to-float v7, v7

    .line 473
    sub-float/2addr v6, v7

    .line 474
    float-to-int v6, v6

    .line 475
    invoke-virtual {v0, v1, v6}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 476
    .line 477
    .line 478
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 479
    .line 480
    aget v1, v1, v4

    .line 481
    .line 482
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 483
    .line 484
    .line 485
    move-result v6

    .line 486
    div-int/2addr v6, v9

    .line 487
    invoke-static {v8}, Ll/bnl0;->w(F)I

    .line 488
    .line 489
    .line 490
    move-result v7

    .line 491
    sub-int/2addr v6, v7

    .line 492
    invoke-virtual {v0, v1, v6}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 493
    .line 494
    .line 495
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 496
    .line 497
    aget v1, v1, v4

    .line 498
    .line 499
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 500
    .line 501
    .line 502
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 503
    .line 504
    aget v1, v1, v4

    .line 505
    .line 506
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 507
    .line 508
    .line 509
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 510
    .line 511
    .line 512
    :cond_3
    :goto_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->m0(Z)V

    .line 513
    .line 514
    .line 515
    return-void
.end method


# virtual methods
.method public final k0(Landroid/content/Context;II)Lv/AutoVDraweeView;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 5
    .line 6
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :cond_0
    const/4 v1, 0x2

    .line 15
    const/4 v2, 0x0

    .line 16
    if-ne p2, v1, :cond_2

    .line 17
    .line 18
    if-nez p3, :cond_1

    .line 19
    .line 20
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 21
    .line 22
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 23
    .line 24
    .line 25
    iget p3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 26
    .line 27
    invoke-virtual {p2, p3, v2, v2, p3}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 28
    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_1
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 33
    .line 34
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 35
    .line 36
    .line 37
    iget p3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 38
    .line 39
    invoke-virtual {p2, v2, p3, p3, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    const/4 v3, 0x3

    .line 44
    if-ne p2, v3, :cond_5

    .line 45
    .line 46
    if-nez p3, :cond_3

    .line 47
    .line 48
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 49
    .line 50
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 51
    .line 52
    .line 53
    iget p3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 54
    .line 55
    invoke-virtual {p2, p3, v2, v2, p3}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    if-ne p3, v0, :cond_4

    .line 60
    .line 61
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 62
    .line 63
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 64
    .line 65
    .line 66
    iget p3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 67
    .line 68
    invoke-virtual {p2, v2, p3, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 73
    .line 74
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 75
    .line 76
    .line 77
    iget p3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 78
    .line 79
    invoke-virtual {p2, v2, v2, p3, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/4 v3, 0x4

    .line 84
    if-ne p2, v3, :cond_9

    .line 85
    .line 86
    if-nez p3, :cond_6

    .line 87
    .line 88
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 89
    .line 90
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 91
    .line 92
    .line 93
    iget p3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 94
    .line 95
    invoke-virtual {p2, p3, v2, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_6
    if-ne p3, v0, :cond_7

    .line 100
    .line 101
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 102
    .line 103
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 104
    .line 105
    .line 106
    iget p3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 107
    .line 108
    invoke-virtual {p2, v2, p3, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    if-ne p3, v1, :cond_8

    .line 113
    .line 114
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 115
    .line 116
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 117
    .line 118
    .line 119
    iget p3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 120
    .line 121
    invoke-virtual {p2, v2, v2, v2, p3}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_8
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 126
    .line 127
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 128
    .line 129
    .line 130
    iget p3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 131
    .line 132
    invoke-virtual {p2, v2, v2, p3, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_9
    const/4 p2, 0x0

    .line 137
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {p0}, Ll/xlj;->u(Landroid/content/res/Resources;)Ll/xlj;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    sget-object p3, Ll/h1e0;->i:Ll/h1e0;

    .line 146
    .line 147
    invoke-virtual {p0, p3}, Ll/xlj;->v(Ll/h1e0;)Ll/xlj;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    const/4 p3, 0x0

    .line 152
    invoke-virtual {p0, p3}, Ll/xlj;->y(I)Ll/xlj;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0, p2}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p0}, Ll/xlj;->a()Ll/wlj;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    new-instance p2, Lv/AutoVDraweeView;

    .line 165
    .line 166
    invoke-direct {p2, p1}, Lv/AutoVDraweeView;-><init>(Landroid/content/Context;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p2, p0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 170
    .line 171
    .line 172
    return-object p2
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->h:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public p0(Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->f:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/ty6;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/ty6;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p1, v1}, Ll/jyb;->l(Ljava/util/Collection;Ljava/util/Collection;Ll/rcj;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->i:Z

    .line 17
    .line 18
    if-ne v0, p2, :cond_0

    .line 19
    .line 20
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->m0(Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iput-boolean p2, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->i:Z

    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->f:Ljava/util/List;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->e:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 34
    .line 35
    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-lez v0, :cond_2

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    move v1, v0

    .line 46
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-ge v1, v2, :cond_2

    .line 51
    .line 52
    const/4 v2, 0x4

    .line 53
    if-ge v1, v2, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {p0, v2, v3, v1}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->k0(Landroid/content/Context;II)Lv/AutoVDraweeView;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->d:[I

    .line 68
    .line 69
    aget v3, v3, v1

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/view/View;->setId(I)V

    .line 72
    .line 73
    .line 74
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->e:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    new-instance v3, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 89
    .line 90
    invoke-direct {v3, v0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    .line 95
    .line 96
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    new-instance p1, Ll/tu10;

    .line 100
    .line 101
    invoke-direct {p1, p0, p2}, Ll/tu10;-><init>(Lcom/p1/mobile/putong/ui/MultipleChatIconView;Z)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public setRadius(F)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/high16 v0, 0x3f000000    # 0.5f

    .line 6
    .line 7
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sub-int/2addr p1, v0

    .line 12
    int-to-float p1, p1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->g:F

    .line 14
    .line 15
    return-void
.end method
