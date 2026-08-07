.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/RectF;

.field public c:Z

.field public d:Landroid/graphics/LinearGradient;

.field public e:Landroid/graphics/LinearGradient;

.field public f:I

.field public g:I

.field public h:I

.field public i:Landroid/graphics/Path;

.field public j:Landroid/graphics/Path;

.field public k:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    .line 4
    .line 5
    sget-object v0, Ll/shc0;->p0:[I

    .line 6
    .line 7
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget p2, Ll/shc0;->r0:I

    .line 12
    .line 13
    const/16 v0, 0x5dc

    .line 14
    .line 15
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->g:I

    .line 20
    .line 21
    sget p2, Ll/shc0;->q0:I

    .line 22
    .line 23
    const/16 v0, 0x64

    .line 24
    .line 25
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->f:I

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x5a

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->f:I

    const/16 p1, 0x5dc

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->g:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->d(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->f:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    mul-int/lit8 v2, v2, 0x2

    .line 12
    .line 13
    sub-int/2addr v1, v2

    .line 14
    if-le v0, v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    mul-int/lit8 v1, v1, 0x2

    .line 25
    .line 26
    sub-int/2addr v0, v1

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->f:I

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->f:I

    .line 43
    .line 44
    neg-int v0, v0

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    mul-int/lit8 v1, v1, 0x2

    .line 50
    .line 51
    filled-new-array {v0, v1}, [I

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    new-instance v1, Ll/zch;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/zch;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 76
    .line 77
    const/4 v1, -0x1

    .line 78
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 82
    .line 83
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->g:I

    .line 84
    .line 85
    int-to-long v1, v1

    .line 86
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final c()V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->c:Z

    .line 3
    .line 4
    new-instance v1, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setDither(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 26
    .line 27
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    int-to-float v5, v0

    .line 39
    const-string v0, "#ff3a00"

    .line 40
    .line 41
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    const-string v0, "#ff852a"

    .line 46
    .line 47
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 52
    .line 53
    const/4 v3, 0x0

    .line 54
    const/4 v4, 0x0

    .line 55
    const/4 v6, 0x0

    .line 56
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 57
    .line 58
    .line 59
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->d:Landroid/graphics/LinearGradient;

    .line 60
    .line 61
    new-instance v0, Landroid/graphics/RectF;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    int-to-float v1, v1

    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    int-to-float v2, v2

    .line 73
    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->b:Landroid/graphics/RectF;

    .line 77
    .line 78
    new-instance v0, Landroid/graphics/Path;

    .line 79
    .line 80
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->i:Landroid/graphics/Path;

    .line 84
    .line 85
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->i:Landroid/graphics/Path;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->b:Landroid/graphics/RectF;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    div-int/lit8 v2, v2, 0x2

    .line 97
    .line 98
    int-to-float v2, v2

    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    div-int/lit8 v3, v3, 0x2

    .line 104
    .line 105
    int-to-float v3, v3

    .line 106
    sget-object v4, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 107
    .line 108
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 109
    .line 110
    .line 111
    new-instance v0, Landroid/graphics/Path;

    .line 112
    .line 113
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->j:Landroid/graphics/Path;

    .line 117
    .line 118
    return-void
.end method

.method public final synthetic d(Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->h:I

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 14
    .line 15
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->h:I

    .line 16
    .line 17
    add-int/lit8 v1, p1, -0x2

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->f:I

    .line 21
    .line 22
    add-int/2addr p1, v2

    .line 23
    int-to-float v3, p1

    .line 24
    const-string p1, "#00000000"

    .line 25
    .line 26
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    const-string p1, "#ff952a"

    .line 31
    .line 32
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    const/4 v4, 0x0

    .line 40
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->e:Landroid/graphics/LinearGradient;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->k:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->c:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->c()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->b()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    const/4 v1, -0x1

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 27
    .line 28
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->d:Landroid/graphics/LinearGradient;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->b:Landroid/graphics/RectF;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    div-int/lit8 v1, v1, 0x2

    .line 47
    .line 48
    int-to-float v1, v1

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    div-int/lit8 v2, v2, 0x2

    .line 54
    .line 55
    int-to-float v2, v2

    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 59
    .line 60
    .line 61
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->h:I

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->j:Landroid/graphics/Path;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->j:Landroid/graphics/Path;

    .line 69
    .line 70
    int-to-float v3, v0

    .line 71
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->f:I

    .line 72
    .line 73
    add-int/2addr v0, v1

    .line 74
    int-to-float v5, v0

    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    int-to-float v6, v0

    .line 80
    sget-object v7, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 81
    .line 82
    const/4 v4, 0x0

    .line 83
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->j:Landroid/graphics/Path;

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->i:Landroid/graphics/Path;

    .line 89
    .line 90
    sget-object v2, Landroid/graphics/Path$Op;->INTERSECT:Landroid/graphics/Path$Op;

    .line 91
    .line 92
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->e:Landroid/graphics/LinearGradient;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->j:Landroid/graphics/Path;

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 110
    .line 111
    const/4 v0, 0x0

    .line 112
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveLightView;->a:Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 118
    .line 119
    .line 120
    return-void
.end method
