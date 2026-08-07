.class public Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# instance fields
.field public a:I

.field public b:Landroid/content/Context;

.field public c:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public d:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public e:F

.field public f:I

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/graphics/Paint;

.field public i:Landroid/graphics/Paint;

.field public j:Landroid/graphics/Paint;

.field public k:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public l:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public m:Landroid/animation/ValueAnimator;

.field public n:F

.field public o:Landroid/graphics/RectF;

.field public p:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 152
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 151
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    const/4 p3, 0x0

    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->k:I

    .line 6
    .line 7
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->l:I

    .line 8
    .line 9
    const/4 p3, 0x0

    .line 10
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->n:F

    .line 11
    .line 12
    new-instance p3, Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 18
    .line 19
    new-instance p3, Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->p:Landroid/graphics/RectF;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b:Landroid/content/Context;

    .line 27
    .line 28
    sget-object p3, Ll/xhc0;->u:[I

    .line 29
    .line 30
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget p2, Ll/xhc0;->v:I

    .line 35
    .line 36
    const-string p3, "#19000000"

    .line 37
    .line 38
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->c:I

    .line 47
    .line 48
    sget p2, Ll/xhc0;->x:I

    .line 49
    .line 50
    const/4 p3, -0x1

    .line 51
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->d:I

    .line 56
    .line 57
    sget p2, Ll/xhc0;->w:I

    .line 58
    .line 59
    const/16 p3, 0x8

    .line 60
    .line 61
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->c(I)I

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    int-to-float p3, p3

    .line 66
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->e:F

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 73
    .line 74
    .line 75
    new-instance p1, Landroid/graphics/Paint;

    .line 76
    .line 77
    const/4 p2, 0x1

    .line 78
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 79
    .line 80
    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->g:Landroid/graphics/Paint;

    .line 82
    .line 83
    new-instance p1, Landroid/graphics/Paint;

    .line 84
    .line 85
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->h:Landroid/graphics/Paint;

    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->g:Landroid/graphics/Paint;

    .line 91
    .line 92
    sget-object p3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 93
    .line 94
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->h:Landroid/graphics/Paint;

    .line 98
    .line 99
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->g:Landroid/graphics/Paint;

    .line 103
    .line 104
    iget p3, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->c:I

    .line 105
    .line 106
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->h:Landroid/graphics/Paint;

    .line 110
    .line 111
    iget p3, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->d:I

    .line 112
    .line 113
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 114
    .line 115
    .line 116
    new-instance p1, Landroid/graphics/Paint;

    .line 117
    .line 118
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->i:Landroid/graphics/Paint;

    .line 122
    .line 123
    sget-object p3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 124
    .line 125
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->i:Landroid/graphics/Paint;

    .line 129
    .line 130
    const/high16 v0, 0x3f000000    # 0.5f

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 133
    .line 134
    .line 135
    new-instance p1, Landroid/graphics/Paint;

    .line 136
    .line 137
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 138
    .line 139
    .line 140
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->j:Landroid/graphics/Paint;

    .line 141
    .line 142
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->j:Landroid/graphics/Paint;

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->i(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public b(I)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->a:I

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->m:Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->a:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->h()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->f(IF)Landroid/graphics/RectF;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Landroid/graphics/RectF;

    .line 21
    .line 22
    iget v1, p1, Landroid/graphics/RectF;->left:F

    .line 23
    .line 24
    iget v2, p1, Landroid/graphics/RectF;->top:F

    .line 25
    .line 26
    iget v3, p1, Landroid/graphics/RectF;->right:F

    .line 27
    .line 28
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    .line 29
    .line 30
    invoke-direct {v0, v1, v2, v3, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->p:Landroid/graphics/RectF;

    .line 34
    .line 35
    iget p1, p1, Landroid/graphics/RectF;->left:F

    .line 36
    .line 37
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 38
    .line 39
    sub-float/2addr p1, v0

    .line 40
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->n:F

    .line 41
    .line 42
    add-float/2addr p1, v0

    .line 43
    const/4 v0, 0x2

    .line 44
    new-array v0, v0, [F

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    aput p1, v0, v1

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    const/4 v1, 0x1

    .line 51
    aput p1, v0, v1

    .line 52
    .line 53
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->m:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    const-wide/16 v0, 0x64

    .line 60
    .line 61
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->m:Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    new-instance v0, Ll/x940;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/x940;-><init>(Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->m:Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final c(I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    int-to-double p0, p1

    .line 8
    const-wide/high16 v0, 0x4004000000000000L    # 2.5

    .line 9
    .line 10
    mul-double/2addr p0, v0

    .line 11
    double-to-int p0, p0

    .line 12
    return p0

    .line 13
    :cond_0
    int-to-float p0, p1

    .line 14
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final d(Landroid/graphics/Canvas;IF)V
    .locals 5

    .line 1
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->f(IF)Landroid/graphics/RectF;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->g()I

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    int-to-float p3, p3

    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->a:I

    .line 13
    .line 14
    const/high16 v1, 0x40000000    # 2.0f

    .line 15
    .line 16
    if-ne p2, v0, :cond_1

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->p:Landroid/graphics/RectF;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 21
    .line 22
    iget v2, v0, Landroid/graphics/RectF;->left:F

    .line 23
    .line 24
    iget v3, v0, Landroid/graphics/RectF;->top:F

    .line 25
    .line 26
    iget v4, v0, Landroid/graphics/RectF;->right:F

    .line 27
    .line 28
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 29
    .line 30
    invoke-virtual {p2, v2, v3, v4, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->m:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 44
    .line 45
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->n:F

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {p2, v0, v2}, Landroid/graphics/RectF;->offset(FF)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 52
    .line 53
    div-float/2addr p3, v1

    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->h:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {p1, p2, p3, p3, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->l:I

    .line 60
    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->j:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {p1, p2, p3, p3, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 72
    .line 73
    div-float/2addr p3, v1

    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->g:Landroid/graphics/Paint;

    .line 75
    .line 76
    invoke-virtual {p1, p2, p3, p3, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 77
    .line 78
    .line 79
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->k:I

    .line 80
    .line 81
    if-eqz p2, :cond_2

    .line 82
    .line 83
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->i:Landroid/graphics/Paint;

    .line 86
    .line 87
    invoke-virtual {p1, p2, p3, p3, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    return-void
.end method

.method public final e(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->h()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->f:I

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->d(Landroid/graphics/Canvas;IF)V

    .line 11
    .line 12
    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->n:F

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    cmpl-float v1, v1, v2

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->a:I

    .line 24
    .line 25
    invoke-virtual {p0, p1, v1, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->d(Landroid/graphics/Canvas;IF)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final f(IF)Landroid/graphics/RectF;
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->e:F

    .line 2
    .line 3
    add-float/2addr v0, p2

    .line 4
    int-to-float p1, p1

    .line 5
    mul-float/2addr v0, p1

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->g()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr p1, v1

    .line 15
    int-to-float p1, p1

    .line 16
    const/high16 v1, 0x40000000    # 2.0f

    .line 17
    .line 18
    div-float/2addr p1, v1

    .line 19
    add-float/2addr p2, v0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->g()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    add-float/2addr v1, p1

    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-virtual {v2, v0, p1, p2, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->o:Landroid/graphics/RectF;

    .line 32
    .line 33
    return-object p0
.end method

.method public final g()I
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->c(I)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public h()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->e:F

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->f:I

    .line 12
    .line 13
    add-int/lit8 v2, p0, -0x1

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    mul-float/2addr v1, v2

    .line 17
    sub-float/2addr v0, v1

    .line 18
    int-to-float p0, p0

    .line 19
    div-float/2addr v0, p0

    .line 20
    return v0
.end method

.method public final synthetic i(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->n:F

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->m:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->f:I

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->e(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const/high16 v2, 0x3f000000    # 0.5f

    .line 21
    .line 22
    const/high16 v3, -0x80000000

    .line 23
    .line 24
    if-ne v0, v3, :cond_0

    .line 25
    .line 26
    const/16 p1, 0x64

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->c(I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    int-to-float p1, p1

    .line 33
    add-float/2addr p1, v2

    .line 34
    float-to-int p1, p1

    .line 35
    :cond_0
    if-ne v1, v3, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->g()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    int-to-float p2, p2

    .line 42
    add-float/2addr p2, v2

    .line 43
    float-to-int p2, p2

    .line 44
    :cond_1
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setIndicatorBorderColor(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->k:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->i:Landroid/graphics/Paint;

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

.method public setIndicatorBorderSelectedColor(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->l:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->j:Landroid/graphics/Paint;

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

.method public setIndicatorColor(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->c:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->g:Landroid/graphics/Paint;

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

.method public setIndicatorCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->f:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIndicatorMargin(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->e:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIndicatorSelectedColor(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->d:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->h:Landroid/graphics/Paint;

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

.method public setSelectedIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->a:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setupWithPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->P(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
