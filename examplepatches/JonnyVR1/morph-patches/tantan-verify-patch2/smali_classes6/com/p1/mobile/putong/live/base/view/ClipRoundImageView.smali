.class public Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Bitmap;

.field public b:Landroid/graphics/Path;

.field public c:F

.field public d:Landroid/graphics/RectF;

.field public e:Landroid/graphics/Rect;

.field public f:Landroid/graphics/Rect;

.field public g:Landroid/graphics/Paint;

.field public h:F

.field public i:F

.field public j:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 52
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    new-instance p3, Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->b:Landroid/graphics/Path;

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    iput p3, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->c:F

    .line 13
    .line 14
    new-instance v0, Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->d:Landroid/graphics/RectF;

    .line 20
    .line 21
    new-instance v0, Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->e:Landroid/graphics/Rect;

    .line 27
    .line 28
    new-instance v0, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->f:Landroid/graphics/Rect;

    .line 34
    .line 35
    new-instance v0, Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->g:Landroid/graphics/Paint;

    .line 41
    .line 42
    iput p3, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->h:F

    .line 43
    .line 44
    iput p3, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->i:F

    .line 45
    .line 46
    iput p3, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->j:F

    .line 47
    .line 48
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Ll/thc0;->t:[I

    .line 7
    .line 8
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    sget v0, Ll/thc0;->u:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->a:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    :cond_1
    sget p1, Ll/thc0;->v:I

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->h:F

    .line 39
    .line 40
    sget p1, Ll/thc0;->w:I

    .line 41
    .line 42
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->i:F

    .line 47
    .line 48
    sget p1, Ll/thc0;->x:I

    .line 49
    .line 50
    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->j:F

    .line 55
    .line 56
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->a:Landroid/graphics/Bitmap;

    .line 60
    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->e:Landroid/graphics/Rect;

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->a:Landroid/graphics/Bitmap;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-virtual {p2, v1, v1, p1, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->g:Landroid/graphics/Paint;

    .line 79
    .line 80
    const/4 p1, 0x1

    .line 81
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 82
    .line 83
    .line 84
    :cond_2
    :goto_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->a:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->b:Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->a:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->e:Landroid/graphics/Rect;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->f:Landroid/graphics/Rect;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->g:Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->a:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->b:Landroid/graphics/Path;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    int-to-float p1, p1

    .line 19
    iget p2, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->c:F

    .line 20
    .line 21
    mul-float/2addr p1, p2

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    int-to-float p2, p2

    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->h:F

    .line 28
    .line 29
    sub-float/2addr p2, v0

    .line 30
    cmpl-float p2, p1, p2

    .line 31
    .line 32
    if-lez p2, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    int-to-float p1, p1

    .line 39
    iget p2, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->h:F

    .line 40
    .line 41
    sub-float/2addr p1, p2

    .line 42
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->d:Landroid/graphics/RectF;

    .line 43
    .line 44
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->h:F

    .line 45
    .line 46
    float-to-int v0, v0

    .line 47
    int-to-float v0, v0

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    int-to-float v1, v1

    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-virtual {p2, v0, v2, p1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->b:Landroid/graphics/Path;

    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->d:Landroid/graphics/RectF;

    .line 60
    .line 61
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->j:F

    .line 62
    .line 63
    sget-object v1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 64
    .line 65
    invoke-virtual {p1, p2, v0, v0, v1}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iget p2, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->i:F

    .line 73
    .line 74
    const/high16 v0, 0x40000000    # 2.0f

    .line 75
    .line 76
    mul-float/2addr p2, v0

    .line 77
    float-to-int p2, p2

    .line 78
    sub-int/2addr p1, p2

    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    sub-int/2addr p2, p1

    .line 84
    div-int/lit8 p2, p2, 0x2

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->f:Landroid/graphics/Rect;

    .line 87
    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->h:F

    .line 89
    .line 90
    float-to-int v1, v1

    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->a:Landroid/graphics/Bitmap;

    .line 92
    .line 93
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->h:F

    .line 98
    .line 99
    float-to-int p0, p0

    .line 100
    add-int/2addr v2, p0

    .line 101
    add-int/2addr p1, p2

    .line 102
    invoke-virtual {v0, v1, p2, v2, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public setProgress(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->c:F

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
