.class public Lv/fresco/subscaleview/SubsamplingScaleImageView$b;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/fresco/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lv/fresco/subscaleview/SubsamplingScaleImageView;


# direct methods
.method public constructor <init>(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 2
    .line 3
    iput-object p2, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 2
    .line 3
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->n(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 10
    .line 11
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->i(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 18
    .line 19
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->m(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 26
    .line 27
    iget-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->a:Landroid/content/Context;

    .line 28
    .line 29
    invoke-static {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->L(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 33
    .line 34
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->g(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    new-instance v0, Landroid/graphics/PointF;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-direct {v0, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->y(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 60
    .line 61
    new-instance v1, Landroid/graphics/PointF;

    .line 62
    .line 63
    iget-object v3, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 64
    .line 65
    invoke-static {v3}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->m(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    iget v3, v3, Landroid/graphics/PointF;->x:F

    .line 70
    .line 71
    iget-object v4, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 72
    .line 73
    invoke-static {v4}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->m(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 78
    .line 79
    invoke-direct {v1, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->z(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 86
    .line 87
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->k(Lv/fresco/subscaleview/SubsamplingScaleImageView;)F

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    invoke-static {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->x(Lv/fresco/subscaleview/SubsamplingScaleImageView;F)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 95
    .line 96
    invoke-static {v0, v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->p(Lv/fresco/subscaleview/SubsamplingScaleImageView;Z)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 100
    .line 101
    invoke-static {v0, v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->q(Lv/fresco/subscaleview/SubsamplingScaleImageView;Z)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 105
    .line 106
    const/high16 v1, -0x40800000    # -1.0f

    .line 107
    .line 108
    invoke-static {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->s(Lv/fresco/subscaleview/SubsamplingScaleImageView;F)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 112
    .line 113
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->l(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->N0(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-static {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->u(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 125
    .line 126
    new-instance v1, Landroid/graphics/PointF;

    .line 127
    .line 128
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    invoke-direct {v1, v2, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 137
    .line 138
    .line 139
    invoke-static {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->w(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 143
    .line 144
    new-instance v0, Landroid/graphics/PointF;

    .line 145
    .line 146
    iget-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 147
    .line 148
    invoke-static {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->h(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 153
    .line 154
    iget-object v2, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 155
    .line 156
    invoke-static {v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->h(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 161
    .line 162
    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 163
    .line 164
    .line 165
    invoke-static {p1, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->v(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 169
    .line 170
    const/4 p1, 0x0

    .line 171
    invoke-static {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->t(Lv/fresco/subscaleview/SubsamplingScaleImageView;Z)V

    .line 172
    .line 173
    .line 174
    return p1

    .line 175
    :cond_0
    new-instance p0, Landroid/graphics/PointF;

    .line 176
    .line 177
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    invoke-direct {p0, v0, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1, p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->N0(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    new-instance v0, Landroid/graphics/PointF;

    .line 193
    .line 194
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    invoke-direct {v0, v3, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 203
    .line 204
    .line 205
    invoke-static {v1, p0, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->B(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 206
    .line 207
    .line 208
    return v2

    .line 209
    :cond_1
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    return p0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 2
    .line 3
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->f(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 10
    .line 11
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->i(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 18
    .line 19
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->m(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    if-eqz p2, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    sub-float/2addr v0, v1

    .line 38
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/high16 v1, 0x42480000    # 50.0f

    .line 43
    .line 44
    cmpl-float v0, v0, v1

    .line 45
    .line 46
    if-gtz v0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    sub-float/2addr v0, v2

    .line 57
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    cmpl-float v0, v0, v1

    .line 62
    .line 63
    if-lez v0, :cond_2

    .line 64
    .line 65
    :cond_0
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/high16 v1, 0x43fa0000    # 500.0f

    .line 70
    .line 71
    cmpl-float v0, v0, v1

    .line 72
    .line 73
    if-gtz v0, :cond_1

    .line 74
    .line 75
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    cmpl-float v0, v0, v1

    .line 80
    .line 81
    if-lez v0, :cond_2

    .line 82
    .line 83
    :cond_1
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 84
    .line 85
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->c(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_2

    .line 90
    .line 91
    new-instance p1, Landroid/graphics/PointF;

    .line 92
    .line 93
    iget-object p2, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 94
    .line 95
    invoke-static {p2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->m(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    iget p2, p2, Landroid/graphics/PointF;->x:F

    .line 100
    .line 101
    const/high16 v0, 0x3e800000    # 0.25f

    .line 102
    .line 103
    mul-float/2addr p3, v0

    .line 104
    add-float/2addr p2, p3

    .line 105
    iget-object p3, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 106
    .line 107
    invoke-static {p3}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->m(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 112
    .line 113
    mul-float/2addr p4, v0

    .line 114
    add-float/2addr p3, p4

    .line 115
    invoke-direct {p1, p2, p3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 116
    .line 117
    .line 118
    iget-object p2, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 119
    .line 120
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    div-int/lit8 p2, p2, 0x2

    .line 125
    .line 126
    int-to-float p2, p2

    .line 127
    iget p3, p1, Landroid/graphics/PointF;->x:F

    .line 128
    .line 129
    sub-float/2addr p2, p3

    .line 130
    iget-object p3, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 131
    .line 132
    invoke-static {p3}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->k(Lv/fresco/subscaleview/SubsamplingScaleImageView;)F

    .line 133
    .line 134
    .line 135
    move-result p3

    .line 136
    div-float/2addr p2, p3

    .line 137
    iget-object p3, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 138
    .line 139
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 140
    .line 141
    .line 142
    move-result p3

    .line 143
    div-int/lit8 p3, p3, 0x2

    .line 144
    .line 145
    int-to-float p3, p3

    .line 146
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 147
    .line 148
    sub-float/2addr p3, p1

    .line 149
    iget-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 150
    .line 151
    invoke-static {p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->k(Lv/fresco/subscaleview/SubsamplingScaleImageView;)F

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    div-float/2addr p3, p1

    .line 156
    new-instance p1, Lv/fresco/subscaleview/SubsamplingScaleImageView$d;

    .line 157
    .line 158
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 159
    .line 160
    new-instance p4, Landroid/graphics/PointF;

    .line 161
    .line 162
    invoke-direct {p4, p2, p3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 163
    .line 164
    .line 165
    const/4 p2, 0x0

    .line 166
    invoke-direct {p1, p0, p4, p2}, Lv/fresco/subscaleview/SubsamplingScaleImageView$d;-><init>(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Ll/acg0;)V

    .line 167
    .line 168
    .line 169
    const/4 p0, 0x1

    .line 170
    invoke-virtual {p1, p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$d;->e(I)Lv/fresco/subscaleview/SubsamplingScaleImageView$d;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    const/4 p2, 0x0

    .line 175
    invoke-static {p1, p2}, Lv/fresco/subscaleview/SubsamplingScaleImageView$d;->b(Lv/fresco/subscaleview/SubsamplingScaleImageView$d;Z)Lv/fresco/subscaleview/SubsamplingScaleImageView$d;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    const/4 p2, 0x3

    .line 180
    invoke-static {p1, p2}, Lv/fresco/subscaleview/SubsamplingScaleImageView$d;->a(Lv/fresco/subscaleview/SubsamplingScaleImageView$d;I)Lv/fresco/subscaleview/SubsamplingScaleImageView$d;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$d;->c()V

    .line 185
    .line 186
    .line 187
    return p0

    .line 188
    :cond_2
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    return p0
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$b;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method
