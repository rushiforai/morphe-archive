.class public Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;,
        Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;,
        Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

.field public b:F

.field public c:F

.field public d:Z

.field public e:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->d:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget p2, Ll/c9c0;->a1:I

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->e:I

    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->e:I

    return p0
.end method


# virtual methods
.method public j(Landroid/graphics/PointF;FLjava/lang/Float;)[Landroid/graphics/PointF;
    .locals 5

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    float-to-double v0, p0

    .line 8
    invoke-static {v0, v1}, Ljava/lang/Math;->atan(D)D

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    double-to-float p0, v0

    .line 13
    float-to-double v0, p0

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    float-to-double p2, p2

    .line 19
    mul-double/2addr v2, p2

    .line 20
    double-to-float p0, v2

    .line 21
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    mul-double/2addr v0, p2

    .line 26
    double-to-float p2, v0

    .line 27
    move v4, p2

    .line 28
    move p2, p0

    .line 29
    move p0, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    new-instance p3, Landroid/graphics/PointF;

    .line 33
    .line 34
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 35
    .line 36
    add-float/2addr v0, p2

    .line 37
    iget v1, p1, Landroid/graphics/PointF;->y:F

    .line 38
    .line 39
    sub-float/2addr v1, p0

    .line 40
    invoke-direct {p3, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 41
    .line 42
    .line 43
    new-instance v0, Landroid/graphics/PointF;

    .line 44
    .line 45
    iget v1, p1, Landroid/graphics/PointF;->x:F

    .line 46
    .line 47
    sub-float/2addr v1, p2

    .line 48
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 49
    .line 50
    add-float/2addr p1, p0

    .line 51
    invoke-direct {v0, v1, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 52
    .line 53
    .line 54
    filled-new-array {p3, v0}, [Landroid/graphics/PointF;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public k(Landroid/graphics/PointF;Landroid/graphics/PointF;)Ljava/lang/Float;
    .locals 3

    .line 1
    iget p0, p2, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    sub-float v1, p0, v0

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    cmpl-float v1, v1, v2

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 15
    .line 16
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 17
    .line 18
    sub-float/2addr p2, p1

    .line 19
    sub-float/2addr p0, v0

    .line 20
    div-float/2addr p2, p0

    .line 21
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public l(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .locals 2

    .line 1
    new-instance p0, Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    iget v1, p2, Landroid/graphics/PointF;->x:F

    .line 6
    .line 7
    add-float/2addr v0, v1

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v0, v1

    .line 11
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 12
    .line 13
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    add-float/2addr p1, p2

    .line 16
    div-float/2addr p1, v1

    .line 17
    invoke-direct {p0, v0, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public o(Landroid/graphics/PointF;Landroid/graphics/PointF;)F
    .locals 4

    .line 1
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    sub-float/2addr p0, v0

    .line 6
    float-to-double v0, p0

    .line 7
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 8
    .line 9
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget p0, p1, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    iget p1, p2, Landroid/graphics/PointF;->y:F

    .line 16
    .line 17
    sub-float/2addr p0, p1

    .line 18
    float-to-double p0, p0

    .line 19
    invoke-static {p0, p1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 20
    .line 21
    .line 22
    move-result-wide p0

    .line 23
    add-double/2addr v0, p0

    .line 24
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    double-to-float p0, p0

    .line 29
    return p0
.end method

.method public onSizeChanged(IIII)V
    .locals 1

    .line 1
    int-to-float v0, p1

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->b:F

    .line 3
    .line 4
    int-to-float v0, p2

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->c:F

    .line 6
    .line 7
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 v4, 0x2

    .line 31
    const/4 v5, 0x0

    .line 32
    const/4 v6, 0x1

    .line 33
    if-eqz p1, :cond_a

    .line 34
    .line 35
    if-eq p1, v6, :cond_7

    .line 36
    .line 37
    if-eq p1, v4, :cond_4

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    if-eq p1, v1, :cond_1

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :cond_1
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    invoke-interface {v3, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 51
    .line 52
    .line 53
    :cond_2
    instance-of p1, v0, Landroid/view/ViewGroup;

    .line 54
    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    check-cast v0, Landroid/view/ViewGroup;

    .line 58
    .line 59
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 60
    .line 61
    .line 62
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_c

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 71
    .line 72
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->c(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;)V

    .line 73
    .line 74
    .line 75
    goto/16 :goto_0

    .line 76
    .line 77
    :cond_4
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_5

    .line 82
    .line 83
    invoke-interface {v3, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 84
    .line 85
    .line 86
    :cond_5
    instance-of p1, v0, Landroid/view/ViewGroup;

    .line 87
    .line 88
    if-eqz p1, :cond_6

    .line 89
    .line 90
    check-cast v0, Landroid/view/ViewGroup;

    .line 91
    .line 92
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 93
    .line 94
    .line 95
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 96
    .line 97
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_c

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 104
    .line 105
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->h(FF)V

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_8

    .line 114
    .line 115
    invoke-interface {v3, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 116
    .line 117
    .line 118
    :cond_8
    instance-of p1, v0, Landroid/view/ViewGroup;

    .line 119
    .line 120
    if-eqz p1, :cond_9

    .line 121
    .line 122
    check-cast v0, Landroid/view/ViewGroup;

    .line 123
    .line 124
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 125
    .line 126
    .line 127
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 128
    .line 129
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_c

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->g()V

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_a
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-eqz p1, :cond_b

    .line 146
    .line 147
    invoke-interface {v3, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 148
    .line 149
    .line 150
    :cond_b
    new-array p1, v4, [I

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 153
    .line 154
    .line 155
    instance-of v3, v0, Landroid/view/ViewGroup;

    .line 156
    .line 157
    if-eqz v3, :cond_c

    .line 158
    .line 159
    check-cast v0, Landroid/view/ViewGroup;

    .line 160
    .line 161
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 162
    .line 163
    .line 164
    new-instance v3, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 165
    .line 166
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    invoke-direct {v3, p0, v4}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;-><init>(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;Landroid/content/Context;)V

    .line 171
    .line 172
    .line 173
    iput-object v3, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 174
    .line 175
    aget v4, p1, v5

    .line 176
    .line 177
    int-to-float v4, v4

    .line 178
    iget v5, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->b:F

    .line 179
    .line 180
    const/high16 v7, 0x40000000    # 2.0f

    .line 181
    .line 182
    div-float/2addr v5, v7

    .line 183
    add-float/2addr v4, v5

    .line 184
    aget p1, p1, v6

    .line 185
    .line 186
    int-to-float p1, p1

    .line 187
    iget v5, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->c:F

    .line 188
    .line 189
    div-float/2addr v5, v7

    .line 190
    add-float/2addr p1, v5

    .line 191
    invoke-virtual {v3, v4, p1, v1, v2}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->i(FFFF)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v6}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_c

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 208
    .line 209
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;->setCacheBitmap(Landroid/graphics/Bitmap;)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->a:Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$DragView;

    .line 213
    .line 214
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 215
    .line 216
    .line 217
    const/4 p1, 0x4

    .line 218
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 219
    .line 220
    .line 221
    :cond_c
    :goto_0
    return v6
.end method

.method public setDragViewColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public setDraggable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOnDragListener(Lcom/p1/mobile/putong/core/view/draggablepoint/DraggablePointView$b;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
