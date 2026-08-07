.class public Ll/t0e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# instance fields
.field public final a:F

.field public final b:F

.field public final c:Landroid/view/ScaleGestureDetector;

.field public final d:Ll/nn50;

.field public e:Landroid/view/VelocityTracker;

.field public f:Z

.field public g:F

.field public h:F

.field public i:I

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/nn50;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/t0e0;->i:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/t0e0;->j:I

    .line 9
    .line 10
    new-instance v0, Landroid/view/ScaleGestureDetector;

    .line 11
    .line 12
    invoke-direct {v0, p1, p0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/t0e0;->c:Landroid/view/ScaleGestureDetector;

    .line 16
    .line 17
    iput-object p2, p0, Ll/t0e0;->d:Ll/nn50;

    .line 18
    .line 19
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    int-to-float p2, p2

    .line 28
    iput p2, p0, Ll/t0e0;->b:F

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    int-to-float p1, p1

    .line 35
    iput p1, p0, Ll/t0e0;->a:F

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;)F
    .locals 0

    .line 1
    :try_start_0
    iget p0, p0, Ll/t0e0;->j:I

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/u610;->e(Landroid/view/MotionEvent;I)F

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final b(Landroid/view/MotionEvent;)F
    .locals 0

    .line 1
    :try_start_0
    iget p0, p0, Ll/t0e0;->j:I

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/u610;->f(Landroid/view/MotionEvent;I)F

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/t0e0;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t0e0;->c:Landroid/view/ScaleGestureDetector;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final e(ILandroid/view/MotionEvent;)V
    .locals 5

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq p1, v2, :cond_2

    .line 7
    .line 8
    const/4 v3, 0x3

    .line 9
    if-eq p1, v3, :cond_2

    .line 10
    .line 11
    const/4 v3, 0x6

    .line 12
    if-eq p1, v3, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-static {p2}, Ll/u610;->b(Landroid/view/MotionEvent;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-static {p2, p1}, Ll/u610;->d(Landroid/view/MotionEvent;I)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    iget v4, p0, Ll/t0e0;->i:I

    .line 24
    .line 25
    if-ne v3, v4, :cond_4

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move v2, v1

    .line 31
    :goto_0
    invoke-static {p2, v2}, Ll/u610;->d(Landroid/view/MotionEvent;I)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Ll/t0e0;->i:I

    .line 36
    .line 37
    invoke-static {p2, v2}, Ll/u610;->e(Landroid/view/MotionEvent;I)F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Ll/t0e0;->g:F

    .line 42
    .line 43
    invoke-static {p2, v2}, Ll/u610;->f(Landroid/view/MotionEvent;I)F

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Ll/t0e0;->h:F

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    iput v0, p0, Ll/t0e0;->i:I

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    invoke-virtual {p2, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput p1, p0, Ll/t0e0;->i:I

    .line 58
    .line 59
    :cond_4
    :goto_1
    iget p1, p0, Ll/t0e0;->i:I

    .line 60
    .line 61
    if-eq p1, v0, :cond_5

    .line 62
    .line 63
    move v1, p1

    .line 64
    :cond_5
    invoke-static {p2, v1}, Ll/u610;->a(Landroid/view/MotionEvent;I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iput p1, p0, Ll/t0e0;->j:I

    .line 69
    .line 70
    return-void
.end method

.method public final f(ILandroid/view/MotionEvent;)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_7

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq p1, v2, :cond_4

    .line 7
    .line 8
    const/4 v3, 0x2

    .line 9
    if-eq p1, v3, :cond_1

    .line 10
    .line 11
    const/4 p2, 0x3

    .line 12
    if-eq p1, p2, :cond_0

    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 17
    .line 18
    if-eqz p1, :cond_6

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0, p2}, Ll/t0e0;->a(Landroid/view/MotionEvent;)F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p0, p2}, Ll/t0e0;->b(Landroid/view/MotionEvent;)F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iget v3, p0, Ll/t0e0;->g:F

    .line 35
    .line 36
    sub-float v3, p1, v3

    .line 37
    .line 38
    iget v4, p0, Ll/t0e0;->h:F

    .line 39
    .line 40
    sub-float v4, v1, v4

    .line 41
    .line 42
    iget-boolean v5, p0, Ll/t0e0;->f:Z

    .line 43
    .line 44
    if-nez v5, :cond_3

    .line 45
    .line 46
    mul-float v5, v3, v3

    .line 47
    .line 48
    mul-float v6, v4, v4

    .line 49
    .line 50
    add-float/2addr v5, v6

    .line 51
    float-to-double v5, v5

    .line 52
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    .line 53
    .line 54
    .line 55
    move-result-wide v5

    .line 56
    iget v7, p0, Ll/t0e0;->a:F

    .line 57
    .line 58
    float-to-double v7, v7

    .line 59
    cmpl-double v5, v5, v7

    .line 60
    .line 61
    if-ltz v5, :cond_2

    .line 62
    .line 63
    move v0, v2

    .line 64
    :cond_2
    iput-boolean v0, p0, Ll/t0e0;->f:Z

    .line 65
    .line 66
    :cond_3
    iget-boolean v0, p0, Ll/t0e0;->f:Z

    .line 67
    .line 68
    if-eqz v0, :cond_6

    .line 69
    .line 70
    iget-object v0, p0, Ll/t0e0;->d:Ll/nn50;

    .line 71
    .line 72
    invoke-interface {v0, v3, v4}, Ll/nn50;->c(FF)V

    .line 73
    .line 74
    .line 75
    iput p1, p0, Ll/t0e0;->g:F

    .line 76
    .line 77
    iput v1, p0, Ll/t0e0;->h:F

    .line 78
    .line 79
    iget-object p0, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 80
    .line 81
    if-eqz p0, :cond_6

    .line 82
    .line 83
    invoke-virtual {p0, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    iget-boolean p1, p0, Ll/t0e0;->f:Z

    .line 88
    .line 89
    if-eqz p1, :cond_5

    .line 90
    .line 91
    iget-object p1, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 92
    .line 93
    if-eqz p1, :cond_5

    .line 94
    .line 95
    invoke-virtual {p0, p2}, Ll/t0e0;->a(Landroid/view/MotionEvent;)F

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    iput p1, p0, Ll/t0e0;->g:F

    .line 100
    .line 101
    invoke-virtual {p0, p2}, Ll/t0e0;->b(Landroid/view/MotionEvent;)F

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iput p1, p0, Ll/t0e0;->h:F

    .line 106
    .line 107
    iget-object p1, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 113
    .line 114
    const/16 p2, 0x3e8

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 120
    .line 121
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    iget-object p2, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 126
    .line 127
    invoke-virtual {p2}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iget v2, p0, Ll/t0e0;->b:F

    .line 144
    .line 145
    cmpl-float v0, v0, v2

    .line 146
    .line 147
    if-ltz v0, :cond_5

    .line 148
    .line 149
    iget-object v0, p0, Ll/t0e0;->d:Ll/nn50;

    .line 150
    .line 151
    iget v2, p0, Ll/t0e0;->g:F

    .line 152
    .line 153
    iget v3, p0, Ll/t0e0;->h:F

    .line 154
    .line 155
    neg-float p1, p1

    .line 156
    neg-float p2, p2

    .line 157
    invoke-interface {v0, v2, v3, p1, p2}, Ll/nn50;->b(FFFF)V

    .line 158
    .line 159
    .line 160
    :cond_5
    iget-object p1, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 161
    .line 162
    if-eqz p1, :cond_6

    .line 163
    .line 164
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 165
    .line 166
    .line 167
    iput-object v1, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 168
    .line 169
    :cond_6
    :goto_0
    return-void

    .line 170
    :cond_7
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Ll/t0e0;->e:Landroid/view/VelocityTracker;

    .line 175
    .line 176
    if-eqz p1, :cond_8

    .line 177
    .line 178
    invoke-virtual {p1, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 179
    .line 180
    .line 181
    :cond_8
    invoke-virtual {p0, p2}, Ll/t0e0;->a(Landroid/view/MotionEvent;)F

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    iput p1, p0, Ll/t0e0;->g:F

    .line 186
    .line 187
    invoke-virtual {p0, p2}, Ll/t0e0;->b(Landroid/view/MotionEvent;)F

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    iput p1, p0, Ll/t0e0;->h:F

    .line 192
    .line 193
    iput-boolean v0, p0, Ll/t0e0;->f:Z

    .line 194
    .line 195
    return-void
.end method

.method public g(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t0e0;->c:Landroid/view/ScaleGestureDetector;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/u610;->c(Landroid/view/MotionEvent;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, v0, p1}, Ll/t0e0;->e(ILandroid/view/MotionEvent;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Ll/t0e0;->f(ILandroid/view/MotionEvent;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Float;->isInfinite(F)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/t0e0;->d:Ll/nn50;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-interface {p0, v0, v1, p1}, Ll/nn50;->f(FFF)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t0e0;->d:Ll/nn50;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nn50;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
