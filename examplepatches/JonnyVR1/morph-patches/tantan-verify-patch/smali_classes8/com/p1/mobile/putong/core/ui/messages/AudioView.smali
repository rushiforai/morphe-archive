.class public Lcom/p1/mobile/putong/core/ui/messages/AudioView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;
    }
.end annotation


# instance fields
.field public a:I

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Path;

.field public e:Landroid/animation/ValueAnimator;

.field public f:Z

.field public g:I

.field public h:Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;

.field public i:Landroid/graphics/PorterDuffXfermode;

.field public j:F

.field public k:I

.field public l:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 12
    invoke-direct {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->f:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->f(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/AudioView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->h(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->g:I

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/messages/AudioView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->a:I

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/messages/AudioView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->setPlay(Z)V

    return-void
.end method

.method private setPlay(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->f:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final f(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance p3, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->d:Landroid/graphics/Path;

    .line 7
    .line 8
    new-instance p3, Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b:Landroid/graphics/Paint;

    .line 14
    .line 15
    sget-object p3, Ll/ohc0;->f:[I

    .line 16
    .line 17
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget p2, Ll/ohc0;->i:I

    .line 22
    .line 23
    const/high16 p3, -0x10000

    .line 24
    .line 25
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    sget v0, Ll/ohc0;->g:I

    .line 30
    .line 31
    invoke-virtual {p1, v0, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    sget v0, Ll/ohc0;->h:I

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->g:I

    .line 43
    .line 44
    sget v0, Ll/ohc0;->j:I

    .line 45
    .line 46
    const/high16 v1, 0x41200000    # 10.0f

    .line 47
    .line 48
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->j:F

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 57
    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b:Landroid/graphics/Paint;

    .line 60
    .line 61
    const/4 v0, 0x1

    .line 62
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b:Landroid/graphics/Paint;

    .line 66
    .line 67
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 68
    .line 69
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 70
    .line 71
    .line 72
    new-instance p2, Landroid/graphics/Paint;

    .line 73
    .line 74
    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->c:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 80
    .line 81
    .line 82
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->c:Landroid/graphics/Paint;

    .line 83
    .line 84
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->c:Landroid/graphics/Paint;

    .line 88
    .line 89
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 93
    .line 94
    .line 95
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 96
    .line 97
    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 98
    .line 99
    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 100
    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->i:Landroid/graphics/PorterDuffXfermode;

    .line 103
    .line 104
    return-void
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic h(Landroid/animation/ValueAnimator;)V
    .locals 0

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
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->a:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public i(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->c:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j(IF)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v1, v0

    .line 11
    mul-float/2addr v1, p2

    .line 12
    float-to-int p2, v1

    .line 13
    add-int/lit8 v0, v0, 0x14

    .line 14
    .line 15
    filled-new-array {p2, v0}, [I

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->e:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    new-instance v0, Ll/qd1;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/qd1;-><init>(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->e:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/AudioView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/AudioView;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->e:Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 46
    .line 47
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->e:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    int-to-long v0, p1

    .line 56
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->e:Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public k(I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->f:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->end()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->d:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->k:I

    .line 7
    .line 8
    int-to-float v4, v0

    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->l:I

    .line 10
    .line 11
    int-to-float v5, v0

    .line 12
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b:Landroid/graphics/Paint;

    .line 13
    .line 14
    const/16 v7, 0x1f

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x0

    .line 18
    move-object v1, p1

    .line 19
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    move-object v0, v1

    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->k:I

    .line 25
    .line 26
    int-to-float v3, v1

    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->l:I

    .line 28
    .line 29
    int-to-float v4, v1

    .line 30
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->j:F

    .line 31
    .line 32
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->c:Landroid/graphics/Paint;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    move v6, v5

    .line 36
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b:Landroid/graphics/Paint;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->i:Landroid/graphics/PorterDuffXfermode;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->d:Landroid/graphics/Path;

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-virtual {v1, v2, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->d:Landroid/graphics/Path;

    .line 53
    .line 54
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->a:I

    .line 55
    .line 56
    add-int/lit8 v3, v3, -0xe

    .line 57
    .line 58
    int-to-float v3, v3

    .line 59
    invoke-virtual {v1, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->d:Landroid/graphics/Path;

    .line 63
    .line 64
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->a:I

    .line 65
    .line 66
    add-int/lit8 v4, v3, 0xe

    .line 67
    .line 68
    int-to-float v4, v4

    .line 69
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->l:I

    .line 70
    .line 71
    shr-int/lit8 v6, v5, 0x1

    .line 72
    .line 73
    int-to-float v6, v6

    .line 74
    add-int/lit8 v3, v3, -0xe

    .line 75
    .line 76
    int-to-float v3, v3

    .line 77
    int-to-float v5, v5

    .line 78
    invoke-virtual {v1, v4, v6, v3, v5}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->d:Landroid/graphics/Path;

    .line 82
    .line 83
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->l:I

    .line 84
    .line 85
    int-to-float v3, v3

    .line 86
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->d:Landroid/graphics/Path;

    .line 90
    .line 91
    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->d:Landroid/graphics/Path;

    .line 95
    .line 96
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b:Landroid/graphics/Paint;

    .line 97
    .line 98
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->b:Landroid/graphics/Paint;

    .line 102
    .line 103
    const/4 v1, 0x0

    .line 104
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->k:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->l:I

    .line 15
    .line 16
    return-void
.end method

.method public setAudioListener(Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;

    .line 2
    .line 3
    return-void
.end method
