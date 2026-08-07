.class public Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private addStart:Z

.field private growTime:D

.field private growTimeMax:D

.field private handler:Landroid/os/Handler;

.field private lastTime:J

.field private length:F

.field private final maxLength:I

.field private final minLength:I

.field private miniSize:I

.field private padding:I

.field private paint:Landroid/graphics/Paint;

.field private paintWidth:I

.field private progress:F

.field private rect:Landroid/graphics/RectF;

.field private showView:Z

.field private speed:F

.field private stopGrowTime:J

.field private stopGrowTimeMax:J

.field stopNum:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 123
    invoke-direct {p0, p1, v0}, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 122
    invoke-direct {p0, p1, p2, v0}, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/16 p2, 0x14

    .line 5
    .line 6
    iput p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->minLength:I

    .line 7
    .line 8
    const/16 p2, 0x12c

    .line 9
    .line 10
    iput p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->maxLength:I

    .line 11
    .line 12
    const-wide/16 p2, 0x0

    .line 13
    .line 14
    iput-wide p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->lastTime:J

    .line 15
    .line 16
    const/high16 v0, 0x43480000    # 200.0f

    .line 17
    .line 18
    iput v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->speed:F

    .line 19
    .line 20
    const-wide/16 v0, 0xb4

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->stopGrowTimeMax:J

    .line 23
    .line 24
    iput-wide p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->stopGrowTime:J

    .line 25
    .line 26
    const-wide p2, 0x407ea00000000000L    # 490.0

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    iput-wide p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->growTimeMax:D

    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    iput-boolean p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->addStart:Z

    .line 35
    .line 36
    const/4 p3, 0x1

    .line 37
    iput-boolean p3, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->showView:Z

    .line 38
    .line 39
    iput p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->stopNum:I

    .line 40
    .line 41
    new-instance p2, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar$1;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar$1;-><init>(Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;)V

    .line 44
    .line 45
    .line 46
    iput-object p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->handler:Landroid/os/Handler;

    .line 47
    .line 48
    const/16 p2, 0x32

    .line 49
    .line 50
    invoke-direct {p0, p1, p2}, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->dip2px(Landroid/content/Context;I)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iput p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->miniSize:I

    .line 55
    .line 56
    const/4 p2, 0x5

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->dip2px(Landroid/content/Context;I)I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    iput p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->paintWidth:I

    .line 62
    .line 63
    const/4 p2, 0x3

    .line 64
    invoke-direct {p0, p1, p2}, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->dip2px(Landroid/content/Context;I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iput p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->padding:I

    .line 69
    .line 70
    new-instance p1, Landroid/graphics/Paint;

    .line 71
    .line 72
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->paint:Landroid/graphics/Paint;

    .line 76
    .line 77
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->paint:Landroid/graphics/Paint;

    .line 81
    .line 82
    const p2, -0xbedd

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->paint:Landroid/graphics/Paint;

    .line 89
    .line 90
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 91
    .line 92
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->paint:Landroid/graphics/Paint;

    .line 96
    .line 97
    iget p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->paintWidth:I

    .line 98
    .line 99
    int-to-float p2, p2

    .line 100
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 101
    .line 102
    .line 103
    new-instance p1, Landroid/graphics/RectF;

    .line 104
    .line 105
    iget p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->padding:I

    .line 106
    .line 107
    int-to-float p3, p2

    .line 108
    int-to-float v0, p2

    .line 109
    iget v1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->miniSize:I

    .line 110
    .line 111
    sub-int v2, v1, p2

    .line 112
    .line 113
    int-to-float v2, v2

    .line 114
    sub-int/2addr v1, p2

    .line 115
    int-to-float p2, v1

    .line 116
    invoke-direct {p1, p3, v0, v2, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 117
    .line 118
    .line 119
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->rect:Landroid/graphics/RectF;

    .line 120
    .line 121
    return-void
.end method

.method public static synthetic access$002(Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->showView:Z

    .line 2
    .line 3
    return p1
.end method

.method private calculateProgress(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->stopGrowTime:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->stopGrowTimeMax:J

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-ltz v2, :cond_2

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->growTime:D

    .line 10
    .line 11
    long-to-double p1, p1

    .line 12
    add-double/2addr v0, p1

    .line 13
    iput-wide v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->growTime:D

    .line 14
    .line 15
    iget-wide p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->growTimeMax:D

    .line 16
    .line 17
    cmpl-double v2, v0, p1

    .line 18
    .line 19
    if-ltz v2, :cond_0

    .line 20
    .line 21
    sub-double/2addr v0, p1

    .line 22
    iput-wide v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->growTime:D

    .line 23
    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->stopGrowTime:J

    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->addStart:Z

    .line 29
    .line 30
    xor-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->addStart:Z

    .line 33
    .line 34
    :cond_0
    iget-wide v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->growTime:D

    .line 35
    .line 36
    div-double/2addr v0, p1

    .line 37
    const-wide/high16 p1, 0x3ff0000000000000L    # 1.0

    .line 38
    .line 39
    add-double/2addr v0, p1

    .line 40
    const-wide p1, 0x400921fb54442d18L    # Math.PI

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    mul-double/2addr v0, p1

    .line 46
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 47
    .line 48
    .line 49
    move-result-wide p1

    .line 50
    double-to-float p1, p1

    .line 51
    const/high16 p2, 0x40000000    # 2.0f

    .line 52
    .line 53
    div-float/2addr p1, p2

    .line 54
    const/high16 p2, 0x3f000000    # 0.5f

    .line 55
    .line 56
    add-float/2addr p1, p2

    .line 57
    iget-boolean p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->addStart:Z

    .line 58
    .line 59
    const/high16 v0, 0x438c0000    # 280.0f

    .line 60
    .line 61
    if-nez p2, :cond_1

    .line 62
    .line 63
    mul-float/2addr p1, v0

    .line 64
    iput p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->length:F

    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    const/high16 p2, 0x3f800000    # 1.0f

    .line 68
    .line 69
    sub-float/2addr p2, p1

    .line 70
    mul-float/2addr v0, p2

    .line 71
    iget p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->progress:F

    .line 72
    .line 73
    iget p2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->length:F

    .line 74
    .line 75
    sub-float/2addr p2, v0

    .line 76
    add-float/2addr p1, p2

    .line 77
    iput p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->progress:F

    .line 78
    .line 79
    iput v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->length:F

    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    add-long/2addr v0, p1

    .line 83
    iput-wide v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->stopGrowTime:J

    .line 84
    .line 85
    return-void
.end method

.method private dip2px(Landroid/content/Context;I)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    int-to-float p1, p2

    .line 12
    mul-float/2addr p0, p1

    .line 13
    float-to-int p0, p0

    .line 14
    return p0
.end method


# virtual methods
.method public declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    iget-wide v2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->lastTime:J

    .line 7
    .line 8
    sub-long/2addr v0, v2

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x168

    .line 14
    .line 15
    rem-long/2addr v0, v2

    .line 16
    iget v2, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->speed:F

    .line 17
    .line 18
    long-to-float v3, v0

    .line 19
    mul-float/2addr v2, v3

    .line 20
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 21
    .line 22
    div-float/2addr v2, v3

    .line 23
    invoke-direct {p0, v0, v1}, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->calculateProgress(J)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iput-wide v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->lastTime:J

    .line 31
    .line 32
    iget v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->progress:F

    .line 33
    .line 34
    add-float/2addr v0, v2

    .line 35
    iput v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->progress:F

    .line 36
    .line 37
    const/high16 v1, 0x43b40000    # 360.0f

    .line 38
    .line 39
    cmpl-float v2, v0, v1

    .line 40
    .line 41
    if-ltz v2, :cond_0

    .line 42
    .line 43
    sub-float/2addr v0, v1

    .line 44
    iput v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->progress:F

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    move-object p1, v0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->rect:Landroid/graphics/RectF;

    .line 51
    .line 52
    iget v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->progress:F

    .line 53
    .line 54
    const/high16 v2, 0x42b40000    # 90.0f

    .line 55
    .line 56
    sub-float v2, v0, v2

    .line 57
    .line 58
    iget v0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->length:F

    .line 59
    .line 60
    const/high16 v3, 0x41a00000    # 20.0f

    .line 61
    .line 62
    add-float/2addr v3, v0

    .line 63
    iget-object v5, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->paint:Landroid/graphics/Paint;

    .line 64
    .line 65
    const/4 v4, 0x0

    .line 66
    move-object v0, p1

    .line 67
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 68
    .line 69
    .line 70
    iget-boolean p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->showView:Z

    .line 71
    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .line 76
    .line 77
    :cond_1
    monitor-exit p0

    .line 78
    return-void

    .line 79
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p1
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->miniSize:I

    .line 5
    .line 6
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x8

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-ne p2, p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->handler:Landroid/os/Handler;

    .line 10
    .line 11
    const-wide/16 p1, 0x3e8

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    if-nez p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->handler:Landroid/os/Handler;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->showView:Z

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public setProgressColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/view/WbSdkProgressBar;->paint:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
