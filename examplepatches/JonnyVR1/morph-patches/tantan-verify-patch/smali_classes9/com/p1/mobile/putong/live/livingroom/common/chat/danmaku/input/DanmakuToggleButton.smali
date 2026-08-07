.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;
    }
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public final c:F

.field public final d:F

.field public final e:I

.field public final f:I

.field public final g:I

.field public h:Z

.field public i:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;

.field public j:I

.field public k:Landroid/graphics/Paint;

.field public l:Landroid/graphics/Paint;

.field public m:Landroid/graphics/Paint;

.field public final n:Ljava/lang/String;

.field public final o:I

.field public p:Z

.field public q:F

.field public r:F

.field public s:J

.field public final t:Landroid/animation/ArgbEvaluator;

.field public u:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 98
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 97
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const p3, 0x3f99999a    # 1.2f

    .line 5
    .line 6
    .line 7
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->c:F

    .line 8
    .line 9
    const/high16 p3, 0x41100000    # 9.0f

    .line 10
    .line 11
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    int-to-float p3, p3

    .line 16
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->d:F

    .line 17
    .line 18
    const/4 p3, 0x0

    .line 19
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->h:Z

    .line 20
    .line 21
    const/16 v0, 0x15e

    .line 22
    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->j:I

    .line 24
    .line 25
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 26
    .line 27
    new-instance p3, Landroid/animation/ArgbEvaluator;

    .line 28
    .line 29
    invoke-direct {p3}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->t:Landroid/animation/ArgbEvaluator;

    .line 33
    .line 34
    sget-object p3, Ll/vhc0;->Y:[I

    .line 35
    .line 36
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget p2, Ll/vhc0;->c0:I

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->n:Ljava/lang/String;

    .line 47
    .line 48
    sget p2, Ll/vhc0;->d0:I

    .line 49
    .line 50
    sget p3, Ll/qa00;->m:I

    .line 51
    .line 52
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->o:I

    .line 57
    .line 58
    sget p2, Ll/vhc0;->b0:I

    .line 59
    .line 60
    const p3, 0x1affffff

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->e:I

    .line 68
    .line 69
    sget p2, Ll/vhc0;->a0:I

    .line 70
    .line 71
    const p3, -0x7c767

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->f:I

    .line 79
    .line 80
    sget p2, Ll/vhc0;->Z:I

    .line 81
    .line 82
    const/16 p3, -0x77e9

    .line 83
    .line 84
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->g:I

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->c()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->e(Landroid/view/View;)V

    return-void
.end method

.method private getRectColor()I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->j:I

    .line 4
    .line 5
    const/high16 v2, 0x3f800000    # 1.0f

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    int-to-float v0, v1

    .line 10
    const/high16 v1, 0x43a00000    # 320.0f

    .line 11
    .line 12
    div-float/2addr v0, v1

    .line 13
    cmpl-float v1, v0, v2

    .line 14
    .line 15
    if-ltz v1, :cond_0

    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->g:I

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->t:Landroid/animation/ArgbEvaluator;

    .line 21
    .line 22
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->f:I

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->g:I

    .line 29
    .line 30
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v1, v0, v2, p0}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_1
    int-to-float p0, v1

    .line 46
    const/high16 v0, 0x435c0000    # 220.0f

    .line 47
    .line 48
    div-float/2addr p0, v0

    .line 49
    cmpl-float v0, p0, v2

    .line 50
    .line 51
    if-ltz v0, :cond_2

    .line 52
    .line 53
    const p0, 0xff8817

    .line 54
    .line 55
    .line 56
    return p0

    .line 57
    :cond_2
    const/high16 v0, 0x437f0000    # 255.0f

    .line 58
    .line 59
    sub-float/2addr v2, p0

    .line 60
    mul-float/2addr v2, v0

    .line 61
    float-to-int p0, v2

    .line 62
    const/16 v0, 0x88

    .line 63
    .line 64
    const/16 v1, 0x17

    .line 65
    .line 66
    const/16 v2, 0xff

    .line 67
    .line 68
    invoke-static {p0, v2, v0, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0
.end method

.method private getTextColor()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->j:I

    .line 4
    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    const/high16 v2, 0x437f0000    # 255.0f

    .line 8
    .line 9
    const/high16 v3, 0x3f800000    # 1.0f

    .line 10
    .line 11
    const/16 v4, 0xff

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    int-to-float p0, p0

    .line 16
    const/high16 v0, 0x43a00000    # 320.0f

    .line 17
    .line 18
    div-float/2addr p0, v0

    .line 19
    cmpl-float v0, p0, v3

    .line 20
    .line 21
    if-ltz v0, :cond_0

    .line 22
    .line 23
    const/4 p0, -0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/high16 v0, 0x3f000000    # 0.5f

    .line 26
    .line 27
    div-float/2addr p0, v1

    .line 28
    add-float/2addr p0, v0

    .line 29
    mul-float/2addr p0, v2

    .line 30
    float-to-int p0, p0

    .line 31
    invoke-static {p0, v4, v4, v4}, Landroid/graphics/Color;->argb(IIII)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_1
    int-to-float p0, p0

    .line 37
    const/high16 v0, 0x435c0000    # 220.0f

    .line 38
    .line 39
    div-float/2addr p0, v0

    .line 40
    cmpl-float v0, p0, v3

    .line 41
    .line 42
    if-ltz v0, :cond_2

    .line 43
    .line 44
    const p0, 0x7affffff

    .line 45
    .line 46
    .line 47
    return p0

    .line 48
    :cond_2
    div-float/2addr p0, v1

    .line 49
    sub-float/2addr v3, p0

    .line 50
    mul-float/2addr v3, v2

    .line 51
    float-to-int p0, v3

    .line 52
    invoke-static {p0, v4, v4, v4}, Landroid/graphics/Color;->argb(IIII)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0
.end method


# virtual methods
.method public final b(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->a:F

    .line 2
    .line 3
    const v1, 0x3f99999a    # 1.2f

    .line 4
    .line 5
    .line 6
    mul-float v2, v0, v1

    .line 7
    .line 8
    const/high16 v3, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v2, v3

    .line 11
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->b:F

    .line 12
    .line 13
    mul-float/2addr v1, v4

    .line 14
    div-float/2addr v1, v3

    .line 15
    div-float/2addr v0, v3

    .line 16
    div-float/2addr v4, v3

    .line 17
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->d:F

    .line 18
    .line 19
    iget-boolean v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 20
    .line 21
    if-eqz v5, :cond_2

    .line 22
    .line 23
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->j:I

    .line 24
    .line 25
    const/16 v6, 0x140

    .line 26
    .line 27
    const v7, 0x3f6e147b    # 0.93f

    .line 28
    .line 29
    .line 30
    if-le v5, v6, :cond_0

    .line 31
    .line 32
    sub-int/2addr v5, v6

    .line 33
    int-to-float v5, v5

    .line 34
    const/high16 v6, 0x41f00000    # 30.0f

    .line 35
    .line 36
    div-float/2addr v5, v6

    .line 37
    mul-float v6, v0, v7

    .line 38
    .line 39
    sub-float v6, v2, v6

    .line 40
    .line 41
    const v8, 0x3d8f5c29    # 0.07f

    .line 42
    .line 43
    .line 44
    mul-float/2addr v0, v8

    .line 45
    mul-float/2addr v0, v5

    .line 46
    sub-float/2addr v6, v0

    .line 47
    mul-float/2addr v7, v4

    .line 48
    sub-float v0, v1, v7

    .line 49
    .line 50
    mul-float/2addr v4, v8

    .line 51
    mul-float/2addr v4, v5

    .line 52
    sub-float/2addr v0, v4

    .line 53
    :goto_0
    sub-float v4, v2, v6

    .line 54
    .line 55
    add-float/2addr v2, v4

    .line 56
    sub-float v4, v1, v0

    .line 57
    .line 58
    add-float/2addr v1, v4

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    const/16 v6, 0xb4

    .line 61
    .line 62
    if-le v5, v6, :cond_1

    .line 63
    .line 64
    sub-int/2addr v5, v6

    .line 65
    int-to-float v5, v5

    .line 66
    const/high16 v6, 0x430c0000    # 140.0f

    .line 67
    .line 68
    div-float/2addr v5, v6

    .line 69
    mul-float/2addr v0, v7

    .line 70
    sub-float v0, v2, v0

    .line 71
    .line 72
    mul-float v6, v0, v5

    .line 73
    .line 74
    mul-float/2addr v4, v7

    .line 75
    sub-float v0, v1, v4

    .line 76
    .line 77
    mul-float/2addr v0, v5

    .line 78
    goto :goto_0

    .line 79
    :cond_1
    int-to-float v0, v5

    .line 80
    const/high16 v4, 0x43340000    # 180.0f

    .line 81
    .line 82
    div-float/2addr v0, v4

    .line 83
    const/high16 v4, 0x3f800000    # 1.0f

    .line 84
    .line 85
    sub-float/2addr v4, v0

    .line 86
    mul-float v6, v2, v4

    .line 87
    .line 88
    mul-float/2addr v4, v1

    .line 89
    sub-float v5, v2, v6

    .line 90
    .line 91
    add-float/2addr v2, v5

    .line 92
    sub-float v5, v1, v4

    .line 93
    .line 94
    add-float/2addr v1, v5

    .line 95
    mul-float/2addr v3, v0

    .line 96
    move v0, v4

    .line 97
    goto :goto_1

    .line 98
    :cond_2
    sub-float v6, v2, v0

    .line 99
    .line 100
    sub-float v5, v1, v4

    .line 101
    .line 102
    add-float/2addr v2, v0

    .line 103
    add-float/2addr v1, v4

    .line 104
    move v0, v5

    .line 105
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->m:Landroid/graphics/Paint;

    .line 106
    .line 107
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->getRectColor()I

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 112
    .line 113
    .line 114
    new-instance v4, Landroid/graphics/RectF;

    .line 115
    .line 116
    invoke-direct {v4, v6, v0, v2, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->m:Landroid/graphics/Paint;

    .line 120
    .line 121
    invoke-virtual {p1, v4, v3, v3, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final c()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->k:Landroid/graphics/Paint;

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->o:I

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->k:Landroid/graphics/Paint;

    .line 16
    .line 17
    const v2, 0x7affffff

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->k:Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 30
    .line 31
    neg-float v2, v2

    .line 32
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 33
    .line 34
    add-float/2addr v2, v0

    .line 35
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->u:F

    .line 36
    .line 37
    new-instance v0, Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->l:Landroid/graphics/Paint;

    .line 43
    .line 44
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->e:I

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->m:Landroid/graphics/Paint;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->k:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/graphics/Paint;->descent()F

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->k:Landroid/graphics/Paint;

    .line 63
    .line 64
    invoke-virtual {v1}, Landroid/graphics/Paint;->ascent()F

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    add-float/2addr v0, v1

    .line 69
    const/high16 v1, 0x40000000    # 2.0f

    .line 70
    .line 71
    div-float/2addr v0, v1

    .line 72
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->r:F

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->k:Landroid/graphics/Paint;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->n:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->q:F

    .line 83
    .line 84
    new-instance v0, Ll/e3c;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/e3c;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->h:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    xor-int/2addr p1, v0

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->h:Z

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->s:J

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->j:I

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 28
    .line 29
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;->a(Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->a:F

    .line 5
    .line 6
    const v1, 0x3e4cccd0    # 0.20000005f

    .line 7
    .line 8
    .line 9
    mul-float v2, v0, v1

    .line 10
    .line 11
    const/high16 v3, 0x40000000    # 2.0f

    .line 12
    .line 13
    div-float v5, v2, v3

    .line 14
    .line 15
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->b:F

    .line 16
    .line 17
    mul-float v4, v2, v1

    .line 18
    .line 19
    div-float v6, v4, v3

    .line 20
    .line 21
    mul-float v4, v0, v1

    .line 22
    .line 23
    div-float/2addr v4, v3

    .line 24
    add-float v7, v4, v0

    .line 25
    .line 26
    mul-float/2addr v1, v2

    .line 27
    div-float/2addr v1, v3

    .line 28
    add-float v8, v1, v2

    .line 29
    .line 30
    iget v9, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->d:F

    .line 31
    .line 32
    iget-object v11, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->l:Landroid/graphics/Paint;

    .line 33
    .line 34
    move v10, v9

    .line 35
    move-object v4, p1

    .line 36
    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->b(Landroid/graphics/Canvas;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->k:Landroid/graphics/Paint;

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->getTextColor()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->n:Ljava/lang/String;

    .line 52
    .line 53
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->a:F

    .line 54
    .line 55
    const v1, 0x3f99999a    # 1.2f

    .line 56
    .line 57
    .line 58
    mul-float/2addr v0, v1

    .line 59
    div-float/2addr v0, v3

    .line 60
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->q:F

    .line 61
    .line 62
    div-float/2addr v2, v3

    .line 63
    sub-float/2addr v0, v2

    .line 64
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->b:F

    .line 65
    .line 66
    mul-float/2addr v2, v1

    .line 67
    div-float/2addr v2, v3

    .line 68
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->r:F

    .line 69
    .line 70
    sub-float/2addr v2, v1

    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->k:Landroid/graphics/Paint;

    .line 72
    .line 73
    invoke-virtual {v4, p1, v0, v2, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 74
    .line 75
    .line 76
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->h:Z

    .line 77
    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->j:I

    .line 81
    .line 82
    const/16 v0, 0x15e

    .line 83
    .line 84
    if-ge p1, v0, :cond_0

    .line 85
    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->s:J

    .line 91
    .line 92
    sub-long/2addr v0, v2

    .line 93
    long-to-int p1, v0

    .line 94
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->j:I

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_0
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->j:I

    .line 101
    .line 102
    const/4 p1, 0x0

    .line 103
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->h:Z

    .line 104
    .line 105
    :cond_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    const/high16 p1, 0x40e00000    # 7.0f

    .line 2
    .line 3
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    shl-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    int-to-float p1, p1

    .line 10
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->q:F

    .line 11
    .line 12
    add-float/2addr p1, p2

    .line 13
    const p2, 0x3f99999a    # 1.2f

    .line 14
    .line 15
    .line 16
    mul-float/2addr p1, p2

    .line 17
    float-to-int p1, p1

    .line 18
    const/high16 v0, 0x40000000    # 2.0f

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    sget v1, Ll/qa00;->e:I

    .line 25
    .line 26
    shl-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->u:F

    .line 30
    .line 31
    add-float/2addr v1, v2

    .line 32
    mul-float/2addr v1, p2

    .line 33
    float-to-int p2, v1

    .line 34
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    int-to-float p1, p1

    .line 5
    const p3, 0x3f99999a    # 1.2f

    .line 6
    .line 7
    .line 8
    div-float/2addr p1, p3

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->a:F

    .line 10
    .line 11
    int-to-float p1, p2

    .line 12
    div-float/2addr p1, p3

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->b:F

    .line 14
    .line 15
    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->p:Z

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;->a(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public setOnCheckedChangeListener(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;

    .line 2
    .line 3
    return-void
.end method
