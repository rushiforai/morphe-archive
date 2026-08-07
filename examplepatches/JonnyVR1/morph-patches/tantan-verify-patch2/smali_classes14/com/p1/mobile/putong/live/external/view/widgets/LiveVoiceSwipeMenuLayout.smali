.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# static fields
.field public static s:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

.field public static t:Z


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroid/view/View;

.field public h:Landroid/graphics/PointF;

.field public i:Z

.field public j:Landroid/graphics/PointF;

.field public k:Z

.field public l:Landroid/view/VelocityTracker;

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Landroid/animation/ValueAnimator;

.field public q:Landroid/animation/ValueAnimator;

.field public r:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->h:Landroid/graphics/PointF;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->i:Z

    .line 13
    .line 14
    new-instance v0, Landroid/graphics/PointF;

    .line 15
    .line 16
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->j:Landroid/graphics/PointF;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->e(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->r:Z

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->l:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->l:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->l:Landroid/view/VelocityTracker;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->q:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->q:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->p:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->p:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public final d(II)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 8
    .line 9
    .line 10
    move-result v6

    .line 11
    const/4 v0, 0x0

    .line 12
    :goto_0
    if-ge v0, p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/16 v2, 0x8

    .line 23
    .line 24
    if-eq v1, v2, :cond_0

    .line 25
    .line 26
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 31
    .line 32
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 33
    .line 34
    const/4 v4, -0x1

    .line 35
    if-ne v2, v4, :cond_0

    .line 36
    .line 37
    iget v8, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 38
    .line 39
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    const/4 v7, 0x0

    .line 47
    move-object v2, p0

    .line 48
    move v4, p2

    .line 49
    invoke-virtual/range {v2 .. v7}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 50
    .line 51
    .line 52
    iput v8, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    move-object v2, p0

    .line 56
    move v4, p2

    .line 57
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    move-object p0, v2

    .line 60
    move p2, v4

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_11

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->b(Landroid/view/MotionEvent;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->l:Landroid/view/VelocityTracker;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v1, :cond_d

    .line 17
    .line 18
    if-eq v1, v2, :cond_7

    .line 19
    .line 20
    const/4 v4, 0x2

    .line 21
    if-eq v1, v4, :cond_0

    .line 22
    .line 23
    const/4 v4, 0x3

    .line 24
    if-eq v1, v4, :cond_7

    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->o:Z

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    goto/16 :goto_1

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->h:Landroid/graphics/PointF;

    .line 35
    .line 36
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    sub-float/2addr v0, v1

    .line 43
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const/high16 v4, 0x41200000    # 10.0f

    .line 48
    .line 49
    cmpl-float v1, v1, v4

    .line 50
    .line 51
    if-gtz v1, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    const/16 v4, 0xa

    .line 62
    .line 63
    if-le v1, v4, :cond_3

    .line 64
    .line 65
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {v1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 70
    .line 71
    .line 72
    :cond_3
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    iget v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->a:I

    .line 77
    .line 78
    int-to-float v2, v2

    .line 79
    cmpl-float v1, v1, v2

    .line 80
    .line 81
    if-lez v1, :cond_4

    .line 82
    .line 83
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->i:Z

    .line 84
    .line 85
    :cond_4
    float-to-int v0, v0

    .line 86
    invoke-virtual {p0, v0, v3}, Landroid/view/View;->scrollBy(II)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-gez v0, :cond_5

    .line 94
    .line 95
    invoke-virtual {p0, v3, v3}, Landroid/view/View;->scrollTo(II)V

    .line 96
    .line 97
    .line 98
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iget v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->e:I

    .line 103
    .line 104
    if-le v0, v1, :cond_6

    .line 105
    .line 106
    invoke-virtual {p0, v1, v3}, Landroid/view/View;->scrollTo(II)V

    .line 107
    .line 108
    .line 109
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->h:Landroid/graphics/PointF;

    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 120
    .line 121
    .line 122
    goto/16 :goto_1

    .line 123
    .line 124
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->j:Landroid/graphics/PointF;

    .line 129
    .line 130
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 131
    .line 132
    sub-float/2addr v1, v4

    .line 133
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    iget v4, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->a:I

    .line 138
    .line 139
    int-to-float v4, v4

    .line 140
    cmpl-float v1, v1, v4

    .line 141
    .line 142
    if-lez v1, :cond_8

    .line 143
    .line 144
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->k:Z

    .line 145
    .line 146
    :cond_8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->o:Z

    .line 147
    .line 148
    if-nez v1, :cond_c

    .line 149
    .line 150
    iget v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->b:I

    .line 151
    .line 152
    int-to-float v1, v1

    .line 153
    const/16 v2, 0x3e8

    .line 154
    .line 155
    invoke-virtual {v0, v2, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 156
    .line 157
    .line 158
    iget v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->c:I

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 169
    .line 170
    cmpl-float v1, v1, v2

    .line 171
    .line 172
    if-lez v1, :cond_a

    .line 173
    .line 174
    const/high16 v1, -0x3b860000    # -1000.0f

    .line 175
    .line 176
    cmpg-float v0, v0, v1

    .line 177
    .line 178
    if-gez v0, :cond_9

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->i()V

    .line 181
    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->h()V

    .line 185
    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iget v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->f:I

    .line 197
    .line 198
    if-le v0, v1, :cond_b

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->i()V

    .line 201
    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_b
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->h()V

    .line 205
    .line 206
    .line 207
    :cond_c
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->g()V

    .line 208
    .line 209
    .line 210
    sput-boolean v3, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->t:Z

    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_d
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->k:Z

    .line 214
    .line 215
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->i:Z

    .line 216
    .line 217
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->o:Z

    .line 218
    .line 219
    sget-boolean v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->t:Z

    .line 220
    .line 221
    if-eqz v0, :cond_e

    .line 222
    .line 223
    return v3

    .line 224
    :cond_e
    sput-boolean v2, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->t:Z

    .line 225
    .line 226
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->h:Landroid/graphics/PointF;

    .line 227
    .line 228
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 233
    .line 234
    .line 235
    move-result v4

    .line 236
    invoke-virtual {v0, v1, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->j:Landroid/graphics/PointF;

    .line 240
    .line 241
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    invoke-virtual {v0, v1, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 250
    .line 251
    .line 252
    sget-object v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->s:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 253
    .line 254
    if-eqz v0, :cond_10

    .line 255
    .line 256
    if-eq v0, p0, :cond_f

    .line 257
    .line 258
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->h()V

    .line 259
    .line 260
    .line 261
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->n:Z

    .line 262
    .line 263
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->o:Z

    .line 264
    .line 265
    :cond_f
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 270
    .line 271
    .line 272
    :cond_10
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    iput v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->c:I

    .line 277
    .line 278
    :cond_11
    :goto_1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 279
    .line 280
    .line 281
    move-result p0

    .line 282
    return p0
.end method

.method public final e(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iput p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->a:I

    .line 10
    .line 11
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->b:I

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->m:Z

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->n:Z

    .line 26
    .line 27
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->s:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->c()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->s:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0, v0}, Landroid/view/View;->scrollTo(II)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    sput-object p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->s:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->l:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->l:Landroid/view/VelocityTracker;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->l:Landroid/view/VelocityTracker;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public h()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->s:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->g:Landroid/view/View;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setLongClickable(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->c()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    filled-new-array {v0, v1}, [I

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->q:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$c;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$c;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->q:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    .line 41
    .line 42
    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->q:Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    new-instance v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$d;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$d;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->q:Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    const-wide/16 v0, 0x12c

    .line 61
    .line 62
    invoke-virtual {p0, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    sput-object p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->s:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->g:Landroid/view/View;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setLongClickable(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->c()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->e:I

    .line 19
    .line 20
    filled-new-array {v0, v1}, [I

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->p:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$a;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$a;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->p:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    .line 41
    .line 42
    invoke-direct {v1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->p:Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    new-instance v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$b;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout$b;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->p:Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    const-wide/16 v0, 0x12c

    .line 61
    .line 62
    invoke-virtual {p0, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->s:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->h()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-object v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->s:Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;

    .line 10
    .line 11
    :cond_0
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->j:Landroid/graphics/PointF;

    .line 21
    .line 22
    iget v2, v2, Landroid/graphics/PointF;->x:F

    .line 23
    .line 24
    sub-float/2addr v0, v2

    .line 25
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->a:I

    .line 30
    .line 31
    int-to-float v2, v2

    .line 32
    cmpl-float v0, v0, v2

    .line 33
    .line 34
    if-lez v0, :cond_4

    .line 35
    .line 36
    return v1

    .line 37
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget v2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->a:I

    .line 42
    .line 43
    if-le v0, v2, :cond_3

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    sub-int/2addr v2, v3

    .line 58
    int-to-float v2, v2

    .line 59
    cmpg-float v0, v0, v2

    .line 60
    .line 61
    if-gez v0, :cond_3

    .line 62
    .line 63
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->i:Z

    .line 64
    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->h()V

    .line 68
    .line 69
    .line 70
    :cond_2
    return v1

    .line 71
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->k:Z

    .line 72
    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    return v1

    .line 76
    :cond_4
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->o:Z

    .line 77
    .line 78
    if-eqz v0, :cond_5

    .line 79
    .line 80
    return v1

    .line 81
    :cond_5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 p3, 0x0

    .line 10
    :goto_0
    if-ge p3, p1, :cond_2

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    invoke-virtual {p4}, Landroid/view/View;->getVisibility()I

    .line 17
    .line 18
    .line 19
    move-result p5

    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    if-eq p5, v0, :cond_1

    .line 23
    .line 24
    if-nez p3, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 27
    .line 28
    .line 29
    move-result p5

    .line 30
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    add-int/2addr v0, p2

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    add-int/2addr v1, v2

    .line 44
    invoke-virtual {p4, p2, p5, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 48
    .line 49
    .line 50
    move-result p4

    .line 51
    :goto_1
    add-int/2addr p2, p4

    .line 52
    goto :goto_2

    .line 53
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 54
    .line 55
    .line 56
    move-result p5

    .line 57
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr v0, p2

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    add-int/2addr v1, v2

    .line 71
    invoke-virtual {p4, p2, p5, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 75
    .line 76
    .line 77
    move-result p4

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    :goto_2
    add-int/lit8 p3, p3, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    return-void
.end method

.method public onMeasure(II)V
    .locals 10

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->e:I

    .line 10
    .line 11
    iput v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->d:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/high16 v4, 0x40000000    # 2.0f

    .line 22
    .line 23
    if-eq v3, v4, :cond_0

    .line 24
    .line 25
    move v3, v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v3, v1

    .line 28
    :goto_0
    move v4, v1

    .line 29
    move v5, v4

    .line 30
    :goto_1
    if-ge v1, v2, :cond_4

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {v6, v0}, Landroid/view/View;->setClickable(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    const/16 v8, 0x8

    .line 44
    .line 45
    if-eq v7, v8, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0, v6, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    check-cast v7, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 55
    .line 56
    iget v8, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->d:I

    .line 57
    .line 58
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    .line 59
    .line 60
    .line 61
    move-result v9

    .line 62
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 63
    .line 64
    .line 65
    move-result v8

    .line 66
    iput v8, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->d:I

    .line 67
    .line 68
    if-eqz v3, :cond_1

    .line 69
    .line 70
    iget v7, v7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 71
    .line 72
    const/4 v8, -0x1

    .line 73
    if-ne v7, v8, :cond_1

    .line 74
    .line 75
    move v5, v0

    .line 76
    :cond_1
    if-lez v1, :cond_2

    .line 77
    .line 78
    iget v7, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->e:I

    .line 79
    .line 80
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    add-int/2addr v7, v6

    .line 85
    iput v7, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->e:I

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_2
    iput-object v6, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->g:Landroid/view/View;

    .line 89
    .line 90
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    :cond_3
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p2, v0

    .line 106
    add-int/2addr p2, v4

    .line 107
    iget v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->d:I

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    add-int/2addr v0, v1

    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    add-int/2addr v0, v1

    .line 119
    invoke-virtual {p0, p2, v0}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 120
    .line 121
    .line 122
    iget p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->e:I

    .line 123
    .line 124
    mul-int/lit8 p2, p2, 0x4

    .line 125
    .line 126
    div-int/lit8 p2, p2, 0xa

    .line 127
    .line 128
    iput p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->f:I

    .line 129
    .line 130
    if-eqz v5, :cond_5

    .line 131
    .line 132
    invoke-virtual {p0, v2, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->d(II)V

    .line 133
    .line 134
    .line 135
    :cond_5
    return-void
.end method

.method public performLongClick()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveVoiceSwipeMenuLayout;->a:I

    .line 10
    .line 11
    if-le v0, v1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-super {p0}, Landroid/view/View;->performLongClick()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method
