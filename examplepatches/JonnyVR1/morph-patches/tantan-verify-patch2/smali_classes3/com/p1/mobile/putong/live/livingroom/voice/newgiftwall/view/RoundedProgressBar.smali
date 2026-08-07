.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final k:I

.field public static final l:I


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/graphics/Paint;

.field public i:Landroid/graphics/RectF;

.field public j:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "#2196F3"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->k:I

    .line 8
    .line 9
    const-string v0, "#E0E0E0"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->l:I

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x40800000    # 4.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->e:I

    .line 11
    .line 12
    const/high16 v0, 0x41600000    # 14.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->f:I

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 25
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 v0, 0x40800000    # 4.0f

    .line 26
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->e:I

    const/high16 v0, 0x41600000    # 14.0f

    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->f:I

    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p3, 0x40800000    # 4.0f

    .line 30
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->e:I

    const/high16 p3, 0x41600000    # 14.0f

    .line 31
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->f:I

    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->k:I

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->a:I

    .line 4
    .line 5
    sget p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->l:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->b:I

    .line 8
    .line 9
    const/16 p1, 0x64

    .line 10
    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->c:I

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->d:I

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->b()V

    .line 17
    .line 18
    .line 19
    new-instance p1, Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->i:Landroid/graphics/RectF;

    .line 25
    .line 26
    new-instance p1, Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->j:Landroid/graphics/RectF;

    .line 32
    .line 33
    return-void
.end method

.method public final b()V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->g:Landroid/graphics/Paint;

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->b:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->g:Landroid/graphics/Paint;

    .line 14
    .line 15
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->g:Landroid/graphics/Paint;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Landroid/graphics/Paint;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->h:Landroid/graphics/Paint;

    .line 32
    .line 33
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->a:I

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->h:Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->h:Landroid/graphics/Paint;

    .line 44
    .line 45
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public getBackgroundColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxProgress()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public getProgress()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public getProgressColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-int/2addr v0, v1

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sub-int/2addr v1, v2

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    sub-int/2addr v1, v2

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    int-to-float v2, v2

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    int-to-float v3, v3

    .line 42
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->f:I

    .line 43
    .line 44
    sub-int/2addr v1, v4

    .line 45
    int-to-float v1, v1

    .line 46
    const/high16 v5, 0x40000000    # 2.0f

    .line 47
    .line 48
    div-float/2addr v1, v5

    .line 49
    add-float/2addr v3, v1

    .line 50
    int-to-float v1, v0

    .line 51
    add-float v5, v2, v1

    .line 52
    .line 53
    int-to-float v4, v4

    .line 54
    add-float/2addr v4, v3

    .line 55
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->i:Landroid/graphics/RectF;

    .line 56
    .line 57
    invoke-virtual {v6, v2, v3, v5, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 58
    .line 59
    .line 60
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->i:Landroid/graphics/RectF;

    .line 61
    .line 62
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->e:I

    .line 63
    .line 64
    int-to-float v7, v6

    .line 65
    int-to-float v6, v6

    .line 66
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->g:Landroid/graphics/Paint;

    .line 67
    .line 68
    invoke-virtual {p1, v5, v7, v6, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 69
    .line 70
    .line 71
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->d:I

    .line 72
    .line 73
    if-lez v5, :cond_0

    .line 74
    .line 75
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->c:I

    .line 76
    .line 77
    if-lez v6, :cond_0

    .line 78
    .line 79
    mul-int/2addr v0, v5

    .line 80
    div-int/2addr v0, v6

    .line 81
    int-to-float v0, v0

    .line 82
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->e:I

    .line 83
    .line 84
    mul-int/lit8 v5, v5, 0x2

    .line 85
    .line 86
    int-to-float v5, v5

    .line 87
    invoke-static {v5, v0}, Ljava/lang/Math;->max(FF)F

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-float/2addr v0, v2

    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->j:Landroid/graphics/RectF;

    .line 97
    .line 98
    invoke-virtual {v1, v2, v3, v0, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->j:Landroid/graphics/RectF;

    .line 102
    .line 103
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->e:I

    .line 104
    .line 105
    int-to-float v2, v1

    .line 106
    int-to-float v1, v1

    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->h:Landroid/graphics/Paint;

    .line 108
    .line 109
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 110
    .line 111
    .line 112
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->f:I

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/2addr v1, v2

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    add-int/2addr v1, v2

    .line 25
    const/high16 v2, 0x40000000    # 2.0f

    .line 26
    .line 27
    if-ne v0, v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/high16 v2, -0x80000000

    .line 31
    .line 32
    if-ne v0, v2, :cond_1

    .line 33
    .line 34
    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move p2, v1

    .line 40
    :goto_0
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->b:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->g:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setCornerRadius(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    mul-float/2addr p1, v0

    .line 13
    float-to-int p1, p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->e:I

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setMaxProgress(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->c:I

    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->d:I

    .line 9
    .line 10
    if-le v0, p1, :cond_0

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->d:I

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->c:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->d:I

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setProgressColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->h:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
