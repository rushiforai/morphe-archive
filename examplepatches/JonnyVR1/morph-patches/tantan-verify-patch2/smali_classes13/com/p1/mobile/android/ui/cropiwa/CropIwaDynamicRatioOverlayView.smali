.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;
.super Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;
.source "SourceFile"


# instance fields
.field public u:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/bwb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->F()V

    return-void
.end method


# virtual methods
.method public final E(FF)F
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    cmpl-float p0, p1, p0

    .line 3
    .line 4
    if-lez p0, :cond_0

    .line 5
    .line 6
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    neg-float p0, p2

    .line 12
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final synthetic F()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->b(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic a()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic b(Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->b(Landroid/graphics/RectF;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic e()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic g()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public o()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    const/4 v2, 0x0

    .line 12
    cmpl-float v3, v0, v2

    .line 13
    .line 14
    if-eqz v3, :cond_3

    .line 15
    .line 16
    cmpl-float v3, v1, v2

    .line 17
    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getAspectRatio()Ll/q11;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-eqz v3, :cond_3

    .line 27
    .line 28
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    cmpl-float v4, v4, v2

    .line 33
    .line 34
    if-nez v4, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    cmpl-float v4, v4, v2

    .line 44
    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 48
    .line 49
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    cmpl-float v2, v4, v2

    .line 54
    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 64
    .line 65
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    div-float/2addr v2, v4

    .line 70
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    sub-float/2addr v2, v4

    .line 75
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    float-to-double v4, v2

    .line 80
    const-wide v6, 0x3f50624dd2f1a9fcL    # 0.001

    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    cmpg-double v2, v4, v6

    .line 86
    .line 87
    if-gez v2, :cond_2

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 91
    .line 92
    invoke-virtual {v2}, Ll/bwb;->p()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    int-to-float v2, v2

    .line 97
    const/high16 v4, 0x3f000000    # 0.5f

    .line 98
    .line 99
    mul-float/2addr v1, v4

    .line 100
    mul-float/2addr v0, v4

    .line 101
    mul-float/2addr v2, v4

    .line 102
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    div-float v3, v2, v3

    .line 107
    .line 108
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 109
    .line 110
    sub-float v5, v0, v2

    .line 111
    .line 112
    sub-float v6, v1, v3

    .line 113
    .line 114
    add-float/2addr v0, v2

    .line 115
    add-float/2addr v1, v3

    .line 116
    invoke-virtual {v4, v5, v6, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 120
    .line 121
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_3

    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 128
    .line 129
    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_3

    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 138
    .line 139
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 140
    .line 141
    .line 142
    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public t()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public u()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->n()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/uvb;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/uvb;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;)V

    .line 24
    .line 25
    .line 26
    const-wide/16 v1, 0x32

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->u()V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->u:Landroid/graphics/PointF;

    .line 36
    .line 37
    return-void
.end method

.method public w(Landroid/view/MotionEvent;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->g()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_6

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-ge v0, v1, :cond_5

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->q:Landroid/util/SparseArray;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;

    .line 31
    .line 32
    if-eqz v1, :cond_4

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->u:Landroid/graphics/PointF;

    .line 35
    .line 36
    if-eqz v2, :cond_4

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iget-object v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->u:Landroid/graphics/PointF;

    .line 43
    .line 44
    iget v3, v3, Landroid/graphics/PointF;->x:F

    .line 45
    .line 46
    sub-float/2addr v2, v3

    .line 47
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->u:Landroid/graphics/PointF;

    .line 52
    .line 53
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 54
    .line 55
    sub-float/2addr v3, v4

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getAspectRatio()Ll/q11;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    if-eqz v4, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getAspectRatio()Ll/q11;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v4}, Ll/q11;->b()F

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    goto :goto_1

    .line 71
    :cond_0
    const/high16 v4, 0x3f800000    # 1.0f

    .line 72
    .line 73
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getRemainScale()F

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    iget-object v6, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 78
    .line 79
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    iget-object v7, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 84
    .line 85
    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    div-float/2addr v7, v5

    .line 90
    sub-float/2addr v6, v7

    .line 91
    iget-object v7, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 92
    .line 93
    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    .line 94
    .line 95
    .line 96
    move-result v7

    .line 97
    iget-object v8, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 98
    .line 99
    invoke-virtual {v8}, Landroid/graphics/RectF;->height()F

    .line 100
    .line 101
    .line 102
    move-result v8

    .line 103
    div-float/2addr v8, v5

    .line 104
    sub-float/2addr v7, v8

    .line 105
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    cmpl-float v5, v5, v8

    .line 114
    .line 115
    if-lez v5, :cond_2

    .line 116
    .line 117
    invoke-virtual {p0, v3, v7}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->E(FF)F

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->c()Z

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-eqz v3, :cond_1

    .line 126
    .line 127
    mul-float/2addr v4, v2

    .line 128
    goto :goto_3

    .line 129
    :cond_1
    neg-float v3, v2

    .line 130
    mul-float/2addr v4, v3

    .line 131
    goto :goto_3

    .line 132
    :cond_2
    invoke-virtual {p0, v2, v6}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->E(FF)F

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->c()Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-eqz v3, :cond_3

    .line 141
    .line 142
    div-float v3, v2, v4

    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_3
    neg-float v3, v2

    .line 146
    div-float/2addr v3, v4

    .line 147
    :goto_2
    move v4, v2

    .line 148
    move v2, v3

    .line 149
    :goto_3
    iget-object v3, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->u:Landroid/graphics/PointF;

    .line 150
    .line 151
    iget v3, v3, Landroid/graphics/PointF;->x:F

    .line 152
    .line 153
    add-float/2addr v3, v4

    .line 154
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 155
    .line 156
    iget v5, v4, Landroid/graphics/RectF;->left:F

    .line 157
    .line 158
    iget v4, v4, Landroid/graphics/RectF;->right:F

    .line 159
    .line 160
    invoke-static {v3, v5, v4}, Ll/gwb;->a(FFF)F

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->u:Landroid/graphics/PointF;

    .line 165
    .line 166
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 167
    .line 168
    add-float/2addr v4, v2

    .line 169
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f:Landroid/graphics/RectF;

    .line 170
    .line 171
    iget v5, v2, Landroid/graphics/RectF;->top:F

    .line 172
    .line 173
    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    .line 174
    .line 175
    invoke-static {v4, v5, v2}, Ll/gwb;->a(FFF)F

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView$a;->e(FF)V

    .line 180
    .line 181
    .line 182
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->C()V

    .line 187
    .line 188
    .line 189
    :cond_6
    return-void
.end method

.method public y(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;->y(Landroid/view/MotionEvent;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-direct {v0, v1, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicRatioOverlayView;->u:Landroid/graphics/PointF;

    .line 18
    .line 19
    return-void
.end method
